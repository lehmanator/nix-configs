{
  self,
  inputs,
  system,
  hosts, userPrimary,
  config, lib, pkgs,
  ...
}:
let
in
{
  imports = [
  ];

  home.shellAliases = {
    # --- Directory Navigation ---
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    # --- Privileges -------------
    s = lib.mkIf config.security.sudo.enable "sudo";         # TODO: Make generic
    pk = lib.mkIf config.security.policyKit.enable "pkexec"; # TODO: Reference NixOS config

    # --- Terminal ---------------
    "cl" = "clear";    # Clear teminal output
    "she" = "$SHELL";  # Reload shell

    # --- Home-Manager -----------
    hm = "home-manager";


  };
}
