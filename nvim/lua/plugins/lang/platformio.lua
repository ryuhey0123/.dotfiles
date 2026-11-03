return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--query-driver=" .. vim.fn.expand("~") .. "/.platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-*",
          },
        },
      },
    },
  },
}
