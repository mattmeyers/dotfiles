{
    /**
     * These are additional packages that I usually install on linux machines.
     * These probably should be installed via the distro's native package
     * manager though as there is a bunch of extra config stuff that has to
     * happen that simply installing via nix does not do. However, if using
     * NixOS, these can get included.
     */
    paths = [
        sway
        swayidle
        wl-clipboard
    ]
}
