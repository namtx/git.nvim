local M = {}
local notify = require("git.notify")

function M.get_remote_url()
	local output = vim.fn.execute(":!git remote get-url origin", true)
	if not output then
		notify.error("[git.nvim] Can not fetch remote url!")
		return
	end
	local domain, path = string.match(output, ".+git@([%w.-]+):(.+).git")

	return { domain, path }
end

function M.is_gitlab(domain)
	return string.match(domain, "gitlab") ~= nil
end

function M.is_github(domain)
	return string.match(domain, "github") ~= nil
end

return M
