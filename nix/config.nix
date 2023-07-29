{
  packageOverrides = pkgs: with pkgs; {
    basePkgs = pkgs.buildEnv {
      name = "base-pkgs";
      paths = [
        # Command line environment
        # Alacritty is an OpenGL program which might be problematic with nix.
        # The workaround is to use nixGL. If alacritty is throwing errors on
        # startup, refer to https://github.com/guibou/nixGL
        alacritty
        neovim
        oh-my-zsh
        tmux
        zsh

        # Command line tools
        bat
        curl
        exercism
        fzf
        git
        jq
        just
        ripgrep

        # Programming languages
        go
        nodejs_20
        python312

        # GUI programs
        dbeaver
      ];
      pathsToLink = ["/share" "/bin"];
      extraOutputsToInstall = ["man" "doc"];
    };
  };
}
