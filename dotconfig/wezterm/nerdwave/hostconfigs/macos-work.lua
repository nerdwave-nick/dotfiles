---@type HostConfig
local M = {
    wallpaper = {
        prefix = os.getenv("HOME") .. "/Documents/",
        wallpapers = {
            {
                image = "wp.jpg",
                hsb = {
                    brightness = 0.025,
                    hue = 1.0,
                    saturation = 1.0,
                }
            }
        }
    },
    sessionizer = {
        fd = "/opt/homebrew/Cellar/fd/9.0.0/bin/fd",
        paths = { os.getenv("HOME") .. "/repos", os.getenv("HOME") .. "/dotfiles" }
    },
    font = {
        size = 16,
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
    }
}

return M
