{ inputs
, config
, lib
, pkgs
, user
, ...
}:
let root = true; in
{
  imports = [ ];
  virtualisation.libvirtd = {
    enable = true;
    allowedBridges = [ "virbr0" ];
    extraConfig = ''
    '';
    extraOptions = [ "--verbose" ];
    qemu = {
      # If true, libvirtd runs qemu as root.
      # If false, libvirtd runs qemu as unprivileged user qemu-libvirtd.
      #   Note: Changing this option to false may cause file permission issues for existing guests.
      #         To fix these, manually change ownership of affected files in /var/lib/libvirt/qemu to qemu-libvirtd.
      runAsRoot = root;
      swtpm.enable = true; # Software TPM for guest VM
      # Contents written to the qemu configuration file, qemu.conf.
      # Make sure to include a proper namespace configuration when supplying custom configuration
      #verbatimConfig = ''
      #  namespaces = []
      #'';
    };
  };

  users.users.${user}.extraGroups = if root then [ "qemu-libvirtd" "libvirtd" ] else [ "libvirtd" ];
  programs.virt-manager.enable = true;

  # --- QEMU / KVM ---
  # --- User Session ---
  # Adapted from: /var/lib/libvirt/qemu.conf
  # Note: AAVMF & OVMF are for Aarch64 & x86 respectively
  # nvram = [ "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd", "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd" ]
}
