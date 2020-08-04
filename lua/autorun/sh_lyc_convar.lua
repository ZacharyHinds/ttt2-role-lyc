CreateConVar("ttt2_lyc_maxhealth", "150", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Unleashed Lycanthrope's max health")
CreateConVar("ttt2_lyc_armor", "30", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Unleashed Lycanthrope's armor")
CreateConVar("ttt2_lyc_health_regen", "2", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Lycanthrope's health regen")
CreateConVar("ttt2_lyc_regen_rate", "0.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Rate at which the Lycanthrope regens health")
CreateConVar("ttt2_lyc_health_delay", "5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Delay before the Lycanthrope begins to heal")
CreateConVar("ttt2_lyc_speed", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Lycanthrope's speed multiplier")
CreateConVar("ttt2_lyc_stamina", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Lycanthrope's stamina multiplier")
CreateConVar("ttt2_lyc_dmg", "1.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Lycanthrope's damage multiplier")
CreateConVar("ttt2_lyc_know_role", "0", {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Should Lycanthrope know their role?")

if CLIENT then
  hook.Add("TTT2FinishedLoading", "mes_devicon", function() -- addon developer emblem for me ^_^
    AddTTT2AddonDev("76561198049910438")
  end)
end

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_lyc_convars", function(tbl)
  tbl[ROLE_LYCANTHROPE] = tbl[ROLE_LYCANTHROPE] or {}

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_know_role",
    checkbox = true,
    desc = "ttt2_lyc_know_role (def. 0)"
  })

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_maxhealth",
    slider = true,
    min = 100,
    max = 300,
    desc = "ttt2_lyc_maxhealth (def. 150)"
  })

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_armor",
    slider = true,
    min = 0,
    max = 100,
    desc = "ttt2_lyc_armor (def. 30)"
  })

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_health_regen",
    slider = true,
    min = 0,
    max = 25,
    desc = "ttt2_lyc_health_regen (def. 2)"
  })

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_regen_rate",
    slider = true,
    min = 0,
    max = 5,
    decimal = 1,
    desc = "ttt2_lyc_regen_rate (def. 0.5)"
  })

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_health_delay",
    slider = true,
    min = 0,
    max = 60,
    desc = "ttt2_lyc_health_delay (def. 5)"
  })

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_speed",
    slider = true,
    min = 1,
    max = 5,
    desc = "ttt2_lyc_speed (def. 1.5)"
  })

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_stamina",
    slider = true,
    min = 0,
    max = 5,
    decimal = 1,
    desc = "ttt2_lyc_stamina (def. 1.5)"
  })

  table.insert(tbl[ROLE_LYCANTHROPE], {
    cvar = "ttt2_lyc_dmg",
    slider = true,
    min = 0,
    max = 5,
    decimal = 1,
    desc = "ttt2_lyc_dmg (def. 1.5)"
  })
end)
