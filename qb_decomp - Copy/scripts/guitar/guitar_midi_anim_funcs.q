
script Band_Playsimpleanim \{Name = GUITARIST}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	if NOT gotParam \{Anim}
		return
	endif
	<Name> :Obj_KillSpawnedScript Name = play_simple_anim
	<Name> :Obj_SpawnscriptNow play_simple_anim Params = {<...>}
endscript

script Band_PlayANim \{Name = GUITARIST Anim = Idle}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<Name> = GUITARIST)
			if compositeObjectexists \{Name = BASSIST}
				launchevent Type = play_anim Target = BASSIST data = {<...>}
			endif
			elseif (<Name> = BASSIST)
			return
		endif
	endif
	launchevent Type = play_anim Target = <Name> data = {<...>}
endscript

script band_playidle \{Name = GUITARIST}
	Band_PlayANim Name = <Name> Anim = Idle CYCLE
endscript

script band_playfacialanim \{Name = GUITARIST}
	if compositeObjectexists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_SpawnscriptNow play_special_facial_anim Params = {Anim = <Anim>}
	endif
endscript

script Band_SetStrumStyle \{Name = GUITARIST style = Long}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change StructureName = <info_struct> Strum = <style>
endscript

script Band_ChangeStance \{Name = GUITARIST stance = stance_A}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<Name> = GUITARIST)
			if compositeObjectexists \{Name = BASSIST}
				launchevent Type = change_stance Target = BASSIST data = {<...>}
			endif
			elseif (<Name> = BASSIST)
			return
		endif
	endif
	launchevent Type = change_stance Target = <Name> data = {<...>}
endscript

script Band_StopStrumming \{Name = GUITARIST}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change StructureName = <info_struct> Strum = NONE
endscript

script Band_EnableArms \{Name = GUITARIST blend_time = 0.25}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	if (<Name> = GUITARIST || <Name> = BASSIST)
		<Name> :hero_toggle_arms num_arms = 2 pre_num_arms = 0 blend_time = <blend_time>
	else
		<Name> :hero_enable_arms blend_time = <blend_time>
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change StructureName = <info_struct> arms_disabled = 0
	Change StructureName = <info_struct> disable_arms = 0
endscript

script Band_DisableArms \{Name = GUITARIST blend_time = 0.25}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	if (<Name> = GUITARIST || <Name> = BASSIST)
		<Name> :hero_toggle_arms num_arms = 0 pre_num_arms = 2 blend_time = <blend_time>
	else
		<Name> :hero_disable_arms blend_time = <blend_time>
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change StructureName = <info_struct> arms_disabled = 2
	Change StructureName = <info_struct> disable_arms = 2
endscript

script Band_SetPosition 
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	char_name = <Name>
	if gotParam \{Index}
		get_waypoint_id Index = <Index>
		GetWaypointPos Name = <waypoint_id>
		Change StructureName = <info_struct> target_node = <waypoint_id>
		elseif gotParam \{node}
		GetWaypointPos Name = <node>
		Change StructureName = <info_struct> target_node = <node>
	endif
	<char_name> :Obj_SetPosition Position = <pos>
endscript

script Band_DisableMovement 
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change StructureName = <info_struct> allow_movement = FALSE
endscript

script Band_EnableMovement 
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change StructureName = <info_struct> allow_movement = TRUE
endscript

script Band_WalkToNode \{Name = GUITARIST faceAudience = TRUE}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	if ($current_num_players = 2)
		return
	endif
	GetPakManCurrent \{map = Zones}
	GetPakManCurrentName \{map = Zones}
	formatText \{Textname = suffix '_TRG_Waypoint_Guitarist_Walk01'}
	AppendSuffixToChecksum Base = <pak> suffixString = <suffix>
	waypoint_id = <appended_id>
	if NOT DoesWaypointExist Name = <waypoint_id>
		return
	endif
	if checksumequals A = <Name> B = GUITARIST
		if LocalizedStringEquals A = <node> B = "guitarist_start"
			Spawnscriptlater \{LightShow_WaitAndEnableSpotlights Params = {Enable = FALSE Time = 4.0}}
		else
			Spawnscriptlater \{LightShow_WaitAndEnableSpotlights Params = {Enable = TRUE Time = 1.5}}
		endif
	endif
	launchevent Type = WALK Target = <Name> data = {<...> anim_set = $normal_walk_data}
endscript

script Band_TurnToFace \{Name = GUITARIST node = 1}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	get_waypoint_id Index = <node>
	GetWaypointPos Name = <waypoint_id>
	<Name> :turn_to_face pos = <pos>
endscript

script Band_RotateToFaceNode \{Name = GUITARIST node = 1}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	get_waypoint_id Index = <node>
	GetWaypointPos Name = <waypoint_id>
	<Name> :turn_to_face pos = <pos>
endscript

script Band_FaceNode \{Name = GUITARIST node = 1}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	get_waypoint_id Index = <node>
	GetWaypointPos Name = <waypoint_id>
	<Name> :turn_to_face pos = <pos>
endscript

script Band_FaceAudience \{Name = GUITARIST}
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	<Name> :face_audience
endscript

script Band_PlayAttackAnim 
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	attack_type = ($battlemode_powerups [<Type>].Name)
	if (($player1_status.band_Member) = <Name>)
		battle_anims = player1_battlemode_anims
		elseif (($player2_status.band_Member) = <Name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT structureContains Structure = $<battle_anims> Name = <attack_type>
		return
	endif
	Anim = ($<battle_anims>.<attack_type>.attack_anim)
	if NOT (<Anim> = NONE)
		launchevent Type = play_battle_anim Target = <Name> data = {<...> No_wait}
	endif
endscript

script Band_PlayResponseAnim 
	if NOT compositeObjectexists Name = <Name>
		return
	endif
	attack_type = ($battlemode_powerups [<Type>].Name)
	if (($player1_status.band_Member) = <Name>)
		battle_anims = player1_battlemode_anims
		elseif (($player2_status.band_Member) = <Name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT structureContains Structure = $<battle_anims> Name = <attack_type>
		return
	endif
	Anim = ($<battle_anims>.<attack_type>.response_anim)
	if NOT (<Anim> = NONE)
		launchevent Type = play_battle_anim Target = <Name> data = {<...>}
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
