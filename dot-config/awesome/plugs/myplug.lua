local sample = { }

sample.name = "My Plug" -- [REQUIRED] The name of your plug for logging purposes

function sample.foreplay()
    -- Run before horny applies any changes to the WM. This is where you'd set
    -- any rules, create wiboxes, etc. Do not mutate the WM here, it's not
    -- guaranteed that your plug will make it past this stage.
end

function sample.screen_connect(s)
    -- Run inside awful.screen.connect_for_each_screen. This is where you'd
    -- generate your wibar, for example.
end

function sample.insert()
    -- Run after horny applies changes to the WM. This is where you'd add
    -- your signal hooks, for example.
end

return sample