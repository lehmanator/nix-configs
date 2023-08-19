{ inputs, self
, config, lib, pkgs
, ...
}:
{
  imports = [
  ];

  networking.domain = "piwine.com";
  networking.search = [ config.networking.domain "pi.wine" "pi.local" ];

  # Configure work Wi-Fi network SSIDs
  networking.wireless.networks = let work-network = {
    psk = "maniccurtain178";
    pskRaw = null;
    #auth = ''
    #  eap=PEAP
    #  identity="slehman@piwine.com"
    #  password="@EXAMPLE_PASSWORD@"
    #'';
    authProtocols = [ "WPA-PSK" ];
    hidden = false;
    priority = 0;
    #extraConfig = ''
    #  bssid_blacklist=02:11:22:33:44:55 02:22:aa:44:55:66
    #'';  # See more: man wpa_supplicant.conf(5)
  }; in {
    "PIWC"    = work-network;
    "PIWC-5G" = work-network;
    "!PIWINE!" = work-network // {psk="!Winery64";};
  };


  #networking.ucarp = {          # Userspace implementation of CARP
  #  enable = true;
  #  package = pkgs.ucarp;
  #  addr = "";       # Virtual shared IP address
  #  advBase = 1;     # Advertisement freq in seconds
  #  advSkew = 0;     # Advertisement skew in seconds
  #  deadratio = 3;   # Ratio to consider a host as dead
  #  downscript = pkgs.writeScript "downscript" ''
  #    #!/bin/sh
  #    ${pkgs.iproute2}/bin/ip addr del "$2"/24 dev "$1"
  #  '';
  #  extraParam = "";   # Extra parameter to pass to up/down scripts
  #  ignoreIfState = false;  # Ignore interface state e.g. down or no carrier
  #  interface = "eth0";     # Network interface to bind to
  #  neutral = false;        # Do not run downscript at start if the host is the backup
  #  preempt = false;        # Enable pre-emptive failover. Thus, this host becomes the CARP master as soon as possible
  #  shutdown = false;       # Call downscript at exit
  #  srcIp = "";             # Source (real) IP address of this host.
  #  upscript = pkgs.writeScript "upscript" ''
  #    #!/bin/sh
  #    ${pkgs.iproute2}/bin/ip addr add "$2"/24 dev "$1"
  #  '';
  #  vhId = 1;               # Virtual IP identifier shared b/w CARP hosts
  #};

}
