local xresources = require("beautiful.xresources")
local dpi        = xresources.apply_dpi
local xrdb       = xresources.get_current_theme()

local gears = require("gears")

local assets = gears.filesystem.get_configuration_dir().."assets"

local theme = { }

theme.font                  = "Fira Sans 12"
theme.font_mono             = "Fira Mono 12"

theme.bg_normal             = xrdb.background
theme.bg_urgent             = theme.bg_normal
theme.bg_focus              = theme.bg_normal
theme.bg_minimize           = theme.bg_normal
theme.bg_systray            = theme.bg_normal

theme.fg_normal             = xrdb.foreground
theme.fg_focus              = xrdb.color4
theme.fg_urgent             = xrdb.color1
theme.fg_minimize           = xrdb.color8

theme.useless_gap           = dpi(5)
theme.border_width          = dpi(3)
theme.border_normal         = theme.bg_normal
theme.border_focus          = theme.border_normal
theme.border_marked         = theme.border_normal

theme.taglist_fg_empty      = xrdb.color0
theme.taglist_bg_focus      = xrdb.color0
theme.taglist_fg_focus      = xrdb.foreground
theme.taglist_fg_urgent     = xrdb.color9
theme.taglist_fg_occupied   = xrdb.color7

theme.titlebar_fg_normal    = xrdb.color8
theme.titlebar_fg_focus     = xrdb.color7

theme.menu_submenu_icon     = ">"
theme.menu_bg_focus         = theme.bg_normal
theme.menu_fg_normal        = xrdb.color8
theme.menu_fg_focus         = theme.fg_normal

theme.hotkeys_modifiers_fg  = xrdb.color8

theme.wallpaper = assets.."/wall.png"

theme.icon_theme = nil

return theme
