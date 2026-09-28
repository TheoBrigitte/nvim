-- Claude backend that sends a single-suggestion request and an
-- n_completions request in parallel. The first suggestion shows fast, the
-- others follow when the second request returns.
local claude = require("minuet.backends.claude")
local common = require("minuet.backends.common")

local M = {}

M.is_available = claude.is_available

M.complete = function(context, callback)
	local config = require("minuet").config
	local n = config.n_completions
	local items = {}

	common.terminate_all_jobs()

	-- claude.complete kills running jobs and reads n_completions synchronously
	local terminate_all_jobs = common.terminate_all_jobs
	common.terminate_all_jobs = function() end

	for _, count in ipairs({ 1, n }) do
		config.n_completions = count
		claude.complete(context, function(data)
			vim.list_extend(items, data or {})
			callback(vim.deepcopy(items))
		end)
	end

	config.n_completions = n
	common.terminate_all_jobs = terminate_all_jobs
end

return M
