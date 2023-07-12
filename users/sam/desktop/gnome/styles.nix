
{ inputs, self
, config, lib, pkgs
, ...
}:
{
  imports = [
  ];

  # --- Qt Applications ---
  qt = {
    platformTheme = "gnome";
    package = pkgs.adwaita-qt;
    #name = "adwaita-dark";
  };

  # --- Pinentry ---
  programs.rbw.settings.pinentry = "gnome3";  # TODO: Use grc_4 like with gpg-agent
  services.gpg-agent = {     # Use GTK4 pinentry (requires services.dbus.packages = [ pkgs.gcr_4 ];)
    pinentryFlavor = null;   # Overriding default to use GTK4. Default=gtk2, gnome3 (when gnome desktop enabled)
    extraConfig = ''
      pinentry-program ${pkgs.gcr_4}/libexec/gcr4-ssh-askpass
    '';
  };

  # --- Desktop Shell ---
  # Dunst: Notification Daemon
  services.dunst.iconTheme.name = "Adwaita";
  services.dunst.iconTheme.package = pkgs.adwaita-icon-theme;

}