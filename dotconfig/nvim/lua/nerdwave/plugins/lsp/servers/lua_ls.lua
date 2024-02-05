return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
                disable = { "different-requires" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = 2,
                    quote_style = "single",
                    align_call_args = true,
                    end_statement_with_semicolon = "replace_with_newline"
                },
            },
            telemetry = { enable = false },
            semantic = { enable = true },
        },
    },
}
