return {
  "gigacrat/aperture.nvim",
  dev = true,
  config = function()
    require('aperture').setup({
      dim_background = "#040C10",
    })
  end,
}
