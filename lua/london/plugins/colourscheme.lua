    return {
	"Mofiqul/dracula.nvim",
	name = "dracula",
	config = function()
		require("dracula").setup({
			transparent_bg = true,
		})
		vim.cmd.colorscheme "dracula"
	end,
}
