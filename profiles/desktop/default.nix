{ self
, inputs
, config
, lib
, pkgs
, ...
}:
{
  imports = [
    ./apps
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
}
