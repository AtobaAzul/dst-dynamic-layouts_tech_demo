name = "WX-78's Moon Base of Doom"
-- borrowed from IA
folder_name = folder_name or "workshop-"
if not folder_name:find("workshop-") then
    name = "[LOCAL] - " .. name
    mod_dependencies = {
        { --PRISON ISLAND
            workshop = "workshop-2982373019",
        },
        { --FORGE WEPS
            workshop = "workshop-1221281706",
        },
        {
            ["dst-dynamic-layouts"] = false,
            --workshop = "workshop-3009621570"
        },
        { --casino mode
            workshop = "workshop-2656551380"
        },
        { --UM
            ["uncompromising-survival"] = false,
            --workshop = "workshop-2039181790"
        },
        --{ --pregame lobby
        --    workshop = "workshop-2960467149"
        --},
        { --party hud
            workshop = "workshop-2868599299"
        },
        { --dmg display
            workshop = "workshop-2964299587"
        },
        { --wigfrid rerefresh
            workshop = "workshop-2892396162"
        },
        { --wx mod
            workshop = "workshop-2995850584"
        },
        { --help me up
            workshop = "workshop-1595934840"
        },
        { --modifiers
            workshop = "workshop-2503437364"
        },
        { --stacksize
            workshop = "workshop-1571581787"
        },

    }
else
    mod_dependencies = {
        { --PRISON ISLAND
            workshop = "workshop-2982373019",
        },
        { --FORGE WEPS
            workshop = "workshop-1221281706",
        },
        {
            --["dst-dynamic-layouts"] = false,
            workshop = "workshop-3009621570"
        },
        { --casino mode
            workshop = "workshop-2656551380"
        },
        { --UM
            --["uncompromising-survival"] = false,
            workshop = "workshop-2039181790"
        },
        { --pregame lobby
            workshop = "workshop-2960467149"
        },
        { --party hud
            workshop = "workshop-2868599299"
        },
        { --dmg display
            workshop = "workshop-2964299587"
        },
        { --wigfrid rerefresh
            workshop = "workshop-2892396162"
        },
        { --wx mod
            workshop = "workshop-2995850584"
        },
        { --help me up
            workshop = "workshop-1595934840"
        },
        { --modifiers
            workshop = "workshop-2503437364"
        },
        { --stacksize
            workshop = "workshop-1571581787"
        },

    }
end

version = "11"

description = [[A total conversion mod that turns DST into a roguelike!]]

author = "󰀈 The Uncomp Dev Team 󰀈"

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
hamlet_compatible = false

forge_compatible = false

all_clients_require_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {}

priority = -100

------------------------------
-- local functions to makes things prettier

local function Header(title)
    return {
        name = "",
        label = title,
        hover = "",
        options = { { description = "", data = false } },
        default = false
    }
end

local function SkipSpace()
    return {
        name = "",
        label = "",
        hover = "",
        options = { { description = "", data = false } },
        default = false
    }
end

local function BinaryConfig(name, label, hover, default)
    return {
        name = name,
        label = label,
        hover = hover,
        options = { { description = "Enabled", data = true, hover = "Enabled." },
            { description = "Disabled", data = false, hover = "Disabled." } },
        default = default
    }
end
------------------------------

configuration_options = {
}
