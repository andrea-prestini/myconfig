-- local telescope = require "lvim.core.telescope"
--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = false
lvim.colorscheme = "dracula"
lvim.transparent_window = false
vim.opt.wrap = false
lvim.debug = false
-- lvim.builtin.telescope.pickers = {find_files = {hidden = true}}
-- vim.o.termguicolors = true
-- vim.cmd[[colorscheme dracula]]
vim.g.python_host_prog = '/bin/python2.7'
vim.g.python3_host_prog = '/bin/python3'
-- vim.g.UltiSnipsListSnippets="<C-tab>"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
-- add your own keymapping
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
-- for finding syntax ids for non TS enabled languages
vim.cmd [[
map <F8> :Telescope find_files cwd=~/
map <F10> :Telescope file_browser cwd=~/
map <F4> :set relativenumber!<CR>
map F :Telescope grep_string search=
map w!! %!sudo tee > /dev/null %
]]
vim.cmd([[nmap ,  /]]) --comando modalità ricerca
vim.cmd([[nmap ss :]]) --comando modalità comandi
vim.cmd("set timeoutlen=300") --timeout pressione ripetuta tasti
vim.cmd([[imap ,, <C-y>]])
vim.cmd("set autochdir")

lvim.keys.normal_mode = {
  ["<Tab>"] = ":bnext<CR>", --passa buffer successivo
  ["<S-Tab>"] = ":bprevious<CR>", --passa buffer precedente
  ["<C-q>"] = ":LvimCacheReset<cr>", --reset cache lunar vim
  --Python RUN
  ["<F5>"] = ":sp<cr> :term python3 % <cr>", --esegui in terminale file python
  ["<F6>"] = ":bd!<cr>", --forza chiusura buffer corrente
  ["<F7>"] = ":only!<cr>",
  ["<C-n>"] = ":cnext<CR>", --quifixk passa al prossimo
  ["<C-m>"] = ":cprevious<CR>", --quickfix passa la precedence
  ["<C-j>"] = "<C-w>j", --quickfix passa la precedence
  ["<C-h>"] = "<C-w>h", --quickfix passa la precedence
  ["<C-k>"] = "<C-w>k", --quickfix passa la precedence
  ["<C-l>"] = "<C-w>l", --quickfix passa la precedence
}

-- lvim.keys.insert_mode = {
--  ["jj"] = "<esc>" --cambio tasti per uscire insertmode
--  -- preconfigurato con alternative jk oppure kj
-- }


lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.

 local _,  actions = pcall(require, "telescope.actions")
 lvim.builtin.telescope.defaults.mappings = {
   -- for input mode
   i = {
     ["<C-j>"] = actions.move_selection_next, --cambiare selezione finestra telescope
     ["<C-k>"] = actions.move_selection_previous,
     ["<C-n>"] = actions.cycle_history_next,
     ["<C-p>"] = actions.cycle_history_prev,
   },
--   -- for normal mode
   n = {
     ["<C-j>"] = actions.move_selection_next, --cambiare selezione finestra telescope
     ["<C-k>"] = actions.move_selection_previous,
   },
 }
lvim.builtin.which_key.mappings["t"] =  {
  name = "Telescope",
  -- live grep only works with ripgrep
  f = {"<cmd>Telescope live_grep<cr>", "Live grep"}, --grep attivo interno alla directory di lavoro
  e = {"<cmd> Telescope file_browser<cr>", "File Browser Exploring"}, -- Performs file search, which excludes ignore files (.gitignore, .dockerignore, etc.)
  -- t = {"<cmd>Telescope <tab><cr>", "Actions"},
}
-- Use which-key to add extra bindings with the leader-key prefix
   lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" } --ricerca probgetti = folder in cui si ha usato lvim
   lvim.builtin.which_key.mappings["t"] = {
   name = "+Trouble",
   t = { "<cmd>Telescope<cr> ", "Telescope" },--menu attivo schermata Telescope
   r = { "<cmd>Trouble lsp_references<cr>", "References" },--menu attivo schermata Telescope
   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },--menu attivo schermata Telescope
   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Doc-Diagnostics" },--menu attivo schermata Telescope
   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },--menu attivo schermata Telescope
   l = { "<cmd>Trouble loclist<cr>", "LocationList" },--menu attivo schermata Telescope
   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "WS-Diagnostics" },--menu attivo schermata Telescope
 }




-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "php",
  "html"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.indent.disable = { "python" }

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.python.formatters = {
  {
    exe = "black",
  }
}
-- set an additional linter
lvim.lang.python.linters = {
  {
    exe = "flake8",
  }
}

-- Additional Plugins
 lvim.plugins = {
     {"folke/tokyonight.nvim"},
     {
       "folke/trouble.nvim",
       cmd = "TroubleToggle",
     },
      {"lunarvim/colorschemes"},
     {
         "folke/zen-mode.nvim",
         config = function()
             require("zen-mode").setup()
         end,
     },
     {
         "ap/vim-css-color"
     },
  {
    "mattn/emmet-vim"
  },
  -- {
  --   "SirVer/ultisnips"
  -- },
  -- {
  --   "honza/vim-snippets"
  -- },
     {
         "lervag/vimtex"
     },
  {
    "Mofiqul/dracula.nvim"
  },
  -- {
  --   "aca/emmet-ls",
  --   config=function()
  --     local lspconfig = require("lspconfig")
  --     local configs = require("lspconfig/configs")

  --     local capabilities = vim.lsp.protocol.make_client_capabilities()
  --     capabilities.textDocument.completition.completitionItem.snippetSupport = true
  --     capabilities.textDocument.completition.completitionItem.resolveSupport = {
  --       properties = {
  --         "documentation",
  --         "detail",
  --         "additionalTextEdits",
  --       },

  --     }
  --     if not lspconfig.emmet_ls then
  --     configs.emmet_ls = {
  --       default_config = {
  --         cmd = { "emmet-ls", "--stdio" },
  --         filetypes = {
  --           "html",
  --           "css",
  --           "javascript",
  --           "typescript",
  --           "eruby",
  --           "typescriptreact",
  --           "javascriptreact",
  --           "svelte",
  --           "vue",
  --     },
  --     root_dir = function(fname)
  --       return vim.loop.cwd()
  --   end,
  --   settings = {},
  --   },
  -- }
  --   end
  --   lspconfig.emmet_ls.setup({ capabilities = capabilities})
  --   end,

  -- },
     {
         "tpope/vim-surround"
     },
  {
    "AndrewRadev/tagalong.vim"
  },
  -- {
  --   "alvan/vim-closetag"
  -- },
  -- {
  --   "docunext/closetag.vim"
  -- },
     {
         "tpope/vim-commentary"
     },
  -- {
  --    "ludovicchabant/vim-gutentags"
  --   },
     {
  "monaqa/dial.nvim",
  event = "BufRead",
  config = function()
    local dial = require "dial"
    vim.cmd [[
    nmap <C-a> <Plug>(dial-increment)
      nmap <C-x> <Plug>(dial-decrement)
      vmap <C-a> <Plug>(dial-increment)
      vmap <C-x> <Plug>(dial-decrement)
      vmap g<C-a> <Plug>(dial-increment-additional)
      vmap g<C-x> <Plug>(dial-decrement-additional)
    ]]

    dial.augends["custom#boolean"] = dial.common.enum_cyclic {
      name = "boolean",
      strlist = { "true", "false" },
    }
    table.insert(dial.config.searchlist.normal, "custom#boolean")

    -- For Languages which prefer True/False, e.g. python.
    dial.augends["custom#Boolean"] = dial.common.enum_cyclic {
      name = "Boolean",
      strlist = { "True", "False" },
    }
    table.insert(dial.config.searchlist.normal, "custom#Boolean")
  end,
},
{
    "tpope/vim-repeat"},
    {
        "mbbill/undotree",
        vim.cmd [[ nmap <F2> :UndotreeToggle <Enter>]]},
        {
            "vim-scripts/searchfold.vim"
        },
        --   "klen/python-mode"
  -- },
  {
      "dccsillag/magma-nvim",
        },
  {
      "metakirby5/codi.vim",
      cmd = "Codi",
    },
  {
    "iamcco/markdown-preview.nvim",
  },

  {
  "kevinhwang91/nvim-bqf",
  event = "BufRead",
},
  {
  "nvim-treesitter/playground",
      event = "BufRead",
    },
  {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
    },
  {
  "sindrets/diffview.nvim",
      event = "BufRead",
    },
  -- {
  --   "fannheyward/telescope-coc.nvim",
  --   require('telescope').load_extension('coc')
  -- },
  {
    "neoclide/coc.nvim"
  },
  {
    "jesseduffield/lazygit"
  },
 }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
}
lvim.autocommands.custom_groups = {
   { "BufWinEnter", "*.py", "call append(0,'#!/usr/bin/python3')" },
 }
 lvim.autocommands.custom_groups = {
   { "BufNewFile", "*.tex", "call append(0,'\\documentclass{article}')" },
   { "BufNewFile", "*.tex", "call append(1,'\\usepackage[T1]{fontenc}')" },
   { "BufNewFile", "*.tex", "call append(2,'\\usepackage[utf8]{inputenc}')" },
 }



lvim.autocommands.custom_groups={
"FileType python nnoremap <buffer> <cr> :silent w<bar>only<bar>vsp<bar> term ipython3 -i %<cr>"
}

 vim.cmd [[ au CmdWinEnter * quit ]]
 require("nvim-treesitter.parsers").get_parser_configs().solidity = {
   install_info = {
       url = "https://github.com/JoranHonig/tree-sitter-solidity",
       files = { "src/parser.c" },
       requires_generate_from_grammar = true,
         },
           filetype = "solidity",
           }

