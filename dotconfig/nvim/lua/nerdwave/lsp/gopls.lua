---@brief
--- @class GoEnvironmentArgs
--- @field environment_variable string
--- @field subdirectory string?

local cached_module_path = nil
local cached_stdlib_path = nil

---@param env_args GoEnvironmentArgs
---@param on_complete fun(dir: string | nil)
local function resolve_go_directory(env_args, on_complete)
  local go_env_command = { 'go', 'env', env_args.environment_variable }
  vim.system(go_env_command, { text = true }, function(result)
    local directory_path = vim.trim(result.stdout or '')
    if result.code == 0 and directory_path ~= '' then
      if env_args.subdirectory and env_args.subdirectory ~= '' then
        directory_path = directory_path .. env_args.subdirectory
      end
      on_complete(directory_path)
    else
      vim.schedule(
        function()
          vim.notify(
            ('[gopls] identify ' .. env_args.environment_variable .. ' dir cmd failed with code %d: %s\n%s'):format(
              result.code,
              vim.inspect(go_env_command),
              result.stderr
            )
          )
        end
      )
      on_complete(nil)
    end
  end)
end

---@return string?
local function get_standard_library_directory()
  if cached_stdlib_path and cached_stdlib_path ~= '' then return cached_stdlib_path end

  resolve_go_directory({ environment_variable = 'GOROOT', subdirectory = '/src' }, function(directory)
    if directory then cached_stdlib_path = directory end
  end)
  return cached_stdlib_path
end

---@return string?
local function get_module_cache_directory()
  if cached_module_path and cached_module_path ~= '' then return cached_module_path end

  resolve_go_directory({ environment_variable = 'GOMODCACHE' }, function(directory)
    if directory then cached_module_path = directory end
  end)
  return cached_module_path
end

---@param filename string
---@return string?
local function determine_root_directory(filename)
  if cached_module_path and filename:sub(1, #cached_module_path) == cached_module_path then
    local gopls_clients = vim.lsp.get_clients({ name = 'gopls' })
    if #gopls_clients > 0 then return gopls_clients[#gopls_clients].config.root_dir end
  end
  if cached_stdlib_path and filename:sub(1, #cached_stdlib_path) == cached_stdlib_path then
    local gopls_clients = vim.lsp.get_clients({ name = 'gopls' })
    if #gopls_clients > 0 then return gopls_clients[#gopls_clients].config.root_dir end
  end
  return vim.fs.root(filename, 'go.work') or vim.fs.root(filename, 'go.mod') or vim.fs.root(filename, '.git')
end

---@type vim.lsp.Config
return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = function(bufnr, on_dir)
    local buffer_filename = vim.api.nvim_buf_get_name(bufnr)
    get_module_cache_directory()
    get_standard_library_directory()
    -- see: https://github.com/neovim/nvim-lspconfig/issues/804
    on_dir(determine_root_directory(buffer_filename))
  end,
  settings = {
    gopls = {
      buildFlags = { '-tags=unit,integration,bench' },
    },
  },
}

