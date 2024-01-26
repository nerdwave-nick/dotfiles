local lsp_servers = {
	lua_ls = {
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
				format = { enable = false },
				telemetry = { enable = false },
				-- Do not override treesitter lua highlighting with lua_ls's highlighting
				semantic = { enable = false },
			},
		},
	},
	gopls = {
		flags = { debounce_text_changes = 500 },
		cmd = { "gopls", "-remote=auto" },
		settings = {
			gopls = {
				usePlaceholders = true,
				analyses = {
					nilness = true,
					shadow = true,
					unusedparams = true,
					unusewrites = true,
				},
			},
		},
	},
	bashls = {
		cmd = { "bash-language-server", "start" },
		filetypes = { "bash", "sh" },
	},
}

local lsp_config_setup = function()
	require("mason").setup({})

	local nvim_lsp = require("lspconfig")
	require("lspconfig.ui.windows").default_options.border = "rounded"

	require("mason-lspconfig").setup({
		ensure_installed = {
			"bashls",
			"clangd",
			"eslint",
			"html",
			"jsonls",
			"lua_ls",
			"marksman",
			"rust_analyzer",
			"tsserver",
			"volar",
		},
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = true,
		virtual_text = true,
		severity_limit = "Hint",
		update_in_insert = true,
	})
	local on_attach = require("nerdwave.lsp-keymap").on_attach_keymap
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	---A handler to setup all servers defined under `completion/servers/*.lua`
	---@param lsp_name string
	local function mason_lsp_handler(lsp_name)
		local custom_handler = lsp_servers[lsp_name]
		if custom_handler == nil then
			custom_handler = {}
		end
		nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
	end

	require("mason-lspconfig").setup_handlers({ mason_lsp_handler })
	vim.api.nvim_command([[LspStart]])
end

return {
	"neovim/nvim-lspconfig",
	lazy = true,
	event = { "CursorHold", "CursorHold" },
	config = lsp_config_setup,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
}
