L = LANG.GetLanguageTableReference("zh_hans")

-- GENERAL ROLE LANGUAGE STRINGS
L[LYCANTHROPE.name] = "狼人"
L["info_popup_" .. LYCANTHROPE.name] = [[你是个狼人!与无辜者合作,赢得胜利!]]
L["body_found_" .. LYCANTHROPE.abbr] = "他们是狼人!"
L["search_role_" .. LYCANTHROPE.abbr] = "这个人是狼人!"
L["target_" .. LYCANTHROPE.name] = "狼人"
L["ttt2_desc_" .. LYCANTHROPE.name] = [[狼人是一个无辜的角色,与无辜者合作以赢得胜利。
如果他们是最后一个站着的,他们会变得更快更强壮!]]

-- EPOP LANGUAGE STRINGS

L["ttt2_lyc_transform_title"] = "满月升起!"
L["ttt2_lyc_transform_body"] = "狼人已经被释放了!"
L["ttt2_lyc_self_transform_body"] = "你是狼人!你的力量已经释放了!"
L["ttt2_lyc_multi"] = "伤害 x{multi}"


-- EVENT STRINGS
L["title_event_lyc_awaken"] = "狼人醒了"
L["desc_event_lyc_awaken"] = "{player} 转化为狼人!"
L["tooltip_lyc_awaken_score"] = "变成狼人: {score}"
L["lyc_awaken_score"] = "变成狼人:"

--SETTINGS STRINGS
L["label_ttt2_lyc_know_role"] = "知道他们是狼人"
L["label_ttt2_lyc_maxhealth"] = "最大生命值"
L["label_ttt2_lyc_armor"] = "护甲"
L["label_ttt2_lyc_health_regen"] = "生命值再生值"
L["label_ttt2_lyc_regen_rate"] = "健康再生率"
L["label_ttt2_lyc_health_delay"] = "受到伤害后治疗前的延迟"
L["label_ttt2_lyc_speed"] = "速度倍增器"
L["label_ttt2_lyc_stamina"] = "耐力倍增器"
L["label_ttt2_lyc_dmg"] = "伤害乘数"
