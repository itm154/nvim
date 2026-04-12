# itm154's Neovim config

<img width="2690" height="1526" alt="image" src="https://github.com/user-attachments/assets/0f2b004c-b741-4a58-a4a1-9f574c383290" />

## Installation

### Pre-requisite

1. `nvim >= 0.12`
2. `git`, `curl`, `unzip` (for plugin/tool installation)
3. `gcc`, `make` (for Treesitter parsers)
4. `fzf`, `ripgrep` (for fuzzy searching)
5. `node`, `python3` (runtimes for LSPs and tools)
6. `websocat` (required for `typst-preview`)

### 🐧 Linux

1. **Install dependencies (Arch Linux):**
   ```bash
   sudo pacman -S neovim git curl unzip base-devel fzf ripgrep nodejs python websocat
   ```

2. **Clean up previous installations:**
   ```bash
   rm -rf ~/.config/nvim
   rm -rf ~/.local/share/nvim
   rm -rf ~/.local/state/nvim
   rm -rf ~/.cache/nvim
   ```

3. **Clone the repository:**
   ```bash
   git clone https://github.com/itm154/nvim ~/.config/nvim
   ```

4. **Launch Neovim:**
   ```bash
   nvim
   ```

### 🪟 Windows (PowerShell)

1. **Install dependencies (WinGet):**
   ```powershell
   winget install Neovim.Neovim Git.Git Python.Python.3 OpenJS.NodeJS Microsoft.VisualStudio.2022.BuildTools junegunn.fzf BurntSushi.ripgrep 7zip.7zip
   ```

   **Alternative for non-admin users ([Scoop](https://scoop.sh)):**
   ```powershell
   scoop install neovim git ripgrep fzf python nodejs gcc 7zip
   ```

2. **Clean up previous installations:**
   ```powershell
   Remove-Item -Recurse -Force $HOME\AppData\Local\nvim
   Remove-Item -Recurse -Force $HOME\AppData\Local\nvim-data
   Remove-Item -Recurse -Force $HOME\AppData\Local\nvim-state
   Remove-Item -Recurse -Force $HOME\AppData\Local\nvim-cache
   ```

3. **Clone the repository:**
   ```powershell
   git clone https://github.com/itm154/nvim $HOME\AppData\Local\nvim
   ```

4. **Launch Neovim:**
   ```powershell
   nvim
   ```

## 📦 Plugins

- [blink.cmp](https://github.com/saghen/blink.cmp)
- [blink.pairs](https://github.com/saghen/blink.pairs)
- [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua)
- [catppuccin](https://github.com/catppuccin/nvim)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim)
- [nvim-java](https://github.com/nvim-java/nvim-java)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [mason.nvim](https://github.com/mason-org/mason.nvim)
- [mini.nvim](https://github.com/echasnovski/mini.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [tiny-code-action.nvim](https://github.com/rachartier/tiny-code-action.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)

## ⌨️ Keymaps

<details>
<summary>General</summary>

| Keymap      | Action                  |
| :---------- | :---------------------- |
| `<leader>e` | Toggle Neo-tree         |
| `<leader>n` | Toggle Relative Numbers |
| `<leader>x` | Close Buffer            |
| `<leader>p` | Paste Image             |
| `<C-s>`     | Save File               |
| `<C-c>`     | Copy Whole File         |
| `<Esc>`     | Clear Highlights        |

</details>

<details>
<summary>LSP</summary>

| Keymap       | Action                |
| :----------- | :-------------------- |
| `gd`         | Go to Definition      |
| `gD`         | Go to Declaration     |
| `gI`         | Go to Implementation  |
| `gT`         | Go to Type Definition |
| `K`          | Hover Documentation   |
| `[d`         | Next Diagnostic       |
| `]d`         | Previous Diagnostic   |
| `<leader>ca` | Code Actions          |

</details>

<details>
<summary>Search (fzf-lua)</summary>

| Keymap       | Action            |
| :----------- | :---------------- |
| `<leader>ff` | Find Files        |
| `<leader>fa` | Find All Files    |
| `<leader>fw` | Live Grep         |
| `<leader>fb` | Find Buffers      |
| `<leader>fo` | Recent Files      |
| `<leader>fs` | Workspace Symbols |
| `<leader>fd` | Document Symbols  |

</details>

<details>
<summary>Debugging (DAP)</summary>

| Keymap        | Action            |
| :------------ | :---------------- |
| `<leader>dt`  | Toggle Breakpoint |
| `<leader>dc`  | Continue / Start  |
| `<leader>dk`  | Terminate         |
| `<leader>dso` | Step Over         |
| `<leader>dsi` | Step Into         |
| `<leader>dsu` | Step Out          |
| `<leader>dut` | Toggle Debug UI   |

</details>
