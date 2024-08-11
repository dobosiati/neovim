local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
vim.notify("luasnip not found!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim"          -- Have packer manage itself
    use "nvim-lua/plenary.nvim"           -- Useful lua functions used by lots of plugins 
    use "windwp/nvim-autopairs"           -- Autopairs, integrates with both cmp and treesitter
    use "akinsho/bufferline.nvim"         -- Handling tabs (buffers)
    use "famiu/bufdelete.nvim"            -- Handling buffer closings
    use "akinsho/toggleterm.nvim"         -- Toggles terminal
    use "mg979/vim-visual-multi"          -- Handles mulitple cursors and selection
    use "kylechui/nvim-surround"          -- Surround selections

    -- Commenting
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Colorschemes
    use "lunarvim/colorschemes"
    use "folke/tokyonight.nvim"

    -- File explorer
    use "nvim-tree/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons"

    -- Notifications
    use "rcarriga/nvim-notify"

    -- CMP
    use "hrsh7th/nvim-cmp"                -- The completion plugin
    use "hrsh7th/cmp-buffer"              -- Buffer completions
    use "hrsh7th/cmp-path"                -- Path completions
    -- Snippet completions
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "L3MON4D3/LuaSnip"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "EmranMR/tree-sitter-blade"

    -- Git client
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    -- Database client
    -- use {
    --   "kndndrj/nvim-dbee",
    --   requires = {
    --       "MunifTanjim/nui.nvim",
    --   },
    --   run = function()
    --       -- Install tries to automatically detect the install method.
    --       -- if it fails, try calling it with one of these parameters:
    --       --    "curl", "wget", "bitsadmin", "go"
    --       require("dbee").install()
    --   end,
    --   -- config = function()
    --   --     require("dbee").setup(--[[optional config]])
    --   -- end
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
    require("packer").sync()
    end
end)
