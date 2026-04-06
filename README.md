# Configuração Neovim (Lua)

Configuração pessoal do Neovim usando `lazy.nvim` como gerenciador de plugins, com foco em:

- desenvolvimento web/backend (LSP, autocompletion e snippets)
- navegaçãoao rápida de arquivos/buffers/git
- interface limpa com tema Catppuccin e statusline customizada

## Requisitos

- Neovim 0.11+
- Git
- `ripgrep` (busca de texto)
- `fd` (busca de arquivos para o `fzf-lua`)
- `fzf` (backend para fuzzy find)
- `xclip` ou `wl-clipboard` (clipboard no Linux)
- Nerd Font (opcional, para icones)

Observação: os servidores LSP instalados via Mason podem exigir runtimes específicos (Node.js, Go, Python etc.), de acordo com cada linguagem.

## Instalação

```bash
git clone https://github.com/p3aga/nvim.lua.git ~/.config/nvim
nvim
```

## Plugins Utilizados

### Gerenciador

- `folke/lazy.nvim`

### Tema e UI

- `catppuccin/nvim`
- `nvim-lualine/lualine.nvim`
- `echasnovski/mini.icons`
- `folke/which-key.nvim`
- `stevearc/oil.nvim`
- `christoomey/vim-tmux-navigator`

### Edição e produtividade

- `nvim-treesitter/nvim-treesitter`
- `HiPhish/rainbow-delimiters.nvim`
- `lukas-reineke/indent-blankline.nvim`
- `numToStr/Comment.nvim`
- `echasnovski/mini.pairs`
- `lewis6991/gitsigns.nvim`
- `ibhagwan/fzf-lua`

### LSP, autocompletion e diagnósticos

- `neovim/nvim-lspconfig`
- `mason-org/mason.nvim`
- `mason-org/mason-lspconfig.nvim`
- `saghen/blink.cmp`
- `L3MON4D3/LuaSnip`
- `rafamadriz/friendly-snippets`
- `folke/trouble.nvim`