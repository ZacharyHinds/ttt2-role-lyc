if SERVER then
  AddCSLuaFile()
  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_lyc.vmt")
  
end


function ROLE:PreInitialize()
  self.color = Color(77, 138, 30, 255)

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
