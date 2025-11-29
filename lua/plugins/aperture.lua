return {
  "gigacrat/aperture.nvim",
  config = function()
    require('aperture').setup({
      debug = false,
      dim_amount = 0.64,        -- Try different values!
      greyscale_factor = 0.5,
      dim_background = "#040C10",
      excluded_buftypes = {
      },
      autosize = {
        enabled = true,
        min_width = 100,
        min_height = 0.8,
      },
    })
  end,
}
