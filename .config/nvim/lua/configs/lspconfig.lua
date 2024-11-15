local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "html",
    "cssls",
    "taplo",
    "emmet_ls",
    -- "tailwindcss",
    "ts_ls",
    "intelephense",
}

-- list of servers configured with default config.
local default_servers = {
    "html",
    "cssls",
    "emmet_ls",
    -- "tailwindcss",
    "taplo",
    "intelephense",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end
lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = on_init,
    init_options = {},
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                -- enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/luv/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
lspconfig.ts_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    -- Initial options for the TypeScript language server
    -- init_options = {
    --     plugins = {
    --         {
    --             --             -- Name of the TypeScript plugin for Vue
    --             --             name = '@vue/typescript-plugin',
    --             --
    --             --             -- Location of the Vue language server module (path defined in step 1)
    --             --             location = vue_language_server_path,
    --             --
    --             --             -- Specify the languages the plugin applies to (in this case, Vue files)
    --             languages = { "javascript", "typescript", "vue" },
    --         },
    --     },
    -- },

    -- Specify the file types that will trigger the TypeScript language server
    filetypes = {
        "typescript", -- TypeScript files (.ts)
        "javascript", -- JavaScript files (.js)
        "javascriptreact", -- React files with JavaScript (.jsx)
        "typescriptreact", -- React files with TypeScript (.tsx)
        "vue", -- Vue.js single-file components (.vue)
    },
})
