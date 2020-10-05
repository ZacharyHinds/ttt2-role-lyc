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
