{ self, system, userPrimary, inputs, config, lib, pkgs, ... }: {

  imports = [
  ];

  environment.systemPackages = with pkgs; [
    bottles
    lutris
    #onedrive
    playonlinux
    proton-caller
    protonup-qt
    protontricks
    wineWowPackages.waylandFull # TODO: Conditional based on wayland support
    winetricks
  ];
}