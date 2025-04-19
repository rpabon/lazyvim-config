local wk = require("which-key")

wk.add({
  {
    "<leader>bt",
    "<cmd>b#<cr>",
    desc = "Restore last closed buffer",
    mode = "n",
  },

  -- Insert Empty Line
  {
    "<leader>i",
    group = "Insert Line",
    icon = "󰇘",
  },
  {
    "<leader>ia",
    "O<Esc>",
    desc = "Insert Empty Line Above",
    mode = "n",
  },
  {
    "<leader>ib",
    "o<Esc>",
    desc = "Insert Empty Line Below",
    mode = "n",
  },

  -- Code Minimap
  {
    "<leader>m",
    group = "Minimap",
    icon = "󰦄",
  },
  {
    "<leader>mm",
    "<cmd>Neominimap bufToggle<cr>",
    desc = "Toggle Minimap",
    mode = "n",
  },
  {
    "<leader>mr",
    "<cmd>Neominimap bufRefresh<cr>",
    desc = "Refresh Minimap",
    mode = "n",
  },
  {
    "<leader>mf",
    "<cmd>Neominimap focus<cr>",
    desc = "Focus Minimap",
    mode = "n",
  },
  {
    "<leader>mu",
    "<cmd>Neominimap unfocus<cr>",
    desc = "Unfocus Minimap",
    mode = "n",
  },

  -- Telescope
  {
    "<leader>fa",
    "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
    desc = "Find all (hidden & ignored)",
    icon = "",
    mode = "n",
  },
  {
    "<leader>,",
    "<cmd>Telescope buffers sort_lastused=true ignore_current_buffer=true<cr>",
    desc = "Buffer List",
    mode = "n",
  },

  --  Console Log
  {
    "<leader>v",
    group = "Console Log",
    icon = "󱂅",
  },
  {
    "<leader>vl",
    function()
      require("chainsaw").variableLog()
    end,
    desc = "Variable Log (Chainsaw)",
    mode = "n",
  },
  {
    "<leader>vo",
    function()
      require("chainsaw").objectLog()
    end,
    desc = "Object Log (Chainsaw)",
    mode = "n",
  },

  -- Keybinding for vertical diffing the current branch with another branch
  {
    "<leader>ghC",
    function()
      local branches = vim.fn.systemlist("git branch --all --format='%(refname:short)'")
      vim.ui.select(branches, { prompt = "Select branch for diff:" }, function(branch_name)
        if branch_name then
          vim.cmd("Gitsigns diffthis " .. branch_name .. " --vertical")
        end
      end)
    end,
    desc = "Diff with branch",
    mode = "n",
  },
  {
    "<leader>ghc",
    function()
      local commits = vim.fn.systemlist("git log --pretty=format:'%h - %s' -- " .. vim.fn.expand("%:p"))
      vim.ui.select(commits, { prompt = "Select commit:" }, function(commit)
        if commit then
          -- Extract the commit hash from the selected commit
          local commit_hash = commit:match("^(%S+)")
          if commit_hash then
            vim.cmd("Gitsigns diffthis " .. commit_hash .. " --vertical")
          end
        end
      end)
    end,
    desc = "Diff with commit",
    mode = "n",
  },

  -- GitConflict
  {
    "<leader>gx",
    group = "Git Conflict",
    icon = "",
  },
  {
    "<leader>gxl",
    "<cmd>GitConflictListQf<cr>",
    desc = "List Conflicts",
    mode = "n",
  },
  {
    "<leader>gxo",
    "<cmd>GitConflictChooseOurs<cr>",
    desc = "Accept Ours",
    mode = "n",
  },
  {
    "<leader>gxt",
    "<cmd>GitConflictChooseTheirs<cr>",
    desc = "Accept Theirs",
    mode = "n",
  },
  {
    "<leader>gxb",
    "<cmd>GitConflictChooseBoth<cr>",
    desc = "Accept Both",
    mode = "n",
  },
})

return {}
