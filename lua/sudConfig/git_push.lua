

function PromptPush()
  local remote_and_branch = vim.fn.input("Remote and branch: ")

  if remote ~= "" and branch ~= "" then
    local command = string.format("!git push %s", remote_and_branch)
    vim.cmd(command)
  else
    print("Remote and branch are required.")
  end
end
