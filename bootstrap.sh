#!/usr/bin/env sh

# Quick start:
#  curl -sSf https://raw.githubusercontent.com/SandroHc/sandro-dotfiles/master/bootstrap.sh | sh

set -e

echo "⚠️  Don't forget to set your hostname with: hostnamectl set-hostname $YOUR_HOSTNAME"

# generate SSH key
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux
echo "ℹ️  Generating SSH key..."
if [ -f "${HOME}/.ssh/id_ed25519" ]; then
  echo "✅  SSH key already exists; skipping"
else
  # generate key
  ssh-keygen -t ed25519 -C "sandrohc-$(hostname)"
  # start the SSH agent
  eval "$(ssh-agent -s)"
  # add key to the agent
  ssh-add "${HOME}/.ssh/id_ed25519"

  echo "✅  SSH key generated. Don't forget to import it to GitHub at https://github.com/settings/keys"
fi

# download, setup and run Ansible playbook
echo ""
echo "ℹ️  Installing Ansible..."
sudo pacman --sync --needed --noconfirm ansible

echo ""
echo "ℹ️  Installing Ansible modules..."
ansible-galaxy collection install "community.general"
ansible-galaxy collection install "kewlfft.aur"

ansible_files_url="https://github.com/SandroHc/sandro-dotfiles/archive/refs/heads/master.tar.gz"
tmp_dir="/tmp/sandro-dotfiles"
echo ""
echo "ℹ️  Downloading Ansible files from '${ansible_files_url}'..."
if [ -f "${tmp_dir}" ]; then
  rm -rf "${tmp_dir}"
fi
mkdir -p "${tmp_dir}"
curl -Lf --location "${ansible_files_url}" | tar xvz -C "${tmp_dir}" --strip-components 1 --wildcards "*/ansible/*"

echo ""
echo "ℹ️  Bootstrapping machine..."
ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook --ask-become-pass --verbose "${tmp_dir}/ansible/setup.yaml"
