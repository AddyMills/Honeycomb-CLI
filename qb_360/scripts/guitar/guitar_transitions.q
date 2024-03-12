transition_playing = FALSE
current_playing_transition = None
Transition_Types = {
	intro = {
		textnl = 'intro'
	}
	fastintro = {
		textnl = 'fastintro'
	}
	practice = {
		textnl = 'practice'
	}
	preencore = {
		textnl = 'preencore'
	}
	encore = {
		textnl = 'encore'
	}
	restartencore = {
		textnl = 'restartencore'
	}
	preboss = {
		textnl = 'preboss'
	}
	boss = {
		textnl = 'boss'
	}
	restartboss = {
		textnl = 'restartboss'
	}
	songWon = {
		textnl = 'songwon'
	}
	songlost = {
		textnl = 'songlost'
	}
}
Default_Immediate_Transition = {
	time = 0
	ScriptTable = [
	]
}
Common_Immediate_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras'
				changenow
			}
		}
		{
			time = 100
			scr = Transition_StartRendering
		}
	]
}
Default_FastIntro_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_FastIntro_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = Transition_StopRendering
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 100
			scr = Transition_StartRendering
		}
		{
			time = 100
			scr = enable_tutorial_pause
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartEncore_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_RestartEncore_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = Transition_StopRendering
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 100
			scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartBoss_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_RestartBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = Transition_StopRendering
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 100
			scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Practice_Transition = {
	time = 5000
	ScriptTable = [
	]
}
Common_Practice_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = Transition_StopRendering
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				practice
			}
		}
		{
			time = 100
			scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Intro_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_Intro_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = Transition_StopRendering
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_intro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 1
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = Transition_StartRendering
		}
		{
			time = 100
			scr = GH_SFX_Intro_WarmUp
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreEncore_Transition = {
	time = 8000
	ScriptTable = [
		{
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = good
			}
		}
	]
}
Common_PreEncore_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = play_outro
			params = {
			}
		}
		{
			time = 0
			scr = Crowd_AllPlayAnim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_preencore'
				changenow
			}
		}
		{
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = good
			}
		}
	]
	EndWithDefaultCamera
}
Default_Encore_Transition = {
	time = 5000
	ScriptTable = [
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
	]
}
Common_Encore_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = Transition_StopRendering
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_encore'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 1
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreBoss_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_PreBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = play_outro
			params = {
			}
		}
		{
			time = 0
			scr = Crowd_AllPlayAnim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_preboss'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_Boss_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_Boss_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = Transition_StopRendering
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_boss'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 1
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_SongWon_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_SongWon_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = play_outro
			params = {
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			scr = Crowd_AllPlayAnim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_SongLost_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_SongLost_Transition = {
	ScriptTable = [
		{
			time = 0
			scr = play_lose_anims
			params = {
			}
		}
		{
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = bad
			}
		}
		{
			time = 0
			scr = play_outro
			params = {
				kill_cameracuts_iterator
				song_failed_pitch_streams = 1
			}
		}
		{
			time = 0
			scr = Crowd_AllPlayAnim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = Transition_CameraCut
			params = {
				prefix = 'cameras_lose'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}

script Transition_SelectTransition \{practice_intro = 0}
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		change \{current_transition = intro}
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		Career_Songs = <tier_global>
		tier = ($setlist_selection_tier)
		FormatText checksumname = tier_checksum 'tier%s' s = <tier>
		if NOT StructureContains structure = ($<Career_Songs>) <tier_checksum>
			change \{current_transition = intro}
			return
		endif
		if Progression_IsBossSong tier_global = <tier_global> tier = <tier> song = ($current_song)
			if should_play_boss_intro
				if NOT ($current_song = bossdevil)
					change \{current_transition = boss}
				else
					change \{current_transition = fastintro}
				endif
			else
				change \{current_transition = fastintro}
			endif
			return
		endif
		if Progression_IsEncoreSong tier_global = <tier_global> tier = <tier> song = ($current_song)
			change \{current_transition = encore}
			return
		endif
	endif
	if ($game_mode = p1_quickplay)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		SetList_Songs = <tier_global>
		tier = ($setlist_selection_tier)
		FormatText checksumname = tier_checksum 'tier%s' s = <tier>
		if NOT StructureContains structure = ($<SetList_Songs>) <tier_checksum>
			change \{current_transition = intro}
			return
		endif
	endif
	change \{current_transition = intro}
endscript

script Transition_KillAll 
	KillSpawnedScript \{id = transitions}
	change \{transition_playing = FALSE}
	change \{current_playing_transition = None}
endscript

script Transition_GetTime \{type = intro}
	if StructureContains structure = $Transition_Types <type>
		printstruct <...>
		type_textnl = ($Transition_Types.<type>.textnl)
	else
		printstruct <...>
		scriptassert \{"Unknown transition type"}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = Transition_Props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT globalexists name = <Transition_Props>
		FormatText checksumname = Transition_Props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	return transition_time = ($<Transition_Props>.time)
endscript

script Transition_Play \{type = intro}
	Transition_KillAll
	change current_playing_transition = <type>
	if StructureContains structure = $Transition_Types <type>
		type_textnl = ($Transition_Types.<type>.textnl)
	else
		printstruct <...>
		scriptassert \{"Unknown transition type"}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = event 'Common_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		<event>
	endif
	FormatText checksumname = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		<event>
	endif
	spawnscriptnow Transition_Play_Spawned id = transitions params = {<...>}
	FormatText checksumname = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
endscript

script Transition_Play_Spawned 
	change \{transition_playing = TRUE}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = Transition_Props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT globalexists name = <Transition_Props>
		FormatText checksumname = Transition_Props 'default_%p_Transition' p = <type_textnl>
		if NOT globalexists name = <Transition_Props>
			printstruct <...>
			scriptassert \{"Default Transition Struct not found"}
		endif
	endif
	transition_time = ($<Transition_Props>.time)
	spawnscriptnow Transition_Play_Iterator id = transitions params = {<...>}
	FormatText checksumname = Transition_Props 'Common_%p_Transition' p = <type_textnl>
	spawnscriptnow Transition_Play_Iterator id = transitions params = {<...>}
	getsongtimems
	time_offset = (0 - <time>)
	begin
	getsongtimems time_offset = <time_offset>
	if (<transition_time> <= <time>)
		change \{transition_playing = FALSE}
		break
	endif
	wait \{1 gameframe}
	repeat
	if StructureContains structure = ($<Transition_Props>) EndWithDefaultCamera
		if StructureContains structure = ($<Transition_Props>) SyncWithNoteCameras
			CameraCuts_GetNextNoteCameraTime
			getsongtimems
			if (<camera_time> >= 0 &&
					<camera_time> - <time> < 2000)
				CameraCuts_EnableChangeCam \{enable = FALSE}
			else
				if NOT ($game_mode = training)
					CameraCuts_SetArrayPrefix \{prefix = 'cameras' changenow}
				else
					CameraCuts_EnableChangeCam \{enable = FALSE}
				endif
			endif
		else
			if NOT ($game_mode = training)
				CameraCuts_SetArrayPrefix \{prefix = 'cameras' changenow}
			else
				CameraCuts_EnableChangeCam \{enable = FALSE}
			endif
		endif
	endif
	FormatText checksumname = event 'Common_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
	FormatText checksumname = event '%s_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
	change \{current_playing_transition = None}
endscript

script Transition_Play_Iterator 
	getsongtimems
	time_offset = (0 - <time>)
	GetArraySize ($<Transition_Props>.ScriptTable)
	if (<array_size> = 0)
		return
	endif
	getsongtimems time_offset = <time_offset>
	array_count = 0
	begin
	begin
	getsongtimems time_offset = <time_offset>
	if ($<Transition_Props>.ScriptTable [<array_count>].time <= <time>)
		break
	endif
	wait \{1 gameframe}
	repeat
	if ScriptExists ($<Transition_Props>.ScriptTable [<array_count>].scr)
		spawnscriptnow ($<Transition_Props>.ScriptTable [<array_count>].scr) id = transitions params = {transition_time = <transition_time> ($<Transition_Props>.ScriptTable [<array_count>].params)}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script Transition_Wait 
	begin
	if ($transition_playing = FALSE)
		return
	endif
	wait \{1 gameframe}
	repeat
endscript

script Transition_PlayAnim \{Cycle = 0}
	<obj> :Obj_SwitchScript Transition_PlayAnim_Spawned params = {anim = <anim> Cycle = <Cycle> blendduration = <blendduration>}
endscript

script Transition_PlayAnim_Spawned 
	begin
	GameObj_PlayAnim anim = <anim> blendduration = <blendduration>
	GameObj_WaitAnimFinished
	if (<Cycle> = 0)
		break
	endif
	repeat
endscript

script Transition_CameraCut 
	CameraCuts_SetArrayPrefix <...> Length = <transition_time>
endscript

script Transition_StopRendering 
	printf \{"Transition_StopRendering"}
	stoprendering
endscript

script Transition_StartRendering 
	printf \{"Transition_StartRendering"}
	startrendering
	enable_pause
	change \{is_changing_levels = 0}
	if ($blade_active = 1)
		gh3_start_pressed
	endif
endscript

script Transition_Printf 
	printf <...>
endscript

script Transitions_ResetZone 
	printf \{"Transitions_ResetZone"}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = reset_func '%s_ResetTransition' s = <pakname>
	if ScriptExists <reset_func>
		<reset_func>
	endif
	FormatText checksumname = nodearray_checksum '%s_NodeArray' s = <pakname>
	if NOT globalexists name = <nodearray_checksum> type = array
		return
	endif
	GetArraySize $<nodearray_checksum>
	array_count = 0
	begin
	resetvalid = TRUE
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) createdfromvariable
		resetvalid = FALSE
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) createdonprogress
		resetvalid = FALSE
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) class
		if NOT ($<nodearray_checksum> [<array_count>].class = gameobject ||
				$<nodearray_checksum> [<array_count>].class = levelgeometry)
			resetvalid = FALSE
		endif
	else
		resetvalid = FALSE
	endif
	if (<resetvalid> = TRUE)
		printf "Resetting %s" s = ($<nodearray_checksum> [<array_count>].name)
		Kill name = ($<nodearray_checksum> [<array_count>].name)
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) createdatstart
			Create name = ($<nodearray_checksum> [<array_count>].name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script Common_PreEncore_TransitionSetup 
	PreEncore_Crowd_Build_SFX
	change_crowd_looping_sfx \{crowd_looping_state = good}
endscript

script Common_PreEncore_TransitionEnd 
endscript

script Common_Encore_TransitionSetup 
	GH_SFX_Play_Encore_Audio_From_Zone_Memory
endscript

script Common_Boss_TransitionSetup 
	GH_SFX_Play_Boss_Audio_From_Zone_Memory
endscript

script Common_Encore_TransitionEnd 
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
endscript
