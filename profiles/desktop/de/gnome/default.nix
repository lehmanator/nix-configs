# See all GNOME packages:
# - https://github.com/NixOS/nixpkgs/blob/master/pkgs/desktops/gnome/default.nix
# - pkgs/desktops/gnome
#   - All GNOME packages:  default.nix
#   - GNOME Installer Env: installer.nix
#   - Update GNOME:        updater.nix

{
  self,
  system,
  inputs,
  userPrimary,
  config, lib, pkgs,
  ...
}:
let
in
{
  imports = [
    #./common.nix
    ../../gtk.nix
    ../../wayland.nix
    #../../xwayland.nix
    ./apps/default.nix
    ./extensions/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # Tool to convert dconf settings to Nix config
    dconf2nix
  ];

  # Exclude broken packages
  environment.gnome.excludePackages = [];

  # --- NetworkManager ---
  networking.networkmanager.enable = true;
  users.users."sam".extraGroups = [ "gdm" "netdev" "networkmanager" "nm-openconnect" ];

  programs.dconf.enable = true;
  programs.evince.enable = true;
  programs.evolution.enable = true;
  programs.evolution.plugins = [ pkgs.evolution-ews ];
  programs.firefox.nativeMessagingHosts.gsconnect = true;
  programs.gnupg.agent.pinentryFlavor = "gnome3";

  # Qt uses GNOME styles
  qt.platformTheme = "gnome";
  qt.style = "adwaita-dark";

  services.gnome = {
    at-spi2-core.enable = true;
    core-developer-tools.enable = true;
    core-os-services.enable = true;
    core-shell.enable = true;
    core-utilities.enable = true;
    evolution-data-server.enable = true;
    #evolution-data-server.plugins = [
    #];
    glib-networking.enable = true;
    gnome-browser-connector.enable = true;
    gnome-keyring.enable = true;
    gnome-online-accounts.enable = true;
    gnome-online-miners.enable = true;
    gnome-remote-desktop.enable = true;
    gnome-settings-daemon.enable = true;
    gnome-user-share.enable = true;
    sushi.enable = true;
    tracker.enable = true;
    tracker-miners.enable = true;
  };

  # Enable automatic login for user
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "sam";
  systemd.services."autovt@tty1".enable = false;
  systemd.services."getty@tty1".enable = false; # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229

  # Enable GNOME & GDM
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  xdg.portal.enable = true;
  xdg.portal.xdgOpenUsePortal = true;
}