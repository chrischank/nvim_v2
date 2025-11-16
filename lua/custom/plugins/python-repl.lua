return {
  {
    'geg2102/nvim-python-repl',
    dependencies = 'nvim-treesitter',
    ft = { 'python', 'lua', 'scala' },
    config = function()
      require('nvim-python-repl').setup {
        execute_on_send = true,
        vsplit = true,
        spawn_command = {
          python = 'uv run ipython3',
          scala = 'sbt console',
          lua = 'ilua',
        },
      }
      vim.keymap.set('n', '<leader>pd', function()
        require('nvim-python-repl').send_statement_definition()
      end, { desc = '[P]ython send [D]efinition to REPL' })
      vim.keymap.set('v', '<leader>vr', function()
        require('nvim-python-repl').send_visual_to_repl()
      end, { desc = 'Send visual selection to REPL' })
      vim.keymap.set('n', '<leader>br', function()
        require('nvim-python-repl').send_buffer_to_repl()
      end, { desc = 'Send entire buffer to REPL' })
      vim.keymap.set('n', '<leader>er', function()
        require('nvim-python-repl').toggle_execute()
      end, { desc = 'Automatically execute command in REPL after sent' })
      vim.keymap.set('n', '<leader>ro', function()
        require('nvim-python-repl').open_repl()
      end, { desc = 'Opens the REPL in a window split' })
      vim.keymap.set('n', '<S-CR>', function()
        require('nvim-python-repl').send_current_cell_to_repl()
        pcall(require('nvim-python-repl').execute_in_repl)
      end, { desc = 'Sends the cell under cursor to repl and execute' })
    end,
  },
}
