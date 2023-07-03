function GitPush()
    local remote_and_branch = vim.fn.input("Remote and branch: ")

    if remote ~= "" and branch ~= "" then
        local command = string.format("!git push %s", remote_and_branch)
        vim.cmd(command)
    else
        print("Remote and branch are required.")
    end
end

function GitRemoteAdd()
    local remote = vim.fn.input("Remote: ")
    local url = vim.fn.input("URL: ")

    if remote ~= "" and url ~= "" then
        local command = string.format("!git remote add %s %s", remote, url)
        vim.cmd(command)
    else
        print("Remote and URL are required.")
    end
end
