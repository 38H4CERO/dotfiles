local opt = vim.opt

opt.number = true

-- tab settings
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true --ns si me gusta

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.clipboard = "unnamedplus"
opt.backspace = { "indent", "eol", "start" }

-- splits
opt.splitbelow = true
opt.splitright = true