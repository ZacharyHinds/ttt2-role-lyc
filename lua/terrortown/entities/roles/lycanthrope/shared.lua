CreateConVar("ttt2_lyc_maxhealth", "150", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Unleashed Lycanthrope's max health")
CreateConVar("ttt2_lyc_armor", "30", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Unleashed Lycanthrope's armor")
CreateConVar("ttt2_lyc_health_regen", "2", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Lycanthrope's health regen")
CreateConVar("ttt2_lyc_regen_rate", "0.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Rate at which the Lycanthrope regens health")
CreateConVar("ttt2_lyc_health_delay", "5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Delay before the Lycanthrope begins to heal")
CreateConVar("ttt2_lyc_speed", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Lycanthrope's speed multiplier")
CreateConVar("ttt2_lyc_stamina", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Lycanthrope's stamina multiplier")
CreateConVar("ttt2_lyc_dmg", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Lycanthrope's damage multiplier")
CreateConVar("ttt2_lyc_know_role", "0", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Should Lycanthrope know their role?")

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

if CLIENT then
  function ROLE:AddToSettingsMenu(parent)
    local form = vgui.CreateTTT2Form(parent, "header_roles_additional")

    form:MakeCheckBox({
      serverConvar = "ttt2_lyc_know_role",
      label = "label_ttt2_lyc_know_role"
    })

    form:MakeSlider({
      serverConvar = "ttt2_lyc_maxhealth",
      label = "label_ttt2_lyc_maxhealth",
      min = 100,
      max = 300,
      decimal = 0
    })

    form:MakeSlider({
      serverConvar = "ttt2_lyc_armor",
      label = "label_ttt2_lyc_armor",
      min = 0,
      max = 100,
      decimal = 0
    })

    form:MakeSlider({
      serverConvar = "ttt2_lyc_health_regen",
      label = "label_ttt2_lyc_health_regen",
      min = 0,
      max = 25,
      decimal = 0
    })

    form:MakeSlider({
      serverConvar = "ttt2_lyc_regen_rate",
      label = "label_ttt2_lyc_regen_rate",
      min = 0,
      max = 5,
      decimal = 0
    })

    form:MakeSlider({
      serverConvar = "ttt2_lyc_health_delay",
      label = "label_ttt2_lyc_health_delay",
      min = 0,
      max = 60,
      decimal = 0
    })

    form:MakeSlider({
      serverConvar = "ttt2_lyc_speed",
      label = "label_ttt2_lyc_speed",
      min = 1,
      max = 5,
      decimal = 1
    })

    form:MakeSlider({
      serverConvar = "ttt2_lyc_stamina",
      label = "label_ttt2_lyc_stamina",
      min = 0,
      max = 5,
      decimal = 1
    })

    form:MakeSlider({
      serverConvar = "ttt2_lyc_dmg",
      label = "label_ttt2_lyc_dmg",
      min = 0,
      max = 5,
      decimal = 1
    })
  end
end
