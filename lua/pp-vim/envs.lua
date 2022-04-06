local M = {}


local function list_envs()
  package.loaded['envs'] = nil
  local v  = require 'envs'
  local keys = {}
  for key, _ in pairs(v) do
    table.insert(keys, key)
  end
  return keys
end

M.list_envs = list_envs


local function create_env_file(env, path)
  package.loaded['envs'] = nil
  local v = require 'envs'
  local file = io.open(path.."/.pp_env", "w")
  for key, val in pairs(v[env]) do
    file:write(""..key.."="..val.."\n")
  end
  file:close()
end

M.create_env_file = create_env_file

return M
