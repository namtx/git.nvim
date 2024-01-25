local M = {}
local remote = require("git.remote")
local notify = require("git.remote")

function M.get_commit_at_cursor()
	local filename = vim.fn.expand("%:p")
	if filename == "" then
		notify.error("Cannot get current file name!")
		return
	end
	local line = vim.fn.line(".")
	local git_blame_output = vim.fn.execute(":!git blame -L " .. line .. "," .. line .. " --minimal " .. filename)
	if git_blame_output == nil then
		notify.error("Cannot blame current line!")
		return
	end
	local commit = string.match(git_blame_output, "\n^*(%w+) ")
	if not commit then
		notify.error("Failed to get the commit!")
		return
	end
	return commit
end

function M.open_commit()
	local remote_url = remote.get_remote_url()
	if not remote_url then
		notify.error("Failed to get remote url")
		return
	end
	local domain = remote_url[1]
	local path = remote_url[2]
	if remote.is_github(domain) then
		vim.fn.execute("!open 'https://" .. domain .. "/" .. path .. "/commit/" .. M.get_commit_at_cursor() .. "'")
	elseif remote.is_gitlab(domain) then
		vim.fn.execute("!open 'https://" .. domain .. "/" .. path .. "/-/commit/" .. M.get_commit_at_cursor() .. "'")
	else
		notify.error("Git provider " .. domain .. " is not supported")
	end
end

return M
