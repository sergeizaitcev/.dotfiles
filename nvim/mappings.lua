local M = {}

M.debug = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint at line",
    },

    ["<leader>dc"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      "Clear all breakpoints",
    },

    ["<leader>dt"] = {
      function()
        local dap = require("dap-go")
        dap.test_buildflags = "-tags=unit,integration"
        dap.debug_test()
      end,
      "Debug test start",
    },

    ["<leader>ds"] = {
      "<cmd> DapTerminate <CR>",
      "Debug test stop",
    },
  },
}

M.testing = {
  plugin = true,
  n = {
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle()
      end,
      "Toggle test summary",
    },

    ["<leader>to"] = {
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      "Open a floating output window",
    },

    ["<leader>tO"] = {
      function()
        require("neotest").output_panel.toggle()
      end,
      "Toggle output panel",
    },

    ["<leader>tt"] = {
      function()
        require("neotest").run.run({
          extra_args = { "-coverprofile=".. vim.fn.getcwd() .. "/cover.out" }
        })
      end,
      "Run the test nearest to the cursor",
    },

    ["<leader>tf"] = {
      function()
        require("neotest").run.run({
          vim.fn.expand("%"),
          extra_args = { "-coverprofile=".. vim.fn.getcwd() .. "/cover.out" },
        })
      end,
      "Run all tests in the file",
    },

    ["<leader>tp"] = {
      function()
        require("neotest").run.run({
          vim.fn.expand("%:p:h"),
          extra_args = { "-coverprofile=".. vim.fn.getcwd() .. "/cover.out" },
        })
      end,
      "Run all tests in the package",
    },

    ["<leader>ct"] = {
      function()
        local coverage = require("coverage")
        local enabled = require("coverage.signs").is_enabled()

        if enabled then
          coverage.clear()
        else
          coverage.load(true)
        end
      end,
      "Toggle coverage",
    },

    ["<leader>cs"] = {
      function()
        local coverage = require("coverage")
        local enabled = require("coverage.signs").is_enabled()

        if not enabled then
          coverage.load(true)
          coverage.hide()
        end

        coverage.summary()

        if not enabled then
          coverage.clear()
        end
      end,
      "Coverage summary",
    }
  },
}

M.markdown = {
  plugin = true,
  n = {
    ["<leader>op"] = {
      function()
        local peek = require("peek")
        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end,
      "Peek (markdown preview)",
    },
  },
}

return M
