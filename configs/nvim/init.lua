--[[
=====================================================================
                 MINIMAL NEOVIM CONFIG
        Optimized for Haxe + Light Webdev
        Based on kickstart.nvim, streamlined for performance
=====================================================================
--]]

-- Set leader key (must be before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true  -- We installed JetBrains Mono Nerd Font

-- =====================================================================
-- FILETYPE DETECTION
-- =====================================================================
-- Detect .hx files as haxe filetype
vim.filetype.add({
  extension = {
    hx = 'haxe',
  },
})

-- =====================================================================
-- PERFORMANCE SETTINGS
-- =====================================================================
vim.o.lazyredraw = true           -- Don't redraw during macros
vim.o.updatetime = 250            -- Faster completion
vim.o.timeoutlen = 300            -- Faster which-key
vim.o.ttimeoutlen = 10            -- Faster key code delays

-- =====================================================================
-- BASIC OPTIONS
-- =====================================================================
vim.o.number = true               -- Line numbers
vim.o.relativenumber = true       -- Relative line numbers
vim.o.mouse = 'a'                 -- Enable mouse
vim.o.showmode = false            -- Hide mode (shown in statusline)
vim.o.clipboard = 'unnamedplus'   -- System clipboard
vim.o.breakindent = true          -- Wrapped lines keep indent
vim.o.undofile = true             -- Persistent undo
vim.o.ignorecase = true           -- Case-insensitive search
vim.o.smartcase = true            -- Unless capital letters used
vim.o.signcolumn = 'yes'          -- Always show sign column
vim.o.splitright = true           -- Vertical splits go right
vim.o.splitbelow = true           -- Horizontal splits go down
vim.o.list = true                 -- Show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'        -- Preview substitutions
vim.o.cursorline = true           -- Highlight current line
vim.o.scrolloff = 8               -- Keep 8 lines visible
vim.o.confirm = true              -- Ask to save instead of failing
vim.o.termguicolors = true        -- Better colors

-- Tab/indent settings
vim.o.tabstop = 4                 -- Tab width = 4 spaces
vim.o.shiftwidth = 4              -- Indent width = 4 spaces
vim.o.expandtab = true            -- Convert tabs to spaces
vim.o.smartindent = true          -- Smart auto-indenting

-- Disable some builtin plugins we don't need
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

-- =====================================================================
-- KEYMAPS
-- =====================================================================

-- Clear search highlights on <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- jk to escape in insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- Insert *() and position cursor between parens
vim.keymap.set('n', 'I', 'i* ()<Esc>i')

-- Custom movement (your preferences)
vim.keymap.set('n', 'J', '}')  -- Jump forward by paragraph
vim.keymap.set('n', 'K', '{')  -- Jump backward by paragraph
vim.keymap.set('n', '[', '{')  -- Jump backward by paragraph
vim.keymap.set('n', ']', '}')  -- Jump forward by paragraph

-- Quick save
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Better indenting (stays in visual mode)
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move lines up/down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Buffer navigation
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Split management
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>h', '<cmd>split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>q', '<cmd>close<CR>', { desc = 'Close window' })

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to upper window' })

-- Exit terminal mode easily
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Insert current date
vim.keymap.set('n', '<space>t', function()
  local date = os.date('%m/%d/%y')
  vim.api.nvim_put({date}, 'c', true, true)
end, { desc = 'Insert current date' })

-- =====================================================================
-- INSTALL LAZY.NVIM (Plugin Manager)
-- =====================================================================
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- =====================================================================
-- PLUGINS (Minimal Set)
-- =====================================================================
require('lazy').setup({

  -- ===== TELESCOPE (Fuzzy Finder) =====
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- telescope-fzf-native disabled (requires make/cmake which aren't easily available on Windows)
      -- Telescope still works great without it!
      -- {
      --   'nvim-telescope/telescope-fzf-native.nvim',
      --   build = 'make',
      -- },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { 'node_modules', '.git/' },
        },
      }

      -- pcall(require('telescope').load_extension, 'fzf')  -- fzf-native disabled

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },

  -- ===== LSP (Language Server Protocol) =====
  {
    'neovim/nvim-lspconfig',
    version = 'v1.0.0',  -- Pin to v1.0.0 which supports Nvim 0.10
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
    },
    config = function()
      -- LSP servers to install automatically
      local servers = {
        -- Haxe Language Server (commented out - uncomment if you install haxe-language-server)
        -- haxe_language_server = {
        --   cmd = { 'haxe-language-server' },
        --   init_options = {
        --     displayArguments = { 'compile.hxml' },
        --   },
        -- },

        -- Web development
        ts_ls = {},           -- TypeScript/JavaScript
        html = {},            -- HTML
        cssls = {},           -- CSS

        -- Lua (for Neovim config)
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            },
          },
        },
      }

      -- Get capabilities from blink.cmp first
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Setup Mason (run :Mason to install LSP servers manually)
      require('mason').setup()

      -- Setup each server directly with lspconfig
      for server_name, server_config in pairs(servers) do
        server_config.capabilities = capabilities
        require('lspconfig')[server_name].setup(server_config)
      end

      -- LSP Keymaps (only active when LSP attaches)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Highlight references under cursor
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    end,
  },

  -- ===== COMPLETION (blink.cmp - FAST!) =====
  {
    'saghen/blink.cmp',
    version = '*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
      -- Disable completion for plain text files and unlabeled files
      enabled = function()
        local filetype = vim.bo.filetype
        local disabled_filetypes = { 'text', '' }  -- 'text' = .txt, '' = no extension
        return not vim.tbl_contains(disabled_filetypes, filetype)
      end,
    },
  },

  -- ===== TREESITTER (Syntax Highlighting) =====
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'lua',         -- Lua (for Neovim config)
        'vim',         -- Vim
        'vimdoc',      -- Vim help docs
        'typescript',  -- TypeScript
        'javascript',  -- JavaScript
        'html',        -- HTML
        'css',         -- CSS
      },
      auto_install = true,
      highlight = {
        enable = true,
        -- Disable treesitter for large files (performance)
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      indent = { enable = true },
    },
  },

  -- ===== HAXE SYNTAX (Simple regex-based) =====
  {
    'yaymukund/vim-haxe',
    ft = 'haxe',  -- Only load for .hx files
  },

  -- ===== COLORSCHEME =====
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
      transparent = true,  -- Enable transparent background
      styles = {
        sidebars = "transparent",  -- Make sidebars transparent
        floats = "transparent",    -- Make floating windows transparent
      },
    },
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

}, {
  -- Lazy.nvim config
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- =====================================================================
-- HAXE LSP SETUP INSTRUCTIONS
-- =====================================================================
--[[
To setup Haxe Language Server:

1. Install the language server:
   npm install -g haxe-language-server

2. Uncomment and configure in the LSP section above:
   haxe_language_server = {
     cmd = { 'haxe-language-server' },
     init_options = {
       displayArguments = { 'build.hxml' },  -- Your HXML file
     },
   },

3. Create a build.hxml in your Haxe project root
4. Restart Neovim

For more info: https://github.com/vshaxe/haxe-language-server
--]]

-- =====================================================================
-- AUTOCOMMANDS
-- =====================================================================

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- =====================================================================
-- STATUSLINE (Simple)
-- =====================================================================
vim.o.statusline = '%f %m %= %l:%c %p%%'

-- The end! Your config is now minimal and fast.
-- Run :checkhealth to verify everything works
-- Run :Lazy to manage plugins
