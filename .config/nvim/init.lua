vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = ","

if vim.g.vscode then
  local vscode = require "vscode"
  vim.g.mapleader = " "
  vim.g.maplocalleader = ","

  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

  vim.keymap.set("i", "<C-c>", "<Esc>")

  vim.keymap.set("n", "<C-h>", "20zh", { desc = "Scroll 20 characters to the left" })
  vim.keymap.set("n", "<C-l>", "20zl", { desc = "Scroll 20 characters to the right" })

  vim.keymap.set({ "n", "x" }, "<leader>r", function()
    vscode.with_insert(function()
      vscode.action "editor.action.refactor"
    end)
  end)

  vim.keymap.set({ "n", "x" }, "<localleader>ee", function()
    vscode.action "calva.evaluateSelection"
  end)

  vim.keymap.set({ "n", "x" }, "<localleader>ef", function()
    vscode.action "calva.loadFile"
  end)

  vim.keymap.set({ "n", "x" }, "<localleader>er", function()
    vscode.action "calva.evaluateCurrentTopLevelForm"
  end)

  vim.keymap.set({ "n", "x" }, "<localleader>tc", function()
    vscode.action "calva.runTestUnderCursor"
  end)

  vim.keymap.set({ "n", "x" }, "<localleader>ta", function()
    vscode.action "calva.runAllTests"
  end)

  vim.keymap.set({ "n", "x" }, "<localleader>tn", function()
    vscode.action "calva.runNamespaceTests"
  end)

  vim.keymap.set({ "n", "x" }, "<localleader>ji", function()
    vscode.action "calva.jackIn"
  end)

  vim.keymap.set({ "n", "x" }, "<localleader>jo", function()
    vscode.action "calva.jackOut"
  end)

  vim.opt.clipboard:append "unnamedplus"
  -- VSCode extension
  vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
      vim.hl.on_yank()
    end,
  })
else
  -- ordinary Neovim
  -- bootstrap lazy and all plugins
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
  end

  vim.opt.rtp:prepend(lazypath)

  local lazy_config = require "configs.lazy"

  -- load plugins
  require("lazy").setup({
    {
      "NvChad/NvChad",
      lazy = false,
      branch = "v2.5",
      import = "nvchad.plugins",
    },

    { import = "plugins" },
  }, lazy_config)

  -- load theme
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")
  require "options"
  require "autocmds"

  vim.schedule(function()
    require "mappings"
    vim.o.clipboard = "unnamedplus"
  end)
end
