return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local codecompanion_status = require("components.codecompanion_status")

    require("lualine").setup({
      options = {
        theme = "nord", -- Make sure this theme is installed or replace with a valid one
        section_separators = '',
        component_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { codecompanion_status.component },
        lualine_y = { 'filetype' },
        lualine_z = { 'location' },
      },
    })
  end,
}
