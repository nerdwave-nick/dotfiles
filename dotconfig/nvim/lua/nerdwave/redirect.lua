_G.print = function(...)
  -- Take in the arguments from `print` and convert them into a table
  local args = { n = select('#', ...), ... }
  local formatted_args = {}
  -- Sanitize the arguments
  for i = 1, args.n do
    local item = select(i, ...)
    if not item then item = 'nil' end
    local t_item = type(item)
    -- If the argument is a table, function or "userdata", pass it through vim.inspect
    if t_item == 'table' or t_item == 'function' or t_item == 'userdata' then
      item = vim.inspect(item)
    else
      item = string.format('%s', item)
    end
    -- Stuff the cleaned argument back into a table
    table.insert(formatted_args, item)
  end
  -- Send the clean table to vim.notify
  -- See :vim.notify for details on this, it is a vim specific
  -- function
  vim.notify(table.concat(formatted_args, ' '), vim.log.levels.INFO)
end
