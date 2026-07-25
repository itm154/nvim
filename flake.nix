{
  description = "Neovim with LSP dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      # Define the systems you want to support
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      # A helper function to generate outputs for each system
      # It imports nixpkgs for the system and passes the resulting 'pkgs' to the function 'f'
      forAllSystems =
        f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs { inherit system; }));
    in
    {
      # Use the helper to generate the packages attribute for every system
      packages = forAllSystems (
        pkgs:
        let
          pkgList = with pkgs; [
            # LSPs
            lua-language-server
            tinymist
            ruff
            ty
            nixd

            # Formatters & Linters
            stylua
            rustfmt
            nixfmt
            prettier
            shfmt
            shellcheck
            jq
            clang-tools

            # Tools & Runtime Dependencies
            ripgrep
            fd
            fzf
            delta
            bat
            websocat
            tree-sitter
            gcc
            gnumake
            imagemagick
            lua5_1
            luarocks
          ];
        in
        {
          # Define the default package for this system
          default = inputs.wrappers.wrappers.neovim.wrap {
            inherit pkgs;
            env = {
              "CONFIG_ROOT" = ./.;
              "NVIM_APPNAME" = "nvim-itm154";
            };
            runtimePkgs = pkgList;
            settings.config_directory = ./.;
          };
        }
      );
    };
}
