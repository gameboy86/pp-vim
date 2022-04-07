local M = {}


local function get_envs()
  package.loaded['envs'] = nil
  local s, v  = pcall(require,'envs')
  if not s then
    error("envs file not found.")
  end
  return v
end


local function list_envs()
  local keys = {}
  local envs = get_envs()
  for key, _ in pairs(envs) do
    table.insert(keys, key)
  end
  return keys
end

M.list_envs = list_envs


local function create_env_file(env, path, env_file)
  local file = io.open(path.."/"..env_file, "w")
  for key, val in pairs(get_envs()[env]) do
    file:write(""..key.."="..val.."\n")
  end
  file:close()
end

M.create_env_file = create_env_file

return M
