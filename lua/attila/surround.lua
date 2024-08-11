local status_ok, surround, _ = pcall(require, "nvim-surround")
if not status_ok then
  vim.notify("nvim-surround not found!")
  return
end

surround.setup({
    -- Configuration here, or leave empty to use defaults
})
