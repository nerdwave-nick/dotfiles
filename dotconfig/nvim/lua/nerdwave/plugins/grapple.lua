return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git_branch', -- also try out "git_branch"
    default_scopes = { lsp = false, global = false, cwd = false },
    icons = false, -- setting to "true" requires "nvim-web-devicons"
    status = false,
  },
}
