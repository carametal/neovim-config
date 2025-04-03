return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "yetone/avante.nvim",
    lazy = false,
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "claude",
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" },
    },
    config = function()
      local neotest_golang_opts = {}
      require("neotest").setup {
        adapters = {
          require "neotest-golang"(neotest_golang_opts),
        },
      }
    end,
    keys = {
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "test all files",
      },

      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "test summary",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "test file",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,
      }
      vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
        fg = "#4060B0",
      })
    end,
    keys = {
      { "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Gitsigns blame" },
      { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Gitsigns blame_line" },
      { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Gitsigns diffthis" },
    },
  },
}
