#!/usr/bin/env sh
set -e
set +o allexport # make sure variables are not automatically exported

echo "ℹ️  Hostname: $(hostname)"


# generate user password
echo ""
echo "ℹ️  Generating user password..."
passwd_file="${XDG_DATA_HOME:-$HOME/.local/share}/passwd"

function make_passwd {
  mkpasswd --method=SHA-512 > $passwd_file
  echo "✅  User password generated."
}

if [ -f "$passwd_file" ]; then
  while true; do
    read -p "User password already exists; regenerate? [yN] " yn
    case $yn in
      [Yy]* ) make_passwd; break;;
      * ) echo "User password unchanged."; break;;
    esac
  done
else
  make_passwd
fi


# generate SSH key
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux
echo ""
echo "ℹ️  Generating SSH key..."
ssh_key_file="$HOME/.ssh/id_ed25519"

function make_ssh_key {
  # generate key
  ssh-keygen -t ed25519 -f "$ssh_key_file" -C "sandro@$(hostname)"
  # start the SSH agent
  eval "$(ssh-agent -s)"
  # add key to the agent
  ssh-add "$ssh_key_file"

  echo "SSH key generated. Don't forget to import it to GitHub at https://github.com/settings/keys"
  echo "Public key: $(cat "$ssh_key_file.pub")"
}

if [ -f "$ssh_key_file" ]; then
  while true; do
    read -p "SSH key already exists; regenerate? [yN] " yn
    case $yn in
      [Yy]* ) make_ssh_key; break;;
      * ) echo "SSH key unchanged."; break;;
    esac
  done
else
  make_ssh_key
fi
