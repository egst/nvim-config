if vim.g.vscode then
    return
end

require 'helpers'

local config = require 'config'

if config.lsp then

    local cmp = require 'cmp'
    cmp.setup {
        snippet = {
            expand = function(args)
                require 'snippy'.expand_snippet(args.body)
            end,
        },
        mapping = {
            ['<C-n>']     = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
            ['<C-p>']     = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
            ['<C-U>']     = cmp.mapping(cmp.mapping.scroll_docs(-4),    {'i', 'c'}),
            ['<C-D>']     = cmp.mapping(cmp.mapping.scroll_docs(4),     {'i', 'c'}),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),         {'i', 'c'}),
            ['<C-Y>']     = cmp.config.disable,
            ['<Down>']    = cmp.config.disable,
            ['<Up>']      = cmp.config.disable,
            ['<Cr>']      = cmp.mapping.confirm {select = true},
            ['<C-E>']     = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
        },
        sources = cmp.config.sources({
            {name = 'nvim_lsp'},
            {name = 'snippy'},
        }, {
            {name = 'buffer'},
        }),
        formatting = {
            format = function (entry, item)
                item.menu = config.icons.source[entry.source.name]
                item.kind = config.icons.completion[allLower(item.kind)]
                return item
            end
        }
    }

    local capabilities = require 'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
    for server, opts in pairs(config.langServers) do
        opts.capabilities = capabilities
        require 'lspconfig'[server].setup(opts)
    end

    -- TODO: Show params when typing them.
    vim.cmd [[set completeopt=menuone,noinsert,noselect]]

    require 'trouble'.setup {
        signs = config.icons.diagnostics.trouble
    }
    for type, icon in pairs(config.icons.diagnostics.native) do
        local hl = 'DiagnosticSign' .. firstUpper(type)
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
    end

end
