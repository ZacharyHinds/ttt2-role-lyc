if SERVER then
  AddCSLuaFile()
  resource.AddFile()
  util.AddNetworkString("ttt2_lyc_transform")
end

function ROLE:PreInitialize()
  self.color = Color()

  self.abbr = "lyc"
  self.surviveBonus = 0
  self.scoreKillsMultiplier = 1
  self.scoreTeamKillsMultiplier = -8

  self.unknownTeam = TEAM_INNOCENT
  self.defaultEquipment = INNO_EQUIPMENT

  self.conVarData = {
    pct = 0.15,
    maximum = 1,
    minPlayers = 6,
    togglable = true,
    random = 20
  }
end

function ROLE:Initialize()
  roles.SetBaseRole(self, ROLE_INNOCENT)
end

if SERVER then
  local function ResetLycanthrope(ply)
    ply:SetNWBool("LycTransformed", false)
    timer.Remove("LycHealthRegen" .. ply:SteamID())
  end

  local function ResetAllLycanthropes()
    for _, ply in ipairs(player.GetAll()) do
      ResetLycanthrope(ply)
    end
  end

  local function HasTeammates(ply)
    if not ply:Alive() or ply:IsSpec() then return false end

    local count = 0
    for _, pl in ipairs(player.GetAll()) do
      if pl == ply then continue end

      if pl:HasTeam(ply:GetTeam()) and pl:Alive() and not ply:IsSpec() then
        count = count + 1
      end
    end

    return (count > 0)
  end

  local function UnleashLycanthrope(ply))
    if HasTeammates(ply) then return end
    ply:SetNWBool("LycTransformed")
    ply:SetMaxHealth(GetConVar("ttt2_lyc_maxhealth"):GetInt())
    ply:GiveArmor(GetConVar("ttt2_lyc_armor"):GetInt())

    timer.Create("LycTransformed" .. ply:SteamID(), 0.5, 0, function()
      local new_health = ply:Health() + GetConVar("ttt2_lyc_health_regen")
      if new_health > ply:GetMaxHealth() then new_health = ply:GetMaxHealth() end

      ply:SetHealth(new_health)
    end)

    net.Start("ttt2_lyc_transform")
    net.Broadcast()
  end

  hook.Add("TTT2PostPlayerDeath", "OnLycTeamDeath", function(victim, _, attacker)
    for _, ply in ipairs(player.GetAll()) do
      if ply:GetSubRole() ~= ROLE_LYCANTHROPE  or not ply:Alive() or ply:IsSpec() then continue end
      if victim:HasTeam(ply:GetTeam()) then
        UnleashLycanthrope(ply)
      end
    end
  end)

  hook.Add("PlayerSpawn", "LycSpawned", function(ply)
    if not IsValid(ply) or not ply:Alive() or ply:IsSpec() then return end

    if ply:GetSubRole() == ROLE_LYCANTHROPE then
      UnleashLycanthrope(ply)
    end
  end)

  hook.Add("PlayerDisconnected", "LycDisconnectTeam", function(ply)
    for _, pl in ipairs(player.GetAll()) do
      if pl:GetSubRole ~= ROLE_LYCANTHROPE or not pl:Alive() or pl:IsSpec() then continue end
      if pl:HasTeam(ply:GetTeam()) then
        UnleashLycanthrope(pl)
      end
    end
  end)

  hook.Add("TTT2SpecialRoleSyncing", "TTT2RoleLycHide", function(ply, tbl)
    if GetConVar("ttt2_lyc_know_role"):GetBool() then return end

    for lyc in pairs(tbl) do
      if lyc:GetSubRole() == ROLE_LYCANTHROPE and not lyc:GetNWBool("LycTransformed") then
        tbl[lyc] = {ROLE_INNOCENT, TEAM_INNOCENT}
      end
    end
  end)

  hook.Add("TTTPlayerSpeedModifier", "LycSpeedBoost", function(ply, _, _, speed_mod)
    if not IsValid(ply) or not ply:Alive() or ply:IsSpec() then return end
    if ply:GetSubRole() ~= ROLE_LYCANTHROPE or not ply:GetNWBool("LycTransformed") then return end

    speed_mod[1] = speed_mod[1] * GetConVar("ttt2_lyc_speed"):GetFloat()
  end)

  hook.Add("TTT2StaminaRegen", "LycStaminaRegen", function(ply, stamina_mod)
    if not IsValid(ply) or not ply:Alive() or ply:IsSpec() then return end
    if ply:GetSubRole() ~= ROLE_LYCANTHROPE or not ply:GetNWBool("LycTransformed") then return end

    stamina_mod[1] = stamina_mod[1] * GetConVar("ttt2_lyc_stamina"):GetFloat()
  end)

  hook.Add("TTTonCorpseCreated", "ModifyLycRag", function(rag, ply)
    if not IsValid(ply) or not IsValid(rag) or ply:GetSubRole() ~= ROLE_LYCANTHROPE or ply:GetNWBool("LycTransformed") then return end

    rag.was_role = ROLE_INNOCENT
    rag.role_color = INNOCENT.ltcolor
  end)

  hook.Add("TTTEndRound", "ResetLycanthrope", ResetAllLycanthropes)
  hook.Add("TTTPrepareRound", "ResetLycanthrope", ResetAllLycanthropes)
  hook.Add("TTTBeginRound", "ResetLycanthrope", ResetAllLycanthropes)

end
