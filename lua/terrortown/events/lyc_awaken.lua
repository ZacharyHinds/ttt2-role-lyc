if CLIENT then
    EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_lyc.vmt")
    EVENT.title = "title_event_lyc_awaken"
    -- EVENT.description = "desc_event_lyc_awaken"

    function EVENT:GetText()
        return {
            {
                string = "desc_event_lyc_awaken",
                params = {
                    player = self.event.lyc.nick,
                },
                translateParams = false
            }
        }
    end
end

if SERVER then
    function EVENT:Trigger(lyc)
        self:AddAffectedPlayers(
            {lyc:SteamID64()},
            {lyc:Nick()}
        )

        return self:Add({
            lyc = {
                nick = lyc:Nick(),
                sid64 = lyc:SteamID64()
            }
        })
    end

    function EVENT:CalculateScore()
        self:SetPlayerScore(self.event.lyc.sid64, {
            score = 1
        })
    end
end