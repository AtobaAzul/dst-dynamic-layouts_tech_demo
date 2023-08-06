name = "The Forge's Catacombs"
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
        { --modifiers
            workshop = "workshop-2503437364"
        },
        { --stacksize
            workshop = "workshop-1571581787"
        },

    }
end

version = "26"

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

priority = -1.79769313486231e+308

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

game_modes = {
    {
        name = "lavaarena_dungeon",
        label = "The Forge's Catacombs",
        description = "* Fight through endless hordes in an ever-expanding dungeon.\n* Purchase items with dubloons.",
        settings = {
            internal = false,
            level_type = "LAVAARENA_DUNGEON",
            spawn_mode = "fixed",
            resource_renewal = false,
            ghost_sanity_drain = false,
            ghost_enabled = false,
            revivable_corpse = true,
            portal_rez = false,
            reset_time = nil,
            invalid_recipes = nil,
            --
            drop_everything_on_despawn = false,
            non_item_equips = false,
            no_air_attack = true,
            -- no_minimap = false,
            no_hunger = true,
            no_eating = false,
            no_sanity = false,
            no_temperature = true,
            no_avatar_popup = false,

            no_morgue_record = true,
            hide_worldgen_loading_screen = true,
            hide_received_gifts = false,
            skin_tag = nil,
            disable_transplanting = true,
            disable_bird_mercy_items = true,
        },
    },
}
