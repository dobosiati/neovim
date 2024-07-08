local status_ok, _ = pcall(require, "lazygit")
if not status_ok then
  vim.notify("lazygit not found!")
  return
end

vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', {})
