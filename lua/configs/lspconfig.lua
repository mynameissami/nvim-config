require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

-- HTML & CSS
lspconfig.html.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.cssls.setup { on_attach = on_attach, capabilities = capabilities }

-- Python
lspconfig.pyright.setup { on_attach = on_attach, capabilities = capabilities }

-- C++
lspconfig.clangd.setup { on_attach = on_attach, capabilities = capabilities }

-- Rust
lspconfig.rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities }

-- TypeScript
lspconfig.ts_ls.setup { on_attach = on_attach, capabilities = capabilities }

-- ESLint
lspconfig.eslint.setup { on_attach = on_attach, capabilities = capabilities }

-- TailwindCSS
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "html", "css", "javascript", "javascriptreact",
    "typescript", "typescriptreact", "svelte",
    "vue", "templ",
  },
  root_dir = lspconfig.util.root_pattern("package.json", "tailwind.config.js", "postcss.config.js"),
}

-- Emmet
lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
}

-- ✅ Java (JDTLS + Debug + Spring Boot)
lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "C:/Program Files/Eclipse Adoptium/jdk-21.0.8.9-hotspot/bin/java.exe", -- ✅ updated Java path
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1G",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", vim.fn.stdpath("data") .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher.jar",
    "-configuration", vim.fn.stdpath("data") .. "/mason/packages/jdtls/config_win",
    "-data", vim.fn.stdpath("cache") .. "/jdtls-workspace",
  },
  root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
}

-- ✅ Spring Boot LSP
lspconfig.spring_boot_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
