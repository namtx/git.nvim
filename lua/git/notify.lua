local M = {}
local prefix = "[git.nvim]"

function M.error(message)
	vim.notify(prefix .. " " .. message, vim.log.levels.ERROR)
end

return M
