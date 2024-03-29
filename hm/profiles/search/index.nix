{ inputs, config, lib, pkgs, ... }:
{
  # --- File Indexer ---
  services.recoll = with config.xdg.userDirs; {
    enable = true;
    package = pkgs.recoll; #(pkgs.recoll.override { withGui = false; })
    startAt = "00/2:00";
    settings = {
      nocjk = false;
      loglevel = 5;
      topdirs = with config.xdg.userDirs.extraConfig; [
        config.xdg.configHome
        config.xdg.dataHome
        desktop
        download
        documents
        publicShare
        templates
        XDG_AUTOSTART_DIR
        XDG_BOOKS_DIR
        XDG_CODE_DIR
        XDG_LAUNCHERS_DIR
        XDG_NOTES_DIR
        XDG_REPOS_DIR
        XDG_SCRIPTS_DIR
        XDG_UNITS_DIR
        "~/.var/app" # Flatpak
        "/usr/share/doc" # Package-installed documentation
        "/usr/local/share/doc" # User-installed documentation
      ];
      "${download}" = {
        "skippedNames+" = [ "*.iso" "*.nsp" "*.bin" "*.exe" "*.msi" ];
      };
      "${extraConfig.XDG_CODE_DIR}" = {
        "skippedNames+" = [ "node_modules" "target" "result" ".git" ".svn" ".cvs" ];
      };
      "${extraConfig.XDG_REPOS_DIR}" = {
        "skippedNames+" = [ "node_modules" "target" "result" ".git" ".svn" ".cvs" ];
      };
    };
  };

}
