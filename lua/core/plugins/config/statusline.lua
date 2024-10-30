require("bufferline").setup {
    options = {
        mode = 'buffers',
        -- diagnostics = 'coc',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true,
            }
        },
    },
}
