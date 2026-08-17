-- Base46 theming from NvChad
return {
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },
  {
    "nvchad/base46",
    lazy = false,
    priority = 1000,
    build = function()
      require("base46").load_all_highlights()
    end,
    keys = {
      {
        "<leader>tH",
        function()
          require("base46").load_all_highlights()
          vim.notify("Base46 highlights reloaded", vim.log.levels.INFO)
        end,
        desc = "Reload highlights",
      },
    },
  }
}
