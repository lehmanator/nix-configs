{ self, inputs
, config, lib, pkgs
, ...
}:
{

  imports = [
    #./android
    #./linux-phone
    #./iot
    #./sbc/rockchip
  ];

}
