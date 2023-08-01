GLOBAL.TUNING.DL_TD = {
    MODROOT = MODROOT,
}

PrefabFiles = {
    "room_mobspawner"
}

Assets = {
    Asset("ANIM", "anim/chandelier_wxdungeon.zip")
}

AddComponentPostInit("archivemanager", function(self)
    function self:GetPowerSetting()
        return true
    end
end)

AddPrefabPostInit("archive_chandelier", function(inst)
    inst.AnimState:SetBuild("chandelier_wxdungeon")
    inst:PushEvent("arhivepoweron")
    inst.widthscale = 1.5
    inst:DoTaskInTime(1, function(inst)
        if inst.updatelight then
            inst.updatelight(inst)
        end
    end)

    if not GLOBAL.TheWorld.ismastersim then
        return
    end

    inst.components.playerprox:SetDist(35, 44) --15,17
end)

AddPrefabPostInit("chandelier_fire", function(inst)
    inst.AnimState:SetMultColour(1, 0.5, 0, 1)
end)
--[[
TODO


]]

GLOBAL.TUNING.NONLETHAL_TEMPERATURE = true
GLOBAL.TUNING.NONLETHAL_HUNGER = true
GLOBAL.TUNING.NONLETHAL_DARKNESS = true
GLOBAL.TUNING.NONLETHAL_PERCENT = 0.5

local recipes = {
    ["forginghammer"] = { cost = 30, quantity = 1, character = nil },
    ["forgedarts"] = { cost = 30, quantity = 1, character = nil },
    ["pithpike"] = { cost = 30, quantity = 1, character = nil },
    ["livingstaff"] = { cost = 60, quantity = 1, character = nil },
    ["moltendarts"] = { cost = 45, quantity = 1, character = nil },
    ["infernalstaff"] = { cost = 60, quantity = 1, character = nil },
    ["spiralspear"] = { cost = 45, quantity = 1, character = nil },
    ["bacontome"] = { cost = 30, quantity = 1, character = nil },
    ["hearthsfire_crystals"] = { cost = 30, quantity = 1, character = nil },
    ["blacksmith_edge"] = { cost = 30, quantity = 1, character = nil },
    ["featheredtunic"] = { cost = 15, quantity = 1, character = nil },
    ["jaggedarmor"] = { cost = 15, quantity = 1, character = nil },
    ["forge_woodarmor"] = { cost = 15, quantity = 1, character = nil },
    ["silkenarmor"] = { cost = 15, quantity = 1, character = nil },
    ["splintmail"] = { cost = 15, quantity = 1, character = nil },
    ["steadfastarmor"] = { cost = 30, quantity = 1, character = nil },
    ["barbedhelm"] = { cost = 15, quantity = 1, character = nil },
    ["reedtunic"] = { cost = 15, quantity = 1, character = nil },
    ["armor_hpdamager"] = { cost = 100, quantity = 1, character = nil },
    ["armor_hpextraheavy"] = { cost = 120, quantity = 1, character = nil },
    ["armor_hprecharger"] = { cost = 120, quantity = 1, character = nil },
    ["armor_hppetmastery"] = { cost = 45, quantity = 1, character = nil },
    ["featheredwreath"] = { cost = 30, quantity = 1, character = nil },
    ["resplendentnoxhelm"] = { cost = 60, quantity = 1, character = nil },
    ["blossomedwreath"] = { cost = 120, quantity = 1, character = nil },
    ["clairvoyantcrown"] = { cost = 100, quantity = 1, character = nil },
    ["noxhelm"] = { cost = 45, quantity = 1, character = nil },
    ["crystaltiara"] = { cost = 15, quantity = 1, character = nil },
    ["wovengarland"] = { cost = 30, quantity = 1, character = nil },
    ["flowerheadband"] = { cost = 30, quantity = 1, character = nil },

    ["recycled_7"] = { cost = 120, quantity = 1, character = nil },
    ["recycled_8"] = { cost = 240, quantity = 1, character = nil },
    ["recycled_9"] = { cost = 480, quantity = 1, character = nil },

    ["wereitem_beaver"] = { cost = 15, quantity = 1, character = "werehuman" },
    ["wereitem_goose"] = { cost = 15, quantity = 1, character = "werehuman" },
    ["wereitem_moose"] = { cost = 15, quantity = 1, character = "werehuman" },

    ["ghostlyelixir_slowregen"] = { cost = 30, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_fastregen"] = { cost = 60, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_shield"] = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_retaliation"] = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_attack"] = { cost = 15, quantity = 1, character = "elixirbrewer" },
    ["ghostlyelixir_speed"] = { cost = 15, quantity = 1, character = "elixirbrewer" },

    ["battlesong_healthgain"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_durability"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_sanitygain"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_fireresistance"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_instant_taunt"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_instant_panic"] = { cost = 30, quantity = 1, character = "battlesinger" },
    ["battlesong_sanityaura"] = { cost = 30, quantity = 1, character = "battlesinger" },

    ["wx78module_maxhealth"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhealth2"] = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxsanity"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxsanity1"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhunger"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_maxhunger1"] = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_bee"] = { cost = 60, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_taser"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_cold"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_heat"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_music"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_movespeed"] = { cost = 30, quantity = 1, character = "upgrademoduleowner" },
    ["wx78module_movespeed2"] = { cost = 60, quantity = 1, character = "upgrademoduleowner" },

    ["book_tentacles"] = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_brimstone"] = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_sleep"] = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_fire"] = { cost = 30, quantity = 1, character = "bookbuilder" },
    ["book_web"] = { cost = 30, quantity = 1, character = "bookbuilder" },

    ["dumbbell"] = { cost = 15, quantity = 1, character = "strongman" },
    ["dumbbell_bluegem"] = { cost = 45, quantity = 1, character = "strongman" },
    ["dumbbell_gem"] = { cost = 60, quantity = 1, character = "strongman" },
    ["dumbbell_golden"] = { cost = 30, quantity = 1, character = "strongman" },
    ["dumbbell_heat"] = { cost = 30, quantity = 1, character = "strongman" },
    ["dumbbell_marble"] = { cost = 45, quantity = 1, character = "strongman" },
    ["dumbbell_redgem"] = { cost = 60, quantity = 1, character = "strongman" },
    ["wolfgang_whistle"] = { cost = 15, quantity = 1, character = "strongman" },

    ["compostwrap"] = { cost = 30, quantity = 1, character = "plantkin" },
}

local function AddShop(prefab, cost, qty, character)
    AddRecipe2(prefab .. "2", { GLOBAL.Ingredient("dubloon", math.ceil(cost ~= nil and cost or 1)) }, GLOBAL.TECH.MAGIC_THREE, { nil, nil, nounlock = true, numtogive = qty ~= nil and qty or 1, nil, nil, nil, nil, product = prefab, builder_tag = character, nil, sg_state = "give" }, { "DUBLOONSHOP" })
end

for item, data in pairs(recipes) do
    AddShop(item, data.cost, data.quantity, data.character)
    AddRecipeToFilter(item .. "2", "DUBLOONSHOP")
end

local slingshotammo = {}

local TechTree = GLOBAL.require("techtree")

AddPrefabPostInit("world", function(inst)
    GLOBAL.TUNING.STACK_SIZE_TINYITEM = GLOBAL.TUNING.STACK_SIZE_SMALLITEM

    inst:DoTaskInTime(0.0000001, function()
        for k, v in pairs(GLOBAL.AllRecipes) do
            if string.find(v.name, "slingshotammo_") then
                v.ingredients = { Ingredient("dubloon", 5) }
                v.level = TechTree.Create(GLOBAL.TECH.NONE)
                v.nounlock = true
                table.insert(slingshotammo, v.name)
            end
        end

        for item, data in pairs(recipes) do
            AddRecipeToFilter(item .. "2", "DUBLOONSHOP")
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

        for k, recipe in pairs(GLOBAL.AllRecipes) do
            if string.find(recipe.name, "@") then
                for k, v in pairs(recipe.ingredients) do
                    if table.contains(theingredients, v.type) then
                        v.type = "dubloon"
                        v.amount = 45
                    end
                end
            end
        end

        for k, v in pairs(slingshotammo) do
            AddRecipeToFilter(v, "DUBLOONSHOP")
        end
    end)

    if not GLOBAL.TheWorld.ismastersim then return end

    GLOBAL.TheWorld:DoTaskInTime(0, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        if GLOBAL.TheWorld.dl_setpieces["forge_dungeon"] == nil then
            local start = GLOBAL.SpawnPrefab("dl_spawner")
            start.Transform:SetPosition(0, 0, 0)
            start.components.writeable.text = "Start"
            start.SpawnLayout(start, { file_path_override = GLOBAL.TUNING.DL_TD.MODROOT .. "scripts/forge_dungeon.json" })
        end
    end)
end)


local DUNGEON_CC =
{
    day = "images/colour_cubes/summer_dusk_cc.tex",
    dusk = "images/colour_cubes/summer_dusk_cc.tex",
    night = "images/colour_cubes/summer_dusk_cc.tex",
    full_moon = "images/colour_cubes/summer_dusk_cc.tex",
}

AddPlayerPostInit(function(inst)
    inst.components.playervision:SetCustomCCTable(DUNGEON_CC)

    inst:DoTaskInTime(0, function(inst)
        inst.Transform:SetPosition(0, 0, 0)
    end)


    if not GLOBAL.TheWorld.ismastersim then return end

    inst:ListenForEvent("death", function(inst)
        print("on dead!")
        local all_dead = true

        for k, v in pairs(GLOBAL.AllPlayers) do
            if v.components.health ~= nil and not v.components.health:IsDead() then
                print("not dead!")
                all_dead = false
            end
        end

        if all_dead then
            inst:DoTaskInTime(5, function()
                GLOBAL.c_regenerateshard()
            end)
        end
    end)


    inst.components.grue:AddImmunity("nogrue")
end)

AddPrefabPostInit("wall_stone", function(inst)
    inst.AnimState:SetMultColour(0.75, 0.45, 0, 1)
    inst:RemoveComponent("workable")
    inst:AddTag("NOTARGET")
    inst:AddTag("notarget")
    if not GLOBAL.TheWorld.ismastersim then return end

    inst.components.health.absorb = 1
end)

local STARTING_ITEMS = GLOBAL.TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT

table.insert(STARTING_ITEMS.WILSON, "forgedarts")
table.insert(STARTING_ITEMS.WILSON, "forge_woodarmor")

table.insert(STARTING_ITEMS.WILLOW, "forgedarts")
table.insert(STARTING_ITEMS.WILLOW, "featheredtunic")

table.insert(STARTING_ITEMS.WOLFGANG, "forginghammer")
table.insert(STARTING_ITEMS.WOLFGANG, "forge_woodarmor")

table.insert(STARTING_ITEMS.WENDY, "forgedarts")
table.insert(STARTING_ITEMS.WENDY, "featheredtunic")

table.insert(STARTING_ITEMS.WX78, "forginghammer")
table.insert(STARTING_ITEMS.WX78, "forge_woodarmor")

table.insert(STARTING_ITEMS.WICKERBOTTOM, "bacontome")
table.insert(STARTING_ITEMS.WICKERBOTTOM, "reedtunic")

table.insert(STARTING_ITEMS.WOODIE, "forge_woodarmor")

table.insert(STARTING_ITEMS.WES, "forgedarts")
table.insert(STARTING_ITEMS.WES, "featheredtunic")

table.insert(STARTING_ITEMS.WAXWELL, "bacontome")
table.insert(STARTING_ITEMS.WAXWELL, "reedtunic")

table.insert(STARTING_ITEMS.WATHGRITHR, "pithpike")
table.insert(STARTING_ITEMS.WATHGRITHR, "featheredtunic")

table.insert(STARTING_ITEMS.WEBBER, "forgedarts")
table.insert(STARTING_ITEMS.WEBBER, "featheredtunic")

table.insert(STARTING_ITEMS.WINONA, "forginghammer")
table.insert(STARTING_ITEMS.WINONA, "forge_woodarmor")

table.insert(STARTING_ITEMS.WARLY, "forgedarts")
table.insert(STARTING_ITEMS.WARLY, "forge_woodarmor")

table.insert(STARTING_ITEMS.WORTOX, "livingstaff")
table.insert(STARTING_ITEMS.WORTOX, "reedtunic")

table.insert(STARTING_ITEMS.WORMWOOD, "livingstaff")
table.insert(STARTING_ITEMS.WORMWOOD, "reedtunic")

table.insert(STARTING_ITEMS.WURT, "forginghammer")
table.insert(STARTING_ITEMS.WURT, "forge_woodarmor")

table.insert(STARTING_ITEMS.WALTER, "forgedarts")
table.insert(STARTING_ITEMS.WALTER, "featheredtunic")

table.insert(STARTING_ITEMS.WANDA, "forgedarts")
table.insert(STARTING_ITEMS.WANDA, "reedtunic")

STARTING_ITEMS.WATHOM = { "forginghammer", "forge_woodarmor" }

table.insert(STARTING_ITEMS.WIXIE, "forgedarts")
table.insert(STARTING_ITEMS.WIXIE, "featheredtunic")


AddPrefabPostInit("dubloon", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(GLOBAL.COLLISION.WORLD)

    local ATTACHDIST = 2

    inst:DoPeriodicTask(30, function(inst)
        local x, y, z = inst.Transform:GetWorldPosition()
        local players = TheSim:FindEntities(x, y, z, 80, { "player" })
        inst.target = players[#players >= 2 and math.random(#players) or 1]
    end, math.random())

    local function OnUpdate(inst, dt)
        if inst.target and inst.target:IsValid() and inst.target.components.inventory ~= nil and inst.components.inventoryitem:GetGrandOwner() == nil and inst.target.components.inventory:CanAcceptCount(inst) > 0 then
            local dist = inst:GetDistanceSqToInst(inst.target)
            if dist < 100 * 100 then
                if dist < ATTACHDIST * ATTACHDIST then
                    inst.target.components.inventory:GiveItem(inst, nil, inst:GetPosition())
                else
                    local x, y, z = inst.target.Transform:GetWorldPosition()
                    local angle = inst:GetAngleToPoint(x, y, z) * GLOBAL.DEGREES
                    local dist = math.sqrt(dist)
                    local speed = math.max(GLOBAL.Remap(dist, 0, 10, 20, 1) * dt, 10 * dt)
                    if speed > 0 then
                        local offset = GLOBAL.Vector3((speed * math.cos(angle)) * 3, 0, (-speed * math.sin(angle)) * 3)
                        local x1, y1, z1 = inst.Transform:GetWorldPosition()
                        inst.Transform:SetPosition(x1 + offset.x, 0, z1 + offset.z)
                    end
                end
            end
        end
    end

    inst:AddComponent("updatelooper")
    inst.components.updatelooper:AddOnUpdateFn(OnUpdate)
end)


AddPrefabPostInit("cursed_monkey_token", function(inst)
    inst:Remove() --Fuck. You.
end)

local fastcharge = {
    ["forginghammer"] = -10,
    ["forgedarts"] = -0.75,
    ["pithpike"] = -20,
    ["moltendarts"] = -0.75,
    ["spiralspear"] = -0.5,
    ["blacksmith_edge"] = -10,
    ["hearthsfire_crystals"] = -10,
}

for prefab, mult in pairs(fastcharge) do
    AddPrefabPostInit(prefab, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        inst.components.rechargeable:SetChargeTimeMod(inst, "fastcharge", mult)
    end)
end

local fastproj = {
    ["moltendarts_projectile_explosive"] = 0.75,
    ["forgedarts_projectile_alt"] = 1.5,
    ["moltendarts_projectile"] = 1.25,
}

for prefab, mult in pairs(fastproj) do
    AddPrefabPostInit(prefab, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        if inst.components.projectile ~= nil then
            inst.components.projectile:SetSpeed(inst.components.projectile.speed * mult)
        elseif inst.components.aimedprojectile ~= nil then
            inst.components.aimedprojectile:SetSpeed(inst.components.aimedprojectile.speed * mult)
        end
    end)
end

local function FixPlanarDamage(inst)
    if not GLOBAL.TheWorld.ismastersim or not GLOBAL.TheWorld then return end

    if inst.components ~= nil and inst.components.planardamage ~= nil then
        if inst.components.weapon ~= nil then
            inst.components.weapon:SetDamage(inst.components.weapon.damage + (inst.components.planardamage.basedamage * 1.5))
        elseif inst.components.combat ~= nil then
            inst.components.combat:SetDefaultDamage(inst.components.combat.defaultdamage + (inst.components.planardamage.basedamage * 1.5))
        end
    end
end

AddPrefabPostInitAny(FixPlanarDamage)

AddPrefabPostInit("winky", function(inst)
    inst.starting_inventory = { "livingstaff", "featheredtunic" }
end)

AddPrefabPostInit("bomb_lunarplant", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    inst.components.complexprojectile.onhitfn = function(inst, attacker, target)
        local x, y, z = inst.Transform:GetWorldPosition()

        if inst.components.planardamage == nil then
            inst:AddComponent("planardamage")
            inst.components.planardamage:SetBaseDamage(TUNING.BOMB_LUNARPLANT_PLANAR_DAMAGE)
        end

        inst.SoundEmitter:KillSound("toss")

        inst:AddComponent("explosive")
        inst.components.explosive.explosiverange = TUNING.BOMB_LUNARPLANT_RANGE
        inst.components.explosive.explosivedamage = TUNING.BOMB_LUNARPLANT_PLANAR_DAMAGE * 1.5
        inst.components.explosive.lightonexplode = false
        if inst.ispvp then
            inst.components.explosive:SetPvpAttacker(attacker)
        else
            inst.components.explosive:SetAttacker(attacker)
        end
        inst.components.explosive:OnBurnt()
        --exploding should have removed me

        GLOBAL.SpawnPrefab("bomb_lunarplant_explode_fx").Transform:SetPosition(x, y, z)
    end
end)


AddPrefabPostInit("moltendarts_projectile", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    local _OnUpdate = inst.components.projectile.OnUpdate

    inst.components.projectile.OnUpdate = function(self, dt)
        if self.inst.prefab == "moltendarts_projectile" and self.inst.from_explosion then
            local target = GLOBAL.FindEntity(self.inst, 2, nil, { "_combat", "_health" }, { "INLIMBO", "invisible", "playerghost", "player", "companion", "abigail" })
            if target ~= nil and target:IsValid() and target.components.combat ~= nil and target.components.health ~= nil and not target.components.health:IsDead() then
                local weapon = self.owner.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
                self.owner.components.combat:DoAttack(target, weapon, self.inst)
                self.inst:Remove()
            end
        end
        return _OnUpdate(self, dt)
    end

    inst.components.projectile.homing = false

    inst:DoTaskInTime(math.random(), function(inst)
        inst.components.projectile.speed = inst.components.projectile.speed * 0.5
    end)
end)


AddPrefabPostInit("moltendarts_projectile_explosive", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    local __onhit = inst.components.aimedprojectile.onhit
    inst.components.aimedprojectile:SetHitDistance(12)

    inst.components.aimedprojectile.onhit = function(inst, owner, attacker, _target)
        for i = 1, math.random(8, 10) do
            local secondary_proj = GLOBAL.SpawnPrefab("moltendarts_projectile")
            secondary_proj.Transform:SetPosition(inst.Transform:GetWorldPosition())

            local theta = (secondary_proj:GetAngleToPoint(attacker:GetPosition().x, 0.5, attacker:GetPosition().z) + math.random(-45, 45)) * GLOBAL.DEGREES

            secondary_proj.components.projectile:Throw(secondary_proj, inst, attacker)
            local tpos = attacker:GetPosition()
            tpos.x = tpos.x + -90 * math.cos(theta)
            tpos.z = tpos.z - -90 * math.sin(theta)
            secondary_proj.from_explosion = true
            secondary_proj.components.projectile.owner = attacker
            secondary_proj.components.projectile.dest = tpos
            secondary_proj.components.projectile:RotateToTarget(tpos)
            secondary_proj.components.projectile.speed = secondary_proj.components.projectile.speed * GLOBAL.GetRandomWithVariance(1, 0.5)
        end

        __onhit(inst, owner, attacker, _target)
    end
end)

AddPrefabPostInit("blacksmith_edge", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    inst.components.parryweapon.max_angle = 180
    inst.components.parryweapon.duration = 60
end)

AddComponentPostInit("parryweapon", function(self)
    function self:TryParry(inst, e, f, g, h)
        if inst.sg then inst.sg:PushEvent("try_parry") end
        if self.ontryparry then return self.ontryparry(inst, e, f, g, h) end
        local attacker = e or g
        local angleaway = inst.Transform:GetRotation() - inst:GetAngleToPoint(attacker.Transform:GetWorldPosition())
        local angle = math.abs(angleaway + (angleaway > 180 and -360 or angleaway < -180 and 360 or 0))
        return angle <= self.max_angle
    end
end)

local refuel =
{
    ["waxwelljournal"] = 1,
    ["pocketwatch_weapon"] = 1,
}

for k, v in pairs(refuel) do
    AddPrefabPostInit(k, function(inst)
        if not GLOBAL.TheWorld.ismastersim then return end

        inst:DoPeriodicTask(v, function(inst)
            inst.components.fueled:DoDelta(TUNING.LARGE_FUEL * 0.025)
        end)
    end)
end

GLOBAL.TUNING.SHADOWWAXWELL_SANITY_PENALTY.SHADOWWORKER = 0
GLOBAL.TUNING.SHADOWWAXWELL_SANITY_PENALTY.SHADOWPROTECTOR = 0
