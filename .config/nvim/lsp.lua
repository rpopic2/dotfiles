-- csharp lsp config

local api = vim.api

-- csharp
require'lspconfig'.csharp_ls.setup {
    cmd = { '/Users/rpopic2/.dotnet/tools/csharp-ls' },
}

-- cpp
local aug_cpp_lsp = api.nvim_create_augroup("aug_cpp_lsp", { clear = true })
api.nvim_create_autocmd("BufEnter", {
    group = aug_cpp_lsp,
    pattern = { "*.c", "*.h", "*.cpp", "*.inl" },
    callback = function()
        vim.lsp.start({
            name = 'clangd',
            cmd = {'clangd'},
            root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1])
        })
    end,
})

-- rs
local aug_cpp_lsp = api.nvim_create_augroup("aug_rs_lsp", { clear = true })
api.nvim_create_autocmd("BufEnter", {
    group = aug_cpp_lsp,
    pattern = { "*.rs" },
    callback = function()
        vim.lsp.start({
            name = 'rust-analyzer',
            cmd = {'rust-analyzer'},
            root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml", ".git" }, { upward = true })[1])
        })
    end,
})

-- aug lsp
local aug_lsp = api.nvim_create_augroup("aug_lsp", { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = aug_lsp,
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { buffer = args.buf }
        if client.server_capabilities.hoverProvider then
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end
        vim.keymap.set('i', '<c-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gR', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references(nil, {on_list=olfn}) end)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '(', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ')', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist)
        vim.keymap.set('n', '<space>d', vim.diagnostic.setqflist)
    end,
})

function olfn(options)
    vim.fn.setqflist({}, ' ', options)
    vim.cmd("cfirst")
    vim.cmd("norm zz")
end

