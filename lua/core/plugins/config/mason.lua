require("mason").setup({
	PATH = "prepend", -- "skip" seems to cause the spawning error
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
