local M = {}
local commits = require("git.commits")

function M.setup()
	vim.keymap.set("n", "<leader>gb", function()
		commits.open_commit()
	end, { silent = true, desc = "Open commit at current line in external browser" })
end

return M
