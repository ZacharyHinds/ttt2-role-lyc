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
L["title_event_lyc_awaken"] = "Lycanthrope Awoke"
L["desc_event_lyc_awaken"] = "{player} transformed into the Lycanthrope!"
L["tooltip_lyc_awaken_score"] = "Lycanthrope Awaken: {score}"
L["lyc_awaken_score"] = "Lycanthrope Awakens:"