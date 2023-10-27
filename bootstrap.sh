#!/usr/bin/env sh

set -e # -e: exit on error

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

echo "ℹ️  Installing Ansible..."
sudo pacman --sync --needed --noconfirm ansible

echo ""
echo "ℹ️  Installing Ansible modules..."
ansible-galaxy collection install -r "$script_dir/ansible/modules.yaml"

echo ""
echo "ℹ️  Bootstrapping machine..."
ansible-playbook --ask-become-pass --verbose "$script_dir/ansible/bootstrap.yaml"
