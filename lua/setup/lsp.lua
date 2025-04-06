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

    vim.diagnostic.config({
        underline    = true,
        virtual_text = false,
    })






    --[=[
    vim.lsp.handlers['textDocument/hover'] = function (_, result, ctx, config)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if not result or not result.contents then
            return
        end

        -- Convert hover contents to markdown lines
        local contents = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        if vim.tbl_isempty(contents) then
            return
        end

        -- Append LSP server name to differentiate sources
        table.insert(contents, 1, '---')
        table.insert(contents, 1, 'From: ' .. client.name)

        -- Get the buffer number and store the hover data in a buffer-specific variable
        local bufnr = ctx.bufnr
        local hover_key = 'hover_window_' .. bufnr

        -- Check if there is an existing floating window for this buffer
        local hover_window = vim.b[hover_key]

        if hover_window and vim.api.nvim_win_is_valid(hover_window.winid) then
            -- If the window is valid, append the new hover data to the floating window
            vim.api.nvim_buf_set_lines(hover_window.bufnr, 0, -1, false, contents)
        else

            local bufnr, winnr = vim.lsp.util.open_floating_preview(
                vim.lsp.util.convert_input_to_markdown_lines(result.contents),
                'markdown',
                config
            )

            local client = vim.lsp.get_client_by_id(ctx.client_id)
            vim.api.nvim_buf_set_option(bufnr, 'modifiable', true)
            vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, {'', '---', 'From: ' .. client.name})
            vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)


            --[[
            -- If no window exists, create a new floating window with the contents
            local opts = config or {}
            opts.border = opts.border or "rounded"
            opts.width = opts.width or 50
            opts.max_width = opts.max_width or 80

            -- Create a new buffer and set the lines
            local new_buf = vim.api.nvim_create_buf(false, true) -- create a new buffer (scratch)
            vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, contents)

            -- Open a new floating window
            local winid = vim.api.nvim_open_win(new_buf, false, {
                relative = "cursor",
                width = opts.width,
                height = #contents,
                col = 0,
                row = 1,
                anchor = "NW",
                border = opts.border,
            })

            -- Store the floating window info in the buffer variable
            vim.b[hover_key] = { bufnr = new_buf, winid = winid }
            ]]

        end
    end
    ]=]




end
