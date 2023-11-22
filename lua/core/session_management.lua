SESSION_MANAGEMENT = {}
local auto_load_session_in_working_directory = function()
    local session_file = vim.fn.getcwd() .. "/.session.vim"
    if vim.fn.filereadable(session_file) == 1 then
        vim.cmd("source " .. session_file)
    end
end

local auto_save_session_in_working_directory = function()
    local session_file = vim.fn.getcwd() .. "/.session.vim"
    vim.cmd("mksession! " .. session_file)
end

SESSION_MANAGEMENT.auto_load_session_in_working_directory = auto_load_session_in_working_directory
SESSION_MANAGEMENT.auto_save_session_in_working_directory = auto_save_session_in_working_directory

