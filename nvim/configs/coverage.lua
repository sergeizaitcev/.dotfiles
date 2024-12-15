require("coverage").setup({
  auto_reload = true,
  commands = false,
	highlights = {
		covered = { cp = "#C3E88D" },
		uncovered = { cp = "#F07178" },
	},
	signs = {
		covered = { hl = "CoverageCovered", text = "▎" },
		uncovered = { hl = "CoverageUncovered", text = "▎" },
	},
	summary = {
		min_coverage = 85.0,
	},
  lang = {
    go = {
      coverage_file = "cover.out",
    },
  },
})
