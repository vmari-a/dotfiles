local wibox = require("wibox")
local awful = require("awful")
local cage  = require("horny.cage")

local titlebar = {}
titlebar.name = "titlebar"

local function make(c)
    awful.titlebar(c):setup{
        {layout = wibox.layout.flex.horizontal},
        {
            {
                align   = "center",
                widget  = awful.titlebar.widget.titlewidget(c)
            },
            layout = wibox.layout.flex.horizontal
        },
        {layout = wibox.layout.flex.horizontal},
        layout = wibox.layout.align.horizontal
    }
end

function titlebar.foreplay()
    cage.adopt({
        rule_any = {
            type = { "normal", "dialog" }
        },
        properties = {
            titlebars_enabled = true
        }
    })
    cage.adopt({
        rule_any = {
            class = { "Google-chrome", "Code", "Telegram-Desktop", "URxvt" },
        },
        properties = {
            titlebars_enabled = false
        }
    })
end

function titlebar.insert()
    client.connect_signal("request::titlebars", make)
end

return titlebar
