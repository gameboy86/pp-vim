local utils = require "pp-vim/utils"
local envs = require "pp-vim/envs"


local function unlink_endpoints()
  local paths = utils.scan(vim.fn.getcwd(), ".pp_env")
  for _, path in ipairs(paths) do
    os.remove(path.."/.pp_env")
  end
end


local function link_endpoints(env)
  local http_dirs = utils.scan(vim.fn.getcwd(), ".http")
  for _, path in ipairs(http_dirs) do
    envs.create_env_file(env, path)
  end
end


return {
  pp_link_endpoints = link_endpoints,
  pp_unlink_endpoints = unlink_endpoints,
}
