local env = env
GLOBAL.setfenv(1, GLOBAL)

env.AddClassPostConstruct("widgets/redux/craftingmenu_widget", function(self)
    function self:Initialize()
        self:UpdateFilterButtons()

        --self:SelectFilter(GLOBAL.CRAFTING_FILTERS.WEAPONS.name, true)
        local data = self.filtered_recipes[1]
        self:PopulateRecipeDetailPanel(data, data ~= nil and Profile:GetLastUsedSkinForItem(data.recipe.name) or nil)

        self:Refresh()
    end
end)

local filters = {
    "TOOLS",
    "LIGHT",
    "PROTOTYPERS",
    "REFINE",
    "CLOTHING",
    "COOKING",
    "GARDENING",
    "FISHING",
    "SEAFARING",
    "CONTAINERS",
    "STRUCTURES",
    "MAGIC",
    "RIDING",
    "WINTER",
    "SUMMER",
    "RAIN",
    "DECOR",
}


for i = #CRAFTING_FILTER_DEFS, 1, -1 do
    if table.contains(filters, CRAFTING_FILTER_DEFS[i].name) then
        table.remove(CRAFTING_FILTER_DEFS, i)
    end
end

RemoveAllRecipes()

--recipe defs

ROGUELIKE_RECIPES = {
    {}
}