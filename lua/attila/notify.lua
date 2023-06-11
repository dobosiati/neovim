local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("notify not found!")
  return
end

notify.setup({
  render = "minimal",
  -- background_colour = "#000000",
})

vim.notify = notify
