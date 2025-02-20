require("core")
require("plugin-config.init")

local project_config = vim.fn.getcwd() .. "/.nvim/project_local/init.lua"

if vim.fn.filereadable(project_config) == 1 then
	vim.cmd("source " .. project_config)
end
