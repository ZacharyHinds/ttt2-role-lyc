net.Receive("ttt2_lyc_transform", function()
  local client = LocalPlayer()
  if client:GetSubRole() ~= ROLE_LYCANTHROPE then
    EPOP:AddMessage(
      {text = LANG.TryTranslation("ttt2_lyc_transform_title"),
        color = LYCANTHROPE.ltcolor},
      LANG.TryTranslation("ttt2_lyc_transform_body"),
      6
    )
  elseif client:Alive() then
    EPOP:AddMessage(
      {text = LANG.TryTranslation("ttt2_lyc_transform_title"),
        color = LYCANTHROPE.ltcolor},
      LANG.TryTranslation("ttt2_lyc_self_transform_body"),
      6
    )
  end
end)


hook.Add("TTTRenderEntityInfo", "ttt2_lyc_multiplier", function(tData)
  if not LYCANTHROPE then return end

  local ent = tData:GetEntity()

  if not ent:IsPlayer() then return end

  local client = LocalPlayer()

  if client:GetSubRole() ~= ROLE_LYCANTHROPE then return end

  local multiplier = math.Round(GetConVar("ttt2_lyc_dmg"):GetFloat(), 1)

  if not (multiplier > 1) then return end

  if tData:GetAmountDescriptionLines() > 0 then
    tData:AddDescriptionLine()
  end

  tData:AddDescriptionLine(
    LANG.GetParamTranslation("ttt2_lyc_multi", {multi = multiplier}),
    LYCANTHROPE.ltcolor
  )
end)
