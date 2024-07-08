local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("treesitter not found!")
  return
end

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = {"src/parser.c"},
		branch = "main",
	},
	filetype = 'blade',
}

treesitter.setup({
	ensure_installed = { "bash", "javascript", "json", "lua", "python",
 		"css", "java", "markdown", "markdown_inline","php", "git_config",
    		"git_rebase", "gitattributes", "gitcommit", "gitignore", "go",
    		"html", "scss", "sql", "glimmer", "blade"
  	}, -- one of "all" or a list of languages, -- one of "all" or a list of languages
	auto_install = true,
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = {} },
})
