local awful = require("awful")
local gears = require("gears")

local opts = { }

opts.dir = gears.filesystem.get_configuration_dir()

opts.tags = {
    "1", "2", "3", "4"
}


function opts.merge(n)
    opts = gears.table.crush(opts, n)
end

return opts