
script setup_globaltags 
	globaltag_checksum = initial_v43
	setup_songtags globaltag_checksum = <globaltag_checksum>
	setup_venuetags globaltag_checksum = <globaltag_checksum>
	setup_unlocks globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_career}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p2_career}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p2_faceoff}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay bonus}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	get_progression_globals \{game_mode = p1_quickplay download}
	setup_setlisttags SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum>
	setup_bandtags globaltag_checksum = <globaltag_checksum>
	setup_user_option_tags globaltag_checksum = <globaltag_checksum>
	setup_training_tags globaltag_checksum = <globaltag_checksum>
	setup_store_tags globaltag_checksum = <globaltag_checksum>
	setup_characterguitar_tags globaltag_checksum = <globaltag_checksum>
	setup_online_tags globaltag_checksum = <globaltag_checksum>
	setup_character_tags globaltag_checksum = <globaltag_checksum>
	setup_achievement_tags globaltag_checksum = <globaltag_checksum>
	SetGlobalTags globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
endscript
default_topscores_easy = {
	score1 = 19737
	score2 = 18164
	score3 = 17809
	score4 = 15500
	score5 = 15434
}
default_topscores_medium = {
	score1 = 46322
	score2 = 41217
	score3 = 39989
	score4 = 32984
	score5 = 20107
}
default_topscores_hard = {
	score1 = 54046
	score2 = 49787
	score3 = 41256
	score4 = 38002
	score5 = 27015
}
default_topscores_expert = {
	score1 = 64289
	score2 = 61986
	score3 = 55423
	score4 = 51425
	score5 = 29001
}
default_songtagswithdifficulty = {
	name1 = "D. Stowater"
	name2 = "Ginkel"
	name3 = "Bunny"
	name4 = "BMarvs"
	name5 = "CVance"
	stars1 = 0
	stars2 = 0
	stars3 = 0
	stars4 = 0
	stars5 = 0
	bestscore = 0
	beststars = 0
	achievement_gold_star = 0
	failedtimes = 0
	percent100 = 0
}

script setup_character_tags 
	SetGlobalTags ($Secret_Characters [0].id) params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [0].id))
	SetGlobalTags ($Secret_Characters [1].id) params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [1].id))
	SetGlobalTags ($Secret_Characters [2].id) params = {unlocked_for_purchase = 0}
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [2].id))
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songtags = {
	available_on_other_client = 0
	beaten_coop_as_lead = 0
	beaten_coop_as_rhythm = 0
}

script setup_songtags 
	GetArraySize \{$difficulty_list}
	num_difficulty = <array_size>
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	FormatText checksumname = default_topscores 'default_topscores_%d' d = <difficulty_text_nl>
	get_songlist_size
	song_array_size = <array_size>
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	get_song_prefix song = <song_checksum>
	FormatText checksumname = songname '%s_%d' s = (<song_prefix>) d = <difficulty_text_nl> addtostringlookup = TRUE
	if GotParam \{globaltag_checksum}
		globaltag_checksum = (<globaltag_checksum> + <songname>)
	endif
	get_song_struct song = <song_checksum>
	if (<song_struct>.version = gh3)
		if NOT GetGlobalTags <songname> noassert = 1
			get_song_title song = <song_checksum>
			SetGlobalTags <songname> params = {($default_songtagswithdifficulty) (<default_topscores>)}
		endif
		if NOT GetGlobalTags <song_checksum> noassert = 1
			SetGlobalTags <song_checksum> params = {($default_songtags)}
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <song_array_size>
	<array_count> = (<array_count> + 1)
	repeat <num_difficulty>
	song_count = 0
	GetArraySize ($GH3_Bonus_Songs.tier1.songs)
	begin
	unlocked = -1
	GetGlobalTags ($GH3_Bonus_Songs.tier1.songs [<song_count>])
	if (<unlocked> = -1)
		SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [<song_count>]) params = {unlocked = 0}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	if GotParam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript
default_venuetags = {
	unlocked = 0
}
cheat_venuetags = {
	unlocked = 1
}

script setup_venuetags 
	if GotParam \{cheat}
		venue_tags = $cheat_venuetags
	else
		venue_tags = $default_venuetags
	endif
	setup_generalvenuetags
	band_count = 0
	begin
	GetArraySize \{$levelzonearray}
	level_zone_array_size = <array_size>
	index = 0
	begin
	GetArraySize \{$difficulty_list}
	diff_array_size = <array_size>
	diff_index = 0
	begin
	player = 1
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<diff_index>])
	get_LevelZoneArray_checksum index = <index>
	FormatText checksumname = final_checksum 'p%p_career_band%i_%d%s' i = (<band_count> + 1) p = <player> d = <difficulty_text_nl> s = ($LevelZones.<level_checksum>.name) addtostringlookup = TRUE
	SetGlobalTags <final_checksum> params = {(<venue_tags>)}
	if (<player> = 1)
		get_progression_globals \{game_mode = p1_career}
	else
		get_progression_globals \{game_mode = p2_career}
	endif
	tier_level = ($<tier_global>.tier1.level)
	tier_name = ($LevelZones.<tier_level>.name)
	FormatText checksumname = final_checksum 'p%p_career_band%i_%d%s' i = (<band_count> + 1) p = <player> d = <difficulty_text_nl> s = <tier_name> addtostringlookup = TRUE
	SetGlobalTags <final_checksum> params = {unlocked = 1}
	FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<tier_level>.name)
	SetGlobalTags <venue_checksum> params = {unlocked = 1}
	if StructureContains structure = ($<tier_global>.tier1) unlocked_levels
		GetArraySize ($<tier_global>.tier1.unlocked_levels)
		array_count = 0
		begin
		level_checksum = ($<tier_global>.tier1.unlocked_levels [<array_count>])
		FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.name)
		SetGlobalTags <venue_checksum> params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
	endif
	if GotParam \{globaltag_checksum}
		<globaltag_checksum> = (<globaltag_checksum> + <final_checksum>)
	endif
	<player> = (<player> + 1)
	repeat 2
	<diff_index> = (<diff_index> + 1)
	repeat <diff_array_size>
	<index> = (<index> + 1)
	repeat (<level_zone_array_size> - 1)
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands)
	if GotParam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript

script setup_generalvenuetags 
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.name) addtostringlookup = TRUE
	if NOT GetGlobalTags <venue_checksum> noassert = 1
		SetGlobalTags <venue_checksum> params = {($default_venuetags)}
	endif
	if Is_LevelZone_Downloaded level_checksum = <level_checksum>
		if (<download> = 1)
			SetGlobalTags <venue_checksum> params = {unlocked = 1}
		endif
	else
		SetGlobalTags <venue_checksum> params = {unlocked = 0}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript
default_guitartags = {
	unlocked = 0
	unlocked_on_other_client = 0
	available_on_other_client = 0
}
default_charactertags = {
	unlocked = 0
	unlocked_on_other_client = 0
	available_on_other_client = 0
}

script setup_unlocks 
	GetArraySize \{$Secret_Guitars}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Guitars [<array_count>].id) noassert = 1
		SetGlobalTags ($Secret_Guitars [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Guitars [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	GetArraySize \{$Bonus_Guitars}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Guitars [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Guitars [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Guitars [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	GetArraySize \{$Bonus_Guitar_Finishes}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Guitar_Finishes [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	GetArraySize \{$Secret_Basses}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Basses [<array_count>].id) noassert = 1
		SetGlobalTags ($Secret_Basses [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Basses [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	GetArraySize \{$Bonus_Basses}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Basses [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Basses [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Basses [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	GetArraySize \{$Bonus_Bass_Finishes}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Bass_Finishes [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Bass_Finishes [<array_count>].id) params = {($default_guitartags) unlocked_for_purchase = 1}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Bass_Finishes [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	GetArraySize \{$Secret_Characters}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Secret_Characters [<array_count>].id) noassert = 1
		SetGlobalTags ($Secret_Characters [<array_count>].id) params = {($default_charactertags)}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Secret_Characters [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	GetArraySize \{$Bonus_Outfits}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Outfits [<array_count>].id) noassert = 1
		SetGlobalTags ($Bonus_Outfits [<array_count>].id) params = {unlocked = 0}
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Outfits [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	GetArraySize \{$Bonus_Styles}
	array_count = 0
	begin
	if NOT GetGlobalTags ($Bonus_Styles [<array_count>].id) noassert = 1
		mod a = <array_count> b = 6
		if (<mod> = 0)
			SetGlobalTags ($Bonus_Styles [<array_count>].id) params = {unlocked = 1}
		else
			SetGlobalTags ($Bonus_Styles [<array_count>].id) params = {unlocked = 0}
		endif
	endif
	globaltag_checksum = (<globaltag_checksum> + ($Bonus_Styles [<array_count>].id))
	array_count = (<array_count> + 1)
	repeat <array_size>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songsetlisttags = {
	stars = 0
	Score = 0
	percent100 = 0
	unlocked = 0
}

script setup_setlisttags \{globaltag_checksum = None force = 0}
	setup_tiertags SetList_Songs = <SetList_Songs>
	array_count = 0
	begin
	FormatText checksumname = tier 'tier%s' s = (<array_count> + 1)
	GetArraySize ($<SetList_Songs>.<tier>.songs)
	if (<array_size> > 0)
		song_count = 0
		begin
		song = ($<SetList_Songs>.<tier>.songs [<song_count>])
		setlist_prefix = ($<SetList_Songs>.prefix)
		SetGlobalTags <song> params = {unlocked = 0}
		FormatText textname = song_checksum_suffix '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1)
		extendcrc out = song_checksum <song> <song_checksum_suffix>
		globaltag_checksum = (<globaltag_checksum> + <song_checksum>)
		FormatText checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) addtostringlookup = TRUE
		if NOT GetGlobalTags <song_checksum> noassert = 1
			SetGlobalTags <song_checksum> params = {($default_songsetlisttags)}
			elseif (<force> = 1)
			SetGlobalTags <song_checksum> params = {($default_songsetlisttags)}
		endif
		if StructureContains structure = ($<SetList_Songs>.<tier>) defaultunlocked
			if (<song_count> < $<SetList_Songs>.<tier>.defaultunlocked)
				SetGlobalTags <song_checksum> params = {unlocked = 1}
			endif
			elseif StructureContains structure = ($<SetList_Songs>.<tier>) unlockall
			song = ($<SetList_Songs>.<tier>.songs [<song_count>])
			if is_song_downloaded song_checksum = <song>
				SetGlobalTags <song_checksum> params = {unlocked = 1}
			else
				SetGlobalTags <song_checksum> params = {unlocked = 0}
			endif
		endif
		song_count = (<song_count> + 1)
		repeat <array_size>
	endif
	array_count = (<array_count> + 1)
	repeat ($<SetList_Songs>.num_tiers)
	return globaltag_checksum = <globaltag_checksum>
endscript
default_tiertags = {
	unlocked = 0
	complete = 0
	encore_unlocked = 0
	boss_unlocked = 0
	num_songs_to_progress = 4
}

script setup_tiertags 
	num_tiers = ($<SetList_Songs>.num_tiers)
	array_count = 0
	begin
	setlist_prefix = ($<SetList_Songs>.prefix)
	FormatText checksumname = tier 'tier%s' s = (<array_count> + 1)
	FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1) addtostringlookup = TRUE
	if NOT GetGlobalTags <tiername> noassert = 1
		SetGlobalTags <tiername> params = {($default_tiertags)}
	endif
	if StructureContains structure = ($<SetList_Songs>.<tier>) defaultunlocked
		SetGlobalTags <tiername> params = {unlocked = 1}
	endif
	if StructureContains structure = ($<SetList_Songs>.<tier>) unlockall
		SetGlobalTags <tiername> params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <num_tiers>
endscript
default_bandtags = {
	cash = 0
	name = ""
	first_play = 1
	first_battle_play = 1
	first_venue_movie_played = 0
	band_unique_id = non_existent_checksum
	hendrix_achievement_easy = -1
	hendrix_achievement_medium = -1
	hendrix_achievement_hard = -1
	hendrix_achievement_expert = -1
}

script setup_bandtags 
	band_count = 0
	begin
	GetArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	FormatText checksumname = bandname 'p1_career_band%i_%d' i = (<band_count> + 1) d = <difficulty_text_nl> addtostringlookup = TRUE
	push_bandtags bandname = <bandname> mode = p1_career
	FormatText checksumname = bandname 'p2_career_band%i_%d' i = (<band_count> + 1) d = <difficulty_text_nl> addtostringlookup = TRUE
	push_bandtags bandname = <bandname> mode = p2_career
	FormatText checksumname = default_bandname 'band%i_info_p1_career' i = (<band_count> + 1) addtostringlookup = TRUE
	SetGlobalTags <default_bandname> params = {($default_bandtags)}
	FormatText checksumname = default_bandname 'band%i_info_p2_career' i = (<band_count> + 1) addtostringlookup = TRUE
	SetGlobalTags <default_bandname> params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_size>
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands + 1)
	GetArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	get_progression_globals \{game_mode = p1_career}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> addtostringlookup = TRUE
	SetGlobalTags <gametype_checksum> params = {complete = 0}
	get_progression_globals \{game_mode = p2_career}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl> addtostringlookup = TRUE
	SetGlobalTags <gametype_checksum> params = {complete = 0}
	array_count = (<array_count> + 1)
	repeat <array_size>
	SetGlobalTags \{progression params = {current_band = 1 current_difficulty = easy current_gamemode = p1_career}}
endscript

script setup_user_option_tags 
	SetGlobalTags \{user_options params = {guitar_volume = 11 band_volume = 11 sfx_volume = 11 lefty_flip_p1 = 0 lefty_flip_p2 = 0 lag_calibration = 0.0 autosave = 1 resting_whammy_position_device_0 = -0.76 resting_whammy_position_device_1 = -0.76 resting_whammy_position_device_2 = -0.76 resting_whammy_position_device_3 = -0.76 resting_whammy_position_device_4 = -0.76 resting_whammy_position_device_5 = -0.76 resting_whammy_position_device_6 = -0.76 star_power_position_device_0 = -1.0 star_power_position_device_1 = -1.0 star_power_position_device_2 = -1.0 star_power_position_device_3 = -1.0 star_power_position_device_4 = -1.0 star_power_position_device_5 = -1.0 star_power_position_device_6 = -1.0 gamma_brightness = 5 online_game_mode = 0 online_difficulty = 0 online_num_songs = 0 online_tie_breaker = 0 online_highway = 0 unlock_Cheat_AirGuitar = 0 unlock_Cheat_PerformanceMode = 0 unlock_Cheat_Hyperspeed = 0 unlock_Cheat_NoFail = 0 unlock_Cheat_EasyExpert = 0 unlock_Cheat_PrecisionMode = 0 unlock_Cheat_BretMichaels = 0}}
endscript

script setup_online_tags 
	SetGlobalTags \{net params = {face_off_streak = 0 pro_face_off_streak = 0 battle_streak = 0 faceoff_wins = 0 faceoff_loses = 0 pro_faceoff_wins = 0 pro_faceoff_loses = 0 battle_wins = 0 battle_loses = 0}}
endscript

script restore_options_from_global_tags 
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1>)
		change \{pad_event_up_inversion = TRUE}
	else
		change \{pad_event_up_inversion = FALSE}
	endif
endscript

script setup_training_tags 
	SetGlobalTags \{training params = {basic_lesson = not_complete star_power_lesson = not_complete guitar_battle_lesson = not_complete advanced_techniques_lesson = not_complete}}
endscript

script setup_store_tags 
	GetArraySize ($Bonus_Videos)
	index = 0
	begin
	video_checksum = ($Bonus_Videos [<index>].id)
	SetGlobalTags <video_checksum> params = {unlocked = 0}
	<index> = (<index> + 1)
	repeat <array_size>
	i = 6
	GetArraySize ($bv_text_array)
	begin
	video_checksum = ($bv_text_array [<i>].id)
	SetGlobalTags <video_checksum> params = {unlocked = 0}
	<i> = (<i> + 1)
	repeat (<array_size> - 6)
endscript
default_characterguitartags = {
	current_selected_guitar = Instrument_Les_Paul_Black
	current_selected_bass = Instrument_LP_VBRST
	current_instrument = guitar
	current_outfit = 1
	current_style = 1
}

script setup_characterguitar_tags 
	get_musician_profile_size
	<musician_profile_index> = 0
	begin
	<player> = 1
	begin
	get_musician_profile_struct index = <musician_profile_index>
	FormatText checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player> addtostringlookup = TRUE
	if NOT GetGlobalTags <default_characterguitartag> noassert = 1
		SetGlobalTags <default_characterguitartag> params = {($default_characterguitartags)}
		if StructureContains structure = <profile_struct> name = musician_instrument
			<inst_id> = (<profile_struct>.musician_instrument.desc_id)
			SetGlobalTags <default_characterguitartag> params = {current_selected_guitar = <inst_id>}
		endif
	else
		valid = 0
		if find_instrument_index desc_id = <current_selected_guitar>
			if is_musician_instrument_downloaded index = <index>
				valid = 1
			endif
		endif
		if (<valid> = 0)
			printf \{"Invalid Instrument found in setup_characterguitar_tags - changing to les paul black"}
			SetGlobalTags <default_characterguitartag> params = {current_selected_guitar = Instrument_Les_Paul_Black}
		endif
		valid = 0
		if find_instrument_index desc_id = <current_selected_bass>
			if is_musician_instrument_downloaded index = <index>
				valid = 1
			endif
		endif
		if (<valid> = 0)
			printf \{"Invalid Bass Instrument found in setup_characterguitar_tags - changing to lp vbrst"}
			SetGlobalTags <default_characterguitartag> params = {current_selected_bass = Instrument_LP_VBRST}
		endif
	endif
	<player> = (<player> + 1)
	repeat 2
	<musician_profile_index> = (<musician_profile_index> + 1)
	repeat <array_size>
endscript

script push_bandtags \{mode = p1_career}
	get_progression_globals game_mode = <mode>
	if (<mode> = p1_career)
		Career_Songs = <tier_global>
		num_players = 1
		elseif (<mode> = p2_career)
		Career_Songs = <tier_global>
		num_players = 2
	else
		printstruct <...>
		scriptassert \{"Invalid mode"}
	endif
	i = 0
	begin
	num_tiers = ($<Career_Songs>.num_tiers)
	array_count = 0
	begin
	FormatText checksumname = tier 'tier%d' d = (<array_count> + 1)
	GetArraySize ($<Career_Songs>.<tier>.songs)
	if NOT (<array_size> = 0)
		setlist_prefix = ($<Career_Songs>.prefix)
		FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
		FormatText checksumname = tier_checksum 'tier%s' s = (<array_count> + 1)
		PushGlobalTags <tiername> section = <bandname>
		GetArraySize ($<Career_Songs>.<tier_checksum>.songs)
		song_count = 0
		begin
		setlist_prefix = ($<Career_Songs>.prefix)
		FormatText checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) addtostringlookup = TRUE
		PushGlobalTags <song_checksum> section = <bandname>
		song_count = (<song_count> + 1)
		repeat <array_size>
	endif
	array_count = (<array_count> + 1)
	repeat <num_tiers>
	<i> = (<i> + 1)
	if (<i> = 1)
		get_progression_globals game_mode = <mode> bonus
		elseif (<i> = 2)
		get_progression_globals game_mode = <mode> download
	endif
	Career_Songs = <tier_global>
	repeat 3
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player>
	FormatText checksumname = player_character_params 'player%i_character_params' i = <player> addtostringlookup = TRUE
	SetGlobalTags <player_character_params> params = {character_id = ($<player_status>.character_id)
		instrument_id = ($<player_status>.instrument_id)
		style = ($<player_status>.style)
		outfit = ($<player_status>.outfit)}
	PushGlobalTags <player_character_params> section = <bandname>
	player = (<player> + 1)
	repeat <num_players>
	PushGlobalTags <player_character_params> section = <bandname>
endscript

script pop_bandtags 
	setup_setlisttags \{SetList_Songs = GH3_Download_Songs force = 1}
	PopGlobalTags section = <bandname>
	<num_players> = 1
	if ($game_mode = p2_career)
		<num_players> = 2
	endif
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player>
	FormatText checksumname = player_character_params 'player%i_character_params' i = <player>
	GetGlobalTags <player_character_params>
	change structurename = <player_status> character_id = <character_id>
	change structurename = <player_status> instrument_id = <instrument_id>
	change structurename = <player_status> style = <style>
	change structurename = <player_status> outfit = <outfit>
	valid = 0
	if find_profile_by_id id = ($<player_status>.character_id)
		if is_musician_profile_downloaded index = <index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		printf \{"Invalid Character found - changing to axel"}
		change structurename = <player_status> character_id = axel
		change structurename = <player_status> style = 1
		change structurename = <player_status> outfit = 1
	endif
	valid = 0
	if find_instrument_index desc_id = ($<player_status>.instrument_id)
		if is_musician_instrument_downloaded index = <index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		printf \{"Invalid Instrument found - changing to les paul black"}
		change structurename = <player_status> instrument_id = Instrument_Les_Paul_Black
	endif
	player = (<player> + 1)
	repeat <num_players>
endscript

script GlobalTags_UnlockAll \{songs_only = 0}
	if NOT (<songs_only> = 1)
		array_count = 0
		GetArraySize \{$Bonus_Guitars}
		begin
		SetGlobalTags ($Bonus_Guitars [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Bonus_Guitar_Finishes}
		begin
		SetGlobalTags ($Bonus_Guitar_Finishes [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Secret_Guitars}
		begin
		SetGlobalTags ($Secret_Guitars [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Bonus_Basses}
		begin
		SetGlobalTags ($Bonus_Basses [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Bonus_Bass_Finishes}
		begin
		SetGlobalTags ($Bonus_Bass_Finishes [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Secret_Basses}
		begin
		SetGlobalTags ($Secret_Basses [<array_count>].id) params = {unlocked = 1 unlocked_for_purchase = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Secret_Characters}
		begin
		SetGlobalTags ($Secret_Characters [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Bonus_Outfits}
		begin
		SetGlobalTags ($Bonus_Outfits [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Bonus_Styles}
		begin
		SetGlobalTags ($Bonus_Styles [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
		array_count = 0
		GetArraySize \{$Bonus_Videos}
		begin
		SetGlobalTags ($Bonus_Videos [<array_count>].id) params = {unlocked = 1}
		array_count = (<array_count> + 1)
		repeat <array_size>
	endif
	array_count = 0
	begin
	setlist_prefix = ($<songlist>.prefix)
	FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
	FormatText checksumname = tier_checksum 'tier%s' s = (<array_count> + 1)
	GetArraySize ($<songlist>.<tier_checksum>.songs)
	SetGlobalTags <tiername> params = {unlocked = 1
		complete = 1
		encore_unlocked = 1
		boss_unlocked = 1
		num_songs_to_progress = 0}
	song_count = 0
	begin
	setlist_prefix = ($<songlist>.prefix)
	FormatText checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<array_count> + 1) addtostringlookup = TRUE
	if (<songs_only> = 1)
		SetGlobalTags <song_checksum> params = {unlocked = 1}
	else
		SetGlobalTags <song_checksum> params = {stars = 5
			Score = 1000000
			unlocked = 1}
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($<songlist>.<tier_checksum>.songs [<song_count>])
		FormatText checksumname = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
		SetGlobalTags <songname> params = {achievement_gold_star = 1}
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	array_count = (<array_count> + 1)
	repeat ($<songlist>.num_tiers)
	setup_venuetags \{cheat}
endscript
progression_pop_count = 0

script progression_push_current \{force = 0}
	printscriptinfo \{"progression_push_current_callstack"}
	if NOT ($progression_pop_count = 1)
		if (<force> = 0)
			scriptassert \{"progression_push_current with nothing popped"}
		endif
		return
	endif
	GetGlobalTags \{progression params = current_band}
	GetGlobalTags \{progression params = current_difficulty}
	GetGlobalTags \{progression params = current_gamemode}
	get_difficulty_text_nl difficulty = (<current_difficulty>)
	if GotParam \{force_gamemode}
		<current_gamemode> = <force_gamemode>
	endif
	if (<current_gamemode> = p1_career)
		bandname_part1 = 'p1_career'
		elseif (<current_gamemode> = p2_career)
		bandname_part1 = 'p2_career'
	endif
	FormatText checksumname = bandname '%s_band%i_%d' s = <bandname_part1> i = <current_band> d = <difficulty_text_nl>
	push_bandtags bandname = <bandname> mode = <current_gamemode>
	change progression_pop_count = ($progression_pop_count - 1)
endscript

script progression_pop_current \{force = 0 UpdateAtoms = 1}
	printscriptinfo \{"progression_pop_current_callstack"}
	if NOT ($progression_pop_count = 0)
		if (<force> = 0)
			scriptassert \{"progression_pop_current with something already popped"}
		endif
		return
	endif
	current_gamemode = ($game_mode)
	if GotParam \{force_gamemode}
		<current_gamemode> = <force_gamemode>
	endif
	if (<current_gamemode> = p1_career)
		bandname_part1 = 'p1_career'
		elseif (<current_gamemode> = p2_career)
		bandname_part1 = 'p2_career'
	else
		scriptassert \{"progression_pop_current not in career mode"}
	endif
	progression_getdifficulty
	get_difficulty_text_nl difficulty = <difficulty>
	FormatText checksumname = bandname '%s_band%i_%d' s = <bandname_part1> i = ($current_band) d = <difficulty_text_nl>
	pop_bandtags bandname = <bandname>
	SetGlobalTags progression params = {current_band = ($current_band)
		current_difficulty = <difficulty>
		current_gamemode = <current_gamemode>}
	change progression_pop_count = ($progression_pop_count + 1)
endscript

script get_minimum_difficulty \{difficulty1 = easy difficulty2 = easy}
	if (<difficulty1> = <difficulty2>)
		return minimum_difficulty = <difficulty1>
	else
		switch <difficulty1>
			case easy
			return \{minimum_difficulty = easy}
			case medium
			if (<difficulty2> = easy)
				return \{minimum_difficulty = easy}
			else
				return \{minimum_difficulty = medium}
			endif
			case hard
			switch <difficulty2>
				case easy
				return \{minimum_difficulty = easy}
				case medium
				return \{minimum_difficulty = medium}
				case expert
				return \{minimum_difficulty = hard}
			endswitch
			case expert
			switch <difficulty2>
				case easy
				return \{minimum_difficulty = easy}
				case medium
				return \{minimum_difficulty = medium}
				case hard
				return \{minimum_difficulty = hard}
			endswitch
		endswitch
	endif
endscript

script get_game_mode_ui_string 
	if NOT GotParam \{game_mode}
		softassert \{"Did not get game_mode!"}
		return
	endif
	return ui_string = ($game_mode_ui_strings.<game_mode>)
endscript
game_mode_ui_strings = {
	p1_career = "Career"
	p2_career = "Career"
	p1_quickplay = "Quick Play"
	p2_faceoff = "Face Off"
	p2_pro_faceoff = "Pro Faceoff"
	p2_battle = "Battle"
	p2_coop = "Co-op"
}

script get_difficulty_ui_string 
	if NOT GotParam \{difficulty}
		softassert \{"Did not get difficulty!"}
		return
	endif
	return ui_string = ($game_difficulty_ui_strings.<difficulty>)
endscript
game_difficulty_ui_strings = {
	easy = "Easy"
	medium = "Medium"
	hard = "Hard"
	expert = "Expert"
}
game_mode_names = {
	p1_career = 'p1_career'
	p2_career = 'p2_career'
	p1_quickplay = 'p1_quickplay'
	p2_faceoff = 'p2_faceoff'
	p2_pro_faceoff = 'p2_pro_faceoff'
	p2_battle = 'p2_battle'
	p2_coop = 'p2_coop'
}

script get_band_game_mode_name 
	game_mode_name = ($game_mode_names.p1_career)
	return game_mode_name = <game_mode_name>
endscript

script get_game_mode_name 
	return game_mode_name = ($game_mode_names.$game_mode)
endscript

script get_current_band_info 
	FormatText checksumname = bandname 'band%i_info_p1_career' i = ($current_band)
	return band_info = <bandname>
endscript

script get_current_band_checksum 
	get_difficulty_text_nl difficulty = ($current_difficulty)
	if ($game_mode = p2_career)
		FormatText checksumname = bandname 'p2_career_band%i_%d' i = ($current_band) d = <difficulty_text_nl>
	else
		FormatText checksumname = bandname 'p1_career_band%i_%d' i = ($current_band) d = <difficulty_text_nl>
	endif
	return band_checksum = <bandname>
endscript

script setup_achievement_tags 
	SetGlobalTags \{achievement_info params = {ranked_matches_played = 0 ranked_matches_won = 0 ranked_consecutive_won_as_host = 0 ranked_consecutive_won_as_client = 0 ranked_matches_won_as_host = 0 ranked_matches_won_as_client = 0 ranked_matches_won_with_standard_controller = 0 player_matches_played = 0 player_matches_won = 0 player_matches_won_as_host = 0 player_matches_won_as_client = 0 total_notes_in_career_mode = 0 total_cash_in_career_mode = 0 total_points_in_career_mode = 0 total_points_in_career_mode_easy = 0 total_points_in_career_mode_medium = 0 total_points_in_career_mode_hard = 0 total_points_in_career_mode_expert = 0 hendrix_achievement_lefty_on = 0 hendrix_achievement_lefty_off = 0}}
endscript

script set_online_match_info \{ranked = 0 won = 0 HOST = 0 standard_controller = 0}
	GetGlobalTags \{achievement_info}
	printf \{"set_online_match_info"}
	if (<ranked> = 0)
		<player_matches> = (<player_matches_played> + 1)
		SetGlobalTags achievement_info params = {player_matches_played = <player_matches>}
		if (<won> = 1)
			<matches_won> = (<player_matches_won> + 1)
			SetGlobalTags achievement_info params = {player_matches_won = <matches_won>}
			if (<HOST> = 1)
				<host_won> = (<player_matches_won_as_host> + 1)
				SetGlobalTags achievement_info params = {player_matches_won_as_host = <host_won>}
			else
				<client_won> = (<player_matches_won_as_client> + 1)
				SetGlobalTags achievement_info params = {player_matches_won_as_client = <client_won>}
			endif
		endif
	else
		<player_matches> = (<ranked_matches_played> + 1)
		SetGlobalTags achievement_info params = {ranked_matches_played = <player_matches>}
		if (<won> = 1)
			<matches_won> = (<ranked_matches_won> + 1)
			SetGlobalTags achievement_info params = {ranked_matches_won = <matches_won>}
			if (<HOST> = 1)
				<host_won> = (<ranked_matches_won_as_host> + 1)
				SetGlobalTags achievement_info params = {ranked_matches_won_as_host = <host_won>}
				<consec_won> = (<ranked_consecutive_won_as_host> + 1)
				SetGlobalTags achievement_info params = {ranked_consecutive_won_as_host = <consec_won>}
			else
				<client_won> = (<ranked_matches_won_as_client> + 1)
				SetGlobalTags achievement_info params = {ranked_matches_won_as_client = <client_won>}
				<consec_won> = (<ranked_consecutive_won_as_client> + 1)
				SetGlobalTags achievement_info params = {ranked_consecutive_won_as_client = <consec_won>}
			endif
			if (<standard_controller> = 1)
				<controller_won> = (<ranked_matches_won_with_standard_controller> + 1)
				SetGlobalTags achievement_info params = {ranked_matches_won_with_standard_controller = <controller_won>}
			endif
		else
			if (<HOST> = 1)
				SetGlobalTags \{achievement_info params = {ranked_consecutive_won_as_host = 0}}
			else
				SetGlobalTags \{achievement_info params = {ranked_consecutive_won_as_client = 0}}
			endif
		endif
	endif
	GetGlobalTags \{achievement_info}
	printstruct <...>
endscript
