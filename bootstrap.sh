#!/usr/bin/env sh

set -e # -e: exit on error

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# generate SSH key
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux
echo "ℹ️  Generating SSH key..."
if [ -f "${HOME}/.ssh/id_ed25519" ]; then
  echo "✅  SSH key already exists; skipping"
else
  # generate key
  ssh-keygen -t ed25519 -C "sandrohc@$(hostname)"
  # start the SSH agent
  eval "$(ssh-agent -s)"
  # add key to the agent
  ssh-add "${HOME}/.ssh/id_ed25519"

  echo "✅  SSH key generated. Don't forget to import it to GitHub at https://github.com/settings/keys"
fi

echo "ℹ️  Installing Ansible..."
sudo pacman --sync --needed --noconfirm ansible

echo ""
echo "ℹ️  Installing Ansible modules..."
ansible-galaxy collection install -r "$script_dir/ansible/modules.yaml"

echo ""
echo "ℹ️  Bootstrapping machine..."
ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook --ask-become-pass --verbose "$script_dir/ansible/bootstrap.yaml"
