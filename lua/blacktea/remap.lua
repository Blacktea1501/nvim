vim.g.mapleader = " "

km = vim.keymap

km.set("n", "<leader>pv", vim.cmd.Ex)

km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '>-2<CR>gv=gv")

km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")

km.set({"n", "v"}, "<leader>y", [["+y]]) 
km.set("n", "<leader>Y", [["+Y]]) 

-- format with language server protocol
km.set("n", "<leader>f", vim.lsp.buf.format)

-- replace occurrences in file
km.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- replace occurrences in visual selection
km.set("v", "<leader>r", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- make file executable
km.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--cargo run
km.set("n", "<leader>cr", "<cmd>! cargo run --release<CR>", { silent = true })
km.set("n", "<leader>cb", "<cmd>! cargo build --release<CR>", { silent = true })
-- vimtex compile
km.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { silent = true })

-- sort line
km.set("v", "<leader>s", [[:!xargs -n1 | sort | xargs<CR>]], { silent = true })
