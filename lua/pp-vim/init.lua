local utils = require "pp-vim/utils"
local envs = require "pp-vim/envs"


local function unlink_endpoints(env_file)
  env_file = env_file or ".env"
  local paths = utils.scan(vim.fn.getcwd(), env_file)
  for _, path in ipairs(paths) do
    os.remove(path.."/"..env_file)
  end
end


local function link_endpoints(env, env_file)
  env_file = env_file or ".env"
  local http_dirs = utils.scan(vim.fn.getcwd(), ".http")
  for _, path in ipairs(http_dirs) do
    envs.create_env_file(env, path, env_file)
  end
end


return {
  pp_link_endpoints = link_endpoints,
  pp_unlink_endpoints = unlink_endpoints,
}
