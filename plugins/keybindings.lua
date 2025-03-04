local wk = require("which-key")

-- Function to get a list of all Git branches
local function get_git_branches()
  -- Run the git command to list all branches and return the result as a list
  local branches = vim.fn.systemlist("git branch --all --format='%(refname:short)'")
  return branches
end

-- Function to compare the current branch with a selected branch
local function compare_to_branch()
  -- Get the list of branches
  local branches = get_git_branches()
  -- Use vim.ui.select to prompt the user to select a branch from the list
  vim.ui.select(branches, { prompt = "Select branch:" }, function(branch_name)
    if branch_name then
      -- Run the Gvdiffsplit command with the selected branch name
      vim.cmd("Gvdiffsplit " .. branch_name)
    end
  end)
end

-- Function to get the current file name
local function get_current_file_name()
  return vim.fn.expand("%:t")
end

-- Function to confirm Git reset buffer
local function confirm_git_reset_buffer()
  local file_name = get_current_file_name()
  vim.ui.input({ prompt = "Do you want to Git reset " .. file_name .. "? (y/n): " }, function(input)
    if input == "y" then
      vim.cmd("Gitsigns reset_buffer")
    end
  end)
end

wk.add({
  {
    -- Keybinding for finding all files, including hidden files
    "<leader>fa",
    "<cmd>Telescope find_files no_ignore=true hidden=true<cr>",
    desc = "Find all files",
    mode = "n",
  },
  {
    -- Keybinding for resetting the current Git buffer with confirmation
    "<leader>gR",
    confirm_git_reset_buffer,
    desc = "Git reset file",
    mode = "n",
  },
  {
    -- Keybinding for comparing the current branch to another branch
    "<leader>gD",
    compare_to_branch,
    desc = "Git diff (branch)",
    mode = "n",
  },
  {
    -- Keybinding for adding the current file to Git
    "<leader>gA",
    "<cmd>Gitsigns stage_buffer<cr>",
    desc = "Git add file",
    mode = "n",
  },
  {
    -- Keybinding for committing changes with Gitsigns
    "<leader>gC",
    function()
      vim.ui.input({ prompt = "Enter commit message: " }, function(input)
        if input then
          vim.cmd('G commit -m "' .. input .. '"')
        end
      end)
    end,
    desc = "Git commit",
    mode = "n",
  },
  {
    -- Keybinding for pushing the current branch with Fugitive
    "<leader>gP",
    "<cmd>Git push<cr>",
    desc = "Git push",
    mode = "n",
  },
})

return {}
