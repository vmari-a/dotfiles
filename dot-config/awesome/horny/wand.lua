local awful = require("awful")
local gears = require("gears")

local wand = {}

wand.globalkeys     = {}
wand.clientkeys     = {}
wand.globalbuttons  = {}
wand.clientbuttons  = {}

function wand.set_globals()
    root.keys(wand.globalkeys)
    root.buttons(wand.globalbuttons)
end

function wand.client_rules()
    return {
        rule = { },
        properties = {
            keys    = wand.clientkeys,
            buttons = wand.clientbuttons
        }
    }
end

return wand