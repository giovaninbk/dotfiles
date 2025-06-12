return {
  'tpope/vim-dispatch',
  'radenling/vim-dispatch-neovim',
  'clojure-vim/vim-jack-in',
  'Olical/conjure',
  'HiPhish/rainbow-delimiters.nvim',
  {
    'julienvincent/nvim-paredit',
    config = function()
      require('nvim-paredit').setup()
    end,
  },
}
