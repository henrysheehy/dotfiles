vim.opt.spelllang="en_gb,fr,pt,es,ru,cjk"
vim.keymap.set('', '<C-s>', '<Esc>[s1z=``', { silent = true })

vim.opt.spell = true --automatically spell check upon opening LaTeX file

vim.b.SPELL_FRENCH = false

function ToggleFrenchSpell()
  if vim.b.SPELL_FRENCH then  -- if Slovene spelling is on, turn it off
    vim.opt.spelllang:append('en_gb')
    vim.opt.spelllang:remove('fr')
    vim.b.SPELL_FRENCH = false
  else -- if French spelling is off, turn it on
    vim.opt.spelllang:append('fr')
    vim.opt.spelllang:remove('en_gb')
    vim.b.SPELL_FRENCH = true
  end
end

vim.keymap.set('n', '<Leader>zz', '<Cmd>set spell!<CR>')
vim.keymap.set('n', '<Leader>zf', ToggleFrenchSpell)
