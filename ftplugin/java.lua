local config = {
	cmd = { "/usr/share/java/jdtls/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
	on_attach = require("util").lsp_attach,
}

require("jdtls").start_or_attach(config)
