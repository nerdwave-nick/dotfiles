local wezterm = require("wezterm")

local F = {}
local fonts = {
    fira = {
        font = {
            family = "FiraCode Nerd Font",
            harfbuzz_features = {
                "liga=0",
                "clig=0",
                "calt=0",
                "zero", -- 0 with a dot, cv11-cv13
                "cv01", -- a simple
                "cv02", -- g simple
                -- "cv03", -- i 03-06
                -- "cv08", -- l changes 07-10
                "ss01", -- r simple
                -- "cv17", -- ~ further up
                "ss05", -- @ sign shape
                "ss04", -- $ sign shape
                -- "cv18", -- % shape
                "ss03", -- & shape
                "cv16", -- * shape
                -- "cv31", -- () shape
                "cv29", -- {} shape
                -- "cv30", -- | shape
            },
        },
        size = 16,
    },
}
F.setup = function(opts)
    opts.font = wezterm.font_with_fallback({
        fonts.fira.font,
        "Noto Sans Emoji",
    })
    opts.font_size = fonts.fira.size
    opts.harfbuzz_features = fonts.fira.font.harfbuzz_features
    return opts
end

return F
