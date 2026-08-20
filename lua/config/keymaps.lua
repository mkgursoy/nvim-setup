vim.api.nvim_create_user_command("Template", function()
  local template_path = vim.fn.expand("~/.config/nvim/templates/cpp.tpl")
  vim.cmd([[0,$delete _]])
  local lines = vim.fn.readfile(template_path)
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.api.nvim_win_set_cursor(0, {1, 0})
end, { desc = "Load C++ template from templates/cpp.tpl" })

-- 1. Command to instantly build the 3-pane layout
vim.api.nvim_create_user_command("CPLayout", function()
  local in_file = vim.fn.expand("~/Documents/in.txt")
  local out_file = vim.fn.expand("~/Documents/out.txt")

  -- Create the files if they don't exist yet
  if vim.fn.filereadable(in_file) == 0 then vim.fn.writefile({""}, in_file) end
  if vim.fn.filereadable(out_file) == 0 then vim.fn.writefile({""}, out_file) end

  -- Open in.txt in a vertical split, forcing it to be exactly 35 columns thin
  vim.cmd("botright 35vsplit " .. in_file)
  
  -- Split that right window horizontally and open out.txt below it
  vim.cmd("belowright split " .. out_file)
  
  -- Jump cursor back to your C++ file on the left
  vim.cmd("wincmd h")
end, { desc = "Set up thin 3-pane CP layout" })

vim.api.nvim_create_user_command("RunCPP", function()
  -- 1. Save open buffers
  vim.cmd("wa")

  local file = vim.fn.expand("%")
  local in_file = vim.fn.expand("~/Documents/in.txt")
  local out_file = vim.fn.expand("~/Documents/out.txt")
  local raw_out = "/tmp/cpp_raw.txt"

  -- 2. Compile silently (-DLOCAL enabled)
  local compile_cmd = string.format(
    "g++ -std=c++17 -O2 -Wall -DLOCAL %s -o /tmp/cpp_run > %s 2>&1",
    vim.fn.shellescape(file),
    vim.fn.shellescape(out_file)
  )

  -- Running system() directly prevents Neovim from opening an interactive subshell prompt
  vim.fn.system(compile_cmd)

  -- 3. Check if compilation succeeded
  if vim.v.shell_error == 0 then
    -- Stream program execution output + cerr debug to raw file
    local run_cmd = string.format(
      "/tmp/cpp_run < %s > %s 2>&1",
      vim.fn.shellescape(in_file),
      vim.fn.shellescape(raw_out)
    )
    vim.fn.system(run_cmd)

    -- 4. Parse execution time ([TIME]) out of raw output
    local lines = vim.fn.readfile(raw_out)
    local clean_lines = {}
    local exec_time = nil

    for _, line in ipairs(lines) do
      local time_match = line:match("^%[TIME%]%s+(.+)%s*")
      if time_match then
        exec_time = time_match
      else
        table.insert(clean_lines, line)
      end
    end

    -- Write clean stdout to out.txt and refresh buffer
    vim.fn.writefile(clean_lines, out_file)
    vim.cmd("checktime")

    -- 5. Show clean status without prompt pause
    if exec_time then
      vim.api.nvim_echo({
        { string.format("[Execution Time: %s]", exec_time), "DiagnosticInfo" }
      }, false, {})
    else
      vim.api.nvim_echo({
        { "[Finished]", "DiagnosticInfo" }
      }, false, {})
    end
  else
    -- Compilation failed: refresh out.txt so errors display in split
    vim.cmd("checktime")
    vim.api.nvim_echo({
      { "[Compilation Failed - See out.txt]", "DiagnosticError" }
    }, false, {})
  end
end, { desc = "Compile and run C++ silently without press enter prompt" })

-- 3. Keymaps for speed
vim.keymap.set("n", "<leader>l", ":CPLayout<CR>", { silent = true, desc = "Open CP Splits" })
vim.keymap.set("n", "<leader>r", ":RunCPP<CR>", { silent = true, desc = "Run CP" })
vim.keymap.set("n", "<leader>t", ":Template<CR>", { silent = true, desc = "Set template" })
