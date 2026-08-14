{
  description = "Portable & Preconfigured Neovim Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      wrappers,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        neovim-wrapped = wrappers.wrappers.neovim.wrap {
          inherit pkgs;
          settings.config_directory = ./.;

          specs.is_nix = {
            data = null;
            before = [ "INIT_MAIN" ];
            config = "vim.g.is_nix = true";
          };

          runtimePkgs = with pkgs; [
            # Non-negotiable
            curl
            git
            gnumake
            stdenv.cc
            tree-sitter
            unzip

            # Plugin dependencies
            bat
            delta
            fd
            fzf
            ripgrep
            websocat
            wl-clipboard

            # LSP Servers and Formatters
            lua-language-server
            stylua

            nixd
            nixfmt
          ];
        };
      in
      {
        packages = {
          default = neovim-wrapped;
          nvim = neovim-wrapped;
        };

        apps.default = flake-utils.lib.mkApp {
          drv = neovim-wrapped;
          exePath = "/bin/nvim";
        };
      }
    );
}
