require("mason").setup({
	PATH = "prepend", -- "skip" seems to cause the spawning error
	ui = {
		icons = {
      package_pending = " ",
			package_installed = "✓",
			package_uninstalled = "✗",
		},
	},
})
