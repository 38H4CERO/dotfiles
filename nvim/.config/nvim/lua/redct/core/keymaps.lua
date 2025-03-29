local keymap = vim.keymap

keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights", silent = true })
keymap.set({ "i", "v", "n" }, "<C-s>", "<Esc>:update<cr>", { desc = "Save file", silent = true })

-- Funciona con binario y hex tambien
keymap.set("n", "<C-a>", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "<C-d>", "<C-a>", { desc = "Increment number" })
