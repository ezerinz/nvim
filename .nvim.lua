require("flutter-tools").setup_project({
	{
		name = "Development",
		flavor = "dev",
		target = "lib/main_dev.dart",
	},
	{
		name = "Production",
		flavor = "prod",
		target = "lib/main.dart",
	},
})
