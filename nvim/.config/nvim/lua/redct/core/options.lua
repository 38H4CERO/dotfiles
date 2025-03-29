local opt = vim.opt

-- Esto tiene que cargar antes que los plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = true
vim.g.have_nerd_font = true

-- tab settings
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = true
opt.scrolloff = 10

-- search settings
opt.ignorecase = true
opt.smartcase = true
-- Preview substitutions live, as you type!
opt.inccommand = "split"

opt.cursorline = true --ns si me gusta
opt.mouse = "a"

opt.showmode = false
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- TODO: Cambiar a 0 cuando metas las notificaciones
vim.o.cmdheight = 1
-- Workaround for macros
vim.cmd([[ autocmd RecordingEnter * set cmdheight=1 ]])
vim.cmd([[ autocmd RecordingLeave * set cmdheight=0 ]])

--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

opt.backspace = { "indent", "eol", "start" }
opt.breakindent = true --  Auto indent cuando la linea se pasa de largo

opt.undofile = true
opt.updatetime = 250

-- splits
opt.splitbelow = true
opt.splitright = true

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Highlight when yanking (copying) text

vim.api.nvim_set_hl(0, "YankHighlightColor", { fg = "#000000", bg = "#68769E" })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = "YankHighlightColor",
			timeout = 100, -- Tiempo (ms) subrayado
		})
	end,
})
