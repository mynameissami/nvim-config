require "nvchad.mappings"
local M = {}

local map = vim.keymap.set

-- NORMAL mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>f", function()
  require("conform").format()
end, { desc = "Format File" })

-- C++ compile & run
map("n", "<leader>r", function()
  vim.cmd("w")
  vim.cmd("!g++ % -o output.exe && start cmd /k output.exe")
end, { desc = "Compile & Run C++ on Windows" })

-- Live server for HTML
map("n", "<leader>ls", function()
  vim.cmd("!start cmd /k live-server")
end, { desc = "Start Live Server for HTML" })

-- Rust compile & run
map("n", "<leader>rr", function()
  vim.cmd("w") -- save
  local file = vim.fn.expand("%:r") -- file name without extension
  vim.cmd("!rustc % -o " .. file .. ".exe && start cmd /k " .. file .. ".exe")
end, { desc = "Compile & Run Rust" })

map("n", "<leader>rb", function()
  vim.cmd("w")
  vim.cmd("!cargo build && cargo run")
end, { desc = "Cargo Build & Run" })

map("n", "<leader>jr", function()
  vim.cmd("w") -- save file
  local file_dir = vim.fn.expand("%:p:h") -- full path to the file's directory
  local file_name = vim.fn.expand("%:t") -- file name with extension
  local class_name = vim.fn.expand("%:t:r") -- class name (without extension)
  local javac = [[C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin\javac.exe]]
  local java  = [[C:\Program Files\Eclipse Adoptium\jdk-21.0.8.9-hotspot\bin\java.exe]]

  -- 🟢 Use ^&^& to escape the command separators.
  -- This ensures the '&&' is interpreted by the new cmd window, not the parent shell.
  local command_to_run = string.format(
    'cd /d "%s" ^&^& "%s" "%s" ^&^& "%s" %s',
    file_dir,
    javac,
    file_name,
    java,
    class_name
  )

  local final_command = string.format('start "Java Output" cmd /k %s', command_to_run)

  vim.cmd("!" .. final_command)
end, { desc = "Compile & Run Java (new CMD)" })

-- ✅ Java Debugging (DAP)
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Start/Continue Debugging" })

map("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Step Over" })

map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Step Into" })

map("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Step Out" })

-- SPECTRE: open, or search word
map("n", "<leader>S", function()
  require("spectre").toggle()
end, { desc = "Toggle Spectre" })

map("n", "<leader>sw", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Spectre search word" })

-- INSERT mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

return M
