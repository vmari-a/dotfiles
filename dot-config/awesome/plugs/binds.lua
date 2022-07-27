local awful = require("awful")
local gears = require("gears")
local popup = require("awful.hotkeys_popup")

local wand  = require("horny.wand")

local ALT   = "Mod1"
local SUPER = "Mod4"
local SHIFT = "Shift"
local CTRL  = "Control"

local binds = {}

binds.name = "binds"

function binds.foreplay()
    wand.globalkeys = gears.table.join(wand.globalkeys,

        awful.key({ SUPER }, "F1", popup.show_help),

        -- "System" keys (mostly Super+Alt)

        awful.key({ SUPER, ALT }, "F5",     awesome.restart,
        {group="system", description="restart awesome"}),
        awful.key({ SUPER, ALT }, "Delete", awesome.quit,
        {group="system", description="quit awesome"}),

        -- Spawn/ext. program (mostly Super)

        awful.key({ SUPER },  "r", function()
            awful.spawn("rofi -show drun")
        end,
        {group="rofi", description="app switcher (rofi drun)"}),

        awful.key({ SUPER },  "Tab", function()
            awful.spawn("rofi -show window")
        end,
        {group="rofi", description="window switcher (rofi window)"}),

        awful.key({ SUPER }, "F2", function()
            awful.spawn("rofi -show run")
        end,
        {group="rofi", description="run command (rofi run)"}),

        awful.key({ SUPER }, "Return", function()
            awful.spawn("urxvt")
        end,
        {group="system", description="spawn terminal"}),

        awful.key({ SUPER }, "Print", function()
            awful.spawn("shot")
        end,
        {group="system", description="spawn terminal"}),

        -- Clients (mostly Super)

        awful.key({ ALT }, "Tab", function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {group="client", description="previous client"}),

        awful.key({ SUPER }, "Up",   function() end),
        awful.key({ SUPER }, "Down", function() end),

        -- Tags (mostly Super+Ctrl)

        awful.key({ SUPER }, "Left",  awful.tag.viewprev,
        {group="tag", description="previous tag"}),

        awful.key({ SUPER }, "Right", awful.tag.viewnext,
        {group="tag", description="next tag"}),


        awful.key({ SUPER, CTRL }, "1", function()
            awful.layout.set(awful.layout.suit.tile)
        end,
        {group="tag", description="set tiling"}),

        awful.key({ SUPER, CTRL }, "2", function()
            awful.layout.set(awful.layout.suit.floating)
        end,
        {group="tag", description="set floating"}),

        awful.key({ SUPER, CTRL }, "3", function()
            awful.layout.set(awful.layout.suit.corner.nw)
        end,
        {group="tag", description="set corner tiling"}),


        awful.key({ SUPER, CTRL }, "Left", function()
            awful.tag.incmwfact(-0.05)
        end,
        {group="tag", description="decrease master width"}),

        awful.key({ SUPER, CTRL }, "Right", function()
            awful.tag.incmwfact( 0.05)
        end,
        {group="tag", description="increase master width"}),


        awful.key({ SUPER, CTRL }, "Up", function()
            awful.tag.incnmaster( 1, nil, true)
        end,
        {group="tag", description="increase number of masters"}),

        awful.key({ SUPER, CTRL }, "Down", function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {group="tag", description="decrease number of masters"})
    )

    wand.clientkeys = gears.table.join(wand.clientkeys,
        -- Mostly Super

        awful.key({ SUPER }, "q", function(c)
            c:kill()
        end,
        {group="client", description="kill"}),

        awful.key({ SUPER }, "w", function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        {group="client", description="maximize"}),

        awful.key({ SUPER }, "e", function(c)
            c.floating = not c.floating
            c:raise()
        end,
        {group="client", description="float"}),

        awful.key({ SUPER }, "t", function(c)
            c.ontop = not c.ontop
            c:raise()
        end,
        {group="client", description="ontop"}),

        awful.key({ SUPER }, "y", function(c)
            --
        end,
        {group="client", description="RTX ON (unused)"})
    )

    wand.clientbuttons = gears.table.join(wand.clientbuttons,
        awful.button({ }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end),

        awful.button({ SUPER }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end),

        awful.button({ SUPER }, 3, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )
end

return binds