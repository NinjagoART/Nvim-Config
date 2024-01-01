require("nvim-tree").setup {
  filters = {
    dotfiles = true,
  },    
  auto_reload_on_write = true,
     view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        width = {},
        side = "left",
        preserve_window_proportions = false,
        -- number = true,
        -- relativenumber = true,
        signcolumn = "yes",
    },
	renderer = {
	  indent_markers = {
		  enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
	},
	icons = {
      glyphs = {
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}
