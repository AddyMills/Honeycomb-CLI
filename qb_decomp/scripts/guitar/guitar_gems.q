whammy_units_per_second = 6.3500004
default_gem_offset = 0
default_input_offset = 0
default_drums_offset = 0
default_practice_mode_geminput_offset = 0
default_practice_mode_pitchshift_offset_song = 0
default_practice_mode_pitchshift_offset_slow = 0
default_practice_mode_pitchshift_offset_slower = 0
default_practice_mode_pitchshift_offset_slowest = 0
current_startup_script = nothing
current_exit_script = nothing
num_song_columns = 3
gem_colors = [
	green
	red
	yellow
	blue
	orange
]
gem_colors_text = [
	'green'
	'red'
	'yellow'
	'blue'
	'orange'
]
broken_strings = [
	broken_string_green
	broken_string_red
	broken_string_yellow
	broken_string_blue
	broken_string_orange
]
scripts_array = [
	{
		name = 'scripts'
		lead_ms = 0
	}
	{
		name = 'anim'
		lead_ms = 0
	}
	{
		name = 'triggers'
		lead_ms = 0
	}
	{
		name = 'cameras'
		lead_ms = 0
	}
	{
		name = 'lightshow'
		lead_ms = $lightshow_offset_ms
	}
	{
		name = 'crowd'
		lead_ms = 0
	}
	{
		name = 'drums'
		lead_ms = $default_drums_offset
	}
	{
		name = 'performance'
		lead_ms = 0
	}
]
fretbar_end_scale = 0.48000002
button_models = {
	green = {
		gem_material = sys_Gem2D_Green_sys_Gem2D_Green
		gem_hammer_material = sys_Gem2D_Green_hammer_sys_Gem2D_Green_hammer
		star_material = sys_Star2D_Green_sys_Star2D_Green
		star_hammer_material = sys_Star2D_Green_Hammer_sys_Star2D_Green_Hammer
		battle_star_material = sys_BattleGEM_Green01_sys_BattleGEM_Green01
		battle_star_hammer_material = sys_BattleGEM_Hammer_Green01_sys_BattleGEM_Hammer_Green01
		whammy_material = sys_Whammy2D_Green_sys_Whammy2D_Green
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_g
	}
	red = {
		gem_material = sys_Gem2D_Red_sys_Gem2D_Red
		gem_hammer_material = sys_Gem2D_Red_hammer_sys_Gem2D_Red_hammer
		star_material = sys_Star2D_Red_sys_Star2D_Red
		star_hammer_material = sys_Star2D_Red_Hammer_sys_Star2D_Red_Hammer
		battle_star_material = sys_BattleGEM_RED01_sys_BattleGEM_RED01
		battle_star_hammer_material = sys_BattleGEM_Hammer_RED01_sys_BattleGEM_Hammer_RED01
		whammy_material = sys_Whammy2D_Red_sys_Whammy2D_Red
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_r
	}
	yellow = {
		gem_material = sys_Gem2D_Yellow_sys_Gem2D_Yellow
		gem_hammer_material = sys_Gem2D_Yellow_hammer_sys_Gem2D_Yellow_hammer
		star_material = sys_Star2D_Yellow_sys_Star2D_Yellow
		star_hammer_material = sys_Star2D_Yellow_Hammer_sys_Star2D_Yellow_Hammer
		battle_star_material = sys_BattleGEM_Yellow01_sys_BattleGEM_Yellow01
		battle_star_hammer_material = sys_BattleGEM_Hammer_Yellow01_sys_BattleGEM_Hammer_Yellow01
		whammy_material = sys_Whammy2D_Yellow_sys_Whammy2D_Yellow
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_y
	}
	blue = {
		gem_material = sys_Gem2D_Blue_sys_Gem2D_Blue
		gem_hammer_material = sys_Gem2D_Blue_hammer_sys_Gem2D_Blue_hammer
		star_material = sys_Star2D_Blue_sys_Star2D_Blue
		star_hammer_material = sys_Star2D_Blue_Hammer_sys_Star2D_Blue_Hammer
		battle_star_material = sys_BattleGEM_Blue01_sys_BattleGEM_Blue01
		battle_star_hammer_material = sys_BattleGEM_Hammer_Blue01_sys_BattleGEM_Hammer_Blue01
		whammy_material = sys_Whammy2D_Blue_sys_Whammy2D_Blue
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_b
	}
	orange = {
		gem_material = sys_Gem2D_Orange_sys_Gem2D_Orange
		gem_hammer_material = sys_Gem2D_Orange_hammer_sys_Gem2D_Orange_hammer
		star_material = sys_Star2D_Orange_sys_Star2D_Orange
		star_hammer_material = sys_Star2D_Orange_Hammer_sys_Star2D_Orange_Hammer
		battle_star_material = sys_BattleGEM_Orange01_sys_BattleGEM_Orange01
		battle_star_hammer_material = sys_BattleGEM_Hammer_Orange01_sys_BattleGEM_Hammer_Orange01
		whammy_material = sys_Whammy2D_Orange_sys_Whammy2D_Orange
		star_power_material = sys_Gem2D_StarPower_sys_Gem2D_StarPower
		star_power_hammer_material = sys_Gem2D_StarPower_hammer_sys_Gem2D_StarPower_hammer
		star_power_whammy_material = sys_Whammy2D_StarPower_sys_Whammy2D_StarPower
		dead_whammy = sys_Whammy2D_Dead_sys_Whammy2D_Dead
		name = button_o
	}
}

script setup_models 
	tod_manager_create_perm_lights
	LightShow_CreatePermModels
endscript

script setup_gemarrays 
	get_song_struct song = <song_name>
	if (($<player_status>.part) = rhythm)
		<part> = 'rhythm_'
	else
		<part> = ''
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop ||
			($game_mode = training && ($<player_status>.part = rhythm)))
		if StructureContains structure = <song_struct> use_coop_notetracks
			if (($<player_status>.part) = rhythm)
				<part> = 'rhythmcoop_'
			else
				<part> = 'guitarcoop_'
			endif
		endif
	endif
	get_song_prefix song = <song_name>
	get_difficulty_text_nl difficulty = <difficulty>
	FormatText checksumname = gem_array '%s_%t_%p%d' s = <song_prefix> t = 'song' p = <part> d = <difficulty_text_nl> addtostringlookup
	FormatText checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup
	change structurename = <player_status> current_song_gem_array = <gem_array>
	change structurename = <player_status> current_song_fretbar_array = <fretbar_array>
	change structurename = <player_status> current_song_beat_time = ($<fretbar_array> [1])
	change structurename = <player_status> playline_song_beat_time = ($<fretbar_array> [1])
	reset_star_array song_name = <song_name> difficulty = <difficulty> player_status = <player_status>
	return gem_array = <gem_array> fretbar_array = <fretbar_array> song_prefix = <song_prefix> part = <part> difficulty_text_nl = <difficulty_text_nl>
endscript

script calc_health_invincible_time 
	get_song_end_time song = ($current_song)
	change structurename = <player_status> health_invincible_time = 0.0
	if ($game_mode = p1_quickplay ||
			$game_mode = p1_career ||
			$game_mode = p2_battle)
		if NOT ($battle_sudden_death)
			if (($<player_status>.player = 1 && $current_difficulty = easy) ||
					($<player_status>.player = 2 && $current_difficulty2 = easy))
				change structurename = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_easy / 100.0)
			endif
			if (($<player_status>.player = 1 && $current_difficulty = medium) ||
					($<player_status>.player = 2 && $current_difficulty2 = medium))
				change structurename = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_medium / 100.0)
			endif
		endif
	elseif ($game_mode = p2_coop ||
			$game_mode = p2_career)
		if ($current_difficulty = easy && $current_difficulty2 = easy)
			change structurename = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_easy / 100.0)
		elseif (($current_difficulty = easy && $current_difficulty2 = medium) ||
				($current_difficulty = medium && $current_difficulty2 = easy))
			change structurename = <player_status> health_invincible_time = (<total_end_time> * $health_invincible_time_percentage_medium / 100.0)
		endif
	endif
endscript

script gem_scroller \{player = 1 training_mode = 0}
	setup_gemarrays song_name = <song_name> difficulty = <difficulty> player_status = <player_status>
	calc_health_invincible_time song = <song_name> player_status = <player_status>
	if ($cheat_easyexpert = 1)
		if ($is_network_game || $game_mode = p1_career || $game_mode = p2_coop)
			change \{check_time_early = $original_check_time_early}
			change \{check_time_late = $original_check_time_late}
		endif
	endif
	if ($Cheat_PrecisionMode = 1)
		if ($is_network_game)
			change \{check_time_early = $original_check_time_early}
			change \{check_time_late = $original_check_time_late}
		endif
	endif
	change structurename = <player_status> check_time_early = ($check_time_early * $current_speedfactor)
	change structurename = <player_status> check_time_late = ($check_time_late * $current_speedfactor)
	FormatText checksumname = input_array 'input_array%p' p = <player_text>
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf "Creating array for %p" p = <player_text>
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	printf \{"-----------------------------------"}
	InputArrayCreate name = <input_array>
	if (<player> = 1)
		if ($input_mode = record)
			ClearDataBuffer \{name = replay}
			DataBufferPutChecksum name = replay value = <song_name>
			DataBufferPutChecksum name = replay value = ($current_transition)
			DataBufferPutInt \{name = replay value = $current_num_players}
			DataBufferPutInt name = replay value = ($player1_status.controller)
			DataBufferPutInt name = replay value = ($player2_status.controller)
			DataBufferPutChecksum name = replay value = <difficulty> bytes = 16
			DataBufferPutChecksum name = replay value = <difficulty2> bytes = 16
			GetRandomSeeds
			DataBufferPutInt name = replay value = <seed1>
			DataBufferPutInt name = replay value = <seed2>
			DataBufferPutInt name = replay value = <seed3>
			DataBufferPutInt name = replay value = <seed4>
			DataBufferPutInt name = replay value = <seed5>
			DataBufferPutInt name = replay value = <seed6>
		endif
	endif
	<gem_offset> = ($time_gem_offset)
	<input_offset> = ($time_input_offset)
	GetGlobalTags \{user_options}
	<input_offset> = (<input_offset> - <lag_calibration>)
	if (<training_mode> = 0)
		SpawnScriptLater Strum_iterator params = {song_name = <song_name> difficulty = expert
			time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
			part = <part> target = (<player_status>.band_member)}
		SpawnScriptLater FretFingers_iterator params = {song_name = <song_name> difficulty = expert
			time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
			part = <part> target = (<player_status>.band_member)}
		SpawnScriptLater FretPos_iterator params = {song_name = <song_name>
			time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
			part = ($<player_status>.part) target = (<player_status>.band_member)}
		if (<player> = 1)
			SpawnScriptLater Drum_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> + $drum_anim_lead_time) skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater Drum_cymbal_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = <gem_offset> skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
			if ($current_num_players = 1)
				bassist_song_part = 'rhythm_'
				bassist_part = rhythm
				get_song_struct song = <song_name>
				if StructureContains structure = <song_struct> name = bassist
					if ((<song_struct>.bassist = 'Morello') || (<song_struct>.bassist = 'slash'))
						bassist_song_part = ''
						bassist_part = guitar
					endif
				endif
				SpawnScriptLater Strum_iterator params = {song_name = <song_name> difficulty = expert
					time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
					part = <bassist_song_part> target = bassist}
				SpawnScriptLater FretFingers_iterator params = {song_name = <song_name> difficulty = expert
					time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
					part = <bassist_song_part> target = bassist}
				SpawnScriptLater FretPos_iterator params = {song_name = <song_name> difficulty = <difficulty>
					time_offset = (<gem_offset> + $strum_anim_lead_time) skipleadin = 0
					part = <bassist_part> target = bassist}
			endif
		endif
	endif
	FormatText checksumname = input_array 'input_array%p' p = <player_text>
	SpawnScriptLater gem_iterator params = {iterator_text = 'fill_array' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <input_array>
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
		player = <player> player_status = <player_status> player_text = <player_text>}
	if ($game_mode = p2_faceoff)
		SpawnScriptLater faceoff_init params = {song_name = <song_name> difficulty = <difficulty> part = <part>
			time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) skipleadin = ($<player_status>.scroll_time * 1000.0)
			player = <player> player_status = <player_status> player_text = <player_text>}
		SpawnScriptLater faceoff_volumes_init params = {song_name = <song_name> difficulty = <difficulty> part = <part>
			time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) skipleadin = ($<player_status>.scroll_time * 1000.0)
			player = <player> player_status = <player_status> player_text = <player_text>}
	endif
	<do_bot> = 0
	if ($boss_battle = 1)
		if (<player> = 2)
			FormatText checksumname = bossresponse_array 'bossresponse_array%p' p = <player_text>
			InputArrayCreate name = <bossresponse_array>
			SpawnScriptLater gem_iterator params = {iterator_text = 'fill_bossarray' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <bossresponse_array>
				time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
				player = <player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater gem_iterator params = {iterator_text = 'boss' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'bossresponse_array'
				time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) strum_function = check_buttons_boss skipleadin = ($<player_status>.scroll_time * 1000.0)
				player = <player> player_status = <player_status> player_text = <player_text>}
		elseif ($<player_status>.bot_play = 1)
			<do_bot> = 1
		endif
	elseif ($<player_status>.bot_play = 1)
		<do_bot> = 1
	endif
	if (<do_bot> = 1)
		SpawnScriptLater gem_iterator params = {iterator_text = 'bot' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'input_array' one_event_per_frame
			time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) strum_function = check_buttons_bot skipleadin = ($<player_status>.scroll_time * 1000.0)
			player = <player> player_status = <player_status> player_text = <player_text>}
		printf \{channel = log "Spawned bot!"}
	endif
	if ($new_net_logic)
		if (<player> = 2)
			FormatText checksumname = bossresponse_array 'bossresponse_array%p' p = <player_text>
			InputArrayCreate name = <bossresponse_array>
			SpawnScriptLater gem_iterator params = {iterator_text = 'fill_bossarray' song_name = <song_name> difficulty = <difficulty> part = <part> input_array = <bossresponse_array>
				time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) strum_function = fill_input_array skipleadin = ($<player_status>.scroll_time * 1000.0)
				player = <player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater gem_iterator params = {iterator_text = 'boss' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'bossresponse_array'
				time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) strum_function = check_buttons_boss skipleadin = ($<player_status>.scroll_time * 1000.0)
				player = <player> player_status = <player_status> player_text = <player_text>}
		endif
	endif
	SpawnScriptLater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty> thin_fretbars
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset>) fretbar_function = create_fretbar skipleadin = ($<player_status>.scroll_time * 1000.0)
		player = <player> player_status = <player_status> player_text = <player_text>}
	SpawnScriptLater gem_iterator params = {iterator_text = 'create_gem' song_name = <song_name> difficulty = <difficulty> part = <part> use_input_array = 'input_array'
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset>) gem_function = create_gem skipleadin = ($<player_status>.scroll_time * 1000.0)
		player = <player> player_status = <player_status> player_text = <player_text>}
	if ((<player_status>.is_local_client) || ($new_net_logic))
		SpawnScriptLater check_buttons_fast params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>) player = <player>
			player_status = <player_status> player_text = <player_text>}
	else
		SpawnScriptLater net_check_buttons params = {song_name = <song_name> player_status = <player_status>
			time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>)}
	endif
	SpawnScriptLater fretbar_update_tempo params = {song_name = <song_name> difficulty = <difficulty>
		time_offset = ((($<player_status>.check_time_early) * 1000.0) + <gem_offset>) player = <player> skipleadin = ($<player_status>.scroll_time * 1000.0)
		player_status = <player_status> player_text = <player_text>}
	SpawnScriptLater fretbar_update_hammer_on_tolerance params = {song_name = <song_name> difficulty = <difficulty>
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset> + 1000.0) player = <player> skipleadin = ($<player_status>.scroll_time * 1000.0)
		player_status = <player_status> player_text = <player_text>}
	if (<player> = 1)
		if ($is_network_game)
			SpawnScriptLater dispatch_player_state params = {player_status = <player_status>}
			SpawnScriptLater \{network_events}
		endif
		SpawnScriptLater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = (($prefretbar_time * 1000.0) + <gem_offset>) fretbar_function = GuitarEvent_PreFretbar skipleadin = 0
			player = <player> player_status = <player_status> player_text = <player_text>}
		SpawnScriptLater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty>
			time_offset = <gem_offset> fretbar_function = GuitarEvent_Fretbar skipleadin = 0
			player = <player> player_status = <player_status> player_text = <player_text>}
		if ($Debug_Audible_Downbeat = 1)
			SpawnScriptLater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> + ($check_time_early * 1000.0)) fretbar_function = GuitarEvent_Fretbar_Early skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
			SpawnScriptLater fretbar_iterator params = {song_name = <song_name> difficulty = <difficulty>
				time_offset = (<gem_offset> - ($check_time_late * 1000.0)) fretbar_function = GuitarEvent_Fretbar_Late skipleadin = 0
				player = <player> player_status = <player_status> player_text = <player_text>}
		endif
		SpawnScriptLater lightshow_iterator params = {song_name = <song_name> time_offset = (<gem_offset> + $lightshow_offset_ms) skipleadin = 0}
		SpawnScriptLater cameracuts_iterator params = {song_name = <song_name> time_offset = <gem_offset> skipleadin = 0}
		GetArraySize \{$scripts_array}
		array_count = 0
		begin
		<lead_ms> = ($scripts_array [<array_count>].lead_ms)
		SpawnScriptLater event_iterator params = {song_name = <song_name> difficulty = <difficulty>
			event_string = ($scripts_array [<array_count>].name) time_offset = (<gem_offset> + <lead_ms>) skipleadin = 0
			player = <player> player_status = <player_status> player_text = <player_text>}
		SpawnScriptLater notemap_startiterator params = {song_name = <song_name> difficulty = <difficulty>
			event_string = ($scripts_array [<array_count>].name) time_offset = (<gem_offset> + <lead_ms>) skipleadin = 0
			player = <player> player_status = <player_status> player_text = <player_text>}
		array_count = (<array_count> + 1)
		repeat <array_size>
	endif
	SpawnScriptLater win_song params = {<...>}
endscript

script get_song_end_time_for_array 
	if NOT globalexists name = <song_array>
		total_end_time2 = 2.0
	else
		GetArraySize $<song_array>
		if (<array_size> = 0)
			total_end_time2 = 2.0
		else
			last_entry = (<array_size> - $num_song_columns)
			end_time = ($<song_array> [(<last_entry>)])
			<whammy_time> = ($<song_array> [(<last_entry> + 1)])
			total_end_time2 = (<end_time> + <whammy_time>)
		endif
	endif
	if NOT GotParam \{total_end_time}
		total_end_time = <total_end_time2>
	else
		if (<total_end_time2> > <total_end_time>)
			total_end_time = <total_end_time2>
		endif
	endif
	return total_end_time = <total_end_time>
endscript

script get_song_end_time 
	get_song_prefix song = <song>
	FormatText checksumname = song_expert '%s_song_expert' s = <song_prefix> addtostringlookup
	FormatText checksumname = rhythm_expert '%s_song_rhythm_expert' s = <song_prefix> addtostringlookup
	total_end_time = 2.0
	get_song_end_time_for_array total_end_time = <total_end_time> song_array = <song_expert>
	get_song_end_time_for_array total_end_time = <total_end_time> song_array = <rhythm_expert>
	get_song_struct song = <song>
	if StructureContains structure = <song_struct> use_coop_notetracks
		FormatText checksumname = guitarcoop_expert '%s_song_guitarcoop_expert' s = <song_prefix> addtostringlookup
		FormatText checksumname = rhythmcoop_expert '%s_song_rhythmcoop_expert' s = <song_prefix> addtostringlookup
		get_song_end_time_for_array total_end_time = <total_end_time> song_array = <guitarcoop_expert>
		get_song_end_time_for_array total_end_time = <total_end_time> song_array = <rhythmcoop_expert>
	endif
	return total_end_time = <total_end_time>
endscript

script win_song 
	if (<player> = 1)
		change \{num_players_finished = 0}
	endif
	song = <gem_array>
	GetArraySize $<song>
	if NOT (<array_size> = 0)
		get_song_end_time song = ($current_song)
		end_s = ((<total_end_time> - <starttime>) / 1000.0)
		printf "Waiting %s seconds for song end marker." s = <end_s>
		if (<end_s> > 0)
			wait <end_s> seconds
		endif
	endif
	if ($current_num_players = 2)
		wait_on_player = 2
	else
		wait_on_player = 1
	endif
	if (<wait_on_player> = <player>)
		if IsWinPort
			wait \{1.1 seconds}
		endif
		KillMovie \{textureslot = 1}
		preload_movie = 'Fret_Flames'
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			if ($player1_status.Score > $player2_status.Score)
				preload_movie = 'Player1_wins'
			elseif ($player2_status.Score > $player1_status.Score)
				preload_movie = 'Player2_wins'
			endif
		endif
		PreLoadMovie {
			movie = <preload_movie>
			textureslot = 1
			texturepri = 70
			no_looping
			no_hold
		}
	endif
	printf \{"Waiting %s seconds for extra song win delay." s = $Song_Win_Delay}
	wait \{$Song_Win_Delay seconds}
	change num_players_finished = ($num_players_finished + 1)
	printf "win_song finished %i %f" i = ($num_players_finished) f = ($current_num_players)
	if ($num_players_finished >= $current_num_players)
		if ($is_network_game)
			spawnscriptnow \{online_end_song}
		else
			printf \{"Broadcasting song won event."}
			extendcrc song_won <player_text> out = type
			broadcastevent type = <type>
		endif
	endif
endscript

script load_songqpak \{async = 0}
	if NOT (<song_name> = $current_song_qpak)
		unload_songqpak
		get_song_prefix song = <song_name>
		is_song_downloaded song_checksum = <song_name>
		if (<download> = 1)
			FormatText textname = songqpak '%i_song.pak' i = <song_prefix>
		else
			FormatText textname = songqpak 'songs/%i_song.pak' i = <song_prefix>
		endif
		printf "Loading Song q pak : %i" i = <songqpak>
		if NOT LoadPakAsync pak_name = <songqpak> heap = heap_song no_vram async = <async>
			downloadcontentlost
			return
		endif
		change current_song_qpak = <song_name>
		if GotParam \{song_prefix}
			FormatText checksumname = song_setup '%s_setup' s = <song_prefix>
			if ScriptExists <song_setup>
				spawnscriptnow <song_setup>
			endif
		endif
	endif
endscript

script unload_songqpak 
	if NOT ($current_song_qpak = None)
		get_song_prefix song = ($current_song_qpak)
		is_song_downloaded song_checksum = ($current_song_qpak)
		if (<download> = 1)
			FormatText textname = songqpak '%i_song.pak' i = <song_prefix>
		else
			FormatText textname = songqpak 'songs/%i_song.pak' i = <song_prefix>
		endif
		printf "UnLoading Song q pak : %i" i = <songqpak>
		UnloadPak <songqpak>
		change \{current_song_qpak = None}
	endif
endscript
playing_song = 0

script start_gem_scroller \{starttime = 0
		practice_intro = 0
		training_mode = 0
		endtime = 99999999
		devil_finish_restart = 0
		end_credits_restart = 0}
	if (<devil_finish_restart> = 1)
		printf \{"FINISH DEVIL RESTART"}
	else
		change \{devil_finish = 0}
		if ($current_song = bossdevil)
			<starttime> = 0
		endif
	endif
	if (<end_credits_restart> = 1)
		printf \{"END CREDITS RESTART"}
	else
		if NOT ($current_song = thrufireandflames)
			change \{end_credits = 0}
		endif
	endif
	change \{playing_song = 1}
	mark_unsafe_for_shutdown
	dragonforce_hack_off
	Menu_Music_Off
	GuitarEvent_EnterVenue
	init_play_log
	load_songqpak song_name = <song_name> async = 1
	if IsWinPort
		WinPortGetPracticeModeOffsets
		change default_practice_mode_geminput_offset = <pm_geminput_offset>
		change default_practice_mode_pitchshift_offset_song = <pm_pitchshift_offset_song>
		change default_practice_mode_pitchshift_offset_slow = <pm_pitchshift_offset_slow>
		change default_practice_mode_pitchshift_offset_slower = <pm_pitchshift_offset_slower>
		change default_practice_mode_pitchshift_offset_slowest = <pm_pitchshift_offset_slowest>
	else
		if IsXenon
			change \{default_gem_offset = $xenon_gem_offset}
			change \{default_input_offset = $xenon_input_offset}
			change \{default_drums_offset = $xenon_drums_offset}
			change \{default_practice_mode_geminput_offset = $xenon_practice_mode_geminput_offset}
			change \{default_practice_mode_pitchshift_offset_song = $xenon_practice_mode_pitchshift_offset_song}
			change \{default_practice_mode_pitchshift_offset_slow = $xenon_practice_mode_pitchshift_offset_slow}
			change \{default_practice_mode_pitchshift_offset_slower = $xenon_practice_mode_pitchshift_offset_slower}
			change \{default_practice_mode_pitchshift_offset_slowest = $xenon_practice_mode_pitchshift_offset_slowest}
		else
			if IsPS3
				change \{default_gem_offset = $ps3_gem_offset}
				change \{default_input_offset = $ps3_input_offset}
				change \{default_drums_offset = $ps3_drums_offset}
				change \{default_practice_mode_geminput_offset = $ps3_practice_mode_geminput_offset}
				change \{default_practice_mode_pitchshift_offset_song = $ps3_practice_mode_pitchshift_offset_song}
				change \{default_practice_mode_pitchshift_offset_slow = $ps3_practice_mode_pitchshift_offset_slow}
				change \{default_practice_mode_pitchshift_offset_slower = $ps3_practice_mode_pitchshift_offset_slower}
				change \{default_practice_mode_pitchshift_offset_slowest = $ps3_practice_mode_pitchshift_offset_slowest}
			else
				change \{default_gem_offset = $ps2_gem_offset}
				change \{default_input_offset = $ps2_input_offset}
				change \{default_drums_offset = $ps2_drums_offset}
				change \{default_practice_mode_geminput_offset = $ps2_practice_mode_geminput_offset}
				change \{default_practice_mode_pitchshift_offset_song = $ps2_practice_mode_pitchshift_offset_song}
				change \{default_practice_mode_pitchshift_offset_slow = $ps2_practice_mode_pitchshift_offset_slow}
				change \{default_practice_mode_pitchshift_offset_slower = $ps2_practice_mode_pitchshift_offset_slower}
				change \{default_practice_mode_pitchshift_offset_slowest = $ps2_practice_mode_pitchshift_offset_slowest}
			endif
		endif
	endif
	begin_singleplayer_game
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> boss
		<difficulty2> = <difficulty>
	endif
	change current_song = <song_name>
	change current_difficulty = <difficulty>
	change current_difficulty2 = <difficulty2>
	change current_starttime = <starttime>
	change current_endtime = <endtime>
	change \{boss_play = 0}
	change \{showing_raise_axe = 0}
	Progression_SetProgressionNodeFlags
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> boss
		change current_boss = (<song_struct>.boss)
		change \{boss_battle = 1}
		change \{current_num_players = 2}
		change boss_oldcontroller = ($player2_status.controller)
		GetInputHandlerBotIndex \{player = 2}
		change structurename = player2_status controller = <controller>
		if StructureContains \{structure = $current_boss name = character_profile}
			profile = ($current_boss.character_profile)
			change structurename = player2_status character_id = <profile>
			change \{structurename = player2_status outfit = 1}
			change \{structurename = player2_status style = 1}
		endif
		printf \{channel = log "Starting bot for boss"}
	else
		if (($player2_status.bot_play = 1) || ($new_net_logic))
			change boss_oldcontroller = ($player2_status.controller)
			GetInputHandlerBotIndex \{player = 2}
			change structurename = player2_status controller = <controller>
			printf \{channel = log "Starting bot for player 2"}
		endif
	endif
	if ($player1_status.bot_play = 1)
		GetInputHandlerBotIndex \{player = 1}
		change structurename = player1_status controller = <controller>
		printf \{channel = log "Starting bot for player 1"}
	endif
	if ($game_mode = p2_battle)
		printf \{"Initiating Battlemode"}
		battlemode_init
	endif
	if ($boss_battle = 1)
		printf \{"Initiating BossBattle"}
		bossbattle_init
	endif
	if ($new_net_logic)
		new_net_logic_init
	endif
	printf \{"-------------------------------------"}
	printf \{"-------------------------------------"}
	printf \{"-------------------------------------"}
	printf \{"Now playing %s %d" s = $current_song d = $current_difficulty}
	printf \{"-------------------------------------"}
	printf \{"-------------------------------------"}
	printf \{"-------------------------------------"}
	song_start_time = <starttime>
	call_startup_scripts <...>
	setup_bg_viewport
	create_cameracuts <...>
	starttimeafterintro = <starttime>
	printf "Current Transition = %s" s = ($current_transition)
	if ($current_transition = None)
		change \{current_transition = fastintro}
	endif
	Transition_GetTime type = ($current_transition)
	starttime = (<starttime> - <transition_time>)
	setslomo \{0.001}
	reset_song_time starttime = <starttime>
	if NOT ($use_character_debug_cam = 1)
	endif
	create_movie_viewport
	create_crowd_models
	crowd_create_lighters
	Crowd_StageDiver_Hide
	change \{structurename = guitarist_info stance = stance_a}
	change \{structurename = guitarist_info next_stance = stance_a}
	change \{structurename = guitarist_info current_anim = idle}
	change \{structurename = guitarist_info cycle_anim = TRUE}
	change \{structurename = guitarist_info next_anim = None}
	change \{structurename = guitarist_info playing_missed_note = FALSE}
	change \{structurename = guitarist_info waiting_for_cameracut = FALSE}
	change \{structurename = bassist_info stance = stance_a}
	change \{structurename = bassist_info next_stance = stance_a}
	change \{structurename = bassist_info current_anim = idle}
	change \{structurename = bassist_info cycle_anim = TRUE}
	change \{structurename = bassist_info next_anim = None}
	change \{structurename = bassist_info playing_missed_note = FALSE}
	change \{structurename = bassist_info waiting_for_cameracut = FALSE}
	change \{structurename = vocalist_info stance = stance_a}
	change \{structurename = vocalist_info next_stance = stance_a}
	change \{structurename = vocalist_info current_anim = idle}
	change \{structurename = vocalist_info cycle_anim = TRUE}
	change \{structurename = vocalist_info next_anim = None}
	change \{structurename = drummer_info stance = stance_a}
	change \{structurename = drummer_info next_stance = stance_a}
	change \{structurename = drummer_info current_anim = idle}
	change \{structurename = drummer_info cycle_anim = TRUE}
	change \{structurename = drummer_info next_anim = None}
	change \{structurename = drummer_info twist = 0.0}
	change \{structurename = drummer_info desired_twist = 0.0}
	change \{structurename = drummer_info last_left_arm_note = 0}
	change \{structurename = drummer_info last_right_arm_note = 0}
	if (<training_mode> = 0)
		if NOT create_band \{async = 1}
			downloadcontentlost
		endif
	endif
	if ($game_mode = training)
		practicemode_init
	endif
	preload_song song_name = <song_name> starttime = <song_start_time>
	calc_score = TRUE
	if NOT (<devil_finish_restart> = 1 || $end_credits = 1)
		if ($use_last_player_scores = 0)
			reset_score \{player_status = player1_status}
		else
			change \{use_last_player_scores = 0}
			<calc_score> = FALSE
		endif
	endif
	reset_score \{player_status = player2_status}
	GetGlobalTags \{user_options}
	SetArrayElement \{arrayName = currently_holding
		globalarray
		index = 0
		newValue = 0}
	SetArrayElement \{arrayName = currently_holding
		globalarray
		index = 1
		newValue = 0}
	player = 1
	begin
	if (<player> = 2)
		if GotParam \{difficulty2}
			<difficulty> = <difficulty2>
		endif
	endif
	FormatText checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	FormatText textname = player_text 'p%i' i = <player> addtostringlookup
	change structurename = <player_status> guitar_volume = 0
	UpdateGuitarVolume
	GetGlobalTags \{user_options}
	if (<player> = 1)
		change structurename = <player_status> lefthanded_gems = (<lefty_flip_p1>)
		change structurename = <player_status> lefthanded_button_ups = (<lefty_flip_p1>)
	else
		if ($is_network_game = 0)
			change structurename = <player_status> lefthanded_gems = (<lefty_flip_p2>)
			change structurename = <player_status> lefthanded_button_ups = (<lefty_flip_p2>)
		endif
	endif
	get_resting_whammy_position controller = ($<player_status>.controller)
	if GotParam \{resting_whammy_position}
		change structurename = <player_status> resting_whammy_position = <resting_whammy_position>
	endif
	get_star_power_position controller = ($<player_status>.controller)
	if GotParam \{star_power_position}
		change structurename = <player_status> star_tilt_threshold = <star_power_position>
	endif
	if ($tutorial_disable_hud = 0)
		setup_hud <...>
	endif
	if ($output_gpu_log = 1)
		TextOutputStart
	endif
	if NOT GotParam \{no_score_update}
		SpawnScriptLater update_score_fast params = {<...>}
	endif
	if (($is_network_game) && ($player1_status.highway_layout = solo_highway))
		SpawnScriptLater \{update_score_fast params = {player_status = player2_status}}
	endif
	if (<training_mode> = 0)
		if NOT (<devil_finish_restart> = 1)
			crowd_reset <...>
		endif
	endif
	star_power_reset <...>
	difficulty_setup <...>
	setup_highway <...>
	if (<training_mode> = 0)
		reset_hud <...>
	endif
	spawnscriptnow gem_scroller params = {<...>}
	if ((<player> = 1) || ($new_net_logic) || ($is_network_game = 0))
		spawnscriptnow button_checker params = {<...>}
	endif
	if NOT (($is_network_game) && (<player> = 2))
		SpawnScriptLater check_for_star_power params = {<...>}
	endif
	if (<calc_score> = TRUE)
		calc_songscoreinfo player_status = <player_status>
	endif
	player = (<player> + 1)
	repeat $current_num_players
	GetPakManCurrent \{map = zones}
	if ($boss_battle = 1)
		if should_play_boss_intro
			if ($current_transition = boss)
				GH_SFX_Preload_Boss_Intro_Audio
			endif
		endif
	endif
	GH3_Set_Guitar_Verb_And_Echo_to_Dry
	Transition_Play type = ($current_transition)
	change \{current_transition = None}
	change \{check_for_unplugged_controllers = 1}
	wait \{1 gameframe}
	if ($is_network_game)
		SyncAndLaunchNetGame
		begin
		if (($net_ready_to_start) || ($player2_present = 0))
			ui_flow_manager_respond_to_action \{action = net_begin_song}
			ui_print_gamertags \{pos1 = (365.0, 50.0)
				pos2 = (940.0, 50.0)
				dims = (310.0, 25.0)
				just1 = [
					center
					top
				]
				just2 = [
					center
					top
				]
				offscreen = 1}
			break
		endif
		wait \{1 gameframe}
		repeat
	endif
	stoprendering
	destroy_loading_screen
	setslomo \{$current_speedfactor}
	if (($player2_present = 0) && ($is_network_game = 1))
		if NOT ((ScreenElementExists id = net_popup_container) || (ScriptIsRunning create_connection_lost_dialog))
			spawnscriptnow \{create_connection_lost_dialog}
		endif
	endif
	spawnscriptnow begin_song_after_intro params = {starttimeafterintro = <starttimeafterintro>}
	if ($boss_battle = 1)
		if ($show_boss_helper_screen = 1)
			disable_bg_viewport
			if ScreenElementExists \{id = battlemode_container}
				battlemode_container :setprops \{alpha = 0}
			endif
			GetPakManCurrent \{map = zones}
			if should_play_boss_intro
				spawnscriptnow \{wait_and_show_boss_helper_after_intro}
			else
				SpawnScriptLater \{show_boss_helper_now}
			endif
		else
			enable_bg_viewport
		endif
	endif
	mark_safe_for_shutdown
endscript
show_boss_helper_screen = 0

script wait_and_show_boss_helper_after_intro 
	disable_pause
	Transition_Wait
	kill_gem_scroller
	ui_flow_manager_respond_to_action \{action = battle_mode_helper}
	disable_pause
	change \{show_boss_helper_screen = 0}
endscript

script show_boss_helper_now 
	kill_gem_scroller
	ui_flow_manager_respond_to_action \{action = battle_mode_helper}
	change \{show_boss_helper_screen = 0}
endscript

script begin_song_after_intro 
	begin
	getsongtimems
	if (<time> >= <starttimeafterintro>)
		break
	endif
	wait \{1 gameframe}
	repeat
	begin_song
	if IsWinPort
		WinPortSongHighwaySync \{sync = 1}
	endif
endscript

script kill_gem_scroller \{no_render = 0}
	mark_unsafe_for_shutdown
	printf \{"kill_gem_scroller - Start"}
	if NOT GotParam \{restarting}
		stoprendering
	endif
	SongUnLoadFSBIfDownloaded
	disable_highway_prepass
	Kill_StarPower_Camera \{changecamera = 0}
	kill_walk_camera \{changecamera = 0}
	change \{structurename = player1_status star_power_amount = 0}
	change \{structurename = player2_status star_power_amount = 0}
	Kill_StarPower_StageFX player_text = ($player1_status.text) player_status = $player1_status ifempty = 0
	Kill_StarPower_StageFX player_text = ($player2_status.text) player_status = $player2_status ifempty = 0
	if ScreenElementExists \{id = starpower_container_leftp1}
		DoScreenElementMorph \{id = starpower_container_leftp1 alpha = 0}
	endif
	if ScreenElementExists \{id = starpower_container_leftp2}
		DoScreenElementMorph \{id = starpower_container_leftp2 alpha = 0}
	endif
	if ScreenElementExists \{id = starpower_container_rightp1}
		DoScreenElementMorph \{id = starpower_container_rightp1 alpha = 0}
	endif
	if ScreenElementExists \{id = starpower_container_rightp2}
		DoScreenElementMorph \{id = starpower_container_rightp2 alpha = 0}
	endif
	change \{showing_raise_axe = 0}
	kill_debug_elements
	GuitarEvent_ExitVenue
	destroy_cameracuts
	practicemode_deinit
	notemap_deinit
	destroy2dparticlesystem \{id = all}
	LaunchGemEvent \{event = kill_objects}
	destroy_credits_menu
	destroy_battle_alert_frames
	KillSpawnedScript \{name = move_2d_elements_to_default}
	KillSpawnedScript \{name = wait_and_play_you_rock_movie}
	KillSpawnedScript \{name = update_score_fast}
	KillSpawnedScript \{name = check_for_star_power}
	KillSpawnedScript \{name = wait_for_inactive}
	KillSpawnedScript \{name = pulsate_all_star_power_bulbs}
	KillSpawnedScript \{name = pulsate_star_power_bulb}
	KillSpawnedScript \{name = rock_meter_star_power_on}
	KillSpawnedScript \{name = rock_meter_star_power_off}
	KillSpawnedScript \{name = star_power_activate_and_drain}
	KillSpawnedScript \{name = hud_activated_star_power}
	KillSpawnedScript \{name = hud_move_note_scorebar}
	KillSpawnedScript \{name = hud_flash_red_bg_p1}
	KillSpawnedScript \{name = hud_flash_red_bg_p2}
	KillSpawnedScript \{name = hud_flash_red_bg_kill}
	KillSpawnedScript \{name = hud_lightning_alert}
	KillSpawnedScript \{name = hud_show_note_streak_combo}
	KillSpawnedScript \{name = highway_pulse_multiplier_loss}
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	FormatText textname = player_text 'p%i' i = <player> addtostringlookup
	change structurename = <player_status> star_power_used = 0
	GuitarEvent_KillSong <...>
	destroy_hud <...>
	destroy_highway <...>
	battlemode_deinit <...>
	bossbattle_deinit <...>
	faceoff_deinit <...>
	faceoff_volumes_deinit <...>
	player = (<player> + 1)
	repeat $max_num_players
	kill_startup_script <...>
	KillSpawnedScript \{name = GuitarEvent_MissedNote}
	KillSpawnedScript \{name = GuitarEvent_UnnecessaryNote}
	KillSpawnedScript \{name = GuitarEvent_HitNotes}
	KillSpawnedScript \{name = GuitarEvent_HitNote}
	KillSpawnedScript \{name = GuitarEvent_StarPowerOn}
	KillSpawnedScript \{name = GuitarEvent_StarPowerOff}
	KillSpawnedScript \{name = GuitarEvent_StarHitNote}
	KillSpawnedScript \{name = GuitarEvent_StarSequenceBonus}
	KillSpawnedScript \{name = GuitarEvent_StarMissNote}
	KillSpawnedScript \{name = GuitarEvent_WhammyOn}
	KillSpawnedScript \{name = GuitarEvent_WhammyOff}
	KillSpawnedScript \{name = GuitarEvent_StarWhammyOn}
	KillSpawnedScript \{name = GuitarEvent_StarWhammyOff}
	KillSpawnedScript \{name = GuitarEvent_Note_Window_Open}
	KillSpawnedScript \{name = GuitarEvent_Note_Window_Close}
	KillSpawnedScript \{name = GuitarEvent_crowd_poor_medium}
	KillSpawnedScript \{name = GuitarEvent_crowd_medium_good}
	KillSpawnedScript \{name = GuitarEvent_crowd_medium_poor}
	KillSpawnedScript \{name = GuitarEvent_crowd_good_medium}
	KillSpawnedScript \{name = GuitarEvent_CreateFirstGem}
	KillSpawnedScript \{name = highway_pulse_black}
	KillSpawnedScript \{name = GuitarEvent_HitNote_Spawned}
	KillSpawnedScript \{name = hit_note_fx}
	KillSpawnedScript \{name = Do_StarPower_StageFX}
	KillSpawnedScript \{name = do_starpower_camera}
	KillSpawnedScript \{name = first_gem_fx}
	KillSpawnedScript \{name = gem_iterator}
	KillSpawnedScript \{name = gem_array_stepper}
	KillSpawnedScript \{name = gem_array_events}
	KillSpawnedScript \{name = gem_step}
	KillSpawnedScript \{name = gem_step_end}
	KillSpawnedScript \{name = fretbar_iterator}
	KillSpawnedScript \{name = Strum_iterator}
	KillSpawnedScript \{name = FretPos_iterator}
	KillSpawnedScript \{name = FretFingers_iterator}
	KillSpawnedScript \{name = Drum_iterator}
	KillSpawnedScript \{name = Drum_cymbal_iterator}
	KillSpawnedScript \{name = WatchForStartPlaying_iterator}
	KillSpawnedScript \{name = gem_scroller}
	KillSpawnedScript \{name = button_checker}
	KillSpawnedScript \{name = check_buttons}
	KillSpawnedScript \{name = check_buttons_fast}
	KillSpawnedScript \{name = net_check_buttons}
	KillSpawnedScript \{name = fretbar_update_tempo}
	KillSpawnedScript \{name = fretbar_update_hammer_on_tolerance}
	KillSpawnedScript \{name = move_whammy}
	KillSpawnedScript \{name = create_fretbar}
	KillSpawnedScript \{name = move_highway_2d}
	KillSpawnedScript \{name = move_highway_prepass}
	KillSpawnedScript \{name = GuitarEvent_PreFretbar}
	KillSpawnedScript \{name = GuitarEvent_Fretbar}
	KillSpawnedScript \{name = check_note_hold}
	KillSpawnedScript \{name = net_check_note_hold}
	KillSpawnedScript \{name = star_power_whammy}
	KillSpawnedScript \{name = show_star_power_ready}
	KillSpawnedScript \{name = hud_glowburst_alert}
	change \{star_power_ready_on_p1 = 0}
	change \{star_power_ready_on_p2 = 0}
	KillSpawnedScript \{name = event_iterator}
	KillSpawnedScript \{name = win_song}
	KillSpawnedScript \{name = hand_note_iterator}
	KillSpawnedScript \{name = kill_object_later}
	KillSpawnedScript \{name = waitAndKillHighway}
	KillSpawnedScript \{name = testlevel_debug}
	KillSpawnedScript \{name = show_coop_raise_axe_for_starpower}
	KillSpawnedScript \{name = net_whammy_pitch_shift}
	KillSpawnedScript \{name = Crowd_AllPlayAnim}
	KillSpawnedScript \{name = hud_activated_star_power_spawned}
	KillSpawnedScript \{name = dispatch_player_state}
	KillSpawnedScript \{name = network_events}
	KillSpawnedScript \{name = online_win_song}
	new_net_logic_deinit
	destroy_net_popup
	destroy_gamertags
	LightShow_Shutdown
	Kill_LightShow_FX
	DestroyParticlesByGroupID \{groupid = zoneparticles}
	Transition_KillAll
	KillSpawnedScript \{name = GuitarEvent_SongFailed_Spawned}
	KillSpawnedScript \{name = play_intro}
	KillSpawnedScript \{name = begin_song_after_intro}
	hud_flash_red_bg_kill \{player = 1}
	hud_flash_red_bg_kill \{player = 2}
	printf \{"kill_gem_scroller - Killing Event Scripts"}
	KillSpawnedScript \{id = song_event_scripts}
	printf \{"kill_gem_scroller - Killing Event Scripts Finished"}
	KillSpawnedScript \{id = zone_scripts}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = zone_killsong '%s_KillSong' s = <pakname>
	if ScriptExists <zone_killsong>
		<zone_killsong>
	endif
	Destroy_AllWhammyFX
	LS_ResetVenueLights
	destroy_movie_viewport
	destroy_crowd_models
	destroy_bg_viewport
	destroy_intro
	destroy_band
	change \{structurename = guitarist_info stance = stance_frontend}
	change \{structurename = guitarist_info next_stance = stance_frontend}
	change \{structurename = guitarist_info current_anim = idle}
	change \{structurename = guitarist_info cycle_anim = TRUE}
	change \{structurename = guitarist_info next_anim = None}
	change \{structurename = guitarist_info playing_missed_note = FALSE}
	change \{structurename = bassist_info stance = stance_frontend}
	change \{structurename = bassist_info next_stance = stance_frontend}
	change \{structurename = bassist_info current_anim = idle}
	change \{structurename = bassist_info cycle_anim = TRUE}
	change \{structurename = bassist_info next_anim = None}
	change \{structurename = bassist_info playing_missed_note = FALSE}
	destroy_debug_measure_text
	kill_character_scripts
	change \{check_for_unplugged_controllers = 0}
	shut_down_practice_mode
	destroy_menu \{menu_id = you_rock_container}
	KillMovie \{textureslot = 1}
	printf \{"kill_gem_scroller - waiting for dead objects"}
	wait \{2 gameframes}
	printf \{"kill_gem_scroller - waiting for dead objects End"}
	end_song
	if NOT (<no_render> = 1)
		if ($shutdown_game_for_signin_change_flag = 0)
			startrendering
		endif
	endif
	printf \{"kill_gem_scroller - End"}
	mark_safe_for_shutdown
	change \{playing_song = 0}
endscript

script restart_gem_scroller \{no_render = 0}
	mark_unsafe_for_shutdown
	disable_pause
	if GotParam \{replay}
		change \{input_mode = play}
		ReadDataBuffer name = replay filename = <replay>
		DataBufferGetChecksum \{name = replay}
		<song_name> = <checksum>
		DataBufferGetChecksum \{name = replay}
		change current_transition = <checksum>
		DataBufferGetInt \{name = replay}
		if (<int> > 0)
			change current_num_players = <int>
			DataBufferGetInt \{name = replay}
			change structurename = player1_status controller = <int>
			DataBufferGetInt \{name = replay}
			change structurename = player2_status controller = <int>
		else
			change \{current_num_players = 1}
			DataBufferGetInt \{name = replay}
			DataBufferGetInt \{name = replay}
			change \{structurename = player1_status controller = -1}
			change \{structurename = player2_status controller = -1}
		endif
		DataBufferGetChecksum \{name = replay bytes = 16}
		<difficulty> = <checksum>
		DataBufferGetChecksum \{name = replay bytes = 16}
		<difficulty2> = <checksum>
		DataBufferGetInt \{name = replay}
		<seed1> = <int>
		DataBufferGetInt \{name = replay}
		<seed2> = <int>
		DataBufferGetInt \{name = replay}
		<seed3> = <int>
		DataBufferGetInt \{name = replay}
		<seed4> = <int>
		DataBufferGetInt \{name = replay}
		<seed5> = <int>
		DataBufferGetInt \{name = replay}
		<seed6> = <int>
		SetRandomSeeds seed1 = <seed1> seed2 = <seed2> seed3 = <seed3> seed4 = <seed4> seed5 = <seed5> seed6 = <seed6>
		change \{replay_suspend = 1}
	else
		change \{input_mode = record}
	endif
	pausegame
	LaunchEvent \{type = unfocus target = root_window}
	printf "Starting new song %s on %l" s = <song_name> l = <difficulty>
	kill_gem_scroller no_render = <no_render> restarting
	start_gem_scroller <...>
	change \{check_for_unplugged_controllers = 1}
	UnBindGuitarControllerStatus
	LaunchEvent \{type = focus target = root_window}
	gh3_start_pressed
endscript

script reset_song_time \{starttime = 0}
	change current_deltatime = (1.0 / 60.0)
	change current_time = (<starttime> / 1000.0)
	if ($input_mode = play)
		change \{replay_suspend = 0}
	endif
	ResetSongTimer starttime = (<starttime> / 1000.0)
endscript

script fill_input_array 
	FillInputArray <...>
endscript

script create_gem 
	Create2DGem <...>
endscript

script gem_iterator \{song_name = test
		difficulty = easy
		array_type = "song"
		player = 1}
	get_difficulty_text_nl difficulty = <difficulty>
	spawnscriptnow gem_array_events params = {<...> difficulty_text_nl = <difficulty_text_nl>}
	if GotParam \{use_input_array}
		spawnscriptnow gem_array_stepper params = {<...>}
	else
		spawnscriptnow gem_array_stepper params = {<...> difficulty = easy difficulty_text_nl = 'easy'}
		spawnscriptnow gem_array_stepper params = {<...> difficulty = medium difficulty_text_nl = 'medium'}
		spawnscriptnow gem_array_stepper params = {<...> difficulty = hard difficulty_text_nl = 'hard'}
		spawnscriptnow gem_array_stepper params = {<...> difficulty = expert difficulty_text_nl = 'expert'}
	endif
endscript

script gem_array_events 
	printf "Changing event receivers... %i %d" i = <iterator_text> d = <difficulty_text_nl>
	cleareventhandlergroup \{iterator_group}
	extendcrc gem_step_event <player_text> out = id
	extendcrc <id> <iterator_text> out = id
	extendcrc <id> <difficulty_text_nl> out = id
	seteventhandler Response = call_script event = <id> scr = gem_step params = {<...>} group = iterator_group
	extendcrc gem_step_end <player_text> out = id
	extendcrc <id> <iterator_text> out = id
	extendcrc <id> <difficulty_text_nl> out = id
	seteventhandler Response = call_script event = <id> scr = gem_step_end params = {<...>} group = iterator_group
	if NOT GotParam \{use_input_array}
		extendcrc change_difficulty <player_text> out = id
		seteventhandler Response = switch_script event = <id> scr = gem_array_events params = {<...>} group = iterator_group
	endif
	Block
endscript

script gem_step 
	GemStep
endscript

script gem_step_end 
endscript

script gem_array_stepper 
	gem_array_stepper_CFunc_Setup
	begin
	if gem_array_stepper_CFunc
		break
	endif
	wait \{1 gameframe}
	repeat
	gem_array_stepper_CFunc_Cleanup
endscript

script default_startup 
endscript

script call_startup_scripts 
	change \{current_startup_script = default_startup}
	change \{time_gem_offset = $default_gem_offset}
	GetGlobalTags \{user_options}
	change \{time_input_offset = $default_input_offset}
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> name = startup_script
		change current_startup_script = (<song_struct>.startup_script)
	endif
	if StructureContains structure = <song_struct> name = exit_script
		change current_exit_script = (<song_struct>.exit_script)
	else
	endif
	if StructureContains structure = <song_struct> name = gem_offset
		change time_gem_offset = ($time_gem_offset + (<song_struct>.gem_offset))
	endif
	if StructureContains structure = <song_struct> name = input_offset
		change time_input_offset = ($time_input_offset + (<song_struct>.input_offset))
	endif
	if StructureContains structure = <song_struct> name = hammer_on_measure_scale
		change hammer_on_measure_scale = (<song_struct>.hammer_on_measure_scale)
	else
		change \{hammer_on_measure_scale = $default_hammer_on_measure_scale}
	endif
	if ($game_mode = training && $in_menu_choose_practice_section = 0 && $current_speedfactor != 1.0)
		if ($current_speedfactor >= 0.8)
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slow)
		elseif ($current_speedfactor >= 0.6)
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slower)
		else
			pitchshiftoffset = ($default_practice_mode_pitchshift_offset_slowest)
		endif
		change time_gem_offset = ($time_gem_offset + <pitchshiftoffset> + $default_practice_mode_geminput_offset)
		change time_input_offset = ($time_input_offset + <pitchshiftoffset> + $default_practice_mode_geminput_offset)
		change default_drums_offset = ($default_drums_offset + <pitchshiftoffset> - $default_practice_mode_geminput_offset)
	endif
	spawnscriptnow ($current_startup_script) params = {<...>}
endscript

script kill_startup_script 
	if NOT ($current_startup_script = nothing)
		KillSpawnedScript name = ($current_startup_script)
	endif
	if NOT ($current_exit_script = nothing)
		spawnscriptnow ($current_exit_script) params = {<...>}
	endif
endscript

script Load_Venue \{block_scripts = 0}
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		if (<pakname> = (($LevelZones.$current_level).name))
			Transitions_ResetZone
			return
		else
			ResetWaypoints
			SetPakManCurrentBlock \{map = zones pak = None}
		endif
	else
		ResetWaypoints
	endif
	ResetPulseEvents
	FormatText textname = filename '%s.pak' s = (($LevelZones.$current_level).name)
	GetContentFolderIndexFromFile <filename>
	if (<device> = content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			downloadcontentlost
			return
		endif
	endif
	if NOT SetPakManCurrentBlock map = zones pak = (($LevelZones.$current_level).zone) block_scripts = <block_scripts>
		downloadcontentlost
		return
	endif
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
	endif
	GH3_Change_crowd_reverb_settings_by_Venue
endscript

script start_song \{device_num = 0 practice_intro = 0 endtime = 999999999}
	mark_unsafe_for_shutdown
	set_rich_presence_game_mode
	MassiveInit \{sku = 'atvi_guitar_hero_3_pc_na' startzone = 'GlobalZone'}
	Load_Venue
	Transition_SelectTransition practice_intro = <practice_intro>
	if NOT (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_coop) || ($game_mode = p2_battle) || ($game_mode = p2_career))
		change player1_device = (<device_num>)
		change structurename = player1_status controller = (<device_num>)
	else
		change \{structurename = player1_status controller = $player1_device}
		change \{structurename = player2_status controller = $player2_device}
		printf "Pads assigned: Player 1: %p Player 2: %q" p = ($player1_status.controller) q = ($player2_status.controller)
	endif
	change \{battle_sudden_death = 0}
	if ($game_mode = p2_battle)
		change \{save_current_powerups_p1 = [0 0 0]}
		change \{save_current_powerups_p2 = [0 0 0]}
		change \{structurename = player1_status save_num_powerups = 0}
		change \{structurename = player2_status save_num_powerups = 0}
		change \{structurename = player1_status save_health = 0.0}
		change \{structurename = player2_status save_health = 0.0}
	endif
	if NOT GotParam \{starttime}
		if GotParam \{uselaststarttime}
			starttime = ($current_starttime)
		else
			starttime = 0
		endif
	endif
	if NOT GotParam \{difficulty2}
		difficulty2 = ($current_difficulty2)
	endif
	if NOT GotParam \{difficulty}
		difficulty = ($current_difficulty)
	endif
	if NOT GotParam \{song_name}
		song_name = ($current_song)
	endif
	restart_gem_scroller song_name = <song_name> difficulty = <difficulty> difficulty2 = <difficulty2> starttime = <starttime> practice_intro = <practice_intro> endtime = <endtime>
	change \{check_for_unplugged_controllers = 1}
endscript

script restart_song \{practice_intro = 0 sudden_death = 0}
	kill_start_key_binding
	create_loading_screen \{mode = restart_song}
	if ($is_network_game = 0)
		xenon_singleplayer_session_init
	endif
	if (<sudden_death> = 0)
		change \{battle_sudden_death = 0}
	endif
	if ($game_mode = p2_battle)
		if NOT (<sudden_death> = 1)
			change \{save_current_powerups_p1 = [0 0 0]}
			change \{save_current_powerups_p2 = [0 0 0]}
			change \{structurename = player1_status save_num_powerups = 0}
			change \{structurename = player2_status save_num_powerups = 0}
			change \{structurename = player1_status save_health = 0.0}
			change \{structurename = player2_status save_health = 0.0}
		endif
	endif
	if ($current_song = bosstom || $current_song = bossslash)
		change boss_wuss_out = ($boss_wuss_out + 1)
		printf \{channel = trchen "Boss Wuss Out %s" s = $boss_wuss_out}
	endif
	stopsoundevent \{Crowd_Fail_Song_SFX}
	if (<practice_intro> = 0)
		change \{current_transition = fastintro}
		if ($coop_dlc_active = 0)
			get_progression_globals game_mode = ($game_mode) use_current_tab = 1
			tier = ($setlist_selection_tier)
			if ($game_mode = p1_career || $game_mode = p2_career)
				if Progression_IsEncoreSong tier_global = <tier_global> tier = <tier> song = ($current_song)
					change \{current_transition = restartencore}
				endif
			endif
			if Progression_IsBossSong tier_global = <tier_global> tier = <tier> song = ($current_song)
				change \{current_transition = restartboss}
			endif
		endif
	endif
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) practice_intro = <practice_intro> endtime = <endtime>
endscript

script kill_object_later 
	begin
	if ScreenElementExists id = <gem_id>
		GetScreenElementPosition id = <gem_id> local
		py = (<screenelementpos>.(0.0, 1.0))
		if (<py> >= $highway_playline)
			DestroyGem name = <gem_id>
			break
		endif
		wait \{1 gameframe}
	else
		break
	endif
	repeat
endscript

script debug_flash_star 
	begin
	LaunchGemEvent \{event = debug_star}
	wait \{8 gameframes}
	LaunchGemEvent \{event = debug_gem}
	wait \{8 gameframes}
	repeat
endscript
