#!/usr/bin/env sh
set -e
set +o allexport # make sure variables are not automatically exported

secrets_dir="${XDG_DATA_HOME:-$HOME/.local/share}/secrets"
mkdir -p "$secrets_dir"

echo "ℹ️  Hostname: $(hostname)"

generate_user_pass() {
  echo ""
  echo "ℹ️  Generating user password..."
  passwd_file="$secrets_dir/passwd"

  make_passwd() {
    mkpasswd --method=SHA-512 > "$passwd_file"
    chmod go-r "$passwd_file"
    echo "User password generated."
  }

  if [ -f "$passwd_file" ]; then
    while true; do
      read -r -p "User password already exists; regenerate? [y/N] " yn
      case $yn in
        [Yy]* ) make_passwd; break;;
        * ) echo "User password unchanged."; break;;
      esac
    done
  else
    make_passwd
  fi

}

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux
generate_ssh_key() {
  echo ""
  echo "ℹ️  Generating SSH key..."
  ssh_key_file="$HOME/.ssh/id_ed25519"

  make_ssh_key() {
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
      read -r -p "SSH key already exists; regenerate? [y/N] " yn
      case $yn in
        [Yy]* ) make_ssh_key; break;;
        * ) echo "SSH key unchanged."; break;;
      esac
    done
  else
    make_ssh_key
  fi
}

generate_mitto() {
  echo ""
  echo "ℹ️  Generating Mitto config..."
  mitto_env_file="$secrets_dir/mitto"

  make_mitto() {
    read -r -p "Mitto URL [http://127.0.0.1:8080/upload]: " mitto_url
    read -r -p "Mitto password: " mitto_pass

    printf "MITTO_URL=%s\nMITTO_PASS=%s\n" "${mitto_url:-http://127.0.0.1:8080/upload}" "$mitto_pass" > "$mitto_env_file"
    chmod go-r "$mitto_env_file"
    echo "Mitto config generated."
  }

  if [ -f "$mitto_env_file" ]; then
    while true; do
      read -r -p "Mitto config already exists; regenerate? [y/N] " yn
      case $yn in
        [Yy]* ) make_mitto; break;;
        * ) echo "Mitto config unchanged."; break;;
      esac
    done
  else
    make_mitto
  fi
}

generate_user_pass
generate_ssh_key
generate_mitto