local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found!")
  return
end

vim.keymap.set('n', '<A-q>', ':NvimTreeToggle<CR>', {})

nvim_tree.setup {
  git = {
    enable = false
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "󰛨",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
  },
  on_attach = function (bufnr)
    local api_status_ok, api = pcall(require, "nvim-tree.api")
    if not api_status_ok then
      vim.notify("nvim-tree.api not found!")
      return
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '<CR>', api.node.open.edit, {})
    vim.keymap.set('n', 'q', api.tree.close, {})
    vim.keymap.set('n', '<S-CR>', api.node.open.vertical, {})
    vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, {})
  end
}
