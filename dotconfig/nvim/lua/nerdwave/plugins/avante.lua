return {
  enabled = false,
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  config = function()
    require('avante').setup({
      instructions_file = 'AGENTS.md',
      provider = 'codex',
      providers = {
        claude = {
          endpoint = 'https://api.anthropic.com',
          model = 'claude-haiku-4-5',
          timeout = 30000, -- Timeout in milliseconds
          -- disabled_tools = { 'fetch' },
          extra_request_body = {
            temperature = 0.30,
          },
        },
      },
      behavior = {
        auto_approve_tool_permission = false,
        acp_follw_agent_locations = false,
      },
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'OXY2DEV/markview.nvim',
  },
}
