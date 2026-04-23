return {
  'gitsigns.nvim',
  auto_enable = true,
  event = 'DeferredUIEnter',
  -- cmd = { "" },
  -- ft = "",
  -- keys = "",
  -- colorscheme = "",
  after = function(plugin)
    require('gitsigns').setup({
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']h', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[h', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'stage git hunk' })

        map('v', '<leader>hr', function()
          gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'reset git hunk' })

        -- normal mode
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>hi', gs.preview_hunk_inline, { desc = 'git preview hunk [i]nline' })

        map('n', '<leader>hb', function()
          gs.blame_line({ full = false })
        end, { desc = 'git blame line' })

        map('n', '<leader>hd', gs.diffthis, { desc = 'git [d]iff against index' })

        map('n', '<leader>hD', function()
          gs.diffthis('@')
        end, { desc = 'git [D]iff against last commit' })

        map('n', '<leader>hQ', function()
          gs.setqflist('all')
        end, { desc = 'git hunk [Q]uickfix list (all files in repo)' })
        map('n', '<leader>hq', gs.setqflist, { desc = 'git hunk [q]uickfix list (all changes in this file)' })

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tw', gs.toggle_word_diff, { desc = '[T]oggle git intra-line [w]ord diff' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    })

    vim.cmd([[hi GitSignsAdd guifg=#04de21]])
    vim.cmd([[hi GitSignsChange guifg=#83fce6]])
    vim.cmd([[hi GitSignsDelete guifg=#fa2525]])
  end,
}
