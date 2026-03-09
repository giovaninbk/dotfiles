local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      sync_root_with_cwd = true,
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
      },
    },
  },
  "tpope/vim-dispatch",
  "radenling/vim-dispatch-neovim",
  "clojure-vim/vim-jack-in",
  {
    "Olical/conjure", -- etc
    ft = { "clojure", "fennel" },
    lazy = true,
    init = function()
      vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = { "deftest", "defflow", "defspec", "describe" }
    end,
  },
  "HiPhish/rainbow-delimiters.nvim",
  {
    "julienvincent/nvim-paredit",
    ft = { "clojure" },
    config = function()
      require("nvim-paredit").setup()
    end,
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "editor-code-assistant/eca-nvim",
    dependencies = {
      "MunifTanjim/nui.nvim", -- Required: UI framework
      "nvim-lua/plenary.nvim", -- Optional: Enhanced async operations
      "folke/snacks.nvim", -- Optional: Picker for server messages/tools
    },
    opts = {},
  },
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
  {
    "editor-code-assistant/eca-nvim",
    dependencies = {
      "MunifTanjim/nui.nvim", -- Required: UI framework
      "nvim-lua/plenary.nvim", -- Optional: Enhanced async operations
      "folke/snacks.nvim", -- Optional: Picker for server messages/tools
    },
    keys = {
      { "<leader>ec", "<cmd>EcaChat<cr>", desc = "Open ECA chat" },
      { "<leader>ef", "<cmd>EcaFocus<cr>", desc = "Focus ECA sidebar" },
      { "<leader>et", "<cmd>EcaToggle<cr>", desc = "Toggle ECA sidebar" },
    },
    opts = {
      debug = false,
      server_path = "",
      behavior = {
        auto_set_keymaps = true,
        auto_focus_sidebar = true,
      },
    },
  },
}
