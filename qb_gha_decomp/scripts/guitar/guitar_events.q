guitar_events = [
	{
		event = missed_note
		scr = GuitarEvent_MissedNote
	}
	{
		event = unnecessary_note
		scr = GuitarEvent_UnnecessaryNote
	}
	{
		event = hit_notes
		scr = GuitarEvent_HitNotes
	}
	{
		event = hit_note
		scr = GuitarEvent_HitNote
	}
	{
		event = star_power_on
		scr = GuitarEvent_StarPowerOn
	}
	{
		event = star_power_off
		scr = GuitarEvent_StarPowerOff
	}
	{
		event = song_failed
		scr = GuitarEvent_SongFailed
	}
	{
		event = song_won
		scr = GuitarEvent_SongWon
	}
	{
		event = star_hit_note
		scr = GuitarEvent_StarHitNote
	}
	{
		event = star_sequence_bonus
		scr = GuitarEvent_StarSequenceBonus
	}
	{
		event = star_miss_note
		scr = GuitarEvent_StarMissNote
	}
	{
		event = whammy_on
		scr = GuitarEvent_WhammyOn
	}
	{
		event = whammy_off
		scr = GuitarEvent_WhammyOff
	}
	{
		event = star_whammy_on
		scr = GuitarEvent_StarWhammyOn
	}
	{
		event = star_whammy_off
		scr = GuitarEvent_StarWhammyOff
	}
	{
		event = note_window_open
		scr = GuitarEvent_Note_Window_Open
	}
	{
		event = note_window_close
		scr = GuitarEvent_Note_Window_Close
	}
	{
		event = crowd_poor_medium
		scr = GuitarEvent_crowd_poor_medium
	}
	{
		event = crowd_medium_good
		scr = GuitarEvent_crowd_medium_good
	}
	{
		event = crowd_medium_poor
		scr = GuitarEvent_crowd_medium_poor
	}
	{
		event = crowd_good_medium
		scr = GuitarEvent_crowd_good_medium
	}
	{
		event = first_gem
		scr = GuitarEvent_CreateFirstGem
	}
	{
		event = firstnote_window_open
		scr = GuitarEvent_FirstNote_Window_Open
	}
]

script create_guitar_events 
	printf "create_guitar_events %a .........." a = <player_text>
	GetArraySize \{$guitar_events}
	array_entry = 0
	begin
	printf \{"adding..."}
	event = ($guitar_events [<array_entry>].event)
	extendcrc <event> <player_text> out = event
	seteventhandler Response = call_script event = <event> scr = event_spawner params = {event_spawned = <array_entry>}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	if IsWinPort
		WinPortGetConfigNumber \{name = "Sound.ClapDelay" defaultValue = 0}
		change winport_clap_delay = <value>
	endif
	Block
endscript

script event_spawner 
	spawnscriptnow ($guitar_events [<event_spawned>].scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf "Event Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	FormatText checksumname = song '%s_%e' s = <song_prefix> e = <event_string> addtostringlookup
	array_entry = 0
	GetArraySize $<song>
	if (<array_size> = 0)
		return
	endif
	getsongtimems time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < (($<song> [<array_entry>]).time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	array_size = (<array_size> - <array_entry>)
	if (<array_size> = 0)
		return
	endif
	begin
	TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry> arrayofstructures
	begin
	if TimeMarkerReached
		getsongtimems time_offset = <time_offset>
		break
	endif
	wait \{1 gameframe}
	repeat
	TimeMarkerReached_ClearParams
	ScriptName = ($<song> [<array_entry>].scr)
	if ScriptExists <ScriptName>
		spawnscriptnow <ScriptName> params = {time = <time> ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif SymbolIsCFunc <ScriptName>
		<ScriptName> {time = <time> ($<song> [<array_entry>].params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script GuitarEvent_MissedNote 
	if (<bum_note> = 1)
		Guitar_Wrong_Note_Sound_Logic <...>
	endif
	if ($is_network_game && ($<player_status>.player = 2))
		if (<silent_miss> = 1)
			spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text)}
		endif
	else
		if NOT ($<player_status>.guitar_volume = 0)
			if (<silent_miss> = 1)
				spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text)}
			else
				change structurename = <player_status> guitar_volume = 0
				UpdateGuitarVolume
			endif
		endif
	endif
	CrowdDecrease player_status = <player_status>
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			if CompositeObjectExists name = (<player_status>.band_member)
				LaunchEvent type = Anim_MissedNote target = (<player_status>.band_member)
			endif
		endif
	endif
	note_time = ($<song> [<array_entry>] [0])
	if ($show_play_log = 1)
		output_log_text "Missed Note (%t)" t = <note_time> color = orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	FormatText checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = TRUE
	DoScreenElementMorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	wait <half_time> seconds
	DoScreenElementMorph id = <highway> rgba = ($highway_normal) time = <half_time>
endscript

script Guitar_Wrong_Note_Sound_Logic 
	if ($current_num_players = 1)
		get_song_rhythm_track song = ($current_song)
		if ($<player_status>.part = rhythm)
			if (<rhythm_track> = 1)
				SoundEvent \{event = Single_Player_Bad_Note_Guitar}
			else
				SoundEvent \{event = Single_Player_Bad_Note_Bass}
			endif
		else
			SoundEvent \{event = Single_Player_Bad_Note_Guitar}
		endif
	else
		if ($<player_status>.player = 1)
			get_song_rhythm_track song = ($current_song)
			if ($<player_status>.part = rhythm)
				if (<rhythm_track> = 1)
					SoundEvent \{event = First_Player_Bad_Note_Guitar}
				else
					SoundEvent \{event = First_Player_Bad_Note_Bass}
				endif
			else
				SoundEvent \{event = First_Player_Bad_Note_Guitar}
			endif
		else
			get_song_rhythm_track song = ($current_song)
			if ($boss_battle = 1)
				SoundEvent \{event = Second_Player_Bad_Note_Guitar}
			else
				if ($<player_status>.part = rhythm)
					if (<rhythm_track> = 1)
						SoundEvent \{event = Second_Player_Bad_Note_Guitar}
					else
						SoundEvent \{event = Second_Player_Bad_Note_Bass}
					endif
				else
					SoundEvent \{event = Second_Player_Bad_Note_Guitar}
				endif
			endif
		endif
	endif
endscript

script GuitarEvent_UnnecessaryNote 
	if ($transition_playing = TRUE)
		return
	endif
	Guitar_Wrong_Note_Sound_Logic <...>
	if NOT ($is_network_game && ($<player_status>.player = 2))
		change structurename = <player_status> guitar_volume = 0
		UpdateGuitarVolume
	endif
	CrowdDecrease player_status = <player_status>
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			if CompositeObjectExists name = (<player_status>.band_member)
				LaunchEvent type = Anim_MissedNote target = (<player_status>.band_member)
			endif
		endif
	endif
	if ($show_play_log = 1)
		if (<array_entry> > 0)
			<songtime> = (<songtime> - ($check_time_early * 1000.0))
			next_note = ($<song> [<array_entry>] [0])
			prev_note = ($<song> [(<array_entry> -1)] [0])
			next_time = (<next_note> - <songtime>)
			prev_time = (<songtime> - <prev_note>)
			if (<prev_time> < ($check_time_late * 1000.0))
				<prev_time> = 1000000.0
			endif
			if (<next_time> < <prev_time>)
				<next_time> = (0 - <next_time>)
				output_log_text "ME: %n (%t)" n = <next_time> t = <next_note> color = red
			else
				output_log_text "ML: %n (%t)" n = <prev_time> t = <prev_note> color = darkred
			endif
		endif
	endif
endscript

script GuitarEvent_HitNotes 
	if GuitarEvent_HitNotes_CFunc
		UpdateGuitarVolume
	endif
	if ($Debug_Audible_HitNote = 1)
		SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
	endif
endscript

script GuitarEvent_HitNote 
	spawnscriptnow GuitarEvent_HitNote_Spawned params = {<...>}
endscript

script GuitarEvent_HitNote_Spawned 
	if ($game_mode = p2_battle || $boss_battle = 1)
		change structurename = <player_status> last_hit_note = <color>
	endif
	wait \{1 gameframe}
	spawnscriptnow hit_note_fx params = {name = <fx_id> Pos = <Pos> player_text = <player_text> star = ($<player_status>.star_power_used) player = <player>}
endscript
hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		0
		255
		255
		255
	]
	end_color = [
		0
		255
		255
		0
	]
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
whammy_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.5
}

script hit_note_fx 
	NoteFX <...>
	wait \{6 gameframes}
	destroy2dparticlesystem id = <particle_id> kill_when_empty
	wait \{10 gameframes}
	if ScreenElementExists id = <fx_id>
		DestroyScreenElement id = <fx_id>
	endif
endscript

script GuitarEvent_StarPowerOn 
	spawnscriptnow GH_Star_Power_Verb_On params = {which_player = <player>}
	FormatText checksumname = scriptID '%p_StarPower_StageFX' p = <player_text>
	SpawnScriptLater Do_StarPower_StageFX id = <scriptID> params = {<...>}
	StarPowerOn player = <player>
endscript

script GuitarEvent_StarPowerOff 
	GH_Star_Power_Verb_Off
	spawnscriptnow rock_meter_star_power_off params = {player_text = <player_text>}
	SpawnScriptLater Kill_StarPower_StageFX params = {<...>}
	FormatText checksumname = cont 'starpower_container_left%p' p = <player_text> addtostringlookup = TRUE
	if ScreenElementExists id = <cont>
		DoScreenElementMorph id = <cont> alpha = 0
	endif
	FormatText checksumname = cont 'starpower_container_right%p' p = <player_text> addtostringlookup = TRUE
	if ScreenElementExists id = <cont>
		DoScreenElementMorph id = <cont> alpha = 0
	endif
	FormatText checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = TRUE
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($highway_normal)
	endif
	spawnscriptnow \{Kill_StarPower_Camera}
endscript
winport_clap_delay = 0.18

script GuitarEvent_PreFretbar 
	if ($winport_clap_delay > 0)
		wait \{$winport_clap_delay seconds}
		if ($<player_status>.star_power_used = 1)
			if ($game_mode != tutorial)
				SoundEvent \{event = Crowd_Individual_Clap_To_Beat}
			endif
		else
			if ($CrowdListenerStateClapOn1234 = 1)
				SoundEvent \{event = Crowd_Individual_Clap_To_Beat}
			endif
		endif
	endif
endscript
beat_flip = 0

script GuitarEvent_Fretbar 
	if ($current_num_players = 2)
		if ($game_mode = p2_battle || $boss_battle)
			<dying> = 0
			if (($player1_status.current_health) <= $crowd_poor_medium * $highway_flash_dying)
				<dying> = 1
			endif
			set_sidebar_flash <...> player_status = player1_status
			<dying> = 0
			if (($player2_status.current_health) <= $crowd_poor_medium * $highway_flash_dying)
				<dying> = 1
			endif
			if NOT ($player1_status.highway_layout = solo_highway)
				set_sidebar_flash <...> player_status = player2_status
			endif
		else
			<dying> = 0
			if ($current_crowd <= $crowd_poor_medium * $highway_flash_dying)
				<dying> = 1
			endif
			if ($game_mode = p2_faceoff)
				<dying> = 0
			endif
			if ($game_mode = p2_pro_faceoff)
				<dying> = 0
			endif
			set_sidebar_flash <...> player_status = player1_status
			if NOT ($player1_status.highway_layout = solo_highway)
				set_sidebar_flash <...> player_status = player2_status
			endif
		endif
	else
		<dying> = 0
		if ($current_crowd <= $crowd_poor_medium * $highway_flash_dying)
			<dying> = 1
		endif
		set_sidebar_flash <...> player_status = player1_status
	endif
	change beat_flip = (1 - $beat_flip)
endscript

script set_sidebar_flash 
	FormatText checksumname = left 'sidebar_left%p' p = ($<player_status>.text) addtostringlookup = TRUE
	FormatText checksumname = RIGHT 'sidebar_right%p' p = ($<player_status>.text) addtostringlookup = TRUE
	if ($<player_status>.star_power_used = 1)
		if ($beat_flip = 0)
			SetScreenElementProps id = <left> rgba = ($sidebar_starpower0)
			SetScreenElementProps id = <RIGHT> rgba = ($sidebar_starpower0)
		else
			SetScreenElementProps id = <left> rgba = ($sidebar_starpower1)
			SetScreenElementProps id = <RIGHT> rgba = ($sidebar_starpower1)
		endif
	else
		if (<dying> = 1)
			if ($beat_flip = 0)
				SetScreenElementProps id = <left> rgba = ($sidebar_dying0)
				SetScreenElementProps id = <RIGHT> rgba = ($sidebar_dying0)
			else
				SetScreenElementProps id = <left> rgba = ($sidebar_dying1)
				SetScreenElementProps id = <RIGHT> rgba = ($sidebar_dying1)
			endif
		else
			if ($<player_status>.star_power_amount >= 50.0)
				if ($beat_flip = 0)
					SetScreenElementProps id = <left> rgba = ($sidebar_starready0)
					SetScreenElementProps id = <RIGHT> rgba = ($sidebar_starready0)
				else
					SetScreenElementProps id = <left> rgba = ($sidebar_starready1)
					SetScreenElementProps id = <RIGHT> rgba = ($sidebar_starready1)
				endif
			else
				if ($beat_flip = 0)
					SetScreenElementProps id = <left> rgba = ($sidebar_normal0)
					SetScreenElementProps id = <RIGHT> rgba = ($sidebar_normal0)
				else
					SetScreenElementProps id = <left> rgba = ($sidebar_normal1)
					SetScreenElementProps id = <RIGHT> rgba = ($sidebar_normal1)
				endif
			endif
		endif
	endif
endscript

script GuitarEvent_Fretbar_Early 
endscript

script GuitarEvent_Fretbar_Late 
endscript

script check_first_note_formed 
	GetSongTime
	<starttime> = (<songtime> - 0.0167)
	duration = ($<player_status>.check_time_early + $<player_status>.check_time_late)
	begin
	GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		change structurename = <player_status> guitar_volume = 100
		UpdateGuitarVolume
	endif
	wait \{1 gameframe}
	GetSongTime
	if ((<songtime> - <starttime>) >= <duration>)
		break
	endif
	repeat
endscript

script GuitarEvent_FirstNote_Window_Open 
	if IsGuitarController controller = ($<player_status>.controller)
		GetStrumPattern entry = 0 song = <song>
		spawnscriptnow check_first_note_formed params = {strum = <strum> player_status = <player_status>}
	else
		change structurename = <player_status> guitar_volume = 100
		UpdateGuitarVolume
	endif
endscript

script GuitarEvent_Note_Window_Open 
	if ($Debug_Audible_Open = 1)
		SoundEvent \{event = GH_SFX_BeatWindowOpenSoundEvent}
	endif
	GetSongTime
	<starttime> = (<songtime> - 0.0167)
	begin
	wait \{1 gameframe}
	GetSongTime
	if ((<songtime> - <starttime>) >= $check_time_early)
		break
	endif
	repeat
	if ($Debug_Audible_Downbeat = 1)
		SoundEvent \{event = gh_sfx_beatsoundevent}
	endif
endscript

script GuitarEvent_Note_Window_Close 
	if ($Debug_Audible_Close = 1)
		SoundEvent \{event = GH_SFX_BeatWindowCloseSoundEvent}
	endif
endscript
blueWhammyFXID01p1 = jow_nil
blueWhammyFXID02p1 = jow_nil
greenWhammyFXID01p1 = jow_nil
greenWhammyFXID02p1 = jow_nil
orangeWhammyFXID01p1 = jow_nil
orangeWhammyFXID02p1 = jow_nil
redWhammyFXID01p1 = jow_nil
redWhammyFXID02p1 = jow_nil
yellowWhammyFXID01p1 = jow_nil
yellowWhammyFXID02p1 = jow_nil
blueWhammyFXID01p2 = jow_nil
blueWhammyFXID02p2 = jow_nil
greenWhammyFXID01p2 = jow_nil
greenWhammyFXID02p2 = jow_nil
orangeWhammyFXID01p2 = jow_nil
orangeWhammyFXID02p2 = jow_nil
redWhammyFXID01p2 = jow_nil
redWhammyFXID02p2 = jow_nil
yellowWhammyFXID01p2 = jow_nil
yellowWhammyFXID02p2 = jow_nil

script Destroy_AllWhammyFX 
	WhammyFXOffAll \{player_status = player1_status}
	WhammyFXOffAll \{player_status = player2_status}
endscript

script GuitarEvent_WhammyOn 
	WhammyFXOn <...>
endscript

script GuitarEvent_WhammyOff 
	WhammyFXOff <...>
endscript

script GuitarEvent_StarWhammyOn 
endscript

script GuitarEvent_StarWhammyOff 
endscript

script GuitarEvent_SongFailed 
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	if ($is_network_game)
		spawnscriptnow \{online_fail_song}
		return
	endif
	if ($game_mode = p2_battle)
		GuitarEvent_SongWon \{battle_win = 1}
	else
		KillSpawnedScript \{name = GuitarEvent_SongWon_Spawned}
		spawnscriptnow \{GuitarEvent_SongFailed_Spawned}
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	disable_pause
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	if ($is_network_game)
		change \{gIsInNetGame = 0}
	endif
	if ($is_network_game)
		KillSpawnedScript \{name = dispatch_player_state}
		kill_start_key_binding
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
		endif
		mark_unsafe_for_shutdown
	endif
	getsongtimems
	change failed_song_time = <time>
	Achievements_SongFailed
	pausegame
	Progression_SongFailed
	if ($boss_battle = 1)
		kill_start_key_binding
		if ($current_song = bossdevil)
			preload_movie = 'Satan-Battle_LOSS'
		else
			preload_movie = 'Player2_wins'
		endif
		KillAllMovies
		PreLoadMovie {
			movie = <preload_movie>
			textureslot = 1
			texturepri = 70
			no_looping
			no_hold
			nowait
		}
		FormatText textname = winner_text "%s Rocks!" s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = Morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = Slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = Satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		spawnscriptnow \{wait_and_play_you_rock_movie}
		wait \{0.2 seconds}
		spawnscriptnow \{waitAndKillHighway}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <winner_text>}
	endif
	if ($is_network_game = 0)
		xenon_singleplayer_session_begin_uninit
		spawnscriptnow \{xenon_singleplayer_session_complete_uninit params = {song_failed}}
	endif
	UnPauseGame
	SoundEvent \{event = Crowd_Fail_Song_SFX}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	Transition_Play \{type = songlost}
	Transition_Wait
	change \{current_transition = None}
	pausegame
	restore_start_key_binding
	spawnscriptnow \{ui_flow_manager_respond_to_action params = {action = fail_song}}
	if ($current_num_players = 1)
		SoundEvent \{event = Crowd_Fail_Song_SFX}
	else
		SoundEvent \{event = Crowd_Med_To_Good_SFX}
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
	KillSpawnedScript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
endscript
GPULog_OutputFilename = 'none'

script GuitarEvent_SongWon \{battle_win = 0}
	if notcd
		if ($output_gpu_log = 1)
			if IsPS3
				FormatText \{textname = filename
					'%s_gpu_ps3'
					s = $current_level
					DontAssertForChecksums}
			else
				FormatText \{textname = filename
					'%s_gpu'
					s = $current_level
					DontAssertForChecksums}
			endif
			if NOT StringEquals \{a = $GPULog_OutputFilename b = 'none'}
				<filename> = $GPULog_OutputFilename
			endif
			TextOutputEnd output_text filename = <filename>
		endif
		if ($output_song_stats = 1)
			FormatText \{textname = filename
				'%s_stats'
				s = $current_song
				DontAssertForChecksums}
			TextOutputStart
			TextOutput \{text = "Player 1"}
			FormatText textname = text "Score: %s" s = ($player1_status.Score) DontAssertForChecksums
			TextOutput text = <text>
			FormatText textname = text "Notes Hit: %n of %t" n = ($player1_status.notes_hit) t = ($player1_status.total_notes) DontAssertForChecksums
			TextOutput text = <text>
			FormatText textname = text "Best Run: %r" r = ($player1_status.best_run) DontAssertForChecksums
			TextOutput text = <text>
			FormatText textname = text "Max Notes: %m" m = ($player1_status.max_notes) DontAssertForChecksums
			TextOutput text = <text>
			FormatText textname = text "Base score: %b" b = ($player1_status.base_score) DontAssertForChecksums
			TextOutput text = <text>
			if (($player1_status.base_score) = 0)
				FormatText \{textname = text "Score Scale: n/a"}
			else
				FormatText textname = text "Score Scale: %s" s = (($player1_status.Score) / ($player1_status.base_score)) DontAssertForChecksums
			endif
			TextOutput text = <text>
			if (($player1_status.total_notes) = 0)
				FormatText \{textname = text "Notes Hit Percentage: n/a"}
			else
				FormatText textname = text "Notes Hit Percentage: %s" s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) DontAssertForChecksums
			endif
			TextOutput text = <text>
			TextOutputEnd output_text filename = <filename>
		endif
	endif
	if ($current_num_players = 2)
		getsongtimems
		if ($last_time_in_lead_player = 0)
			change structurename = player1_status time_in_lead = ($player1_status.time_in_lead + <time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 1)
			change structurename = player2_status time_in_lead = ($player2_status.time_in_lead + <time> - $last_time_in_lead)
		endif
		change \{last_time_in_lead_player = -1}
	endif
	if ($game_mode = p2_battle)
		if NOT (<battle_win> = 1)
			change \{save_current_powerups_p1 = $current_powerups_p1}
			change \{save_current_powerups_p2 = $current_powerups_p2}
			change \{current_powerups_p1 = [0 0 0]}
			change \{current_powerups_p2 = [0 0 0]}
			change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			change \{structurename = player1_status current_num_powerups = 0}
			change \{structurename = player2_status current_num_powerups = 0}
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			change structurename = player1_status save_health = <p1_health>
			change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if ScreenElementExists \{id = battlemode_container}
				DestroyScreenElement \{id = battlemode_container}
			endif
			change \{battle_sudden_death = 1}
		else
			battlemode_killspawnedscripts
			change \{battle_sudden_death = 0}
		endif
	endif
	KillSpawnedScript \{name = GuitarEvent_SongFailed_Spawned}
	spawnscriptnow \{GuitarEvent_SongWon_Spawned}
endscript

script GuitarEvent_SongWon_Spawned 
	disable_pause
	if NOT ($game_mode = p2_battle)
		if ($game_mode = p2_career)
			change structurename = player1_status total_notes = ($player1_status.max_notes + $player2_status.max_notes)
			change structurename = player2_status total_notes = ($player1_status.max_notes + $player2_status.max_notes)
		else
			change structurename = player1_status total_notes = ($player1_status.max_notes)
			change structurename = player2_status total_notes = ($player2_status.max_notes)
		endif
	endif
	mark_unsafe_for_shutdown
	if ($is_network_game)
		change \{gIsInNetGame = 0}
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ($is_network_game)
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
		endif
		KillSpawnedScript \{name = dispatch_player_state}
		if ($player2_present)
			SendNetMessage {
				type = net_win_song
				note_streak = ($player1_status.best_run)
				notes_hit = ($player1_status.notes_hit)
				total_notes = ($player1_status.total_notes)
			}
		endif
		if NOT ($game_mode = p2_battle || $game_mode = p2_faceoff || $cheat_nofail = 1)
			online_song_end_write_stats
		endif
	endif
	if ($is_attract_mode = 1)
		spawnscriptnow \{ui_flow_manager_respond_to_action params = {action = exit_attract_mode play_sound = 0}}
		return
	endif
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	if ($current_song = bossdevil && $devil_finish = 0)
		change \{devil_finish = 1}
	else
		change \{devil_finish = 0}
	endif
	Progression_EndCredits_Done
	pausegame
	kill_start_key_binding
	if ($battle_sudden_death = 1)
		SoundEvent \{event = GH_SFX_BattleMode_Sudden_Death}
	else
		if ($game_mode = p1_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
			SoundEvent \{event = You_Rock_End_SFX}
		endif
	endif
	spawnscriptnow \{You_Rock_Waiting_Crowd_SFX}
	if ($game_mode = p2_battle || $boss_battle = 1)
		if ($player1_status.current_health >= $player2_status.current_health)
			if ($current_song = bossdevil)
				preload_movie = 'Satan-Battle_WIN'
			else
				preload_movie = 'Player1_wins'
			endif
		else
			if ($current_song = bossdevil)
				preload_movie = 'Satan-Battle_LOSS'
			else
				preload_movie = 'Player2_wins'
			endif
		endif
		if ($current_song = bossdevil && $devil_finish = 0)
			preload_movie = 'Golden_Guitar'
		endif
		if ($battle_sudden_death = 1)
			preload_movie = 'Fret_Flames'
		endif
		KillAllMovies
		PreLoadMovie {
			movie = <preload_movie>
			textureslot = 1
			texturepri = 70
			no_looping
			no_hold
			nowait
		}
	endif
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		spawnscriptnow \{wait_and_play_you_rock_movie}
	endif
	tie = FALSE
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	if ($battle_sudden_death = 1)
		winner_text = "Sudden Death!"
		winner_space_between = (65.0, 0.0)
		winner_scale = 1.8
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = "Two"
				SoundEvent \{event = UI_2ndPlayerWins_SFX}
			else
				winner = "One"
				SoundEvent \{event = UI_1stPlayerWins_SFX}
			endif
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					name = ($opponent_gamertag)
				else
					if (NetSessionFunc obj = match func = get_gamertag)
						name = <name>
					endif
				endif
				FormatText textname = winner_text <name>
				<text_pos> = (640.0, 240.0)
			else
				FormatText textname = winner_text "Player %s Rocks!" s = <winner>
			endif
			winner_space_between = (50.0, 0.0)
			winner_scale = 1.5
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.Score)
			p2_score = ($player2_status.Score)
			if (<p2_score> > <p1_score>)
				winner = "Two"
				SoundEvent \{event = UI_2ndPlayerWins_SFX}
			elseif (<p1_score> > <p2_score>)
				winner = "One"
				SoundEvent \{event = UI_1stPlayerWins_SFX}
			else
				<tie> = TRUE
				SoundEvent \{event = You_Rock_End_SFX}
			endif
			if (<tie> = TRUE)
				winner_text = "TIE!"
				winner_space_between = (15.0, 0.0)
				winner_scale = 0.5
				fit_dims = (100.0, 0.0)
			else
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						name = ($opponent_gamertag)
					else
						if (NetSessionFunc obj = match func = get_gamertag)
							name = <name>
						endif
					endif
					FormatText textname = winner_text <name>
					<text_pos> = (640.0, 240.0)
				else
					FormatText textname = winner_text "Player %s Rocks!" s = <winner>
				endif
				winner_space_between = (50.0, 0.0)
				winner_scale = 1.5
			endif
		else
			winner_text = "You Rock!"
			winner_space_between = (40.0, 0.0)
			fit_dims = (350.0, 0.0)
			winner_scale = 1.0
		endif
		if ($devil_finish = 1)
			winner_text = "Now Finish Him!"
			winner_space_between = (55.0, 0.0)
			winner_scale = 1.8
		endif
		if ($current_song = bossdevil && $devil_finish = 0)
			<rock_legend> = 1
			winner_text = "YOU'RE A"
			<text_pos> = (800.0, 300.0)
			winner_space_between = (40.0, 0.0)
			winner_scale = 1.1
			fit_dims = (200.0, 0.0)
		endif
	endif
	StringLength string = <winner_text>
	<fit_dims> = (<str_len> * (23.0, 0.0))
	if (<fit_dims>.(1.0, 0.0) >= 350)
		<fit_dims> = (350.0, 0.0)
	endif
	<yourock_text> = <winner_text>
	if (<rock_legend> = 1)
		<yourock_text_legend> = "ROCK LEGEND!"
	endif
	if (($is_network_game) && ($battle_sudden_death = 0) && (<tie> = FALSE))
		if NOT ($game_mode = p2_coop)
			<yourock_text_2> = "Rocks!"
		endif
	endif
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		spawnscriptnow \{waitAndKillHighway}
		KillSpawnedScript \{name = jiggle_text_array_elements}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text> placement = top}
		if (<rock_legend> = 1)
			spawnscriptnow create_exploding_text params = {parent = 'you_rock_legend_physics' text = <yourock_text_legend> placement = bottom}
		endif
		if ($is_network_game)
			if NOT ($game_mode = p2_coop)
				spawnscriptnow create_exploding_text params = {parent = 'you_rock_2_physics' text = <yourock_text_2> placement = bottom}
			endif
		endif
		if ($game_mode = p1_career)
			if ($current_song = bossjoe || $current_song = walkthiswayrundmc)
				if ($current_song = bossjoe)
					find_secret_character_index \{info_name = JoeP}
					<boss_character> = <index>
				elseif ($current_song = walkthiswayrundmc)
					find_secret_character_index \{info_name = DMC}
					<boss_character> = <index>
				endif
				if (<boss_character> >= 0)
					unlocked_for_purchase = 1
					GetGlobalTags ($Secret_Characters [<boss_character>].id)
					if (<unlocked_for_purchase> = 0)
						KillSpawnedScript \{name = Boss_Unlocked_Text}
						if ScreenElementExists \{id = boss_unlocked_text_container}
							DestroyScreenElement \{id = boss_unlocked_text_container}
						endif
						spawnscriptnow \{Boss_Unlocked_Text}
						SetGlobalTags ($Secret_Characters [<boss_character>].id) params = {unlocked_for_purchase = 1}
					endif
				endif
			endif
		endif
	endif
	change \{old_song = None}
	if NOT ($devil_finish = 1)
		if NOT ($battle_sudden_death = 1)
			Progression_SongWon
			if ($game_mode = p1_career)
				menu_top_rockers_check_for_new_top_score \{use_band_name}
			endif
			if ($current_transition = preencore)
				end_song
				menu_top_rockers_check_for_new_top_score \{use_band_name}
				UnPauseGame
				Transition_Play \{type = preencore}
				Transition_Wait
				change \{current_transition = None}
				pausegame
				ui_flow_manager_respond_to_action \{action = preencore_win_song}
				encore_transition = 1
			elseif ($current_transition = PREAEROSMITH)
				printf \{"Got PreAerosmith transition"}
				end_song
				menu_top_rockers_check_for_new_top_score \{use_band_name}
				UnPauseGame
				Transition_Play \{type = PREAEROSMITH}
				Transition_Wait
				change \{current_transition = None}
				pausegame
				ui_flow_manager_respond_to_action \{action = preaerosmith_win_song}
				encore_transition = 1
			elseif ($current_transition = preboss)
				end_song
				UnPauseGame
				Transition_Play \{type = preboss}
				Transition_Wait
				change \{current_transition = None}
				pausegame
				change \{use_last_player_scores = 1}
				change old_song = ($current_song)
				change \{show_boss_helper_screen = 1}
				ui_flow_manager_respond_to_action \{action = preboss_win_song}
				if ($is_network_game = 0)
					if NOT ($boss_battle = 1)
						if NOT ($devil_finish)
							agora_write_stats
						endif
					endif
					net_write_single_player_stats
					SpawnScriptLater \{xenon_singleplayer_session_complete_uninit}
				endif
				return
			else
				UnPauseGame
				Transition_Play \{type = songWon}
				Transition_Wait
				change \{current_transition = None}
				pausegame
			endif
		else
			UnPauseGame
			Transition_Play \{type = songWon}
			spawnscriptnow \{wait_and_play_you_rock_movie}
			spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text>}
			KillSpawnedScript \{name = Sudden_Death_Helper_Text}
			if ScreenElementExists \{id = sudden_death_helper_container}
				DestroyScreenElement \{id = sudden_death_helper_container}
			endif
			spawnscriptnow \{Sudden_Death_Helper_Text}
			wait \{0.1 seconds}
			spawnscriptnow \{waitAndKillHighway}
			wait \{6 seconds}
			change \{current_transition = None}
			pausegame
		endif
	else
		UnPauseGame
		Transition_Play \{type = songWon}
		spawnscriptnow \{wait_and_play_you_rock_movie}
		KillSpawnedScript \{name = jiggle_text_array_elements}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text>}
		devil_finish_anim
		wait \{0.15 seconds}
		spawnscriptnow \{waitAndKillHighway}
		wait \{2.5 seconds}
		SoundEvent \{event = Devil_Die_Transition_SFX}
		wait \{0.5 seconds}
		change \{current_transition = None}
		pausegame
	endif
	if ($battle_sudden_death = 1)
		stopsoundevent \{GH_SFX_BattleMode_Sudden_Death}
		printf \{"BATTLE MODE, Song Won, Begin Sudden Death"}
		change \{battle_sudden_death = 1}
		if ($is_network_game)
			ui_flow_manager_respond_to_action \{action = sudden_death_begin}
			SpawnScriptLater \{load_and_sync_timing params = {start_delay = 4000 player_status = player1_status}}
		else
			ui_flow_manager_respond_to_action \{action = select_retry}
			spawnscriptnow \{restart_song params = {sudden_death = 1}}
		endif
		KillSpawnedScript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
	elseif ($end_credits = 1 && $current_song = kingsandqueenscredits)
		KillSpawnedScript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
		change \{end_credits = 0}
		career_song_ended_select_quit
		start_flow_manager \{flow_state = career_credits_autosave_fs}
	elseif ($devil_finish = 1)
		start_devil_finish
	else
		KillSpawnedScript \{name = create_exploding_text}
		destroy_all_exploding_text
		ui_flow_manager_respond_to_action \{action = win_song}
	endif
	if ($is_network_game = 1)
		if ishost
			agora_write_stats
		endif
	elseif NOT ($boss_battle = 1)
		if NOT ($devil_finish)
			agora_write_stats
		endif
	endif
	if ($is_network_game = 0)
		net_write_single_player_stats
	endif
	if ($game_mode = p1_career)
		agora_update
	endif
	restore_player_selected_character_info \{player_status = player1_status}
	restore_player_selected_character_info \{player_status = player2_status}
	if ($is_network_game = 0)
		if NOT ($devil_finish = 1)
			if NOT ($battle_sudden_death = 1)
				if NOT GotParam \{encore_transition}
					spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
				endif
			endif
		endif
	endif
	SoundEvent \{event = Crowd_Med_To_Good_SFX}
	mark_safe_for_shutdown
	change \{check_for_unplugged_controllers = 1}
endscript

script Sudden_Death_Helper_Text 
	CreateScreenElement \{type = ContainerElement
		id = sudden_death_helper_container
		parent = root_window
		Pos = (0.0, 0.0)}
	FormatText \{checksumname = text_checksum 'sudden_death_helper'}
	CreateScreenElement {
		type = TextElement
		id = <text_checksum>
		parent = sudden_death_helper_container
		Pos = (640.0, 500.0)
		text = "All powerups are death drain attacks!"
		font = text_a4
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	FormatText \{checksumname = text_checksum2 'sudden_death_helper2'}
	CreateScreenElement {
		type = TextElement
		id = <text_checksum2>
		parent = sudden_death_helper_container
		Pos = (640.0, 540.0)
		text = "Launch a devastating DEATH DRAIN!"
		font = text_a4
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	wait \{5 seconds}
	DoScreenElementMorph {
		id = <text_checksum>
		alpha = 0
		time = 1
	}
	DoScreenElementMorph {
		id = <text_checksum2>
		alpha = 0
		time = 1
	}
endscript

script Boss_Unlocked_Text 
	disable_pause
	CreateScreenElement \{type = ContainerElement
		id = boss_unlocked_text_container
		parent = root_window
		Pos = (0.0, 0.0)}
	if ($current_song = bossjoe)
		FormatText \{textname = boss "Joe Perry"}
		Pos = (634.0, 580.0)
	elseif ($current_song = walkthiswayrundmc)
		Pos = (634.0, 580.0)
		FormatText \{textname = boss "DMC"}
	elseif ($current_song = dreamon)
		Pos = (634.0, 580.0)
		FormatText \{textname = boss "Just Push Play Girl"}
	endif
	FormatText \{textname = unlocked "unlocked"}
	FormatText \{textname = visit_store "VISIT THE VAULT"}
	FormatText textname = text "%s %b, %v" s = <boss> b = <unlocked> v = <visit_store>
	FormatText \{checksumname = boss_unlocked 'boss_unlocked'}
	if ScreenElementExists id = <boss_unlocked>
		DestroyScreenElement id = <boss_unlocked>
	endif
	CreateScreenElement {
		type = TextElement
		id = <boss_unlocked>
		parent = boss_unlocked_text_container
		Pos = <Pos>
		text = <text>
		font = text_a11
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	wait \{3 seconds}
	if ScreenElementExists id = <boss_unlocked>
		DoScreenElementMorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
	wait \{1 second}
	if ($current_song = bossjoe)
		FormatText \{textname = boss "Joe Perry Guitar Battle"}
		Pos = (634.0, 580.0)
		FormatText \{textname = unlocked "unlocked"}
		FormatText textname = text "%s %b, %v" s = <boss> b = <unlocked> v = <visit_store>
		FormatText \{checksumname = boss_unlocked 'boss_unlocked'}
		if ScreenElementExists id = <boss_unlocked>
			DestroyScreenElement id = <boss_unlocked>
		endif
		CreateScreenElement {
			type = TextElement
			id = <boss_unlocked>
			parent = boss_unlocked_text_container
			Pos = <Pos>
			text = <text>
			font = text_a11
			Scale = 0.8
			rgba = [255 255 255 255]
			just = [center bottom]
			z_priority = 500
			shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 0
		}
		if ScreenElementExists id = <boss_unlocked>
			DoScreenElementMorph {
				id = <boss_unlocked>
				alpha = 1
				time = 1
			}
		endif
		wait \{3 seconds}
		if ScreenElementExists id = <boss_unlocked>
			DoScreenElementMorph {
				id = <boss_unlocked>
				alpha = 0
				time = 1
			}
		endif
	endif
endscript

script start_devil_finish 
	change \{end_credits = 0}
	marker_count = 37
	get_song_prefix song = ($current_song)
	FormatText checksumname = marker_array '%s_markers' s = <song_prefix>
	starttime = ($<marker_array> [<marker_count>].time)
	startmarker = <marker_count>
	change \{CameraCuts_ForceTime = 0}
	stoprendering
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = <starttime> startmarker = <startmarker> no_render = 1 devil_finish_restart = 1
	devil_lose_anim
	wait \{20 frames}
	startrendering
	KillSpawnedScript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
	destroy_exploding_text \{parent = 'you_rock_legend_physics'}
endscript

script devil_finish_anim 
	wait \{1 gameframe}
	bassist :Obj_SwitchScript \{Transition_PlayAnim_Spawned params = {anim = GH3_Guit_Satn_A_Lose02}}
	change \{CameraCuts_AllowNoteScripts = FALSE}
	change \{CameraCuts_ForceTime = 3.2}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_boss_finish' Length = 0 changenow}
	spawnscriptnow \{devil_camera_flash}
endscript

script devil_camera_flash 
	wait \{2.7 seconds}
	fadetoblack \{on
		time = 0.03
		alpha = 1.0
		z_priority = 1000
		texture = white
		rgba = [
			255
			255
			255
			255
		]}
	wait \{0.04 seconds}
	SoundEvent \{event = Song_Intro_Kick_SFX}
	SoundEvent \{event = Practice_Mode_Crash2}
	fadetoblack \{Off}
endscript

script devil_lose_anim 
	change \{CameraCuts_AllowNoteScripts = FALSE}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_boss_dead' Length = 0 changenow}
	bassist :Obj_SwitchScript \{Transition_PlayAnim_Spawned params = {Cycle = 1 stance = lose anim = GH3_Guit_Satn_A_Lose03}}
endscript

script wait_and_play_you_rock_movie 
	begin
	if (isMoviePreLoaded textureslot = 1)
		StartPreLoadedMovie \{textureslot = 1}
		return
	endif
	wait \{1 gameframe}
	repeat
endscript

script waitAndKillHighway 
	wait \{0.5 seconds}
	SoundEvent \{event = Crowd_Fast_Surge_Cheer}
	disable_bg_viewport
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
tempo_iterator_offset = 0

script tempo_matching_iterator 
	printf "tempo_matching_iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	FormatText checksumname = timesig '%s_timesig' s = <song_prefix> addtostringlookup
	GetArraySize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	measure_count = 0
	song = ($<player_status>.current_song_fretbar_array)
	array_entry = 0
	fretbar_count = 0
	change tempo_iterator_offset = <time_offset>
	GetArraySize $<song>
	get_song_end_time song = ($current_song)
	begin
	<entry> = (<array_size> -2)
	<fret_time> = ($<song> [<entry>])
	if (<total_end_time> > <fret_time>)
		break
	endif
	<array_size> = (<array_size> - 1)
	repeat
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if (<timesig_entry> < <timesig_size>)
			if ($<timesig> [<timesig_entry>] [0] <= $<song> [<array_entry>])
				<timesig_num> = ($<timesig> [<timesig_entry>] [1])
				<timesig_den> = ($<timesig> [<timesig_entry>] [2])
				fretbar_count = 0
				timesig_entry = (<timesig_entry> + 1)
			endif
		endif
		if ((<time> - <skipleadin>) < $<song> [<array_entry>])
			break
		endif
		array_entry = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
		endif
		repeat <array_size>
		final_array_entry = (<array_size> - 1)
		array_size = (<array_size> - <array_entry>)
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			getsongtimems time_offset = <time_offset>
			if (<timesig_entry> < <timesig_size>)
				if ($<timesig> [<timesig_entry>] [0] <= $<song> [<array_entry>])
					<timesig_num> = ($<timesig> [<timesig_entry>] [1])
					<timesig_den> = ($<timesig> [<timesig_entry>] [2])
					fretbar_count = 0
					timesig_entry = (<timesig_entry> + 1)
				endif
			endif
			break
		endif
		wait \{1 gameframe}
		repeat
		TimeMarkerReached_ClearParams
		marker = ($<song> [<array_entry>])
		<array_entry> = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
			spawn_measure_callbacks
		endif
		if (<array_entry> < <final_array_entry>)
			change next_beat_time = ($<song> [<array_entry>])
			change time_to_next_beat = ($next_beat_time - <marker>)
			spawn_beat_callbacks \{time_to_next_beat = $time_to_next_beat}
		else
			change \{next_beat_time = -1}
			change \{time_to_next_beat = -1}
		endif
		repeat <array_size>
	endif
endscript
measure_callback = NullScript
beat_callback = NullScript

script SetMeasureCallback 
	if GotParam \{callback}
		change measure_callback = <callback>
	endif
endscript

script ClearMeasureCallbacks 
	change \{measure_callback = NullScript}
endscript

script SetBeatCallback 
	if GotParam \{callback}
		change beat_callback = <callback>
	endif
endscript

script ClearBeatCallbacks 
	change \{beat_callback = NullScript}
endscript

script GetTimeToNextBeat 
	getsongtimems \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script spawn_measure_callbacks 
	spawnscriptnow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	spawnscriptnow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script GuitarEvent_crowd_poor_medium 
	printf \{"Crowd went from poor to medium"}
endscript

script GuitarEvent_crowd_medium_good 
	printf \{"Crowd went from medium to good"}
endscript

script GuitarEvent_crowd_medium_poor 
	printf \{"Crowd went from medium to poor"}
endscript

script GuitarEvent_crowd_good_medium 
	printf \{"Crowd went from good to medium"}
endscript

script GuitarEvent_StarHitNote 
endscript

script GuitarEvent_StarSequenceBonus 
	if ($is_attract_mode = 1)
		return
	endif
	change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	if isSinglePlayerGame
		SoundEvent \{event = Star_Power_Awarded_SFX}
	else
		spawnscriptnow Star_Power_Awarded_SFX_Multiplayer params = {player = ($<player_status>.player)}
	endif
	FormatText checksumname = container_id 'gem_container%p' p = ($<player_status>.text) addtostringlookup = TRUE
	GetArraySize \{$gem_colors}
	gem_count = 0
	begin
	<note> = ($<song> [<array_entry>] [(<gem_count> + 1)])
	if (<note> > 0)
		color = ($gem_colors [<gem_count>])
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = ($button_up_models.<color>.left_pos_2d)
			<Angle> = ($button_models.<color>.Angle)
		else
			<pos2d> = ($button_up_models.<color>.pos_2d)
			<Angle> = ($button_models.<color>.left_angle)
		endif
		FormatText checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = TRUE
		CreateScreenElement {
			type = SpriteElement
			id = <name>
			parent = <container_id>
			material = sys_Big_Bolt01_sys_Big_Bolt01
			rgba = [255 255 255 255]
			Pos = <pos2d>
			rot_angle = <Angle>
			Scale = $star_power_bolt_scale
			just = [center bottom]
			z_priority = 6
		}
		FormatText checksumname = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = TRUE
		destroy2dparticlesystem id = <fx_id>
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		create2dparticlesystem {
			id = <fx_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = sys_Particle_Star01_sys_Particle_Star01
			parent = <container_id>
			start_color = [0 128 255 255]
			end_color = [0 128 128 0]
			start_scale = (0.55, 0.55)
			end_scale = (0.25, 0.25)
			start_angle_spread = 360.0
			min_rotation = -120.0
			max_rotation = 240.0
			emit_start_radius = 0.0
			emit_radius = 2.0
			emit_rate = 0.04
			emit_dir = 0.0
			emit_spread = 44.0
			velocity = 24.0
			friction = (0.0, 66.0)
			time = 2.0
		}
		FormatText checksumname = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = TRUE
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		create2dparticlesystem {
			id = <fx2_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = sys_Particle_Star02_sys_Particle_Star02
			parent = <container_id>
			start_color = [255 255 255 255]
			end_color = [128 128 128 0]
			start_scale = (0.5, 0.5)
			end_scale = (0.25, 0.25)
			start_angle_spread = 360.0
			min_rotation = -120.0
			max_rotation = 508.0
			emit_start_radius = 0.0
			emit_radius = 2.0
			emit_rate = 0.04
			emit_dir = 0.0
			emit_spread = 28.0
			velocity = 22.0
			friction = (0.0, 55.0)
			time = 2.0
		}
		FormatText checksumname = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = TRUE
		<particle_pos> = (<pos2d> - (0.0, 15.0))
		create2dparticlesystem {
			id = <fx3_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = sys_Particle_Spark01_sys_Particle_Spark01
			parent = <container_id>
			start_color = [0 255 255 255]
			end_color = [0 255 255 0]
			start_scale = (1.5, 1.5)
			end_scale = (0.25, 0.25)
			start_angle_spread = 360.0
			min_rotation = -500.0
			max_rotation = 500.0
			emit_start_radius = 0.0
			emit_radius = 2.0
			emit_rate = 0.04
			emit_dir = 0.0
			emit_spread = 180.0
			velocity = 12.0
			friction = (0.0, 0.0)
			time = 1.0
		}
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	wait \{$star_power_bolt_time seconds}
	gem_count = 0
	begin
	<note> = ($<song> [<array_entry>] [(<gem_count> + 1)])
	if (<note> > 0)
		FormatText checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = TRUE
		DestroyScreenElement id = <name>
		FormatText checksumname = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = TRUE
		destroy2dparticlesystem id = <fx_id> kill_when_empty
		FormatText checksumname = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = TRUE
		destroy2dparticlesystem id = <fx2_id> kill_when_empty
		FormatText checksumname = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = TRUE
		destroy2dparticlesystem id = <fx3_id> kill_when_empty
		wait \{1 gameframe}
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script GuitarEvent_StarMissNote 
endscript

script guitarevent_multiplier4xon 
	spawnscriptnow GuitarEvent_Multiplier4xOn_Spawned params = {<...>}
endscript

script GuitarEvent_Multiplier4xOn_Spawned 
	if ($disable_band = 0)
		ObjID = (<player_status>.band_member)
		GetPakManCurrent \{map = zones}
		if NOT (<pak> = z_soundcheck)
			wait \{1 gameframe}
			SafeGetUniqueCompositeObjectID preferredid = FingerSparks01 ObjID = <ObjID>
			CreateParticleSystem_fast name = <uniqueid> ObjID = <ObjID> groupid = zoneparticles bone = Bone_Hand_Middle_Mid_L params_script = $GP_4X_FingerSparks01
			MangleChecksums a = <uniqueid> b = <ObjID>
			change structurename = <player_status> FourX_FingerFXID01 = <mangled_id>
			wait \{1 gameframe}
			SafeGetUniqueCompositeObjectID preferredid = FingerFlames01 ObjID = <ObjID>
			CreateParticleSystem_fast name = <uniqueid> ObjID = <ObjID> groupid = zoneparticles bone = Bone_Hand_Middle_Mid_L params_script = $GP_4X_FingerFlames01
			MangleChecksums a = <uniqueid> b = <ObjID>
			change structurename = <player_status> FourX_FingerFXID02 = <mangled_id>
			wait \{1 gameframe}
			SafeGetUniqueCompositeObjectID preferredid = FingerSparks02 ObjID = <ObjID>
			CreateParticleSystem_fast name = <uniqueid> ObjID = <ObjID> groupid = zoneparticles bone = Bone_Hand_Middle_Mid_R params_script = {$GP_4X_FingerSparks01 emit_target = (0.0, -1.0, 0.0)}
			MangleChecksums a = <uniqueid> b = <ObjID>
			change structurename = <player_status> FourX_FingerFXID03 = <mangled_id>
			wait \{1 gameframe}
			SafeGetUniqueCompositeObjectID preferredid = FingerFlames02 ObjID = <ObjID>
			CreateParticleSystem_fast name = <uniqueid> ObjID = <ObjID> groupid = zoneparticles bone = Bone_Hand_Middle_Mid_R params_script = $GP_4X_FingerFlames01
			MangleChecksums a = <uniqueid> b = <ObjID>
			change structurename = <player_status> FourX_FingerFXID04 = <mangled_id>
		endif
	endif
	if ($allow_4x_effect = FALSE)
		hide_fourx_effect
	endif
endscript

script guitarevent_multiplier3xon 
endscript

script guitarevent_multiplier2xon 
endscript

script kill_4x_fx 
	KillSpawnedScript \{name = GuitarEvent_Multiplier4xOn_Spawned}
	if IsCreated ($<player_status>.FourX_FingerFXID01)
		($<player_status>.FourX_FingerFXID01) :emitrate rate = 0
		($<player_status>.FourX_FingerFXID01) :destroy ifempty = 1
	endif
	if IsCreated ($<player_status>.FourX_FingerFXID02)
		($<player_status>.FourX_FingerFXID02) :emitrate rate = 0
		($<player_status>.FourX_FingerFXID02) :destroy ifempty = 1
	endif
	if IsCreated ($<player_status>.FourX_FingerFXID03)
		($<player_status>.FourX_FingerFXID03) :emitrate rate = 0
		($<player_status>.FourX_FingerFXID03) :destroy ifempty = 1
	endif
	if IsCreated ($<player_status>.FourX_FingerFXID04)
		($<player_status>.FourX_FingerFXID04) :emitrate rate = 0
		($<player_status>.FourX_FingerFXID04) :destroy ifempty = 1
	endif
	change structurename = <player_status> FourX_FingerFXID01 = jow_nil
	change structurename = <player_status> FourX_FingerFXID02 = jow_nil
	change structurename = <player_status> FourX_FingerFXID03 = jow_nil
	change structurename = <player_status> FourX_FingerFXID04 = jow_nil
endscript

script hide_fourx_effect 
	if IsCreated ($player1_status.FourX_FingerFXID01)
		($player1_status.FourX_FingerFXID01) :emitrate rate = 0
	endif
	if IsCreated ($player1_status.FourX_FingerFXID02)
		($player1_status.FourX_FingerFXID02) :emitrate rate = 0
	endif
	if IsCreated ($player1_status.FourX_FingerFXID03)
		($player1_status.FourX_FingerFXID03) :emitrate rate = 0
	endif
	if IsCreated ($player1_status.FourX_FingerFXID04)
		($player1_status.FourX_FingerFXID04) :emitrate rate = 0
	endif
	if IsCreated ($player2_status.FourX_FingerFXID01)
		($player2_status.FourX_FingerFXID01) :emitrate rate = 0
	endif
	if IsCreated ($player2_status.FourX_FingerFXID02)
		($player2_status.FourX_FingerFXID02) :emitrate rate = 0
	endif
	if IsCreated ($player2_status.FourX_FingerFXID03)
		($player2_status.FourX_FingerFXID03) :emitrate rate = 0
	endif
	if IsCreated ($player2_status.FourX_FingerFXID04)
		($player2_status.FourX_FingerFXID04) :emitrate rate = 0
	endif
endscript

script show_fourx_effect 
	if IsCreated ($player1_status.FourX_FingerFXID01)
		($player1_status.FourX_FingerFXID01) :emitrate rate = 64
	endif
	if IsCreated ($player1_status.FourX_FingerFXID02)
		($player1_status.FourX_FingerFXID02) :emitrate rate = 24
	endif
	if IsCreated ($player1_status.FourX_FingerFXID03)
		($player1_status.FourX_FingerFXID03) :emitrate rate = 64
	endif
	if IsCreated ($player1_status.FourX_FingerFXID04)
		($player1_status.FourX_FingerFXID04) :emitrate rate = 24
	endif
	if IsCreated ($player2_status.FourX_FingerFXID01)
		($player2_status.FourX_FingerFXID01) :emitrate rate = 64
	endif
	if IsCreated ($player2_status.FourX_FingerFXID02)
		($player2_status.FourX_FingerFXID02) :emitrate rate = 24
	endif
	if IsCreated ($player2_status.FourX_FingerFXID03)
		($player2_status.FourX_FingerFXID03) :emitrate rate = 64
	endif
	if IsCreated ($player2_status.FourX_FingerFXID04)
		($player2_status.FourX_FingerFXID04) :emitrate rate = 24
	endif
endscript

script guitarevent_multiplier4xoff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
	SoundEvent \{event = Lose_Multiplier_Crowd}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 4}
	kill_4x_fx <...>
endscript

script guitarevent_multiplier3xoff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 3}
endscript

script guitarevent_multiplier2xoff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 2}
endscript

script GuitarEvent_KillSong 
	GH3_SFX_Stop_Sounds_For_KillSong
	GH_Star_Power_Verb_Off
	FormatText \{checksumname = player_status 'player1_status'}
	kill_4x_fx player_status = <player_status>
	FormatText \{checksumname = player_status 'player2_status'}
	kill_4x_fx player_status = <player_status>
endscript

script GuitarEvent_EnterVenue 
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	FormatText checksumname = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT globalexists name = <echo_params>
		echo_params = Echo_Crowd_Buss_Default
	endif
	if NOT globalexists name = <reverb_params>
		reverb_params = Reverb_Crowd_Buss_Default
	endif
	setsoundbusseffects effect = $<echo_params>
	setsoundbusseffects effect = $<reverb_params>
endscript

script GuitarEvent_ExitVenue 
	setsoundbusseffects \{effect = $Echo_Crowd_Buss}
	setsoundbusseffects \{effect = $Reverb_Crowd_Buss}
endscript

script GuitarEvent_CreateFirstGem 
	spawnscriptnow first_gem_fx params = {<...>}
endscript

script first_gem_fx 
	extendcrc <gem_id> '_particle' out = fx_id
	if GotParam \{is_star}
		if ($game_mode = p2_battle || $boss_battle = 1)
			<Pos> = (125.0, 170.0)
		else
			<Pos> = (255.0, 170.0)
		endif
	else
		<Pos> = (66.0, 20.0)
	endif
	destroy2dparticlesystem id = <fx_id>
	create2dparticlesystem {
		id = <fx_id>
		Pos = <Pos>
		z_priority = 8.0
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		parent = <gem_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (1.0, 1.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.3
		emit_dir = 0.0
		emit_spread = 160.0
		velocity = 0.01
		friction = (0.0, 0.0)
		time = 1.25
	}
	spawnscriptnow destroy_first_gem_fx params = {gem_id = <gem_id> fx_id = <fx_id>}
	wait \{0.8 seconds}
	destroy2dparticlesystem id = <fx_id> kill_when_empty
endscript

script destroy_first_gem_fx 
	begin
	if NOT ScreenElementExists id = <gem_id>
		destroy2dparticlesystem id = <fx_id>
		break
	endif
	wait \{1 gameframe}
	repeat
endscript

script GuitarEvent_GemStarPowerOn 
endscript

script GuitarEvent_BattleAttackFinished 
	GH3_Battle_Attack_Finished_SFX <...>
	Reset_Battle_DSP_Effects <...>
endscript

script GuitarEvent_TransitionIntro 
endscript

script GuitarEvent_TransitionFastIntro 
endscript

script GuitarEvent_TransitionPreEncore 
endscript

script GuitarEvent_TransitionPreAerosmith 
endscript

script GuitarEvent_TransitionEncore 
endscript

script GuitarEvent_TransitionPreBoss 
endscript

script GuitarEvent_TransitionBoss 
endscript
