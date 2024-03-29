L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[LYCANTHROPE.name] = "Lycanthrope"
L["info_popup_" .. LYCANTHROPE.name] = [[You are a Lycanthrope! Work with the innocents to win!]]
L["body_found_" .. LYCANTHROPE.abbr] = "They were a Lycanthrope!"
L["search_role_" .. LYCANTHROPE.abbr] = "This person was a Lycanthrope!"
L["target_" .. LYCANTHROPE.name] = "Lycanthrope"
L["ttt2_desc_" .. LYCANTHROPE.name] = [[The Lycanthrope is an innocent role and works with the innocents to win.
If they are the last one standing, they become faster and stronger!]]

-- EPOP LANGUAGE STRINGS

L["ttt2_lyc_transform_title"] = "The Full Moon Rises!"
L["ttt2_lyc_transform_body"] = "The Lycanthrope has been unleashed!"
L["ttt2_lyc_self_transform_body"] = "You are the Lycanthrope! Your powers have been unleashed!"
L["ttt2_lyc_multi"] = "Damage x{multi}"


-- EVENT STRINGS
L["title_event_lyc_awaken"] = "The Lycanthrope Awakened"
L["desc_event_lyc_awaken"] = "{player} transformed into the Lycanthrope!"
L["tooltip_lyc_awaken_score"] = "Became Lycanthrope: {score}"
L["lyc_awaken_score"] = "Became Lycanthrope:"

--SETTINGS STRINGS
L["label_ttt2_lyc_know_role"] = "Know they are Lycanthrope"
L["label_ttt2_lyc_maxhealth"] = "Max health"
L["label_ttt2_lyc_armor"] = "Armor"
L["label_ttt2_lyc_health_regen"] = "Health regen value"
L["label_ttt2_lyc_regen_rate"] = "Health regen rate"
L["label_ttt2_lyc_health_delay"] = "Delay before healing after taking damage"
L["label_ttt2_lyc_speed"] = "Speed Multiplier"
L["label_ttt2_lyc_stamina"] = "Stamina Multiplier"
L["label_ttt2_lyc_dmg"] = "Damage Multiplier"
