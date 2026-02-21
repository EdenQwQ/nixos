{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = true;
      ensure_installed = [
        "diff"
        "bash"
        "fish"
        "python"
        "yaml"
        "lua"
        "json"
        "nix"
        "regex"
        "toml"
        "vim"
        "markdown"
        "rust"
        "jsonc"
        "glsl"
        "css"
        "hyprlang"
        "r"
      ];
      highlight.enable = true;
      indent.enable = true;
    };
  };
  programs.nixvim.plugins.hmts.enable = true;
  programs.nixvim.plugins.rainbow-delimiters.enable = true;
}
