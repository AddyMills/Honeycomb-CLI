
script Band_PlaysimpleAnim \{name = guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if NOT GotParam \{anim}
		return
	endif
	<name> :obj_killspawnedscript name = play_simple_anim
	<name> :obj_spawnscriptnow play_simple_anim params = {<...>}
endscript

script Band_PlayAnim \{name = guitarist anim = idle}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<name> = guitarist)
			if CompositeObjectExists \{name = bassist}
				LaunchEvent type = play_anim target = bassist Data = {<...>}
			endif
		elseif (<name> = bassist)
			return
		endif
	endif
	LaunchEvent type = play_anim target = <name> Data = {<...>}
endscript

script Band_PlayIdle \{name = guitarist}
	Band_PlayAnim name = <name> anim = idle Cycle
endscript

script Band_PlayFacialAnim \{name = guitarist}
	if CompositeObjectExists name = <name>
		<name> :obj_killspawnedscript name = play_special_facial_anim
		<name> :obj_spawnscriptnow play_special_facial_anim params = {anim = <anim>}
	endif
endscript

script Band_SetStrumStyle \{name = guitarist style = long}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> strum = <style>
endscript

script Band_ChangeStance \{name = guitarist stance = stance_a}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<name> = guitarist)
			if CompositeObjectExists \{name = bassist}
				LaunchEvent type = change_stance target = bassist Data = {<...>}
			endif
		elseif (<name> = bassist)
			return
		endif
	endif
	LaunchEvent type = change_stance target = <name> Data = {<...>}
endscript

script Band_StopStrumming \{name = guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> strum = None
endscript

script Band_EnableArms \{name = guitarist blend_time = 0.25}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if (<name> = guitarist || <name> = bassist)
		<name> :hero_toggle_arms num_arms = 2 pre_num_arms = 0 blend_time = <blend_time>
	else
		<name> :hero_enable_arms blend_time = <blend_time>
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> arms_disabled = 0
	change structurename = <info_struct> disable_arms = 0
endscript

script Band_DisableArms \{name = guitarist blend_time = 0.25}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if (<name> = guitarist || <name> = bassist)
		<name> :hero_toggle_arms num_arms = 0 pre_num_arms = 2 blend_time = <blend_time>
	else
		<name> :hero_disable_arms blend_time = <blend_time>
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> arms_disabled = 2
	change structurename = <info_struct> disable_arms = 2
endscript

script Band_SetPosition 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	char_name = <name>
	if GotParam \{index}
		get_waypoint_id index = <index>
		GetWaypointPos name = <waypoint_id>
		change structurename = <info_struct> target_node = <waypoint_id>
	elseif GotParam \{node}
		GetWaypointPos name = <node>
		change structurename = <info_struct> target_node = <node>
	endif
	<char_name> :obj_setposition position = <Pos>
endscript

script Band_DisableMovement 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> allow_movement = FALSE
endscript

script Band_EnableMovement 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> allow_movement = TRUE
endscript

script Band_WalkToNode \{name = guitarist faceAudience = TRUE}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if ($current_num_players = 2)
		return
	endif
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	FormatText \{textname = suffix '_TRG_Waypoint_Guitarist_Walk01'}
	AppendSuffixToChecksum base = <pak> suffixstring = <suffix>
	waypoint_id = <appended_id>
	if NOT DoesWayPointExist name = <waypoint_id>
		return
	endif
	if ChecksumEquals a = <name> b = guitarist
		if LocalizedStringEquals a = <node> b = "guitarist_start"
			SpawnScriptLater \{LightShow_WaitAndEnableSpotlights params = {enable = FALSE time = 4.0}}
		else
			SpawnScriptLater \{LightShow_WaitAndEnableSpotlights params = {enable = TRUE time = 1.5}}
		endif
	endif
	LaunchEvent type = walk target = <name> Data = {<...> anim_set = $normal_walk_data}
endscript

script Band_TurnToFace \{name = guitarist node = 1}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	get_waypoint_id index = <node>
	GetWaypointPos name = <waypoint_id>
	<name> :turn_to_face Pos = <Pos>
endscript

script Band_RotateToFaceNode \{name = guitarist node = 1}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	get_waypoint_id index = <node>
	GetWaypointPos name = <waypoint_id>
	<name> :turn_to_face Pos = <Pos>
endscript

script Band_FaceNode \{name = guitarist node = 1}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	get_waypoint_id index = <node>
	GetWaypointPos name = <waypoint_id>
	<name> :turn_to_face Pos = <Pos>
endscript

script Band_FaceAudience \{name = guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :face_audience
endscript

script Band_PlayAttackAnim 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [<type>].name)
	if (($player1_status.band_member) = <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains structure = $<battle_anims> name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.attack_anim)
	if NOT (<anim> = None)
		LaunchEvent type = play_battle_anim target = <name> Data = {<...> no_wait}
	endif
endscript

script Band_PlayResponseAnim 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [<type>].name)
	if (($player1_status.band_member) = <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains structure = $<battle_anims> name = <attack_type>
		return
	endif
	anim = ($<battle_anims>.<attack_type>.response_anim)
	if NOT (<anim> = None)
		LaunchEvent type = play_battle_anim target = <name> Data = {<...>}
	endif
endscript

script bassist_should_use_guitarist_commands 
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if ($boss_battle = 0)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript
