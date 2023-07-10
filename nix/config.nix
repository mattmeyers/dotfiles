{
  packageOverrides = pkgs: with pkgs; {
    basePkgs = pkgs.buildEnv {
      name = "base-pkgs";
      paths = [
        # Command line environment
        alacritty
        neovim
        tmux
        zsh

        # Command line tools
        bat
        fzf
        git
        jq
        ripgrep

        # Programming languages
        go
        python312

        # GUI programs
        dbeaver
      ];
      pathsToLink = ["/share/man" "/share/doc" "/bin"];
      extraOutputsToInstall = ["man" "doc"];
    };
  };
}
