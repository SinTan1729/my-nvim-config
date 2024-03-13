require("rust-tools").setup({
	server = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy"
				},
			},
		},
	},
})

