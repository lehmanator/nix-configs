{ self, inputs
, config, lib, pkgs
, host, network, repo
, user       ? "sam"
, secretType ? "agenix"
, ...
}:
{
  imports = [
    #inputs.agenix.nixosModules.age
    #inputs.sops-nix.nixosModules.sops
  ];

  networking.wireguard = {
    enable = true;
    interfaces.wg0 = {
      allowedIPsAsRoutes = true;       # default: true
      generatePrivateKeyFile = true;   # default: false
      privateKeyFile = "/etc/wireguard/wg0.privkey";
      ips = [ "192.168.125.1/24" ];
      #listenPort = 42270;              # default: null  (51820)
      #mtu = 1420;                      # default: null
      #interfaceNamespace = null;      # default: null
      #peers = [{
      #  allowedIps = [ "<LocalIP>/32" ];
      #  dynamicEndpointRefreshRestartSeconds = 5;  # default: null
      #  dynamicEndpointRefreshSeconds = 0;         # default: 0
      #  endpoint = "<RemoteIP|Hostname>:<Port>";
      #  persistentKeepalive = 25;                  # default: null
      #  presharedKey = null;                       # default: null
      #  presharedKeyFile = "/run/secrets/wireguard-${config.networking.wireguard.interfaces[0]}";                   # default: null
      #  publicKey = "";
      #}];
      #postSetup = "";
      #postShutdown = "";
      #preSetup = "";
      #privateKey = "";
      #privateKeyFile = "${host.dirs.secrets}/wireguard-${config.networking.wireguard.interfaces[0]}.privkey";
      #socketNamespace = null; # default: null
      #table = "main";         # default: "main"
    };
  };

  networking.firewall = {
    logReversePathDrops = true;  # if packets still dropped, show in dmesg
    extraCommands = ''
    '';
  };

  #networking.wg-quick.interfaces.wg0 = {
  #};

  # Enable Wireguard network manager service
  services.wg-netmanager.enable = true;
}
