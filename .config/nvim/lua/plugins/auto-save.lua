-- Toggle automatically saving changes in NeoVim
vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle", {})

-- Silence autosave
vim.g.auto_save_silent = 1
vim.cmd[[
let g:auto_save_silent = 1  " do not display the auto-save notification]]

