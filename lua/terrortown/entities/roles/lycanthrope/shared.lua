if SERVER then
  AddCSLuaFile()
  resource.AddFile()
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
  local function ResetLycanthrope()
    for _, ply in ipairs(player.GetAll()) do
      ply:SetNWBool("LycTransformed", false)
    end
  end

  local function CheckForOtherTeammates(ply)
    if not ply:Alive() or ply:IsSpec() then return false end

    local count = 0
    for _, pl in ipairs(player.GetAll()) do
      if pl == ply then continue end

      if pl:HasTeam(ply:GetTeam()) and pl:Alive() then
        count = count + 1
      end
    end

    return (count > 0)
  end

  hook.Add("TTT2PostPlayerDeath", "OnLycDeath", function(victim, _, attacker)
    if victim:HasTeam(TEAM_INNOCENT) then
  end)

  hook.Add("TTT2SpecialRoleSyncing", "TTT2RoleLycHide", function(ply, tbl)
    if GetConVar("ttt2_lyc_know_role"):GetBool() then return end

    for lyc in pairs(tbl) do
      if lyc:GetSubRole() == ROLE_LYCANTHROPE and not lyc:GetNWBool("LycTransformed") then
        tbl[lyc] = {ROLE_INNOCENT, TEAM_INNOCENT}
      end
    end
  end)

  hook.Add("TTTonCorpseCreated", "ModifyLycRag", function(rag, ply)
    if not IsValid(ply) or not IsValid(rag) or ply:GetSubRole() ~= ROLE_LYCANTHROPE or ply:GetNWBool("LycTransformed") then return end

    rag.was_role = ROLE_INNOCENT
    rag.role_color = INNOCENT.ltcolor
  end)

  hook.Add("TTTEndRound", "ResetLycanthrope", ResetLycanthrope)
  hook.Add("TTTPrepareRound", "ResetLycanthrope", ResetLycanthrope)
  hook.Add("TTTBeginRound", "ResetLycanthrope", ResetLycanthrope)

end
