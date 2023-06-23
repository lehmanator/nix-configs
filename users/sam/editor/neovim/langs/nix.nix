{ inputs
, ...
}:
{
  programs.nixvim.plugins = {
    lsp.servers = {
      nil_ls.enable = true;
      rnix-lsp.enable = false;
    };
    nix.enable = true;
    null-ls.sources = {
      code_actions.statix.enable = true;
      diagnostics = {
        deadnix.enable = true;
        statix.enable = true;
      };
      formatting = {
        alejandra.enable = true;
        nixfmt.enable = false;
        nixpkgs_fmt.enable = false;
      };
    };
  };
}