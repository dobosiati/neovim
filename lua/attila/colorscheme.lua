function isGnomeDarkTheme()
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
    local result = handle:read("*all")
    handle:close()
    return result:find("dark")
end


local colorscheme = "tokyonight-day"  -- Light
if isGnomeDarkTheme() then
    colorscheme = "darkplus"          -- Dark
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


