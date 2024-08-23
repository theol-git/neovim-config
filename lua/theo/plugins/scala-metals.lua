return {
    "scalameta/nvim-metals",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
        local metals_config = require("metals").bare_config()

        metals_config.settings = {
            serverVersion = "latest.snapshot",
        }

        metals_config.init_options.statusBarProvider = "off"

        metals_config.on_attach = function(client, bufnr)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)
        end

        return metals_config
    end,
    config = function(self, metals_config)
        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = self.ft,
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end
}
