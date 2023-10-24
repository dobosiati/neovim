local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = { "bash", "javascript", "json", "lua", "python",
    "css", "java", "markdown", "markdown_inline","php", "git_config",
    "git_rebase", "gitattributes", "gitcommit", "gitignore", "go",
    "html", "scss", "sql", "glimmer"
  }, -- one of "all" or a list of languages
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = {} },
})
