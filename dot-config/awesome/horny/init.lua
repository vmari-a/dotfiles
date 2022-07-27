local awful     = require("awful")
local gears     = require("gears")
local naughty   = require("naughty")
local beautiful = require("beautiful")

local horny = { }

horny.opts = require("horny.opts") -- config
horny.cage = require("horny.cage") -- rules
horny.wand = require("horny.wand") -- binds
horny.plug = require("horny.plug") -- plugins

function horny.set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper

        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end

        gears.wallpaper.maximized(wallpaper, s)
    end
end

function horny.connect_screen(s)
    horny.set_wallpaper(s)
    awful.tag(horny.opts.tags, s, awful.layout.suit.tile)

    for k,plug in pairs(horny.plug.plugs) do
        if plug.screen_connect then
            plug.screen_connect(s)
        end
    end
end

function horny.foreplay()
    for k,plug in pairs(horny.plug.plugs) do
        if plug.foreplay then
            plug.foreplay()
        end
    end
end

function horny.get_freaky()
    -- Set keys
    horny.wand.set_globals()
    horny.cage.adopt(horny.wand.client_rules())

    -- Apply screen connection func
    awful.screen.connect_for_each_screen(horny.connect_screen)

    -- Apply rules
    horny.cage.consent()

    -- Insert plugs
    for k,plug in pairs(horny.plug.plugs) do
        if plug.insert then
            plug.insert()
        end
    end

    naughty.notify({title="Horny", text="Orgasm achieved."})
end

return horny