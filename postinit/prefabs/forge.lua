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
    if not GLOBAL.TheWorld.ismastersim then return end

    if inst.components ~= nil and inst.components.planardamage ~= nil then
        if inst.components.weapon ~= nil then
            inst.components.weapon:SetDamage(inst.components.weapon.damage + (inst.components.planardamage:GetDamage() * 1.5))
        end
        if inst.components.combat ~= nil then
            inst.components.combat:SetDefaultDamage(inst.components.combat.defaultdamage + (inst.components.planardamage:GetDamage() * 1.5))
        end
    end
end

AddPrefabPostInitAny(FixPlanarDamage)

AddPrefabPostInit("winky", function(inst)
    inst.starting_inventory = { "forgedarts", "featheredtunic" }
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


local weaponsparks = {
    "weaponsparks",
    "weaponsparks_bounce",
    "weaponsparks_piercing",
    "weaponsparks_thrusting",
    "weaponsparks_fx",
    "spear_gungnir_lungefx",
    "forge_fireball_hit_fx",
    "superjump_fx",
}

local function onupdate_intensity(inst, dt)
    inst.Light:SetIntensity(inst.i)
    inst.i = inst.i - dt * 2
    if inst.i <= 0 then
        if inst.killfx then
            inst:Remove()
        else
            inst.task:Cancel()
            inst.task = nil
        end
    end
end

local function onupdate_radius(inst, dt)
    inst.Light:SetRadius(inst.r)
    inst.r = inst.r - dt * 2
    if inst.r <= 0 then
        if inst.killfx then
            inst:Remove()
        else
            inst.taskr:Cancel()
            inst.taskr = nil
        end
    end
end


for k, v in ipairs(weaponsparks) do
    AddPrefabPostInit(v, function(inst)
        inst.entity:AddLight()
        inst.Light:SetIntensity(.6)
        inst.Light:SetRadius(2)
        inst.Light:SetFalloff(2)
        inst.Light:SetColour(1, 1, 0)

        inst.hue = 0

        local dti = 0.025
        local dtr = 0.025
        inst.i = .9
        inst.r = 2

        inst.sound = inst.SoundEmitter ~= nil
        inst.task = inst:DoPeriodicTask((inst.AnimState:GetCurrentAnimationNumFrames() * GLOBAL.FRAMES) / 12, onupdate_intensity, nil, dti) --takes 12 onupdates for the fx intensity to be 0, I think.
        inst.taskr = inst:DoPeriodicTask((inst.AnimState:GetCurrentAnimationNumFrames() * GLOBAL.FRAMES) / 40, onupdate_radius, nil, dtr)   --takes 80 onupdates for the fx radius to be 0, I think.
    end)
end

local flicker = {
    "forgedarts_projectile_alt",
    "forgedarts_projectile",
    "moltendarts_projectile_explosive",
    "moltendarts_projectile",
    "forge_fireball_projectile",
    "forge_fireball_projectile_fast"
}



for k, v in ipairs(flicker) do
    AddPrefabPostInit(v, function(inst)
        inst.entity:AddLight()
        inst.Light:SetFalloff(3)
        inst.Light:SetColour(1, 1, 0)

        if not string.find(v, "moltendarts") then
            inst.Light:SetIntensity(0)
            inst.Light:SetRadius(0)
            inst.base_intensity = .6
            inst.base_rad = 1
        else
            inst.Light:SetIntensity(0)
            inst.Light:SetRadius(0)
            inst.base_intensity = .6
            inst.base_rad = v == "moltendarts_projectile_explosive" and 3 or 1.25
        end

        inst.task = inst:DoPeriodicTask(GLOBAL.FRAMES, function(inst)
            local curr_i, curr_r = inst.Light:GetIntensity(), inst.Light:GetRadius()
            if curr_i < inst.base_intensity then
                inst.Light:SetIntensity(curr_i + inst.base_intensity / 5)
            end
            if curr_r < inst.base_rad then
                inst.Light:SetRadius(curr_r + inst.base_rad / 5)
            end

            if curr_r > inst.base_rad and curr_i > inst.base_intensity then
                inst.task = inst:DoPeriodicTask(GLOBAL.FRAMES, function(inst)
                    inst.Light:SetIntensity(GLOBAL.GetRandomWithVariance(inst.base_intensity, inst.base_intensity * 0.9))
                    inst.Light:SetRadius(GLOBAL.GetRandomWithVariance(inst.base_rad, inst.base_intensity * 0.9))
                end)
            end
        end)
    end)
end

AddComponentPostInit("multithruster", function(self)
    function self:DoThrust(owner, target) --target? idk the original code is minified
        local mult = owner.components.combat.damagemultiplier ~= nil and owner.components.combat.damagemultiplier * 1.25 or 1.25
        owner.components.combat:DoAttack(target, nil, nil, "strong", mult)
    end
end)

AddComponentPostInit("helmsplitter", function(self)
    function self:DoHelmSplit(owner, h)
        if owner.sg then owner.sg:PushEvent("do_helmsplit") end
        local i = owner.components.combat.damagemultiplier ~= nil and owner.components.combat.damagemultiplier * 5 or 5
        owner.components.combat:DoSpecialAttack(self.damage, h, "strong", i)
        if self.onhelmsplit then self.onhelmsplit(self.inst, owner, h) end
    end
end)

AddPrefabPostInit("blacksmith_edge", function(inst)
    inst:AddTag("helmsplitter")

    if not GLOBAL.TheWorld.ismastersim then return end

    inst.hits       = 0
    local _onattack = inst.components.weapon.onattack

    local function OnAttack(inst, attacker, target)
        if _onattack ~= nil then
            _onattack(inst, attacker, target)
        end
        inst.hits = inst.hits + 1


        if inst.hits > 3 then
            inst:AddTag("helmsplitter")
            inst.hits = 0
        else
            inst:RemoveTag("helmsplitter") --just a failsafe.
        end
    end
    inst.components.weapon:SetOnAttack(OnAttack)
end)

AddPrefabPostInit("spiralspear", function(inst)
    inst:AddTag("multithruster")

    if not GLOBAL.TheWorld.ismastersim then return end

    inst.hits       = 0

    local _onattack = inst.components.weapon.onattack

    local function OnAttack(inst, attacker, target)
        if _onattack ~= nil then
            _onattack(inst, attacker, target)
        end
        inst.hits = inst.hits + 1


        if inst.hits > 3 then
            inst:AddTag("multithruster")
            inst.hits = 0
        else
            inst:RemoveTag("multithruster") --just a failsafe
        end
    end
    inst.components.weapon:SetOnAttack(OnAttack)
end)


