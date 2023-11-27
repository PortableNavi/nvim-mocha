return function()
	local signs = {
        { name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

    local handlers_on_attach = function(buf)
        local opts = {noremap=true, silent=true}
        local map = function(key, cmd)
            vim.api.nvim_buf_set_keymap(buf, "n", key, cmd, opts)
        end
        
        map("D", "<cmd>lua vim.lsp.buf.declaration()<CR>")
        map("d", "<cmd>lua vim.lsp.buf.definition()<CR>")
        map("h", "<cmd>lua vim.lsp.buf.hover()<CR>")
        map("i", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        map("H", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        map("r", "<cmd>lua vim.lsp.buf.references()<CR>")
    end

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            handlers_on_attach(ev.buf)
        end
    })


    local lspconfig = require("lspconfig")
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
        function(server_name)
            lspconfig[server_name].setup({})
        end 
    })
end
