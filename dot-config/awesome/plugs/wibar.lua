local awful     = require("awful")
local gears     = require("gears")
local wibox     = require("wibox")
local beautiful = require("beautiful")

local POSITION = "bottom"

local wibar = {}
wibar.name = "wibar"

local function taglist(s)
    local buttons = gears.table.join(
        awful.button({ }, 1, function(t) t:view_only() end)
    )

    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = buttons
    }
end

local function prompt()
    local w = awful.widget.prompt()
    w.font = beautiful.font_mono
    return w
end

local function clock()
    local w = wibox.widget.textclock(" %d/%m %H:%M ")
    local c = awful.widget.calendar_popup.month()

    c:attach(w, "br")

    w.font = beautiful.font_mono
    return w
end

local function kbmap()
    local w = awful.widget.keyboardlayout()
    w.font = beautiful.font_mono
    return w
end

local function tray()
    return {
        wibox.widget.systray(),
        widget = wibox.container.margin,
        top = 3,
        bottom = 3,
        left = 5,
        right = 5
    }
end

function wibar.screen_connect(s)
    s.wibar = awful.wibar({
        position = POSITION,
        screen   = s
    })

    s.prompt = prompt()

    s.wibar:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            taglist(s),
            s.prompt
        },
        {
            layout = wibox.layout.fixed.horizontal
        },
        {
            layout = wibox.layout.fixed.horizontal,
            tray(),
          --kbmap(),
            clock()
        }
    }
end

return wibar
