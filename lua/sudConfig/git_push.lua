

function PromptPush()
  local remote = vim.fn.input("Remote: ")
  local branch = vim.fn.input("Branch: ")

  if remote ~= "" and branch ~= "" then
    local command = string.format("!git push %s %s", remote, branch)
    vim.cmd(command)
  else
    print("Remote and branch are required.")
  end
end
