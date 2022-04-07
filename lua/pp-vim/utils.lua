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


local function contains(table, val)
   for i=1,#table do
      if table[i] == val then
         return true
      end
   end
   return false
end


local function notify_error(message)
  local s, notify = pcall(require, "notify")
  if not s then
    print(message)
  else
    notify(message, "error")
  end
end


M.split = split
M.scan = scan
M.contains = contains
M.notify_error = notify_error
return M
