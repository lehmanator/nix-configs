{ inputs, config, lib, pkgs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    #../../../hosts/${config.networking.hostName}/disko.nix
  ];

  disko = {
    enableConfig = lib.mkDefault false;
    checkScripts = lib.mkDefault true;
    memSize = lib.mkDefault 4096; # Pass size of memory to runInLinuxVM (in megabytes)
    rootMountPoint = lib.mkDefault "/mnt";

    #devices = {};

    #tests = {
    #  efi = config.boot.loader.systemd-boot.enable || config.boot.loader.grub.efiSupport;
    #  extraChecks = ''
    #    machine.succeed("test -e /var/secrets/my.secret")
    #  '';
    #  # Extra NixOS config for your test. Can be used to specify a diff luks key for tests.
    #  # A dummy key is in /tmp/secret.key
    #  extraConfig = { };
    #};

  };

  sops.secrets.luks-password = { };
}
