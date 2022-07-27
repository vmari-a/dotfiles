local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local signals = { }
signals.name = "signals"

function signals.foreplay()
    --
end

function signals.insert()
    client.connect_signal("manage", function (c)
        if awesome.startup
          and not c.size_hints.user_position
          and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
        end

        c.shape        = gears.shape.rounded_rect
        c.border_width = beautiful.border_width
    end)

    client.connect_signal("focus", function(c)
        c.border_color = beautiful.border_focus
    end)
    client.connect_signal("unfocus", function(c)
        c.border_color = beautiful.border_normal
    end)
end

return signals