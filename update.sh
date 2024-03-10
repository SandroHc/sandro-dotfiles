#!/usr/bin/env bash
set -e

pushd /etc/nixos

sudo nix-collect-garbage --delete-older-than 7d
sudo nix-store --optimise

nix flake update
#nix-channel --update
sudo nixos-rebuild switch --upgrade
trash-empty -f

popd
