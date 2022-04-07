local utils = require "pp-vim/utils"
local envs = require "pp-vim/envs"

local function notify_error(message)
  local s, notify = pcall(require, "notify")
  if not s then
    print(message)
  else
    notify(message, "error")
  end
end


local function unlink_endpoints(env_file)
  env_file = env_file or ".env"
  local paths = utils.scan(vim.fn.getcwd(), env_file)
  for _, path in ipairs(paths) do
    os.remove(path.."/"..env_file)
  end
end


local function link_endpoints(env, env_file)
  print(env, env_file)
  local st, er = pcall(envs.list_envs)
  if not st then
    notify_error(er)
    return
  end
  if not env then
    notify_error("ENV is required. Available envs: "..table.concat(er, ", "))
    return
  end
  if not utils.contains(er, env) then
    notify_error("ENV not exist. Available envs: "..table.concat(er, ", "))
    return
  end
  env_file = env_file or ".env"
  local http_dirs = utils.scan(vim.fn.getcwd(), ".http")
  for _, path in ipairs(http_dirs) do
    local st, er = pcall(envs.create_env_file, env, path, env_file)
    if not st then
      notify_error(er)
      return
    end
  end
end


return {
  pp_link_endpoints = link_endpoints,
  pp_unlink_endpoints = unlink_endpoints,
}
