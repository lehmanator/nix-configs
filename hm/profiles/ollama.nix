{
  config,
  pkgs,
  ...
}: {
  home = {
    sessionVariables.OLLAMA_HOST = "45.42.244.197:11434";
    packages = [pkgs.ollama];
  };
}
