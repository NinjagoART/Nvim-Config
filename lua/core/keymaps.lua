-- normal_mode = "n", insert_mode = "i"
-- visual_mode = "v", visual_block_mode = "x" 
-- term_mode = "t", command_mode = "c"

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end


-- Leader key --
map('n', '<Space>', '', '')
vim.g.mapleader = ' '


-- Removing a a stupid things --

map({ "n", "v" }, "q:", "<nop>")

-- Keybindigs

map('n', '<Leader>q', ':qa!<CR>', 'Exit to nvim')
map('n', '<C-s>', ':w <CR>', 'Save Files')
map('n', '<tab>', '')
map('n', '<C-k>', ':wincmd k<CR>', '' )
map('n', '<C-j>', ':wincmd j<CR>', '' )
map('n', '<C-h>', ':wincmd h<CR>', '' )
map('n', '<C-l>', ':wincmd l<CR>', '' )
-- map('i', 'qqq', '<Esc>', {})
map('n', '<Leader>g', 'gg','' )
map('n', "<Tab>", "<Cmd>BufferLineCycleNext<CR>", "Next tab")
map('n', "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", "Prev tab")
-- Pugins --
map({'n', 'v'}, '<Leader>e', ':NvimTreeToggle<Cr>', 'Toggle NvTree')

map(
	{'n','t'},
	'<A-t>',
	function ()
		require("nvterm.terminal").toggle "horizontal"
	end,
	"Spawn new term"
)

map('n', '<C-W>', ':bdelete!<CR>', 'Close Actual buffer')
map('n', 'qq', ':bdelete<CR>', 'Close bufer')

