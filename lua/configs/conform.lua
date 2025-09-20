---@type ConformOpts
local opts = {
  -- Step 1: Define which formatters to use for each file type.
  -- For tools installed with Mason, this is all you need.
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    java = { "google-java-format" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    rust = { "rustfmt" },

    -- Using a single formatter for all web-related files
    ["_"] = { "prettier" },
  },

  -- Step 2: Configure format-on-save behavior.
  format_on_save = {
    -- Allows other formatters to work when the primary one fails
    lsp_fallback = true,
    -- Set a timeout to prevent the editor from freezing
    timeout_ms = 2000,
  },

  -- Step 3: (Optional) Provide manual configurations ONLY for formatters
  -- that are NOT installed by Mason or are not in your system's PATH.
  formatters = {
    -- NOTE: stylua, black, prettier, and google-java-format were removed from here
    -- because they are managed by Mason and found automatically.

    clang_format = {
      -- This is kept because it's installed system-wide, not via Mason.
      -- If this fails, verify this is the correct path to the executable.
      command = "C:/Program Files/LLVM/bin/clang-format.exe",
      stdin = true,
    },
    rustfmt = {
      -- This is kept because it's installed via rustup/cargo, not via Mason.
      -- If this fails, verify this is the correct path to the executable.
      command = "C:/Users/M Sami Furqan/.cargo/bin/rustfmt.exe",
      stdin = true,
    },
  },
}

return opts