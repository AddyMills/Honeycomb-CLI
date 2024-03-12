
script strum_iterator \{song_name = "test" DIFFICULTY = "easy" array_type = "song" part = ''}
	if NOT gotParam \{Target}
		Printf \{"Strum_iterator called without target!"}
		return
	endif
	get_song_prefix Song = <song_name>
	formatText Checksumname = Song '%s_song_%pexpert' S = <song_prefix> P = <part> AddToStringLookup
	array_entry = 0
	getArraySize $<Song>
	if (<array_Size> = 0)
		return
	endif
	song_array_size = (<array_Size> / $num_song_columns)
	GetSongtimeMS time_offset = <time_offset>
	if NOT (<song_array_size> = 0)
		begin
		if ((<Time> - <skipleadin>) < ($<Song> [<array_entry>]))
			break
		endif
		<array_entry> = (<array_entry> + $num_song_columns)
		repeat <song_array_size>
		song_array_size = (<song_array_size> - (<array_entry> / $num_song_columns))
	endif
	begin
	if (<song_array_size> = 0)
		break
	endif
	TimeMarkerReached_SetParams time_offset = <time_offset> Array = <Song> array_entry = <array_entry>
	begin
	if TimeMarkerReached
		GetSongtimeMS time_offset = <time_offset>
		break
	endif
	Wait \{1 GameFrame}
	repeat
	TimeMarkerReached_ClearParams
	note_length = ($<Song> [(<array_entry> + 1)])
	if (<note_length> > 0)
		launchevent Type = strum_guitar Target = <Target> data = {note_length = <note_length>}
	endif
	<array_entry> = (<array_entry> + $num_song_columns)
	repeat <song_array_size>
endscript

script FretPos_iterator 
	if NOT gotParam \{Target}
		Printf \{"FretPos_iterator called without target!"}
		return
	endif
	if ($disable_band = 1)
		return
	endif
	get_song_prefix Song = <song_name>
	formatText Checksumname = event_array '%s_anim_notes' S = <song_prefix> AddToStringLookup
	if NOT Globalexists Name = <event_array> Type = Array
		Printf \{"FRETPOS ANIMS DISABLED: No midi events found for this song"}
		return
	endif
	array_entry = 0
	getArraySize $<event_array>
	GetSongtimeMS time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
		begin
		if TimeMarkerReached
			GetSongtimeMS time_offset = <time_offset>
			break
		endif
		Wait \{1 GameFrame}
		repeat
		TimeMarkerReached_ClearParams
		note = ($<event_array> [<array_entry>] [1])
		length = ($<event_array> [<array_entry>] [2])
		if compositeObjectexists Name = <Target>
			if (<part> = GUITAR)
				if ((<note> >= 118) && (<note> <= 127))
					launchevent Type = pose_fret Target = <Target> data = {note = <note> note_length = <note_length>}
				endif
			else
				if ((<note> >= 101) && (<note> <= 110))
					launchevent Type = pose_fret Target = <Target> data = {note = <note> note_length = <note_length>}
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
endscript

script FretFingers_iterator \{part = ''}
	FretFingers_iterator_CFunc_Setup
	begin
	if FretFingers_iterator_CFunc
		break
	endif
	Wait \{1 GameFrame}
	repeat
	FretFingers_iterator_CFunc_Cleanup
endscript

script WatchForStartPlaying_iterator 
	get_song_prefix Song = <song_name>
	formatText Checksumname = event_array '%s_song_expert' S = <song_prefix> AddToStringLookup
	if NOT Globalexists Name = <event_array> Type = Array
		return
	endif
	array_entry = 0
	getArraySize $<event_array>
	song_array_size = (<array_Size> / $num_song_columns)
	GetSongtimeMS time_offset = <time_offset>
	if NOT (<song_array_size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + $num_song_columns)
		repeat <song_array_size>
		song_array_size = (<song_array_size> - (<array_entry> / $num_song_columns))
		if (<song_array_size> = 0)
			return
		endif
		TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongtimeMS time_offset = <time_offset>
			break
		endif
		Wait \{1 GameFrame}
		repeat
		TimeMarkerReached_ClearParams
		BroadCastEvent \{Type = start_playing}
	endif
endscript

script Drum_iterator 
	Drum_iterator_CFunc_Setup
	begin
	if Drum_iterator_CFunc
		break
	endif
	Wait \{1 GameFrame}
	repeat
	Drum_iterator_CFunc_Cleanup
endscript

script Drum_cymbal_iterator 
	get_song_prefix Song = <song_name>
	formatText Checksumname = event_array '%s_drums_notes' S = <song_prefix> AddToStringLookup
	if NOT Globalexists Name = <event_array> Type = Array
		Printf \{"FRETPOS ANIMS DISABLED: No midi events found for this song"}
		return
	endif
	array_entry = 0
	getArraySize $<event_array>
	GetSongtimeMS time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
		begin
		if TimeMarkerReached
			GetSongtimeMS time_offset = <time_offset>
			break
		endif
		Wait \{1 GameFrame}
		repeat
		TimeMarkerReached_ClearParams
		if compositeObjectexists \{Name = DRUMMER}
			note = ($<event_array> [<array_entry>] [1])
			length = ($<event_array> [<array_entry>] [2])
			if ((<note> >= 37) && (<note> <= 45))
				switch (<note>)
					case 44
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal1 timerId = CymbalTimer1 Anim = ($cymbal_anims [0]) Blendduration = $drum_blend_time
					case 45
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal2 timerId = CymbalTimer2 Anim = ($cymbal_anims [1]) Blendduration = $drum_blend_time
					case 43
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal3 timerId = CymbalTimer3 Anim = ($cymbal_anims [2]) Blendduration = $drum_blend_time
					case 41
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal4 timerId = CymbalTimer4 Anim = ($cymbal_anims [3]) Blendduration = $drum_blend_time
					case 42
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal4 timerId = CymbalTimer4 Anim = ($cymbal_anims [3]) Blendduration = $drum_blend_time
				endswitch
				elseif ((<note> >= 49) && (<note> <= 57))
				switch (<note>)
					case 56
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal1 timerId = CymbalTimer1 Anim = ($cymbal_anims [0]) Blendduration = $drum_blend_time
					case 57
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal2 timerId = CymbalTimer2 Anim = ($cymbal_anims [1]) Blendduration = $drum_blend_time
					case 55
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal3 timerId = CymbalTimer3 Anim = ($cymbal_anims [2]) Blendduration = $drum_blend_time
					case 53
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal4 timerId = CymbalTimer4 Anim = ($cymbal_anims [3]) Blendduration = $drum_blend_time
					case 54
					DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal4 timerId = CymbalTimer4 Anim = ($cymbal_anims [3]) Blendduration = $drum_blend_time
				endswitch
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
endscript

script handle_strum_event 
	Obj_KillSpawnedScript \{Name = hero_strum_guitar}
	Obj_SpawnscriptNow hero_strum_guitar Params = {note_length = <note_length>}
endscript

script handle_missed_strum_event 
	Obj_KillSpawnedScript \{Name = hero_strum_guitar}
	Obj_SpawnscriptNow hero_strum_guitar Params = {note_length = <note_length>}
endscript

script handle_start_playing 
	Obj_Getid
	ExtendCrc <objId> '_Info' out = info_struct
	if (<info_struct>.stance = INTRO || <info_struct>.stance = intro_smStg)
		handle_change_stance \{stance = stance_A}
	endif
endscript

script handle_fret_event 
	Obj_Getid
	ExtendCrc <objId> '_Info' out = info_struct
	formatText Checksumname = track 'track_%n' N = <note>
	fret_anims = ($<info_struct>.fret_anims)
	if ((<note> >= 118) && (<note> <= 127))
		Anim = (<fret_anims>.<track>)
		elseif ((<note> >= 101) && (<note> <= 110))
		Anim = (<fret_anims>.<track>)
	else
		return
	endif
	Obj_KillSpawnedScript \{Name = hero_play_fret_anim}
	Obj_SpawnscriptNow hero_play_fret_anim Params = {Anim = <Anim>}
endscript

script handle_finger_event 
	Obj_KillSpawnedScript \{Name = hero_play_chord}
	Obj_SpawnscriptNow hero_play_chord Params = {Chord = <Chord>}
endscript

script handle_missed_note 
	Obj_Getid
	ExtendCrc <objId> '_Info' out = info_struct
	if ($<info_struct>.playing_missed_note = FALSE)
		Change StructureName = <info_struct> playing_missed_note = TRUE
		strum_anims = $bad_strums
		anim_length = ($<info_struct>.last_strum_length)
		strum_anim = (<strum_anims>.<anim_length> [0])
		hero_play_strum_anim Anim = <strum_anim> Blendduration = 0.1
	endif
endscript

script handle_hit_note 
	Obj_Getid
	handle_hit_note_CFunc
endscript

script handle_change_stance \{speed = 1.0}
	Obj_Getid
	ExtendCrc <objId> '_Info' out = info_struct
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = TRUE
	endif
	if gotParam \{No_wait}
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = <stance>
			hero_play_anim Anim = <anim_to_run> speed = <speed>
			Ragdoll_MarkForReset
			hero_wait_until_anim_finished
		else
			Ragdoll_MarkForReset
		endif
		Change StructureName = <info_struct> stance = <stance>
		Change StructureName = <info_struct> next_stance = <stance>
		if (<display_debug_info> = TRUE)
			Printf Channel = Animinfo "%a stance is immediately changing to %b ...." A = <objId> B = <stance>
		endif
		if (<objId> = GUITARIST || <objId> = BASSIST)
			if (<stance> = INTRO || <stance> = intro_smStg || <stance> = stance_FrontEnd || <stance> = Stance_FrontEnd_Guitar)
				Change StructureName = <info_struct> disable_arms = 2
				Change StructureName = <info_struct> next_anim_disable_arms = 2
			else
				Change StructureName = <info_struct> disable_arms = 0
				Change StructureName = <info_struct> next_anim_disable_arms = 0
			endif
			obj_switchscript \{guitarist_idle}
		else
			obj_switchscript \{bandmember_idle}
		endif
	else
		if (<display_debug_info> = TRUE)
			Printf Channel = Animinfo "%a is queuing stance change to %b............." A = <objId> B = <stance>
		endif
		Change StructureName = <info_struct> next_stance = <stance>
		if (<objId> = GUITARIST || <objId> = BASSIST)
			if (<stance> = INTRO || <stance> = intro_smStg || <stance> = stance_FrontEnd || <stance> = Stance_FrontEnd_Guitar)
				Change StructureName = <info_struct> next_anim_disable_arms = 2
			else
				Change StructureName = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
	return
endscript

script queue_change_stance 
	Obj_Getid
	ExtendCrc <objId> '_Info' out = info_struct
	Change StructureName = <info_struct> next_stance = <stance>
endscript

script handle_play_anim 
	Obj_Getid
	ExtendCrc <objId> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = TRUE
	endif
	if gotParam \{No_wait}
		if (<display_debug_info> = TRUE)
			Printf Channel = Animinfo "%a will immediately start the %b anim........" A = <objId> B = <Anim>
		endif
		Change StructureName = <info_struct> current_anim = <Anim>
		Change StructureName = <info_struct> next_anim = NONE
		if gotParam \{repeat_count}
			Change StructureName = <info_struct> anim_repeat_count = <repeat_count>
		else
			Change StructureName = <info_struct> anim_repeat_count = 1
		endif
		if gotParam \{CYCLE}
			Change StructureName = <info_struct> cycle_anim = TRUE
		else
			Change StructureName = <info_struct> cycle_anim = FALSE
		endif
		if (<Name> = GUITARIST || <Name> = BASSIST)
			if gotParam \{Disable_auto_arms}
				Change StructureName = <info_struct> disable_arms = 2
				elseif gotParam \{disable_auto_strum}
				Change StructureName = <info_struct> disable_arms = 1
			else
				Change StructureName = <info_struct> disable_arms = 0
			endif
		endif
		Ragdoll_MarkForReset
		Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
		Obj_SpawnscriptNow hero_play_adjusting_random_anims Params = {Anim = <Anim>}
	else
		if (<display_debug_info> = TRUE)
			if (<info_struct>.next_anim != NONE)
				Printf Channel = Animinfo "******* %a is replacing queued anim %b with %c ******* " A = <objId> B = (<info_struct>.next_anim) C = <Anim>
			else
				Printf Channel = Animinfo "%a is queueing the %b anim........" A = <objId> B = <Anim>
			endif
		endif
		Change StructureName = <info_struct> next_anim = <Anim>
		if gotParam \{repeat_count}
			Change StructureName = <info_struct> next_anim_repeat_count = <repeat_count>
		else
			Change StructureName = <info_struct> next_anim_repeat_count = 1
		endif
		if gotParam \{CYCLE}
			Change StructureName = <info_struct> cycle_next_anim = TRUE
		else
			Change StructureName = <info_struct> cycle_next_anim = FALSE
		endif
		if (<Name> = GUITARIST || <Name> = BASSIST)
			if gotParam \{Disable_auto_arms}
				Change StructureName = <info_struct> next_anim_disable_arms = 2
				elseif gotParam \{disable_auto_strum}
				Change StructureName = <info_struct> next_anim_disable_arms = 1
			else
				Change StructureName = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
endscript

script handle_walking 
	Obj_Getid
	if (<objId> != <Name>)
		return
	endif
	ExtendCrc <objId> '_Info' out = info_struct
	if ($<info_struct>.allow_movement != TRUE)
		return
	endif
	if NOT ($<info_struct>.stance = stance_A)
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = stance_A
			hero_play_anim Anim = <anim_to_run>
			hero_wait_until_anim_finished
		endif
		Change StructureName = <info_struct> stance = stance_A
	endif
	Change StructureName = <info_struct> disable_arms = 0
	obj_switchscript guitarist_walking Params = {<...>}
endscript

script play_drum_anim \{Arm = Left Blendduration = $drum_blend_time}
	if NOT gotParam \{Anim}
		return
	endif
	if (<Arm> = Left)
		Obj_KillSpawnedScript \{Name = play_drummer_left_arm_anim}
		Obj_SpawnscriptNow play_drummer_left_arm_anim Params = {Anim = <Anim> Blendduration = <Blendduration>}
	else
		Obj_KillSpawnedScript \{Name = play_drummer_right_arm_anim}
		Obj_SpawnscriptNow play_drummer_right_arm_anim Params = {Anim = <Anim>}
	endif
endscript

script play_drummer_left_arm_anim 
	hero_play_anim Tree = $hero_drumming_branch timerId = leftarm_timer Target = DrummerLeftArm Anim = <Anim> Blendduration = <Blendduration>
	hero_wait_until_anim_finished \{Timer = leftarm_timer}
	Wait \{$drummer_arm_blend_out_delay Seconds}
	hero_play_anim Tree = $hero_drumming_branch timerId = leftarm_timer Target = DrummerLeftArm Anim = ($drummer_anims.stickdown_l) Blendduration = 0.6
	Wait \{$drummer_clear_arm_twist_value_delay Seconds}
	Change \{StructureName = drummer_info last_left_arm_note = 0}
endscript

script play_drummer_right_arm_anim 
	hero_play_anim Tree = $hero_drumming_branch timerId = rightarm_timer Target = DrummerRightArm Anim = <Anim> Blendduration = <Blendduration>
	hero_wait_until_anim_finished \{Timer = rightarm_timer}
	Wait \{$drummer_arm_blend_out_delay Seconds}
	hero_play_anim Tree = $hero_drumming_branch timerId = rightarm_timer Target = DrummerRightArm Anim = ($drummer_anims.stickdown_r) Blendduration = 0.6
	Wait \{$drummer_clear_arm_twist_value_delay Seconds}
	Change \{StructureName = drummer_info last_right_arm_note = 0}
endscript
