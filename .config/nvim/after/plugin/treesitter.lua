require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	auto_install = true,
	ensure_installed = { "c", "lua", "vimdoc", "cpp" },

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
})
