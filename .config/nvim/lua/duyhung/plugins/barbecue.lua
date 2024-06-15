return {
  		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
  -- enabled = false,
  config = function()
    require("barbecue").setup({})
  end,

}
