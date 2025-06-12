{ pkgs, lib, config, ... }: {

  options = {
    neovimMod = lib.mkEnableOption "enables neovimMod";
  };

  config = lib.mkIf config.neovimMod {
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
        lua-language-server
        python311Packages.python-lsp-server
        nixd
        vimPlugins.nvim-treesitter-parsers.hyprlang
      ];
    };
  };
}
