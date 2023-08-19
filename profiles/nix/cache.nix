{ inputs, self
, config, lib, pkgs
, ...
}:
{
  imports = [
  ];

  # --- Binary Cache -------------------
  nix.settings = {
    builders-use-substitutes = true; # Allow builders to use binary caches
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org/"
      "https://nix-on-droid.cachix.org/"
      "https://robotnix.cachix.org/"
      "https://nrdxp.cachix.org/"
      "https://numtide.cachix.org/"
      "https://snowflakeos.cachix.org/"
    ];
    trusted-substituters = [
      "https://hydra.nixos.org/"
      "https://nix-community.cachix.org/"
      "https://nix-on-droid.cachix.org/"
      "https://nrdxp.cachix.org/"
      "https://numtide.cachix.org/"
      "https://snowflakeos.cachix.org/"
    ];
    trusted-public-keys = [
      "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-on-droid.cachix.org-1:56snoMJTXmDRC1Ei24CmKoUqvHJ9XCp+nidK7qkMQrU="
      "nrdxp.cachix.org-1:Fc5PSqY2Jm1TrWfm88l6cvGWwz3s93c6IOifQWnhNW4="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
    ];

  };

}
