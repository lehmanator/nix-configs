{ config, lib, pkgs, ... }:
{
  nix.settings.extra-experimental-features = [ "recursive-nix" ];
}
