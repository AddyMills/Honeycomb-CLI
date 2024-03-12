guitarist_info = {
	anim_set = judy_animations
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	guitar_model = None
	playing_missed_note = FALSE
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = stance_frontend
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	waiting_for_cameracut = FALSE
	allow_movement = TRUE
	target_node = None
	facial_anim = idle
	Scale = 1.0
}
bassist_info = {
	anim_set = axel_animations
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	bass_model = None
	playing_missed_note = FALSE
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = FALSE
	next_stance = stance_frontend
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	waiting_for_cameracut = FALSE
	allow_movement = TRUE
	target_node = None
	facial_anim = idle
	Scale = 1.0
}
vocalist_info = {
	anim_set = vocalist_animations
	stance = stance_a
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = FALSE
	next_stance = stance_a
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	allow_movement = TRUE
	target_node = None
	facial_anim = idle
	Scale = 1.0
}
drummer_info = {
	twist = 0.0
	desired_twist = 0.0
	anim_set = drummer_animations
	stance = stance_a
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = FALSE
	next_stance = stance_a
	next_anim = None
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = FALSE
	last_anim_name = None
	allow_movement = TRUE
	target_node = None
	facial_anim = idle
	last_left_arm_note = 0
	last_right_arm_note = 0
	Scale = 1.0
}
current_bass_model = None

script create_band \{async = 0}
	if ($disable_band = 1)
		return
	endif
	GetPakManCurrent \{map = zones}
	if (<pak> = z_credits)
		if NOT create_guitarist async = <async>
			return \{FALSE}
		endif
		unload_character \{name = bassist}
		unload_character \{name = vocalist}
		unload_character \{name = drummer}
		set_bandvisible
		return \{TRUE}
	endif
	if ($current_num_players = 1)
		if NOT create_guitarist async = <async>
			return \{FALSE}
		endif
		if NOT create_drummer async = <async>
			return \{FALSE}
		endif
		get_song_struct song = ($current_song)
		if StructureContains structure = <song_struct> name = bassist
			bassist_profile = (<song_struct>.bassist)
			if NOT create_bassist profile_name = <bassist_profile> async = <async>
				return \{FALSE}
			endif
		else
			if NOT create_bassist async = <async>
				return \{FALSE}
			endif
		endif
		if StructureContains structure = <song_struct> name = singer
			if (<song_struct>.singer = None)
				if CompositeObjectExists \{name = vocalist}
					unload_character \{name = vocalist}
				endif
			else
				if (<pak> = Z_Wikker || <pak> = z_budokan || <pak> = z_hell)
					if (<song_struct>.singer = Female)
						singer_profile = 'singer_female_alt'
					elseif (<song_struct>.singer = bRet)
						singer_profile = 'singer_bret_alt'
					else
						singer_profile = 'singer_alt'
					endif
				else
					if (<song_struct>.singer = Female)
						singer_profile = 'singer_female'
					elseif (<song_struct>.singer = bRet)
						singer_profile = 'singer_bret'
					else
						singer_profile = 'singer'
					endif
				endif
				if ($Cheat_BretMichaels = 1)
					if NOT (<song_struct>.singer = Female)
						singer_profile = 'singer_bret'
					endif
				endif
				if NOT create_vocalist profile_name = <singer_profile> async = <async>
					return \{FALSE}
				endif
			endif
		else
			if ($Cheat_BretMichaels = 1)
				singer_profile = 'singer_bret'
			else
				singer_profile = 'singer'
			endif
			if NOT create_vocalist profile_name = <singer_profile> async = <async>
				return \{FALSE}
			endif
		endif
	else
		unload_character \{name = vocalist}
		if NOT create_guitarist name = guitarist async = <async>
			return \{FALSE}
		endif
		if NOT create_guitarist name = bassist async = <async>
			return \{FALSE}
		endif
		if NOT create_drummer async = <async>
			return \{FALSE}
		endif
	endif
	set_bandvisible
	return \{TRUE}
endscript

script create_guitarist_profile 
	player2_is_lead = FALSE
	if ($current_num_players = 2)
		if (($game_mode = p2_career) || ($game_mode = p2_coop))
			if NOT ($player1_status.part = guitar)
				player2_is_lead = TRUE
			endif
		endif
	endif
	if ((<name> = guitarist && <player2_is_lead> = FALSE) || (<name> = bassist && <player2_is_lead> = TRUE))
		player_status = player1_status
	else
		player_status = player2_status
	endif
	found = 0
	find_profile_by_id id = ($<player_status>.character_id)
	<found> = 1
	if (<found> = 1)
		if GotParam \{no_guitar}
			<instrument_id> = None
		else
			if ($boss_battle = 1 && <name> = bassist)
				get_musician_profile_struct index = <index>
				<instrument_id> = (<profile_struct>.musician_instrument.desc_id)
			else
				<instrument_id> = ($<player_status>.instrument_id)
			endif
		endif
		if ($Cheat_AirGuitar = 1)
			if NOT ($is_network_game)
				<instrument_id> = None
			endif
		endif
		outfit = ($<player_status>.outfit)
		style = ($<player_status>.style)
		get_musician_profile_struct index = <index>
		character_name = (<profile_struct>.name)
		FormatText checksumname = body_id 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = <style>
		profile = {<profile_struct>
			musician_instrument = {desc_id = <instrument_id>}
			musician_body = {desc_id = <body_id>}
			download_musician_instrument = {desc_id = <instrument_id>}
			download_musician_body = {desc_id = <body_id>}
			outfit = <outfit>}
	endif
	return <...>
endscript

script create_guitarist \{name = guitarist
		profile_name = 'judy'
		instrument_id = Instrument_Les_Paul_Black
		async = 0
		animpak = 1}
	extendcrc <name> '_Info' out = info_struct
	printf channel = animinfo "creating guitarist - %a ........." a = <name>
	create_guitarist_profile <...>
	character_id = ($<player_status>.character_id)
	if (<found> = 1)
		if GotParam \{node_name}
			waypoint_id = <node_name>
		else
			get_start_node_id member = <name>
		endif
		if DoesWayPointExist name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		cleareventhandlergroup \{hand_events}
		if NOT create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
			return \{FALSE}
		endif
		find_profile_by_id id = <character_id>
		FormatText textname = highway_name 'Guitarist_%n_Outfit%o_Style%s' n = (<profile_struct>.name) o = <outfit> s = <style>
		AddToMaterialLibrary scene = <highway_name>
		FormatText checksumname = highway_material 'sys_%a_1_highway_sys_%a_1_highway' a = (<profile_struct>.name)
		change structurename = <player_status> highway_material = <highway_material>
		change structurename = <player_status> band_member = <name>
		get_musician_profile_struct index = <index>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		change structurename = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		change structurename = <info_struct> strum = (<profile_struct>.strum_anims)
		change structurename = <info_struct> allow_movement = TRUE
		change structurename = <info_struct> arms_disabled = 0
		change structurename = <info_struct> disable_arms = 0
		change structurename = <info_struct> next_stance = ($<info_struct>.stance)
		if StructureContains structure = <profile_struct> name = Scale
			scale_x = ((<profile_struct>.Scale).(1.0, 0.0, 0.0))
			scale_y = ((<profile_struct>.Scale).(0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.Scale).(0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_y>) || (<scale_y> != <scale_z>))
				scriptassert \{"Attempting to create a guitarist with a non-uniform scale!"}
			endif
			printf channel = newdebug "found scale in character profile! %a ......." a = (<profile_struct>.Scale)
			change structurename = <info_struct> Scale = <scale_x>
		else
			change structurename = <info_struct> Scale = 1.0
		endif
		stance = ($<info_struct>.stance)
		printf channel = animinfo "creating guitarist in stance %a ........" a = <stance>
		if (<stance> = stance_frontend || <stance> = stance_frontend_guitar)
			change structurename = <info_struct> arms_disabled = 2
			change structurename = <info_struct> disable_arms = 2
			<name> :hero_toggle_arms num_arms = 0 prev_num_arms = 2 blend_time = 0.0
		else
			<name> :hero_toggle_arms num_arms = 1 prev_num_arms = 0 blend_time = 0.0
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($<info_struct>.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		if NOT GotParam \{no_strum}
			<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
			<name> :hero_play_fret_anim anim = (<fret_anims>.track_123)
			<name> :hero_play_finger_anim anim = (<finger_anims>.track_none)
		endif
		if IsWinPort
			if NOT (<character_id> = ripper)
				<name> :ragdoll_setaccessorybones accessory_bones = $Guitarist_accessory_bones
			endif
		else
			<name> :ragdoll_setaccessorybones accessory_bones = $Guitarist_accessory_bones
		endif
		<name> :Obj_SwitchScript guitarist_idle
		<name> :obj_spawnscriptnow facial_anim_loop
		if GotParam \{no_anim}
			spawnscriptnow temp_hero_pause_script params = {name = <name>}
		endif
		<name> :Obj_ForceUpdate
	else
		printf \{"profile not found in create_guitarist! ........."}
	endif
	return \{TRUE}
endscript

script temp_hero_pause_script 
	wait \{1 gameframes}
	if <name> :anim_animnodeexists id = bodytimer
		<name> :anim_command target = bodytimer command = timer_setspeed params = {Speed = 0.0}
	endif
endscript

script create_bassist \{name = bassist profile_name = 'bassist' async = 0}
	extendcrc <name> '_Info' out = info_struct
	printf channel = animinfo "creating bassist - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if DoesWayPointExist name = <waypoint_id>
			GetWaypointPos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct index = <index>
		if ($current_bass_model = None)
			profile = <profile_struct>
		else
			profile = {
				<profile_struct>
				musician_instrument = {desc_id = ($current_bass_model)}
			}
		endif
		if NOT create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
			return \{FALSE}
		endif
		get_musician_profile_struct index = <index>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		change structurename = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		change structurename = <info_struct> strum = (<profile_struct>.strum_anims)
		change structurename = <info_struct> allow_movement = TRUE
		change structurename = <info_struct> arms_disabled = 0
		change structurename = <info_struct> disable_arms = 0
		if StructureContains structure = <profile_struct> name = Scale
			scale_x = ((<profile_struct>.Scale) * (1.0, 0.0, 0.0))
			scale_y = ((<profile_struct>.Scale) * (0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.Scale) * (0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_y>) || (<scale_y> != <scale_z>))
				scriptassert \{"Attempting to create a guitarist with a non-uniform scale!"}
			endif
			printf channel = newdebug "found scale in character profile! %a ......." a = (<profile_struct>.Scale)
			change structurename = <info_struct> Scale = <scale_x>
		else
			change structurename = <info_struct> Scale = 1.0
		endif
		if GotParam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($bassist_info.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		if NOT GotParam \{no_strum}
			<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
			<name> :hero_play_fret_anim anim = (<fret_anims>.track_106)
			<name> :hero_play_finger_anim anim = (<finger_anims>.track_none)
		endif
		<name> :ragdoll_setaccessorybones accessory_bones = $Guitarist_accessory_bones
		<name> :Obj_SwitchScript guitarist_idle
		<name> :obj_spawnscriptnow facial_anim_loop
	else
		printf \{"profile not found in create_bassist! ........."}
	endif
	return \{TRUE}
endscript

script create_vocalist \{name = vocalist profile_name = 'singer' async = 0}
	extendcrc <name> '_Info' out = info_struct
	printf "creating vocalist - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if DoesWayPointExist name = <waypoint_id>
			GetWaypointPos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct index = <index>
		if NOT create_band_member name = <name> profile = <profile_struct> start_node = <waypoint_id> <...>
			return \{FALSE}
		endif
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> allow_movement = TRUE
		if GotParam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		<name> :ragdoll_setaccessorybones accessory_bones = $Guitarist_accessory_bones
		<name> :Obj_SwitchScript bandmember_idle
		<name> :obj_spawnscriptnow facial_anim_loop
	else
		printf \{"profile not found in create_vocalist! ........."}
	endif
	return \{TRUE}
endscript

script create_drummer \{name = drummer profile_name = 'drummer' async = 0}
	extendcrc <name> '_Info' out = info_struct
	printf "creating drummer - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if DoesWayPointExist name = <waypoint_id>
			GetWaypointPos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct index = <index>
		if NOT create_band_member name = <name> profile = <profile_struct> start_node = <waypoint_id> <...>
			return \{FALSE}
		endif
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> allow_movement = TRUE
		if GotParam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		<name> :ragdoll_setaccessorybones accessory_bones = $Guitarist_accessory_bones
		<name> :obj_killspawnedscript name = drummer_autotwist
		<name> :obj_spawnscriptnow drummer_autotwist
		<name> :Obj_SwitchScript bandmember_idle
		<name> :obj_spawnscriptnow facial_anim_loop
		change \{structurename = drummer_info last_left_arm_note = 0}
		change \{structurename = drummer_info last_right_arm_note = 0}
	else
		printf \{"profile not found in create_drummer! ........."}
	endif
	return \{TRUE}
endscript

script drummer_autotwist 
	hero_play_anim \{tree = $drummer_twist_branch
		target = BodyTwist
		anim = Test_Drum_BodyTwist_D
		blendduration = 0.0}
	change_rate = 0.18
	begin
	twist = ($drummer_info.twist)
	compute_desired_drummer_twist
	diff = (<desired_twist> - <twist>)
	if (<twist> < <desired_twist>)
		if (<diff> < $drummer_twist_rate)
			twist = <desired_twist>
		else
			twist = (<twist> + $drummer_twist_rate)
		endif
	elseif (<twist> > <desired_twist>)
		if ((<diff> * -1) < $drummer_twist_rate)
			twist = <desired_twist>
		else
			twist = (<twist> - $drummer_twist_rate)
		endif
	endif
	drummer_twist strength = <twist>
	change structurename = drummer_info twist = <twist>
	wait \{1 gameframe}
	repeat
endscript

script unload_character 
	destroy_band_member name = <name>
endscript

script unload_band 
	destroy_band_member \{name = guitarist}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = drummer}
	destroy_band_member \{name = vocalist}
	force_unload_all_character_paks
endscript

script hero_play_random_anim \{blendduration = 0.2}
	GetArraySize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if GotParam \{Cycle}
		hero_play_anim anim = <anim_name> blendduration = <blendduration> Cycle
	else
		hero_play_anim anim = <anim_name> blendduration = <blendduration>
	endif
endscript

script should_display_debug_info 
	obj_getid
	display_info = FALSE
	switch (<ObjID>)
		case guitarist
		if ($display_guitarist_anim_info = TRUE)
			display_info = TRUE
		endif
		case bassist
		if ($display_bassist_anim_info = TRUE)
			display_info = TRUE
		endif
		case vocalist
		if ($display_vocalist_anim_info = TRUE)
			display_info = TRUE
		endif
		case drummer
		if ($display_drummer_anim_info = TRUE)
			display_info = TRUE
		endif
	endswitch
	return <display_info>
endscript

script hero_play_random_anims 
	count = 0
	begin
	hero_play_random_anim anims = <anim_array>
	hero_wait_until_anim_finished
	count = (<count> + 1)
	if GotParam \{repeat_count}
		if (<count> = <repeat_count>)
			break
		endif
	endif
	repeat
endscript

script hero_play_adjusting_random_anims \{blend_time = 0.2}
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	count = 0
	begin
	anim = ($<info_struct>.current_anim)
	Cycle = ($<info_struct>.cycle_anim)
	repeat_count = ($<info_struct>.anim_repeat_count)
	if (<ObjID> = guitarist || <ObjID> = bassist)
		if (($<info_struct>.disable_arms) = 2)
			if ($<info_struct>.arms_disabled != 2)
				hero_toggle_arms num_arms = 0 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 2
			endif
		elseif (($<info_struct>.disable_arms) = 1)
			if ($<info_struct>.arms_disabled != 1)
				hero_toggle_arms num_arms = 1 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 1
			endif
		else
			if ($<info_struct>.arms_disabled != 0)
				hero_toggle_arms num_arms = 2 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 0
			endif
		endif
	endif
	if (<ObjID> = guitarist)
		if NOT (<anim> = idle)
			change structurename = <info_struct> facial_anim = <anim>
		endif
	endif
	if hero_play_tempo_anim_cfunc anim = <anim> blendduration = <blend_time>
		hero_play_anim anim = <anim_to_run> blendduration = <blend_duration> usemotionextraction = <use_motion_extraction>
		hero_wait_until_anim_finished
	else
		wait \{1 gameframe}
	endif
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = TRUE
	endif
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	next_stance = ($<info_struct>.next_stance)
	stance_changed = FALSE
	if NOT (<next_stance> = <stance>)
		if (<display_debug_info> = TRUE)
			printf channel = animinfo "%c stance now changing from %a to %b............" c = <ObjID> a = <stance> b = <next_stance>
		endif
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <stance> new_stance = <next_stance>
			hero_play_anim anim = <anim_to_run>
			hero_wait_until_anim_finished
		endif
		change structurename = <info_struct> stance = <next_stance>
		stance = <next_stance>
		stance_changed = TRUE
	endif
	next_anim = ($<info_struct>.next_anim)
	if (<next_anim> = None && <stance_changed> = FALSE)
		if (<Cycle> = FALSE)
			repeat_count = (<repeat_count> - 1)
			if (<repeat_count> < 1)
				if (<display_debug_info> = TRUE)
					printf channel = animinfo "%a has finished playing anim %b " a = <ObjID> b = <anim>
				endif
				repeat_count = 0
			endif
		endif
		change structurename = <info_struct> anim_repeat_count = <repeat_count>
		if (<Cycle> = FALSE && <repeat_count> <= 0)
			change structurename = <info_struct> current_anim = idle
			change structurename = <info_struct> cycle_anim = TRUE
			if (<next_stance> = intro || <next_stance> = intro_smstg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			else
				change structurename = <info_struct> disable_arms = 0
			endif
			blend_time = 0.2
			if (<display_debug_info> = TRUE)
				printf channel = animinfo "%a has no anims in queue...returning to idle" a = <ObjID>
			endif
		else
			blend_time = 0.2
			if (<display_debug_info> = TRUE)
				if (<Cycle> = FALSE)
					printf channel = animinfo "%a repeating the %c anim (%b more times)" c = <anim> a = <ObjID> b = <repeat_count>
				else
					printf channel = animinfo "%a %b anim is cycling" a = <ObjID> b = <anim>
				endif
			endif
		endif
	else
		repeat_count = ($<info_struct>.next_anim_repeat_count)
		if ((<display_debug_info> = TRUE) && (<next_anim> != None))
			if (<repeat_count> > 1)
				printf channel = animinfo "%a will play %b anim %c times ......." a = <ObjID> b = <next_anim> c = <repeat_count>
			else
			endif
		endif
		if (<next_anim> = None)
			if (<display_debug_info> = TRUE)
				printf channel = animinfo "%a has no anims in queue...returning to idle" a = <ObjID>
			endif
			next_anim = idle
			cycle_next_anim = TRUE
		else
			cycle_next_anim = ($<info_struct>.cycle_next_anim)
		endif
		if (<next_stance> = intro || <next_stance> = intro_smstg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			disable_arms_next_anim = 2
		else
			disable_arms_next_anim = ($<info_struct>.next_anim_disable_arms)
		endif
		change structurename = <info_struct> stance = <next_stance>
		change structurename = <info_struct> current_anim = <next_anim>
		change structurename = <info_struct> cycle_anim = <cycle_next_anim>
		change structurename = <info_struct> disable_arms = <disable_arms_next_anim>
		change structurename = <info_struct> next_anim = None
		change structurename = <info_struct> cycle_next_anim = TRUE
		change structurename = <info_struct> anim_repeat_count = <repeat_count>
		change structurename = <info_struct> next_anim_disable_arms = 0
		blend_time = 0.2
	endif
	repeat
endscript

script crowd_play_adjusting_random_anims \{anim = idle blend_time = 0.2 startwithnoblend = 0}
	obj_getid
	old_speed = undefined
	begin
	hero_get_skill_level_cfunc
	get_anim_speed_for_tempo_cfunc
	if GotParam \{anim_set}
		anims = ($<anim_set>.<anim>.<skill>.<anim_speed>)
	else
		anims = ($crowd_animations.<anim>.<skill>.<anim_speed>)
	endif
	GetArraySize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if (<startwithnoblend> = 1)
		blend_time = 0.0
		startwithnoblend = 0
	elseif (<anim_speed> != <old_speed>)
		blend_time = $Crowd_BlendTime_TempoChange
	elseif (<skill> = bad)
		blend_time = $Crowd_BlendTime_Bad
	elseif (<anim> = special)
		blend_time = $Crowd_BlendTime_Special
	elseif (<anim_speed> = slow)
		blend_time = $Crowd_BlendTime_Slow
	elseif (<anim_speed> = med)
		blend_time = $Crowd_BlendTime_Med
	elseif (<anim_speed> = fast)
		blend_time = $Crowd_BlendTime_Fast
	else
		blend_time = -1.0
	endif
	if ($display_crowd_anim_info = TRUE)
		printf channel = crowd "%a playing %b anim (%c) with blendtime %d ..." a = <ObjID> b = <anim> c = <anim_name> d = <blend_time>
	endif
	GameObj_PlayAnim anim = <anim_name> blendduration = <blend_time> animevents = on
	GameObj_WaitAnimFinished
	old_speed = <anim_speed>
	repeat
endscript

script hero_strum_guitar \{note_length = 150}
	if (<note_length> < $short_strum_max_gem_length)
		anim_length = short
	elseif (<note_length> < $med_strum_max_gem_length)
		anim_length = med
	else
		anim_length = long
	endif
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	change structurename = <info_struct> last_strum_length = <anim_length>
	strum_type = ($<info_struct>.strum)
	extendcrc <strum_type> '_Strums' out = strum_anims
	if (($<info_struct>.playing_missed_note = FALSE) || ($always_strum = TRUE))
		GetArraySize (<strum_anims>.<anim_length>)
		getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
		strum_anim = (<strum_anims>.<anim_length> [<newindex>])
		hero_play_strum_anim anim = <strum_anim> blendduration = 0.1
	endif
	hero_wait_until_anim_finished \{timer = StrumTimer}
	hero_play_strum_anim anim = (($<strum_anims>).no_strum_anim)
endscript

script hero_play_chord \{chord = track_none}
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	finger_anims = ($<info_struct>.finger_anims)
	if StructureContains structure = $<finger_anims> name = <chord>
		finger_anim = (<finger_anims>.<chord>)
		if (<chord> = None)
			blend_time = $finger_release_blend_time
		else
			blend_time = $finger_press_blend_time
		endif
	else
		finger_anim = (<finger_anims>.None)
		blend_time = $finger_release_blend_time
	endif
	if (<finger_anim> != None)
		hero_play_finger_anim anim = <finger_anim> blendduration = <blend_time>
	endif
endscript

script find_profile 
	get_musician_profile_size
	if GotParam \{name}
		GetLowerCaseString <name>
		search_name = <lowercasestring>
		found = 0
		index = 0
		begin
		get_musician_profile_struct index = <index>
		GetLowerCaseString (<profile_struct>.name)
		profile_name = <lowercasestring>
		if (<profile_name> = <search_name>)
			found = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
		return found = <found> index = <index>
	elseif GotParam \{body_id}
		found = 0
		index = 0
		begin
		get_musician_profile_struct index = <index>
		Body = (<profile_struct>.musician_body)
		body_descid = (<Body>.desc_id)
		if (<body_id> = <body_descid>)
			found = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
		return found = <found> index = <index>
	endif
endscript

script find_profile_by_id 
	get_musician_profile_size
	found = 0
	index = 0
	begin
	get_musician_profile_struct index = <index>
	next_name = (<profile_struct>.name)
	FormatText checksumname = profile_id '%n' n = <next_name> addtostringlookup = TRUE
	if (<profile_id> = <id>)
		return TRUE index = <index>
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	find_profile_by_id \{id = axel}
	return FALSE index = <index>
endscript

script get_waypoint_id \{index = 0}
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	if (<index> < 10)
		FormatText textname = suffix '_TRG_Waypoint_0%a' a = <index>
	else
		FormatText textname = suffix '_TRG_Waypoint_%a' a = <index>
	endif
	waypoint_name = (<pakname> + <suffix>)
	AppendSuffixToChecksum base = <pak> suffixstring = <suffix>
	return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
endscript

script get_start_node_id \{Character = "guitarist"}
	player2_is_guitarist = FALSE
	if (($game_mode = p2_career) || ($game_mode = p2_coop))
		if NOT ($player1_status.part = guitar)
			player2_is_guitarist = TRUE
		endif
	endif
	art_deco_encore = FALSE
	GetPakManCurrent \{map = zones}
	if (<pak> = z_artdeco)
		if GetNodeFlag \{ls_encore_post}
			art_deco_encore = TRUE
		endif
	endif
	switch (<member>)
		case guitarist
		if ($current_num_players = 1)
			Character = "guitarist"
		else
			if (<player2_is_guitarist> = TRUE)
				if (<art_deco_encore> = TRUE)
					Character = "guitarist"
				else
					Character = "guitarist_player2"
				endif
			else
				Character = "guitarist_player1"
			endif
		endif
		case bassist
		if ($current_num_players = 1)
			Character = "bassist"
		else
			if (<player2_is_guitarist> = TRUE)
				Character = "guitarist_player1"
			else
				if (<art_deco_encore> = TRUE)
					Character = "guitarist"
				else
					Character = "guitarist_player2"
				endif
			endif
		endif
		case vocalist
		Character = "vocalist"
		case drummer
		Character = "drummer"
		default
		printf \{"Unknown character referenced in get_starting_position!"}
		Character = "unknown"
	endswitch
	if GetPakManCurrentName \{map = zones}
		GetPakManCurrent \{map = zones}
		FormatText textname = suffix '_TRG_Waypoint_%a_start' a = <Character>
		waypoint_name = (<pakname> + <suffix>)
		AppendSuffixToChecksum base = <pak> suffixstring = <suffix>
		return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
	else
		return \{waypoint_id = None waypoint_name = "NONE"}
	endif
endscript

script get_skill_level 
	health = ($player1_status.current_health)
	skill = normal
	if (<health> < 0.66)
		skill = bad
	elseif (<health> > 1.3299999)
		skill = good
	endif
	return skill = <skill>
endscript

script get_target_node 
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	return target_node = ($<info_struct>.target_node)
endscript
BandMember_Idle_EventTable = [
	{
		Response = call_script
		event = play_anim
		scr = handle_play_anim
	}
	{
		Response = call_script
		event = change_stance
		scr = handle_change_stance
	}
]

script bandmember_idle 
	ResetEventHandlersFromTable \{BandMember_Idle_EventTable group = hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	obj_spawnscriptnow \{hero_play_adjusting_random_anims params = {anim = idle}}
	Block
endscript

script play_special_facial_anim 
	if NOT GotParam \{anim}
		return
	endif
	obj_killspawnedscript \{name = facial_anim_loop}
	obj_getid
	if (<ObjID> = guitarist)
		printf \{channel = newdebug "playing special facial on guitarist......."}
	endif
	hero_play_facial_anim anim = <anim>
	hero_wait_until_anim_finished \{timer = FacialTimer}
	if (<ObjID> = guitarist)
		printf \{channel = newdebug "done waiting for facial on guitarist......."}
	endif
	obj_spawnscriptnow \{facial_anim_loop}
endscript

script facial_anim_loop 
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	if NOT StructureContains structure = $<anim_set> name = facial_anims
		return
	endif
	if NOT StructureContains structure = ($<anim_set>.facial_anims) name = idle
		return
	endif
	begin
	anim = ($<info_struct>.facial_anim)
	if NOT StructureContains structure = ($<anim_set>.facial_anims) name = <anim>
		if ($display_facial_anim_info = TRUE)
			printf channel = facial "facial anims not defined for %a ... reverting to idle" a = <anim>
		endif
		anim = idle
	endif
	anims = ($<anim_set>.facial_anims.<anim>)
	GetArraySize <anims>
	getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<index>])
	if ($display_facial_anim_info = TRUE)
		printf channel = facial "playing facial anim - %a (%b) ..." a = <anim> b = <anim_name>
	endif
	change structurename = <info_struct> facial_anim = idle
	hero_play_facial_anim anim = <anim_name>
	hero_wait_until_anim_finished \{timer = FacialTimer}
	wait \{1 gameframe}
	repeat
endscript
Guitarist_Idle_EventTable = [
	{
		Response = call_script
		event = strum_guitar
		scr = handle_strum_event
	}
	{
		Response = call_script
		event = pose_fret
		scr = handle_fret_event
	}
	{
		Response = call_script
		event = pose_fingers
		scr = handle_finger_event
	}
	{
		Response = call_script
		event = Anim_MissedNote
		scr = handle_missed_note
	}
	{
		Response = call_script
		event = anim_hitnote
		scr = handle_hit_note
	}
	{
		Response = call_script
		event = play_anim
		scr = handle_play_anim
	}
	{
		Response = call_script
		event = play_battle_anim
		scr = handle_play_anim
	}
	{
		Response = call_script
		event = change_stance
		scr = handle_change_stance
	}
	{
		Response = call_script
		event = walk
		scr = handle_walking
	}
]

script guitarist_idle 
	ResetEventHandlersFromTable \{Guitarist_Idle_EventTable group = hand_events}
	obj_getid
	if (($player1_status.band_member) = <ObjID>)
		seteventhandler \{Response = call_script
			event = star_power_onp1
			scr = handle_star_power
			group = hand_events}
	else (($player2_status.band_member) = <ObjID>)
		seteventhandler \{Response = call_script
			event = star_power_onp2
			scr = handle_star_power
			group = hand_events}
	endif
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	obj_spawnscriptnow \{hero_play_adjusting_random_anims params = {anim = idle blend_time = 0.2 Cycle}}
	Block
endscript

script guitarist_idle_animpreview 
	cleareventhandlergroup \{hand_events}
endscript
Guitarist_Walking_EventTable = [
	{
		Response = call_script
		event = strum_guitar
		scr = handle_strum_event
	}
	{
		Response = call_script
		event = pose_fret
		scr = handle_fret_event
	}
	{
		Response = call_script
		event = pose_fingers
		scr = handle_finger_event
	}
	{
		Response = call_script
		event = Anim_MissedNote
		scr = handle_missed_note
	}
	{
		Response = call_script
		event = anim_hitnote
		scr = handle_hit_note
	}
	{
		Response = call_script
		event = change_stance
		scr = queue_change_stance
	}
]

script guitarist_walking 
	ResetEventHandlersFromTable \{Guitarist_Walking_EventTable group = hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	spawnscriptnow \{start_walk_camera}
	walk_to_waypoint <...>
	spawnscriptnow \{kill_walk_camera}
	Obj_SwitchScript \{guitarist_idle}
endscript

script play_special_anim \{stance = stance_a disable_arms = 2 blendduration = 0.2}
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	cleareventhandlergroup \{hand_events}
	if GotParam \{respond_to_hand_events}
		ResetEventHandlersFromTable \{Guitarist_Walking_EventTable group = hand_events}
	else
		seteventhandler \{Response = call_script
			event = change_stance
			scr = queue_change_stance
			group = hand_events}
	endif
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	if GotParam \{wait}
		hero_wait_until_anim_finished
	endif
	if (<disable_arms> = 0)
		if (<info_struct>.arms_disabled = 2)
			hero_toggle_arms \{prev_num_arms = 0 num_arms = 2}
			change structurename = <info_struct> arms_disabled = 0
			change structurename = <info_struct> disable_arms = 0
			change structurename = <info_struct> next_anim_disable_arms = 0
			change structurename = <info_struct> current_anim = idle
			change structurename = <info_struct> cycle_anim = idle
			change structurename = <info_struct> next_anim = idle
			change structurename = <info_struct> cycle_next_anim = TRUE
		endif
	endif
	if (<disable_arms> = 2)
		if (<ObjID> = guitarist || <ObjID> = bassist || <ObjID> = drummer)
			hero_disable_arms \{blend_time = 0.0}
		endif
	endif
	change structurename = <info_struct> stance = <stance>
	if hero_play_tempo_anim_cfunc anim = <anim> blendduration = <blendduration>
		hero_play_anim anim = <anim_to_run> blendduration = <blend_duration> usemotionextraction = <use_motion_extraction>
	endif
	if (<stance> = win || <stance> = win_smstg || <stance> = lose || <stance> = lose_smstg || <anim> = starpower)
		ragdoll_markforreset
	endif
	if (<ObjID> = guitarist || <ObjID> = bassist)
		if (<disable_arms> = 2)
			hero_wait_until_anim_near_end \{time_from_end = 0.25}
			hero_enable_arms \{blend_time = 0.25}
		endif
	endif
	hero_wait_until_anim_finished
	change structurename = <info_struct> stance = stance_a
	if (<ObjID> = guitarist || <ObjID> = bassist)
		Obj_SwitchScript \{guitarist_idle}
	else
		Obj_SwitchScript \{bandmember_idle}
	endif
endscript

script play_simple_anim \{disable_arms = 2 blendduration = 0.0}
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	cleareventhandlergroup \{hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	if (<disable_arms> = 2)
		if (<ObjID> = guitarist || <ObjID> = bassist)
			hero_disable_arms blend_time = <blendduration>
		endif
	endif
	hero_play_anim anim = <anim> blendduration = <blendduration>
	if (blendduration = 0.0)
		ragdoll_markforreset
	endif
	if (<ObjID> = guitarist || <ObjID> = bassist)
		hero_wait_until_anim_near_end \{time_from_end = 0.25}
		hero_enable_arms \{blend_time = 0.25}
	endif
	hero_wait_until_anim_finished
	handle_change_stance \{stance = stance_a no_wait}
	if (<ObjID> = guitarist || <ObjID> = bassist)
		Obj_SwitchScript \{guitarist_idle}
	else
		Obj_SwitchScript \{bandmember_idle}
	endif
endscript

script handle_star_power 
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	change structurename = <info_struct> waiting_for_cameracut = TRUE
	begin
	if ($<info_struct>.waiting_for_cameracut = FALSE)
		break
	endif
	wait \{1 gameframe}
	repeat
	Obj_SwitchScript \{play_special_anim params = {stance = stance_a
			anim = starpower
			blendduration = 0.0
			disable_arms = 0
			respond_to_hand_events = 1}}
endscript

script handle_song_won 
	obj_killspawnedscript \{name = handle_star_power}
	printf \{channel = animinfo "handle song won............"}
	Obj_SwitchScript \{play_special_anim params = {stance = win anim = idle kill_transitions_when_done}}
endscript

script handle_song_failed 
	obj_killspawnedscript \{name = handle_star_power}
	printf \{channel = animinfo "handle song failed........."}
	Obj_SwitchScript \{play_special_anim params = {stance = lose anim = idle kill_transitions_when_done}}
endscript

script play_intro_anims 
	printf \{channel = animinfo "play_intro_anims............."}
	intro_stance = intro
	if (UseSmallVenueAnims)
		printf \{channel = animinfo "Using small venue anims! ............"}
		intro_stance = intro_smstg
	endif
	play_guitarist_intro = TRUE
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_artdeco
		if GetNodeFlag \{ls_encore_post}
			play_guitarist_intro = FALSE
		endif
	endswitch
	if (<play_guitarist_intro> = TRUE)
		Band_ChangeStance name = guitarist stance = <intro_stance> no_wait
		Band_ChangeStance name = bassist stance = <intro_stance> no_wait
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			Band_ChangeStance name = ($player1_status.band_member) stance = <intro_stance> no_wait
			Band_ChangeStance name = ($player2_status.band_member) stance = stance_a no_wait
		else
			Band_ChangeStance \{name = guitarist stance = stance_a no_wait}
			Band_ChangeStance name = bassist stance = <intro_stance> no_wait
		endif
	endif
	Band_ChangeStance name = vocalist stance = <intro_stance> no_wait
	Band_ChangeStance \{name = drummer stance = intro no_wait}
	Band_ChangeStance \{name = guitarist stance = stance_a}
	Band_ChangeStance \{name = bassist stance = stance_a}
	Band_ChangeStance \{name = vocalist stance = stance_a}
	Band_ChangeStance \{name = drummer stance = stance_a}
endscript

script UseSmallVenueAnims 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		return_val = TRUE
		case z_dive
		return_val = TRUE
		case z_video
		return_val = TRUE
		case z_prison
		return_val = TRUE
		case z_hell
		return_val = TRUE
		case z_artdeco
		if GetNodeFlag \{ls_encore_post}
			return \{TRUE}
		endif
		default
		return_val = FALSE
	endswitch
	return <return_val>
endscript

script play_win_anims 
	if ($disable_band = 1)
		return
	endif
	if ($game_mode = tutorial)
		return
	endif
	printf \{channel = animinfo "play_win_anims............."}
	win_stance = win
	lose_stance = lose
	if (UseSmallVenueAnims)
		printf \{channel = animinfo "Using small venue anims! ............"}
		win_stance = win_smstg
		lose_stance = lose_smstg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		if CompositeObjectExists \{name = guitarist}
			guitarist :Obj_SwitchScript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		endif
		if CompositeObjectExists \{name = bassist}
			bassist :Obj_SwitchScript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		endif
	else
		if ($boss_battle = 1)
			guitarist :Obj_SwitchScript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
			bassist :Obj_SwitchScript play_special_anim params = {stance = <lose_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		else
			p1_won = TRUE
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					p1_won = FALSE
				endif
			else
				if (($player2_status.Score) > ($player1_status.Score))
					p1_won = FALSE
				endif
			endif
			if (<p1_won> = TRUE)
				($player1_status.band_member) :Obj_SwitchScript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player2_status.band_member) :Obj_SwitchScript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			else
				($player2_status.band_member) :Obj_SwitchScript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player1_status.band_member) :Obj_SwitchScript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			endif
		endif
	endif
	if CompositeObjectExists \{name = drummer}
		change \{structurename = drummer_info desired_twist = 0.0}
		change \{structurename = drummer_info last_left_arm_note = 0}
		change \{structurename = drummer_info last_right_arm_note = 0}
		drummer :Obj_SwitchScript \{play_special_anim params = {stance = win anim = idle blendduration = 0.0}}
	endif
	if CompositeObjectExists \{name = vocalist}
		vocalist :Obj_SwitchScript \{play_special_anim params = {stance = win anim = idle blendduration = 0.0}}
	endif
	restore_idle_faces
endscript

script play_lose_anims 
	printf \{channel = newdebug "play_lose_anims............"}
	if ($disable_band = 1)
		return
	endif
	win_stance = win
	lose_stance = lose
	if (UseSmallVenueAnims)
		printf \{channel = animinfo "Using small venue anims! ............"}
		win_stance = win_smstg
		lose_stance = lose_smstg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		guitarist :Obj_SwitchScript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
		bassist :Obj_SwitchScript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
	else
		if ($boss_battle = 1)
			guitarist :Obj_SwitchScript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			bassist :Obj_SwitchScript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
		else
			printf \{channel = newdebug "not bossbattle......"}
			p1_won = TRUE
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					p1_won = FALSE
				endif
			else
				if (($player2_status.Score) > ($player1_status.Score))
					p1_won = FALSE
				endif
			endif
			if (<p1_won> = TRUE)
				($player1_status.band_member) :Obj_SwitchScript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player2_status.band_member) :Obj_SwitchScript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			else
				($player2_status.band_member) :Obj_SwitchScript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player1_status.band_member) :Obj_SwitchScript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			endif
		endif
	endif
	if CompositeObjectExists \{name = drummer}
		change \{structurename = drummer_info last_left_arm_note = 0}
		change \{structurename = drummer_info last_right_arm_note = 0}
		change \{structurename = drummer_info desired_twist = 0.0}
		drummer :Obj_SwitchScript \{play_special_anim params = {stance = lose anim = idle blendduration = 0.0}}
	endif
	if CompositeObjectExists \{name = vocalist}
		vocalist :Obj_SwitchScript \{play_special_anim params = {stance = lose anim = idle blendduration = 0.0}}
	endif
	restore_idle_faces
endscript

script restore_idle_faces 
	if CompositeObjectExists \{name = guitarist}
		guitarist :obj_killspawnedscript \{name = facial_anim_loop}
		guitarist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{name = bassist}
		bassist :obj_killspawnedscript \{name = facial_anim_loop}
		bassist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{name = vocalist}
		vocalist :obj_killspawnedscript \{name = facial_anim_loop}
		vocalist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{name = drummer}
		drummer :obj_killspawnedscript \{name = facial_anim_loop}
		drummer :obj_spawnscriptnow \{facial_anim_loop}
	endif
endscript

script hide_band 
	if CompositeObjectExists \{guitarist}
		guitarist :hide
	endif
	if CompositeObjectExists \{bassist}
		bassist :hide
	endif
	if CompositeObjectExists \{vocalist}
		vocalist :hide
	endif
	if CompositeObjectExists \{drummer}
		drummer :hide
	endif
endscript

script unhide_band 
	if CompositeObjectExists \{guitarist}
		guitarist :unhide
	endif
	if CompositeObjectExists \{bassist}
		bassist :unhide
	endif
	if CompositeObjectExists \{vocalist}
		vocalist :unhide
	endif
	if CompositeObjectExists \{drummer}
		drummer :unhide
	endif
endscript
using_walk_camera = FALSE

script start_walk_camera 
	if ($using_walk_camera = TRUE || $using_starpower_camera = TRUE || $game_mode = training)
		return
	endif
	change \{using_walk_camera = TRUE}
	change \{CameraCuts_AllowNoteScripts = FALSE}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_walk' changetime = $max_walk_camera_cut_delay}
	wait \{7 seconds}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	change \{CameraCuts_AllowNoteScripts = TRUE}
	change \{using_walk_camera = FALSE}
endscript

script kill_walk_camera \{changecamera = 1}
	if ($using_walk_camera = FALSE || $game_mode = training)
		return
	endif
	KillSpawnedScript \{name = start_walk_camera}
	if (<changecamera> = 1)
		CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	endif
	change \{CameraCuts_AllowNoteScripts = TRUE}
	change \{using_walk_camera = FALSE}
endscript
