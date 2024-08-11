local status_ok, dbee = pcall(require, "dbee")
if not status_ok then
    vim.notify("dbee not found!")
	return
end

dbee.setup {
    sources = {
      require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
    },
}
