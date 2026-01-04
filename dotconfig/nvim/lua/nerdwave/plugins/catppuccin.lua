return {
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      float = {
        transparent = true,
        solid = false,
      },
      -- FINAL PALETTE: "Moonlight Glitch"
      -- Optimized for transparent backgrounds with dark anime aesthetics
      -- -- FINAL ADJUSTMENT: "Sakura Contrast"
      -- Text is tinted pink to separate it from the cyan/blue syntax.

      color_overrides = {
        all = {
          -- Base colors (The Void)
          base = '#06060c',
          mantle = '#0d0d15',
          crust = '#000000',

          -- Surface colors (The UI Elements)
          -- (Kept from the "High-Vis" version so line numbers stay readable)
          surface0 = '#2f334d',
          surface1 = '#4f567a',
          surface2 = '#6f76a1',

          -- Text colors (The HUD)
          -- CHANGED: Text is now a very pale Pink-White.
          -- This creates a warm vs cool contrast against the Teal members.
          text = '#f6f5f6',

          -- Adjusted subtext slightly to match the warmer text temperature
          subtext1 = '#e8dce6',
          subtext0 = '#c0c5e0',

          -- Comments
          overlay2 = '#aeb5d6',
          overlay1 = '#8e95b5',
          overlay0 = '#757b99',

          -- Syntax Colors (Restored to the "High-Vis" values)
          teal = '#8cfcf2', -- Bright Cyan (Now distinct against Pink text)
          blue = '#a3c7ff', -- Periwinkle Blue
          mauve = '#e8c2ff', -- Electric Violet
          red = '#ff80a6',
          maroon = '#f096aa',
          peach = '#ffc991',
          yellow = '#fae8b0',
          green = '#9df5c6',
          sky = '#a6e8f5',
          sapphire = '#85c1fa',
          lavender = '#dce0ff',
          pink = '#fccce8',

          -- Accents
          rosewater = '#fce3e8',
          flamingo = '#f7cdcd',
        },
      },

      -- color_overrides = {
      --   all = {
      --     -- Base colors (The Void)
      --     base = '#06060c',
      --     mantle = '#0d0d15',
      --     crust = '#000000',

      --     -- Surface colors (The UI Elements)
      --     -- High visibility for transparent usage
      --     surface0 = '#2f334d', -- Gutter background
      --     surface1 = '#4f567a', -- Inactive Line Numbers
      --     surface2 = '#6f76a1', -- Active Line Number / Splits / Borders

      --     -- Text colors (The HUD)
      --     text = '#f2f4ff', -- Main Code (Brightest White)
      --     subtext1 = '#dde1fc', -- Variable names
      --     subtext0 = '#c0c5e0', -- Brackets
      --     overlay2 = '#aeb5d6', -- Comments (High Contrast)
      --     overlay1 = '#8e95b5', -- Comments (Medium Contrast)
      --     overlay0 = '#757b99', -- Ignored text

      --     -- Syntax Colors (The Neon Glitch)
      --     red = '#ff80a6', -- Errors (Hot Pink)
      --     maroon = '#f096aa', -- Warnings
      --     peach = '#ffc991', -- Numbers/Booleans (Gold)
      --     yellow = '#fae8b0', -- Classes
      --     green = '#9df5c6', -- Strings (Spectral Mint)
      --     teal = '#8cfcf2', -- Keys (Cyan)
      --     sky = '#a6e8f5', -- Operators
      --     sapphire = '#85c1fa', -- Constants
      --     blue = '#a3c7ff', -- Functions (Periwinkle)
      --     lavender = '#dce0ff', -- Includes
      --     mauve = '#e8c2ff', -- Keywords (Electric Violet)
      --     pink = '#fccce8', -- Specials

      --     -- Accents
      --     rosewater = '#fce3e8',
      --     flamingo = '#f7cdcd',
      --   },
      -- },
      -- color_overrides = {
      --   all = {

      --     -- ----------------------------------------------------------------
      --     -- FINAL FIX: "High-Vis Frost"
      --     -- ----------------------------------------------------------------

      --     -- Base colors (The Void)
      --     -- Kept dark for contrast
      --     base = '#06060c',
      --     mantle = '#0d0d15',
      --     crust = '#000000',

      --     -- Surface colors (The UI Elements)
      --     -- CRITICAL FIX: Lifted brightness significantly for Line Numbers & Gutters
      --     surface0 = '#2f334d', -- Gutter background (Visible dark blue-grey)
      --     surface1 = '#4f567a', -- Inactive Line Numbers (Now clearly visible slate)
      --     surface2 = '#6f76a1', -- Active Line Number / Splits (Bright enough to read instantly)

      --     -- Text colors (The HUD)
      --     text = '#f2f4ff', -- Main Code (Brightest White)
      --     subtext1 = '#dde1fc', -- Variable names
      --     subtext0 = '#c0c5e0', -- Brackets
      --     overlay2 = '#aeb5d6', -- Comments (High Contrast)
      --     overlay1 = '#8e95b5', -- Comments (Medium Contrast)
      --     overlay0 = '#757b99', -- Ignored text (Brightened so it doesn't disappear)

      --     -- Syntax Colors (The Magic - Kept vibrant)

      --     -- RED: Errors
      --     red = '#ff80a6',

      --     -- MAROON: Warnings
      --     maroon = '#f096aa',

      --     -- PEACH: Numbers / Booleans
      --     peach = '#ffc991',

      --     -- YELLOW: Classes
      --     yellow = '#fae8b0',

      --     -- GREEN: Strings
      --     green = '#9df5c6',

      --     -- TEAL: Keys
      --     teal = '#8cfcf2',

      --     -- SKY: Operators
      --     sky = '#a6e8f5',

      --     -- SAPPHIRE: Constants
      --     sapphire = '#85c1fa',

      --     -- BLUE: Functions
      --     blue = '#a3c7ff',

      --     -- LAVENDER: Includes
      --     lavender = '#dce0ff',

      --     -- MAUVE: Keywords
      --     mauve = '#e8c2ff',

      --     -- PINK: Special
      --     pink = '#fccce8',

      --     -- Accents
      --     rosewater = '#fce3e8',
      --     flamingo = '#f7cdcd',

      -- -- ----------------------------------------------------------------
      -- -- FINAL MASTER: "Frost & Violet"
      -- -- ----------------------------------------------------------------

      -- -- Base colors (The Void)
      -- -- Kept extremely dark for contrast
      -- base = '#06060c',
      -- mantle = '#0d0d15',
      -- crust = '#000000',

      -- -- Surface colors (The UI Glass)
      -- -- SHIFTED: From "Warm Violet" to "Cool Deep Indigo"
      -- -- This separates the UI from the code syntax.
      -- surface0 = '#212337', -- Gutter / Line Numbers
      -- surface1 = '#323654', -- Selection / Cursor Line (Cooler, more distinct)
      -- surface2 = '#4f567a', -- Borders / Splits (Blue-tinted glass edge)

      -- -- Text colors (The HUD)
      -- text = '#f0f2ff', -- Main Code (Icy White)
      -- subtext1 = '#d0d6fc', -- Variable names
      -- subtext0 = '#aeb5d1', -- Brackets
      -- -- SHIFTED: Comments are now "Starlight Blue" instead of purple
      -- -- This ensures they don't look like keywords.
      -- overlay2 = '#949cbb', -- Comments (High Vis)
      -- overlay1 = '#767d96', -- Comments (Low Vis)
      -- overlay0 = '#5a6078', -- Hidden

      -- -- Syntax Colors (The Magic)

      -- -- RED: Errors
      -- red = '#ff80a6',

      -- -- MAROON: Warnings
      -- maroon = '#f096aa',

      -- -- PEACH: Numbers / Booleans
      -- peach = '#ffc991',

      -- -- YELLOW: Classes
      -- yellow = '#fae8b0',

      -- -- GREEN: Strings
      -- -- Pushed slightly towards "Emerald" to cut through the blue UI
      -- green = '#9df5c6',

      -- -- TEAL: Keys
      -- teal = '#8cfcf2',

      -- -- SKY: Operators
      -- sky = '#a6e8f5',

      -- -- SAPPHIRE: Constants
      -- sapphire = '#85c1fa',

      -- -- BLUE: Functions
      -- blue = '#a3c7ff',

      -- -- LAVENDER: Includes
      -- lavender = '#dce0ff',

      -- -- MAUVE: Keywords (local, function, if)
      -- -- The primary purple accent - now pops against the blueish comments
      -- mauve = '#e8c2ff',

      -- -- PINK: Special
      -- pink = '#fccce8',

      -- -- Accents
      -- rosewater = '#fce3e8',
      -- flamingo = '#f7cdcd',

      -- -- ----------------------------------------------------------------
      -- -- FINAL POLISH: "Moonlight Glitch" Palette
      -- -- ----------------------------------------------------------------

      -- -- Base colors (The Void)
      -- -- Kept pitch dark to maintain contrast
      -- base = '#05050a',
      -- mantle = '#0f0f14',
      -- crust = '#000000',

      -- -- Surface colors (The Glass UI)
      -- -- Brightened specifically to make window borders/splits visible
      -- surface0 = '#2b2640', -- Gutter / Line Numbers background
      -- surface1 = '#453f66', -- Selection / Cursor Line
      -- surface2 = '#6e6a9c', -- Borders / Splits (Lighter = clearer window separation)

      -- -- Text colors (The HUD)
      -- -- CRITICAL FIX: Brightened comments and secondary text
      -- text = '#f0f2ff', -- Main Code (Icy White)
      -- subtext1 = '#dee1f8', -- Variable names (Bright Lavender)
      -- subtext0 = '#c3c7e0', -- Brackets / Delimiters
      -- overlay2 = '#b8bddb', -- Comments - High Vis (Now silver-white, much more readable)
      -- overlay1 = '#9ca2bd', -- Comments - Low Vis
      -- overlay0 = '#8086a0', -- Hidden/Ignored

      -- -- Syntax Colors (The Neon Glitch)

      -- -- RED: Errors
      -- -- Hot Pink (Unchanged, it works well)
      -- red = '#ff80a6',

      -- -- MAROON: Warnings
      -- -- Deep Rose
      -- maroon = '#f096aa',

      -- -- PEACH: Numbers / Booleans
      -- -- Gold/Orange (Excellent contrast against blue background)
      -- peach = '#ffc991',

      -- -- YELLOW: Classes / Types
      -- -- Pale Amber
      -- yellow = '#fae8b0',

      -- -- GREEN: Strings
      -- -- "Ghost Mint" (Kept bright to float over the dark hair)
      -- green = '#a6f5c6',

      -- -- TEAL: Keys / Properties
      -- -- Electric Cyan
      -- teal = '#8cfcf2',

      -- -- SKY: Operators
      -- -- Soft Cyan
      -- sky = '#a6e8f5',

      -- -- SAPPHIRE: Constants
      -- -- Vivid Blue
      -- sapphire = '#85c1fa',

      -- -- BLUE: Functions / Methods
      -- -- Lifted slightly towards "Periwinkle" to separate from background indigo
      -- blue = '#a3c7ff',

      -- -- LAVENDER: Includes
      -- -- Soft Glow
      -- lavender = '#dce0ff',

      -- -- MAUVE: Keywords (local, function, if)
      -- -- "Electric Violet" - Lightened to prevent blending with the art
      -- mauve = '#e8c2ff',

      -- -- PINK: Special / Pointers
      -- -- Sakura Pink
      -- pink = '#fccce8',

      -- -- Accents
      -- rosewater = '#fce3e8',
      -- flamingo = '#f7cdcd',

      -- -- Base colors (The Void)
      -- -- Kept very dark to maximize contrast with the bright text
      -- base = '#09080f',
      -- mantle = '#12101c',
      -- crust = '#06050a',

      -- -- Surface colors (The UI Glass)
      -- -- Shifted to a cool slate-violet to stand out from the noise
      -- surface0 = '#29263c', -- Gutter / Line Numbers
      -- surface1 = '#3d375e', -- Selection / Cursor Line (More visible now)
      -- surface2 = '#544d7d', -- Borders / Splits

      -- -- Text colors (The Light)
      -- -- Much brighter than previous versions for readability
      -- text = '#f0f2ff', -- Icy White (Main Code)
      -- subtext1 = '#d0d5f5', -- Variable names
      -- subtext0 = '#b1b6d9', -- Brackets / Delimiters
      -- overlay2 = '#949bbd', -- Comments (High Vis)
      -- overlay1 = '#787da1', -- Comments (Low Vis)
      -- overlay0 = '#5c6080', -- Hidden

      -- -- Syntax Colors (The Neon Glitch)

      -- -- RED: Errors
      -- -- A bright, hot pink to match the butterfly glow
      -- red = '#ff80a6',

      -- -- MAROON: Warnings/Destructive
      -- -- A deep rose color
      -- maroon = '#f096aa',

      -- -- PEACH: Numbers / Booleans
      -- -- Brightened to match the glowing gold frame
      -- peach = '#ffc991',

      -- -- YELLOW: Classes / Types
      -- -- Pale amber, like the distant city lights/orbs
      -- yellow = '#fae8b0',

      -- -- GREEN: Strings
      -- -- "Ghost Green" - very bright mint to pop against dark hair
      -- green = '#a6f5c6',

      -- -- TEAL: Keys / Properties
      -- -- Electric cyan, matches the glitch effects
      -- teal = '#8cfcf2',

      -- -- SKY: Operators
      -- -- Soft moon-blue
      -- sky = '#a6e8f5',

      -- -- SAPPHIRE: Constants
      -- -- Vivid blue
      -- sapphire = '#85c1fa',

      -- -- BLUE: Functions / Methods
      -- -- Light Cornflower - distinct from the deep blue background
      -- blue = '#99c1f7',

      -- -- LAVENDER: Includes / Preproc
      -- -- The soft glow of the character's skin
      -- lavender = '#dce0ff',

      -- -- MAUVE: Keywords (if, then, end)
      -- -- The "Eyes" color - a punchy, bright violet
      -- mauve = '#e0b0ff',

      -- -- PINK: Special / Pointers
      -- -- Soft sakura pink
      -- pink = '#fccce8',

      -- -- Accents
      -- rosewater = '#fce3e8',
      -- flamingo = '#f7cdcd',

      -- -- Base colors (UI Surfaces - Deep Indigo Void)
      -- base = '#0a0914', -- Deepest background
      -- mantle = '#110f1d', -- Sidebars/popups
      -- crust = '#07060b', -- Darkest borders/statusline

      -- -- Surface colors (UI Elements - Cool Violet Tones)
      -- surface0 = '#27243d', -- Gutter/Line numbers background
      -- surface1 = '#3a3557', -- Selection highlights
      -- surface2 = '#504973', -- Borders/Separators

      -- -- Text colors (Foreground - Icy Moonlight)
      -- text = '#e8e6fd', -- Main text (very pale lavender-white)
      -- subtext1 = '#c4c0e3', -- Secondary text
      -- subtext0 = '#a9a4c9', -- Operators/Punctuation
      -- overlay2 = '#8e94b8', -- Comments (high contrast - blue-tinted gray)
      -- overlay1 = '#7a7f9e', -- Comments (medium contrast)
      -- overlay0 = '#626785', -- Ignored/hidden text

      -- -- Syntax Colors (Harmonized Magic)

      -- -- RED: Errors/Deletions -> Hot Magenta (Matches butterfly glow)
      -- red = '#fa7aa8',

      -- -- MAROON: Warnings -> Muted Rose
      -- maroon = '#e68ea7',

      -- -- PEACH: Numbers/Booleans -> Soft Golden Light
      -- peach = '#fcc288',

      -- -- YELLOW: Classes/Types -> Pale Gold
      -- yellow = '#fcebc5',

      -- -- GREEN: Strings -> Spectral Teal (Cooler than previous iteration)
      -- green = '#8bd0c4',

      -- -- TEAL: Keys/Constructors -> Bright Cyan Glitch
      -- teal = '#80dce8',

      -- -- SKY: Operators/Regex -> Pale Blue Reflection
      -- sky = '#99dcf0',

      -- -- SAPPHIRE: Secondary highlights -> Medium Blue
      -- sapphire = '#8aaef2',

      -- -- BLUE: Functions -> Deep Indigo Blue (Blends with hair shadows)
      -- blue = '#8b9dfd',

      -- -- LAVENDER: Includes/Preprocessors -> Soft Violet Glow
      -- lavender = '#c7c9ff',

      -- -- MAUVE: Keywords/Constants -> Radiant Purple (Matches eyes)
      -- mauve = '#e0baf7',

      -- -- PINK: Special/Pointers -> Magic dust pink
      -- pink = '#f7ccea',

      -- -- Accents
      -- rosewater = '#f5dadd',
      -- flamingo = '#f2c6c6',

      -- -- Base colors (UI & Backgrounds)
      -- -- Designed to be semi-transparent overlays on the wallpaper
      -- base = '#0b0a12', -- Deepest void (matches dark corners)
      -- mantle = '#13101f', -- Slightly lighter sidebar background
      -- crust = '#08070d', -- Status bar / darkest element

      -- -- Surface colors (Selection, Line Numbers, Popups)
      -- surface0 = '#2a2640', -- Very faint violet (Editor Gutter)
      -- surface1 = '#3e3859', -- Lighter violet (Selection background)
      -- surface2 = '#554f75', -- Borders / Split separators

      -- -- Text colors (Foreground)
      -- -- Shifted to icy-lavender for maximum contrast against dark indie/black
      -- text = '#e3eafc', -- Primary code color (Moonlight white)
      -- subtext1 = '#bac2de', -- Variable names / secondary text
      -- subtext0 = '#a6adc8', -- Operators / punctuation
      -- overlay2 = '#9399b2', -- Comments (High contrast)
      -- overlay1 = '#7f849c', -- Comments (Low contrast)
      -- overlay0 = '#6c7086', -- Ignored files / hidden text

      -- -- Syntax Colors (The "Pop")
      -- -- Mapped to specific visual elements in the image

      -- -- RED: Used for Errors/Deletions
      -- -- Matched to: The dark reddish/pink butterfly wings
      -- red = '#f46f99',

      -- -- MAROON: Used for secondary warnings
      -- -- Matched to: The deeper shadows on the hands
      -- maroon = '#d95a7d',

      -- -- PEACH: Used for Numbers/Booleans
      -- -- Matched to: The glowing orange/gold frame art
      -- peach = '#fcb874',

      -- -- YELLOW: Used for Warnings/Classes
      -- -- Matched to: The bright light orbs (Gold)
      -- yellow = '#fae3b0',

      -- -- GREEN: Used for Strings/Additions
      -- -- Matched to: Ghostly spectral light (Shifted to Mint for visibility)
      -- green = '#9cefb6',

      -- -- TEAL: Used for Keys/Constructors
      -- -- Matched to: The glitch artifacts in the hair
      -- teal = '#8bd5ca',

      -- -- SKY: Used for Operators/Regex
      -- -- Matched to: Light reflections on the hair
      -- sky = '#89dceb',

      -- -- SAPPHIRE: Used for secondary highlights
      -- -- Matched to: Deep blue hair shadows
      -- sapphire = '#74c7ec',

      -- -- BLUE: Used for Functions/Keywords
      -- -- Matched to: The main hair color (Electric Indigo)
      -- blue = '#8aa2f7',

      -- -- LAVENDER: Used for Includes/Preprocessors
      -- -- Matched to: The soft ambient glow around the character
      -- lavender = '#c9cbff',

      -- -- MAUVE: Used for Constants/Special Keywords
      -- -- Matched to: The glowing purple eyes (The focal point)
      -- mauve = '#ddb6f2',

      -- -- PINK: Used for Pointers/Underlines
      -- -- Matched to: The magical particle effects
      -- pink = '#f5c2e7',

      -- -- Special accent strictly for "Rosewater" elements
      -- rosewater = '#f2d5cf',
      -- flamingo = '#eebebe',

      -- rosewater = '#f0d9e3', --  Pale skin highlights
      -- flamingo = '#eebcca', --  Soft reddish-pink accents
      -- pink = '#e8a2d7', --  Magic dust/petals
      -- mauve = '#c07bf7', --  The glowing eyes (Key accent)
      -- red = '#d96c8a', --  Muted berry (Shadows on hands)
      -- maroon = '#c46882', --  Darker berry tone
      -- peach = '#eeb086', --  The wooden frame texture
      -- yellow = '#f2dcb3', --  Glowing light orbs (Gold)
      -- green = '#9edeb5', --  Spectral/Ghostly green (adjusted to fit the cold vibe)
      -- teal = '#8ad1d6', --  Cyan highlights in the frame art
      -- sky = '#91d0e8', --  Lightest hair reflections
      -- sapphire = '#7aa2f7', --  Deep blue hair tones
      -- blue = '#8aa2f0', --  Main hair color
      -- lavender = '#babbf1', --  Soft purple glow
      -- text = '#e0dcf5', --  Moonlight white (High readability)
      -- subtext1 = '#c2bce0', --  Muted lavender
      -- subtext0 = '#a49dc2', --  Desaturated purple-grey
      -- overlay2 = '#8884a3', --  Light noise texture
      -- overlay1 = '#6e6a8a', --  Mid-tone shadows
      -- overlay0 = '#565273', --  Darker shadows
      -- surface2 = '#423d61', --  Lighter background elements
      -- surface1 = '#322c4d', --  Deep background elements
      -- surface0 = '#241f3b', --  Dark violet shadow
      -- base = '#151226', --  Main background (Deep Indigo)
      -- mantle = '#100d1f', --  Darker background layer
      -- crust = '#0b0a14', --  Deepest black/void
      -- },
      -- },
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.surface2 },
          DiagnosticUnderlineError = { style = { 'undercurl' } },
          DiagnosticUnderlineWarn = { style = { 'undercurl' } },
          LspDiagnosticUnderlineError = { style = { 'undercurl' } },
          LspDiagnosticUnderlineWarning = { style = { 'undercurl' } },
          TreesitterContextSeparator = { fg = colors.surface1 },
        }
      end,
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        dark = 'mocha',
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.55, -- percentage of the shade to apply to the inactive window
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'undercurl' },
          hints = { 'underline' },
          warnings = { 'undercurl' },
          information = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      integrations = {
        treesitter = true,
        blink_cmp = true,
        treesitter_context = true,
        mason = true,
        telescope = { enabled = true },
        gitsigns = true,
        render_markdown = true,
        indent_blankline = {
          enabled = true,
          scope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = true,
        },
        fidget = true,
      },
    })
    vim.cmd('colorscheme catppuccin')
  end,
}
