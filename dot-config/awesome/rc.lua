require("awful.remote")
require("awful.autofocus")
require("awful.dbus")
local beautiful = require("beautiful")
local horny     = require("horny")

local mytheme = require("theme")
beautiful.init(mytheme)

horny.opts.tags = {"α", "β", "γ", "δ"}

horny.plug.plugs = {
    require("plugs.binds"),
    require("plugs.wibar"),
    require("plugs.titlebar"),
    require("plugs.signals")
}

horny.foreplay()

horny.get_freaky()
