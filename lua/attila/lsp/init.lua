local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lspconfig not found!")
    return
end

require "attila.lsp.mason"
require("attila.lsp.handlers").setup()
require "attila.lsp.null-ls"

