local g   = vim.g
local o   = vim.o
local opt = vim.opt


-- Line Numeration
o.number	= true
o.rnu		= true 
o.cursorline	= true

-- Searching 
o.ic = true
o.smartcase  = true
o.hlsearch   = false
o.incsearch  = true
o.magic		 = true

-- File updating 

o.autoread	= true

-- General Options

opt.encoding     = 'utf8'
opt.fileencoding = 'utf8'
o.termguicolors	 = true
o.clipboard	 = 'unnamedplus'
o.history	 = 50
o.hidden	 = true
o.shiftwidth = 4
o.tabstop    = 4
o.mouse		 = 'a'

-- Undo and backup

o.backup      = true
o.writebackup = true
o.swapfile    = true
o.undofile    = true

o.backupdir   = '/tmp'
o.directory   = '/tmp'
o.undodir     = '/tmp'

