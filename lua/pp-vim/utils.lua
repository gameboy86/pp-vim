local M = {}

local function split(text)
  local t = {}
  for str in string.gmatch(text, "%S+") do
    table.insert(t, str)
  end
  return t
end


local function scan(path, search_pattern)
  local pfile = io.popen('ls -la "'..path..'" | grep -v "^total"')
  local dirs = {}
  if pfile == nil then
    return dirs
  end
  for ls_line in pfile:lines() do
    local file = split(ls_line)
    local filename = file[9]
    if filename == '.' or filename == '..' then
    else
      local file_mods = file[1]
      if file_mods:find("^d") ~= nil then
        for _, a in ipairs(scan(path.."/"..filename, search_pattern)) do
          table.insert(dirs, a)
        end
      end
      if filename:find(search_pattern) ~= nil then
        table.insert(dirs, path)
      end
    end
  end
  return dirs
end

M.split = split
M.scan = scan
return M