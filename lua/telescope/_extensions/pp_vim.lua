local picker = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"

local envs = require "pp-vim.envs"
local pp = require "pp-vim"


local function enter(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  pp.link_endpoints(selected[1])
  actions.close(prompt_bufnr)
end


local function make_picker(opts)
  local opts = {
    layout_strategy="vertical",
    layout_config={
      height=10,
      width=0.3,
    },
    sorting_strategy="ascending",
    finder=finders.new_table(),
    sorter=sorters.get_generic_fuzzy_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", enter)
      return true
    end,
  }
  local make_finder = function()
    local en = envs.list_envs()
    return finders.new_table {
        results = en,
    }
  end

  local initial_finder = make_finder()
  if not initial_finder then return end
  picker.new(opts, {
    finder=initial_finder,
  }):find()
end

return require('telescope').register_extension({
    exports = {
        pp_vim = make_picker,
    }
})
