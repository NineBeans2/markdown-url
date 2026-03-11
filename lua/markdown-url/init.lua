local M = {}

local function paste_and_convert_url()
	local reg = vim.v.register

	-- normal paste
	vim.cmd('normal! "' .. reg .. "p")

	local cursor = vim.api.nvim_win_get_cursor(0)
	local row = cursor[1] - 1
	local line = vim.api.nvim_get_current_line()

	local s, e = line:find("https?://[%w-_%.%?%.:/%+=&%%#]+")

	if s then
		local url = line:sub(s, e)

		require("markdown-url.url").replace_url(url, row, s - 1, e)
	end
end

function M.setup(opts)
	opts = opts or {}

	local key = opts.keymap or "p"

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "markdown",
		callback = function()
			vim.keymap.set("n", key, paste_and_convert_url, { buffer = true, desc = "Paste URL with title" })
		end,
	})
end

return M
