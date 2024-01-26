local on_attach_keymap = function(client, bufnr)
	vim.notify("LSP keymap loaded")
	local mapn = function(key, fn, opts)
		if opts == nil then
			opts = { noremap = true, buffer = bufnr }
		end
		vim.keymap.set("n", key, fn, opts)
	end
	mapn("K", vim.lsp.buf.hover)
	mapn("gd", vim.lsp.buf.definition)
	mapn("gD", vim.lsp.buf.declaration)
	mapn("gi", vim.lsp.buf.implementation)
	mapn("gr", vim.lsp.buf.references)
	mapn("[d", vim.diagnostic.goto_next)
	mapn("]d", vim.diagnostic.goto_prev)
	mapn("<leader>df", vim.diagnostic.open_float)
	mapn("<leader>ca", vim.lsp.buf.code_action)
	mapn("<leader>rn", vim.lsp.buf.rename)
	-- mapi("i", "<C-h>", vim.lsp.buf.signature_help)
end

return {
	on_attach_keymap = on_attach_keymap,
}
