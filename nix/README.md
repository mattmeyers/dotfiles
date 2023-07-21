# nix

The purpose of the nix package manager in my setup is to provide a standardized way of building my environment.
Every computer I use usually ends up needing the same set of tools, but I never remember to install them.
This makes that as easy as running a single command.

## Init

1. Run `nix-env -iA nixpkgs.basePkgs`

## Troubleshooting

### OpenGL issues

OpenGL apparently causes issues when using nix e.g. when using alacritty.
The solution is to instead use [nixGL][1].
This can be installed with:

```sh
$ nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl
$ nix-channel --update
$ nix-env -iA nixgl.auto.nixGLDefault
```

[1]: https://github.com/guibou/nixGL
