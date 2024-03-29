{ inputs
, config
, lib
, pkgs
, user
, ...
}:
{
  security.tpm2 = {
    enable = true;
    #applyUdevRules = true;
    #abrmd.enable = true;
    #abrmd.package = pkgs.tpm2-abrmd;
    pkcs11.enable = lib.mkDefault false; # Temporarily disable to fix build
    #pkcs11.package = pkgs.tpm2-pkcs11;
    #tctiEnvironment = {
    #  enable = true;
    #  interface = "device";  # device | tabrmd
    #  deviceConf = "/dev/tpmrm0";
    #  tabrmdConf = "bus_name=com.intel.tss2.Tabrmd";
    #};
    #tssGroup = "tss";
    #tssUser = if config.security.tpm2.abrmd.enable then "tss" else "root";
  };
  #services.tcsd = {
  #  enable = true;
  #  firmwarePCRs = "0,1,2,3,4,5,6,7";
  #  kernelPCRs = "8,9,10,11,12";
  #  conformanceCred = "${config.services.tcsd.stateDir}/conformance.cert";
  #  endorsementCred = "${config.services.tcsd.stateDir}/endorsement.cert";
  #  platformCred = "${config.services.tcsd.stateDir}/platform.cert";
  #};
  users.extraGroups.tss.members = [ user ];
}
