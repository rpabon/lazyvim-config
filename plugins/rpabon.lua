return {
  { "tpope/vim-fugitive" },

  -- Git line blame
  {
    "tveskag/nvim-blame-line",
    config = function()
      vim.g.blameLineGitFormat = "%an | %ar"
    end,
  },

  -- Everforest colorschene
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = true
      -- vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "comfysage/evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      transparent_background = true,
      variant = "hard", -- 'hard'|'medium'|'soft'
    },
  },

  -- rpabon start screen
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
                  _                 
                 | |                
 _ __ _ __   __ _| |__   ___  _ __  
| '__| '_ \ / _` | '_ \ / _ \| '_ \ 
| |  | |_) | (_| | |_) | (_) | | | |
|_|  | .__/ \__,_|_.__/ \___/|_| |_|
     | |                            
     |_|                            
          ]],
        },
      },
    },
  },

  -- Telescope config
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },

    -- Better TS errors
    {
      "OlegGulevskyy/better-ts-errors.nvim",
      dependencies = { "MunifTanjim/nui.nvim" },
      config = {
        keymaps = {
          toggle = "<leader>dd", -- default '<leader>dd'
          go_to_definition = "<leader>dx", -- default '<leader>dx'
        },
      },
    },
  },
}
