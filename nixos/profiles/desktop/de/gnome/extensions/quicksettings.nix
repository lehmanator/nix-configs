{ self, inputs
, config, lib, pkgs
, ...
}:
{
  imports = [

  ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    quick-settings-tweaker    # Tweaks for QS, move notifications below QS panel
    wifi-qrcode               # Show QR code to connect other devices to wifi network
  ];
}
