
--way too much work.

local env = env
GLOBAL.setfenv(1, GLOBAL)

--Remove dubloon mod recipes. We'll be dynamically populating that later.
for k, v in pairs(CRAFTING_FILTERS.DUBLOONSHOP.recipes) do
    AllRecipes[v] = nil
end
for k, v in pairs(CRAFTING_FILTERS.DUBLOONREFINE.recipes) do
    AllRecipes[v] = nil
end

--[[
local _CRAFTING_FILTERS = deepcopy(CRAFTING_FILTERS)

CRAFTING_FILTERS = {
    DUBLOONSHOP = _CRAFTING_FILTERS.DUBLOONSHOP,
    DUBLOONREFINE = _CRAFTING_FILTERS.DUBLOONREFINE,
    MODS = _CRAFTING_FILTERS.MODS
}
]]
local _AllRecipes = deepcopy(AllRecipes)

AllRecipes = {} --clear ALL recipes.
AllBuilderTaggedRecipes = {}


for _, recipe in pairs(_AllRecipes) do
    local cost = 0
    if recipe.name == recipe.product then
        for _, ingredients in pairs(recipe.ingredients) do
            cost = cost + ingredients.amount * (2 + (recipe.nounlock == true and 1.5 or 1) + (#recipe.ingredients))
        end

        env.AddRecipe2(recipe.name, { Ingredient("dubloon", cost, "images/slotm_inventory.xml") }, TECH.MAGIC_THREE, { sg_state = "give", product = recipe.product, builder_tag = recipe.builder_tag, placer = recipe.placer, atlas = recipe.atlas }, { "DUBLOONSHOP" })
        env.AddRecipe2(recipe.name .. "_sell", { Ingredient(recipe.product, 1) }, TECH.MAGIC_THREE, { atlas = "images/slotm_inventory.xml", sg_state = "give", product = "dubloon", numtogive = math.floor(cost * 0.66) }, { "DUBLOONREFINE" })
    end
end

local theingredients = {
    "petals",
    "saltrock",
    "flint",
    "marble",
    "nightmarefuel",
    "rocks",
    "twigs",
    "slurper_pelt",
    "batwing",
    "feather_robin_winter",
    "purplegem",
    "houndstooth",
    "boneshard",
    "rope",
}

for k, recipe in pairs(_AllRecipes) do
    if string.find(recipe.name, "@") then
        for k, v in pairs(recipe.ingredients) do
            if table.contains(theingredients, v.type) then
                v.type = "dubloon"
                v.amount = 45
            end
        end
        AllRecipes[recipe.name] = recipe
    end
end
