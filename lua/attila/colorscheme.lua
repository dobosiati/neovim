-- local colorscheme = "tokyonight-day"  -- Light
local colorscheme = "darkplus"        -- Dark

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


