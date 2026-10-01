return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "SmiteshP/nvim-navic",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                },
            })

            local navic = require("nvim-navic")

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.server_capabilities.documentSymbolProvider then
                        navic.attach(client, args.buf)
                    end

                    local opts = { buffer = args.buf }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                end,
            })

            -- auto-preview the diagnostics at the cursor after a brief pause
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                callback = function()
                    local line = vim.fn.line(".")
                    if #vim.diagnostic.get(0, { lnum = line - 1 }) > 0 then
                        vim.diagnostic.open_float(0, {
                            focusable = false,
                            scope = "line",
                        })
                    end
                end,
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- advertise snippet support (and other completion capabilities) so
            -- servers send full snippet templates instead of plain words
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            for _, name in ipairs({ "lua_ls", "pyright", "clangd", "rust_analyzer" }) do
                vim.lsp.config(name, { capabilities = capabilities })
            end

            vim.lsp.enable({
                "lua_ls",
                "pyright",
                "clangd",
                "rust_analyzer",
            })

            require("luasnip.loaders.from_vscode").lazy_load()

            local cmp = require("cmp")

            cmp.setup({
                preselect = cmp.PreselectMode.None,

                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },

                mapping = cmp.mapping.preset.insert({
                    -- cycle through suggestions & snippets
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    -- fill in the currently selected item (expands snippets)
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })
        end,
    },
}
