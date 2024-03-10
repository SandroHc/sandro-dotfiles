#!/usr/bin/env bash
set -e

pushd /etc/nixos

nix flake update
#nix-channel --update
sudo nixos-rebuild switch --upgrade

sudo nix-collect-garbage --delete-older-than 7d
# sudo nix-collect-garbage --delete-old
sudo nix-store --optimise

popd
