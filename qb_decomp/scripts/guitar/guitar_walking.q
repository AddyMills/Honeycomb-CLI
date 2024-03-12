
script turn_to_face \{Pos = (0.0, 0.0, 0.0)}
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	walking_set = (<anim_set>.walking)
	target = <Pos>
	get_angle_to_target target = <target>
	Angle = (<Angle> * -1)
	obj_roty Angle = <Angle> Speed = (<anim_set>.walking.turn_speed)
endscript

script play_turn_anim 
	Blend = (<Angle> / <max_turn>)
	if (<Blend> < 0)
		Blend = 0
	elseif (<Blend> > 1.0)
		Blend = 1.0
	endif
	printf "playing turn with %a, %b, and %c............." a = <turn_idle> b = <turn_left> c = <turn_right>
	if (<turning_left> = TRUE)
		hero_play_turn_anim Idleanim = <turn_idle> turnAnim = <turn_left> TurnBlend = <Blend>
	else
		hero_play_turn_anim Idleanim = <turn_idle> turnAnim = <turn_right> TurnBlend = <Blend>
	endif
endscript

script walk_to_waypoint \{rotate = TRUE}
	if GotParam \{index}
		get_waypoint_id index = <index>
	elseif GotParam \{node}
		GetPakManCurrent \{map = zones}
		GetPakManCurrentName \{map = zones}
		FormatText textname = suffix '_TRG_Waypoint_%a' a = <node>
		AppendSuffixToChecksum base = <pak> suffixstring = <suffix>
		waypoint_id = <appended_id>
	else
		printf \{"node not specified in walk_to_waypoint!"}
		return
	endif
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	if DoesWayPointExist name = <waypoint_id>
		change structurename = <info_struct> target_node = <waypoint_id>
		GetWaypointPos name = <waypoint_id>
		walk_to_pos dest = <Pos>
		face_audience
	else
		printf \{"waypoint not found............"}
	endif
endscript

script walk_to_pos \{walkspeed = 2 rotate = TRUE backward = FALSE}
	obj_getid
	extendcrc <ObjID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	obj_getposition
	world_pos_dest = (<dest>)
	Offset = (<world_pos_dest> - <Pos>)
	VectorLength vector = <Offset>
	printf "dist to target is %a..........." a = <Length>
	if (<Length> < $min_walk_dist)
		return
	endif
	get_angle_to_target target = <dest>
	min_turn = (<anim_set>.walking.min_turn)
	if ((<Angle> > (-180 + <min_turn>) && <Angle> < (0.0 - <min_turn>)) || (<Angle> > <min_turn> && <Angle> < (180 - <min_turn>)))
		if (<rotate> = TRUE)
			turn_to_face Pos = <world_pos_dest>
		endif
	else
		if (<Angle> <= -90)
			Angle = (<Angle> + 180)
		elseif (<Angle> >= 90)
			Angle = (<Angle> - 180)
		endif
		Angle = (<Angle> * -1)
		obj_roty Angle = <Angle> Speed = (<anim_set>.walking.turn_speed)
	endif
	if IsFacing Pos = <dest>
		walking_set = (<anim_set>.walking.forward)
	else
		walking_set = (<anim_set>.walking.backward)
	endif
	delta = (<Pos> - <world_pos_dest>)
	x = (<delta>.(1.0, 0.0, 0.0))
	z = (<delta>.(0.0, 0.0, 1.0))
	delta = (<x> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	VectorLength vector = <delta>
	if (<Length> = 0.1)
		printf \{"not going anywhere?.........."}
		return
	endif
	time = (<Length> / <walkspeed>)
	desired_dist = (<Length>)
	get_anim_speed_for_tempo_cfunc
	setsearchallassetcontexts
	anim_scale = (<info_struct>.Scale)
	anim_gettotaldisplacement anim = (<walking_set>.start_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	desired_dist = (<desired_dist> - <displacement>)
	anim_gettotaldisplacement anim = (<walking_set>.stop_left_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	desired_dist = (<desired_dist> - <displacement>)
	anim_getanimlength anim = (<walking_set>.cycle_anim.<anim_speed>)
	anim_gettotaldisplacement anim = (<walking_set>.cycle_anim.<anim_speed>)
	displacement = (<displacement> * <anim_scale>)
	setsearchallassetcontexts \{Off}
	if (<displacement> = 0.0)
		cycles_needed = 3
	else
		cycles_needed = (<desired_dist> / <displacement>)
	endif
	precision_mode = FALSE
	if (<precision_mode> = FALSE)
		cycles_needed_float = (<cycles_needed>)
		CastToInteger \{cycles_needed}
		fraction = (<cycles_needed_float> - <cycles_needed>)
		if (<fraction> > 0.75)
			cycles_needed = (<cycles_needed> + 1)
		elseif (<fraction> > 0.25)
			cycles_needed = (<cycles_needed> + 0.5)
		endif
	endif
	time_needed = (<cycles_needed> * <Length>)
	printf \{"starting to walk........."}
	hero_play_anim anim = (<walking_set>.start_anim.<anim_speed>)
	hero_wait_until_anim_finished
	printf \{"playing cycle......"}
	if (<time_needed> > 0)
		hero_play_anim anim = (<walking_set>.cycle_anim.<anim_speed>) blendduration = 0.0 Cycle
		wait <time_needed> seconds
	endif
	hero_get_foot_down
	printf \{"playing stop......"}
	get_angle_to_target \{target = (0.0, 0.0, 50.0)}
	if (<Angle> < <min_turn> && <Angle> > (0.0 - <min_turn>))
		Angle = (<Angle> * -1)
		obj_roty Angle = <Angle> Speed = (<anim_set>.walking.face_audience_speed)
	endif
	if (<foot> = left)
		hero_play_anim anim = (<walking_set>.stop_left_anim.<anim_speed>)
	else
		hero_play_anim anim = (<walking_set>.stop_right_anim.<anim_speed>)
	endif
	hero_wait_until_anim_finished
	printf \{"all done!................."}
endscript

script hero_get_foot_down 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer command = timer_getframefactor}
		if (<framefactor> > 0.120000005 && <framefactor> < 0.62)
			return \{foot = RIGHT}
		else
			return \{foot = left}
		endif
	endif
endscript

script face_audience 
	turn_to_face \{Pos = (0.0, 0.0, 50.0)}
endscript

script IsFacing 
	obj_getmatrix
	x = (<at>.(1.0, 0.0, 0.0))
	z = (<at>.(0.0, 0.0, 1.0))
	at = (<x> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	dest_pos = <Pos>
	obj_getposition
	delta = (<dest_pos> - <Pos>)
	x = (<delta>.(1.0, 0.0, 0.0))
	z = (<delta>.(0.0, 0.0, 1.0))
	delta = (<x> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	if (<at>.<delta> < 0)
		return \{FALSE}
	else
		return \{TRUE}
	endif
endscript

script get_angle_to_target 
	obj_getposition
	obj_getmatrix
	vec_to_pos = (<target> - <Pos>)
	GetAngle vec1 = <at> vec2 = <vec_to_pos> rot_axis = y
	crossprod = (<vec_to_pos>.<left>)
	if (<crossprod> > 0.0)
		<Angle> = (0.0 - <Angle>)
	endif
	return {Angle = <Angle>}
endscript
