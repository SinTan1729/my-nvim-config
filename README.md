# My NeoVim Config Files

This is my config for [neovim](https://neovim.io). It's a bit over-engineered I guess, but hey, it fits my needs.
There are two modes for this config. The default `core` one that's used by default, and then an
`extra` layer that's activated by setting the environment variable `NVIM_CONFIG_MODE` to `full`.

I'm using [`zpack.nvim`](https://github.com/zuqini/zpack.nvim) as my plugin manager.

Feel free to use it as a baseline for your personal neovim configuration.

[![dotfyle](https://img.shields.io/badge/View%20on-Dotfyle-6C63FF?style=for-the-badge&logo=neovim&logoColor=white)](https://dotfyle.com/SinTan1729/my-nvim-config)

## Notes

1. In the `core` config, the binaries for `fzf`, `python`, and `tree-sitter` assumed to be installed in your system.
1. In the `extra` config, we install and setup some LSPs. I chose against using `mason` because I
   prefer having control over which binaries are in my system. So, the following binaries must be installed
   manually for it to work.
   ```
   ty, ruff, luals, gopls, hls, clippy, bashls, fish-lsp
   ```
1. In the `extra` config, `vimtex` assumes that packages related to compiling and editing LaTeX files are installed
   in your system. Please take a look at its documentation to figure out the details.
1. If you don't want to use a certain plugin, just don't enable the full mode, and move that plugin to `lua/plugins/core`.
   The configs are isolated enough for this to work. If it doesn't, that's a bug, so feel free file an issue.
1. Any dictionary files `dict.utf-8.add` dropped inside `spell/` will automatically be compiled and loaded into the
   spellchecker. The files aren't committed here for privacy reasons. Just create a `spell/` directory, and it should work.
