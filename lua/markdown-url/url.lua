local M = {}

local function fetch_title(url, callback)
	vim.system({ "curl", "-Ls", url }, { text = true }, function(res)
		if res.code ~= 0 then
			callback(nil)
			return
		end

		local title = res.stdout:match("<title>(.-)</title>")

		if title then
			title = title:gsub("%s+", " "):gsub("^%s*", ""):gsub("%s*$", "")
		end

		callback(title)
	end)
end

function M.replace_url(url, row, start_col, end_col)
	fetch_title(url, function(title)
		if not title then
			return
		end

		vim.schedule(function()
			local new = "[" .. title .. "](" .. url .. ")"

			vim.api.nvim_buf_set_text(0, row, start_col, row, end_col, { new })
		end)
	end)
end

return M
