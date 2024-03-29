{
  inputs,
  self,
  ...
}: {
  imports = [inputs.ez-configs.flakeModule];

  # TODO: Restructure dirs
  ezConfigs = {
    globalArgs = {
      inherit inputs self;
      user = "sam";
    };
    home = {
      configurationsDirectory = "../hm/users";
      modulesDirectory = "../hm/modules";
      extraSpecialArgs = {};
    };
    nixos = {
      modulesDirectory = "../nixos/profiles";
      configurationsDirectory = "../nixos/hosts";
      hosts = {fajita = {system = "aarch64-linux";};};
    };
    darwin = {
      modulesDirectory = "../darwin/profiles";
      configurationsDirectory = "../darwin/hosts";
    };
  };
}
