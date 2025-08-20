# Neovim Configuration

This repository contains my personal Neovim configuration. It's set up with lazy loading for plugins and includes support for multiple programming languages.

## Features

- Lazy-loaded plugins using [lazy.nvim](https://github.com/folke/lazy.nvim)
- Language Server Protocol (LSP) support for:
  - Python (Pyright)
  - Go (gopls)
  - Rust (rust-analyzer)
  - C/C++ (clangd/ccls)
  - Lua
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting and code understanding
- [Lualine](https://github.com/nvim-lualine/lualine.nvim) for status line
- [Nord](https://github.com/arcticicestudio/nord-vim) color scheme

## Installation

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone https://github.com/kylemestery/nvim-config.git ~/.config/nvim
   ```

2. Start Neovim and run `:Lazy sync` to install plugins

3. Restart Neovim

## Usage

The configuration includes the following key mappings:

- `<Space>` as leader key
- `<C-p>` for Telescope fuzzy finder
- `<C-g>` for LSP actions (via lspsaga)

## Customization

To customize this configuration, you can modify files in the `lua/` directory.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.