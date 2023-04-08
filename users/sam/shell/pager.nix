{
  self,
  inputs,
  host, network, repo,
  config, lib, pkgs,
  ...
}:
{
  imports = [
  ];

  programs.bat.enable = true;
  programs.bat.extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  programs.bat.config = {
    map-syntax = [
      "*.jenkinsfile:Groovy"
      "*.props:Java Properties"
    ];
    pager = "less -FR";
    #theme = "TwoDark";
    theme = "Monokai Extended Light";
  };
  programs.bat.themes = {
  };

  home.shellAliases.b = "bat";
  programs.zsh.shellGlobalAliases.BAT = "| bat";
  programs.zsh.shellGlobalAliases.B = "| bat";
}