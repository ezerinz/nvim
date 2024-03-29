-- references
return {
	"RRethy/vim-illuminate",
	event = "BufReadPost",
  -- stylua: ignore
  keys = {
    { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
    { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
  },
	opts = { delay = 200 },
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
