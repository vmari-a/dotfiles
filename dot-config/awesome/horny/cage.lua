local awful     = require("awful")
local beautiful = require("beautiful")

local cage = { }

cage.book = {
    {
        rule = { },
        properties = {
            border_width    = beautiful.border_width,
            border_color    = beautiful.border_normal,
            focus           = awful.client.focus.filter,
            raise           = true,
            screen          = awful.screen.preferred,
            placement       =
                awful.placement.no_overlap + awful.placement.no_offscreen
        }
    }
}

function cage.adopt(book)
    table.insert(cage.book, book)
end

function cage.consent()
    awful.rules.rules = cage.book
end

return cage