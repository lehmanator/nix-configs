{ pkgs, config, lib, ... }:
{
  imports = [

    # TODO: Conditional on GTK-based desktop
    ./gtkcord.nix

    # TODO: QT clients?
    # TODO: Better ElectronJS clients?
    # TODO: Proprietary client
  ];

}
