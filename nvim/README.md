# nvim

My Neovim configuration based off of [The Primeagen's][1] setup.

## Init

1. Install packer
   ```sh
   $ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```
1. Source the packer file
   ```sh
   $ nvim ./lua/main/packer.lua
   # In nvim, run :so
   ```
1. Run `:PackerSync`

[1]: https://github.com/ThePrimeagen/init.lua/tree/249f3b14cc517202c80c6babd0f9ec548351ec71
