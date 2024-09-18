# Neovim

My Neovim configuration, you can use it to code smoothly without the need to learn vim motion.

* [Lazy.nvim](https://github.com/folke/lazy.nvim) | The plugin manager.
* [Mason.nvim](https://github.com/williamboman/mason.nvim) | The language server manager.
* [Themify.nvim](https://github.com/LmanTW/themify.nvim) | The colorscheme manager.
* [coq.nvim.nvim](https://github.com/ms-jpq/coq_nvim) | The completion engine.
* [nvim-tree.nvim](https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file) | The file explorer.
* [barbar.nvim](github.com/romgrk/barbar.nvim) | The tabline.

## Installation

```
git clone https://github.com/LmanTW/nvim.git
mv nvim ~/.config/nvim
```

> [!NOTE]
> Required: [nodejs](https://nodejs.org/en), [npm](https://www.npmjs.com)

# Keymaps

```
- Navigation -

<Meta-Left>: Jump to the start of the line.
<Meta-Right>: Jump to the end of the line.
<Meta-Up>: Jump to the top of the buffer.
<Meta-Down>: Jump to the bottom of the buffer.

- Editing -

<Meta-x>: Delete the current line.
<Meta-d>: Delete the current word.
| Stand for "Delete".
<Control-Shift-Up>: Switch the current line with the line above. 
<Control-Shift-Down>: Switch the current line with the line below.

<Meta-z>: Undo.
<y>: Copy the selected content. (Visual mode)
<p>: Past. (Normal and Visual mode, use system shortcut in Insert mode.)

<a>: Add to the start of every selected lines. (Visual mode)
| Stand for "Add".
<r>: Remove the first character of every selected lines. (Visual mode)
| Stand for "Remove".

- Selecting -

<Shift-Left>: Start selecting in Visual mode.
<Shift-Right>: Start selecting in Visual mode.

- Other -

<Control-w>: Write the file.
<Control-c>: Quit.

<Control-e>: Switch to Insert mode.
| Stand for "Edit".
<Control-v>: Switch to Visual mode.
| Stand for "Visual".

- Plugins -

<Control-z>: Toggle LSP diagnostics.
<Meta-Up>: Scroll up.
<Meta-Down>: Scroll down.
<Alt-Left>: Switch to the previous tab.
<Alt-Right>: Switch to the next tab.
<Alt-[>: Move the tab to the left.
<Alt-]>: Move the tab to the right.
<Alt-Up>: Focus on the current tab.
<Alt-Down>: Delete the current tab.
<Control-f>: Focus on the file explorer.
| Stand for "File".
<Control-g>: Open Telescope find_files.
<Control-t>: Toggle the terminal.
| Stand for "Terminal".
<Control-r>: Run the current file.
| Stand for "Run".
```