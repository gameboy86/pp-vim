local M = {}


local function list_envs()
  package.loaded['envs'] = nil
  local s, v  = pcall(require,'envs')
  if not s then
    return nil
  end
  local keys = {}
  for key, _ in pairs(v) do
    table.insert(keys, key)
  end
  return keys
end

M.list_envs = list_envs


local function create_env_file(env, path, env_file)
  package.loaded['envs'] = nil
  local v = require 'envs'
  local file = io.open(path.."/"..env_file, "w")
  for key, val in pairs(v[env]) do
    file:write(""..key.."="..val.."\n")
  end
  file:close()
end

M.create_env_file = create_env_file

return M
