intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
practice_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -3000
	highway_move_time = 2000
	button_ripple_start_time = -1800
	button_ripple_per_button_time = 100
	hud_start_time = -1400
	hud_move_time = 200
}
immediate_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = 0
	song_title_fade_time = 700
	song_title_on_time = 0
	highway_start_time = 0
	highway_move_time = 0
	button_ripple_start_time = 0
	button_ripple_per_button_time = 0
	hud_start_time = 0
	hud_move_time = 0
}
current_intro = fast_intro_sequence_props

script play_intro 
	Printf \{"Playing Intro"}
	printStruct <...>
	if ($show_boss_helper_screen = 1)
		return
	endif
	if ($is_attract_mode = 1)
		disable_bg_viewport
		return
	endif
	killspawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	if gotParam \{FAST}
		Change \{current_intro = fastintro_sequence_props}
		elseif gotParam \{PRACTICE}
		Change \{current_intro = practice_sequence_props}
	else
		Change \{current_intro = intro_sequence_props}
	endif
	if ($game_mode != tutorial)
		SpawnScriptNOw \{intro_song_info Id = intro_scripts}
	endif
	if NOT ($Cheat_PerformanceMode = 1 && $is_network_game = 0)
		SpawnScriptNOw \{intro_highway_move Id = intro_scripts}
	endif
	Player = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	formatText Textname = player_Text 'p%i' I = <Player>
	SpawnScriptNOw intro_buttonup_ripple Params = <...> Id = intro_scripts
	Player = (<Player> + 1)
	repeat $current_num_players
	if ($tutorial_disable_hud = 0)
		SpawnScriptNOw \{intro_hud_move Id = intro_scripts}
	endif
endscript

script destroy_intro 
	killspawnedScript \{Id = intro_scripts}
	killspawnedScript \{Name = Song_Intro_Kick_SFX_Waiting}
	killspawnedScript \{Name = Song_Intro_Highway_Up_SFX_Waiting}
	killspawnedScript \{Name = move_highway_2d}
	killspawnedScript \{Name = intro_buttonup_ripple}
	killspawnedScript \{Name = intro_hud_move}
	DoScreenElementMorph \{Id = intro_song_info_text Alpha = 0}
	DoScreenElementMorph \{Id = intro_artist_info_text Alpha = 0}
	DoScreenElementMorph \{Id = intro_performed_by_text Alpha = 0}
	Player = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player> AddToStringLookup
	EnableInput controller = ($<player_status>.controller)
	Player = (<Player> + 1)
	repeat $current_num_players
endscript

script intro_buttonup_ripple 
	EnableInput OFF controller = ($<player_status>.controller)
	begin
	GetSongtimeMS
	if ($current_intro.button_ripple_start_time + $current_starttime < <Time>)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		return
	endif
	getArraySize \{$gem_colors}
	Soundevent \{Event = Notes_Ripple_Up_SFX}
	ExtendCrc button_up_pixel_array ($<player_status>.Text) out = pixel_array
	buttonup_count = 0
	begin
	Wait ($current_intro.button_ripple_per_button_time / 1000.0) Seconds
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	if (<array_count> = <buttonup_count>)
		setarrayelement Arrayname = <pixel_array> globalArray Index = <array_count> NewValue = $button_up_pixels
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	buttonup_count = (<buttonup_count> + 1)
	repeat (<array_Size> + 1)
	EnableInput controller = ($<player_status>.controller)
endscript

script intro_song_info 
	begin
	GetSongtimeMS
	if ($current_intro.song_title_start_time + $current_starttime < <Time>)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	get_song_title Song = ($current_song)
	GetUppercaseString <Song_Title>
	intro_song_info_text :SetProps Text = <UppercaseString>
	intro_song_info_text :doMorph pos = ($current_intro.song_title_pos)
	get_song_artist Song = ($current_song)
	GetUppercaseString <song_artist>
	intro_artist_info_text :SetProps Text = <UppercaseString>
	intro_artist_info_text :doMorph pos = ($current_intro.song_artist_pos)
	get_song_artist_text Song = ($current_song)
	GetUppercaseString <song_artist_text>
	intro_performed_by_text :SetProps Text = <UppercaseString>
	intro_performed_by_text :doMorph pos = ($current_intro.performed_by_pos)
	intro_song_info_text :SetProps \{z_priority = 5.0}
	intro_artist_info_text :SetProps \{z_priority = 5.0}
	intro_performed_by_text :SetProps \{z_priority = 5.0}
	DoScreenElementMorph Id = intro_song_info_text Alpha = 1 Time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph Id = intro_performed_by_text Alpha = 1 Time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph Id = intro_artist_info_text Alpha = 1 Time = ($current_intro.song_title_fade_time / 1000.0)
	Wait ($current_intro.song_title_on_time / 1000.0) Seconds
	DoScreenElementMorph Id = intro_song_info_text Alpha = 0 Time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph Id = intro_artist_info_text Alpha = 0 Time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph Id = intro_performed_by_text Alpha = 0 Time = ($current_intro.song_title_fade_time / 1000.0)
endscript

script intro_highway_move 
	begin
	GetSongtimeMS
	if ($current_intro.highway_start_time + $current_starttime < <Time>)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	SpawnScriptNOw \{Song_Intro_Highway_Up_SFX_Waiting}
	Player = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player> AddToStringLookup
	formatText Textname = player_Text 'p%i' I = <Player> AddToStringLookup
	move_highway_camera_to_default <...> Time = ($current_intro.highway_move_time / 1000.0)
	Player = (<Player> + 1)
	repeat $current_num_players
endscript

script intro_hud_move 
	begin
	GetSongtimeMS
	if ($current_intro.hud_start_time + $current_starttime < <Time>)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	get_num_players_by_gamemode
	Player = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player> AddToStringLookup
	formatText Textname = player_Text 'p%i' I = <Player> AddToStringLookup
	move_hud_to_default <...> Time = ($current_intro.hud_move_time / 1000.0)
	Player = (<Player> + 1)
	repeat <num_players>
	if ($game_mode = p2_battle && $battle_sudden_death = 1)
		restore_saved_powerups
	endif
	SpawnScriptNOw \{Song_Intro_Kick_SFX_Waiting}
endscript

script play_outro 
	SongUnLoadFSBIfDownloaded
	Kill_StarPower_Camera \{changecamera = 0}
	Kill_Walk_Camera \{changecamera = 0}
	Change \{StructureName = player1_status star_power_amount = 0}
	Change \{StructureName = player2_status star_power_amount = 0}
	Kill_StarPower_StageFX player_Text = ($player1_status.Text) player_status = $player1_status IfEmpty = 0
	Kill_StarPower_StageFX player_Text = ($player2_status.Text) player_status = $player2_status IfEmpty = 0
	Change \{showing_raise_axe = 0}
	Destroy2DParticleSystem \{Id = All}
	LaunchGemEvent \{Event = kill_objects}
	Player = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player> AddToStringLookup
	formatText Textname = player_Text 'p%i' I = <Player> AddToStringLookup
	GuitarEvent_KillSong <...>
	destroy_hud <...>
	battlemode_deinit <...>
	bossbattle_deinit <...>
	faceoff_deinit <...>
	faceoff_volumes_deinit <...>
	Player = (<Player> + 1)
	repeat $max_num_players
	practicemode_deinit
	notemap_deinit
	kill_startup_script <...>
	killspawnedScript \{Name = GuitarEvent_MissedNote}
	killspawnedScript \{Name = GuitarEvent_UnnecessaryNote}
	killspawnedScript \{Name = GuitarEvent_HitNotes}
	killspawnedScript \{Name = GuitarEvent_HitNote}
	killspawnedScript \{Name = GuitarEvent_StarPowerOn}
	killspawnedScript \{Name = GuitarEvent_StarPowerOff}
	killspawnedScript \{Name = GuitarEvent_StarHitNote}
	killspawnedScript \{Name = GuitarEvent_StarSequenceBonus}
	killspawnedScript \{Name = GuitarEvent_StarMissNote}
	killspawnedScript \{Name = GuitarEvent_WhammyOn}
	killspawnedScript \{Name = GuitarEvent_WhammyOff}
	killspawnedScript \{Name = GuitarEvent_StarWhammyOn}
	killspawnedScript \{Name = GuitarEvent_StarWhammyOff}
	killspawnedScript \{Name = GuitarEvent_Note_Window_Open}
	killspawnedScript \{Name = GuitarEvent_Note_Window_Close}
	killspawnedScript \{Name = GuitarEvent_crowd_poor_medium}
	killspawnedScript \{Name = GuitarEvent_crowd_medium_good}
	killspawnedScript \{Name = GuitarEvent_crowd_medium_poor}
	killspawnedScript \{Name = GuitarEvent_crowd_good_medium}
	killspawnedScript \{Name = GuitarEvent_CreateFirstGem}
	killspawnedScript \{Name = highway_pulse_black}
	killspawnedScript \{Name = GuitarEvent_HitNote_Spawned}
	killspawnedScript \{Name = hit_note_fx}
	killspawnedScript \{Name = Do_StarPower_StageFX}
	killspawnedScript \{Name = Do_StarPower_Camera}
	killspawnedScript \{Name = first_gem_fx}
	killspawnedScript \{Name = gem_iterator}
	killspawnedScript \{Name = gem_array_stepper}
	killspawnedScript \{Name = gem_array_events}
	killspawnedScript \{Name = gem_step}
	killspawnedScript \{Name = gem_step_end}
	killspawnedScript \{Name = fretbar_iterator}
	killspawnedScript \{Name = strum_iterator}
	killspawnedScript \{Name = FretPos_iterator}
	killspawnedScript \{Name = FretFingers_iterator}
	killspawnedScript \{Name = Drum_iterator}
	killspawnedScript \{Name = Drum_cymbal_iterator}
	killspawnedScript \{Name = WatchForStartPlaying_iterator}
	killspawnedScript \{Name = gem_scroller}
	killspawnedScript \{Name = button_checker}
	killspawnedScript \{Name = check_buttons}
	killspawnedScript \{Name = check_buttons_fast}
	killspawnedScript \{Name = fretbar_update_tempo}
	killspawnedScript \{Name = fretbar_update_hammer_on_tolerance}
	killspawnedScript \{Name = move_whammy}
	killspawnedScript \{Name = create_fretbar}
	killspawnedScript \{Name = move_highway_2d}
	killspawnedScript \{Name = update_score_fast}
	killspawnedScript \{Name = check_for_star_power}
	killspawnedScript \{Name = wait_for_inactive}
	killspawnedScript \{Name = guitarevent_prefretbar}
	killspawnedScript \{Name = GuitarEvent_Fretbar}
	killspawnedScript \{Name = check_note_hold}
	killspawnedScript \{Name = star_power_whammy}
	killspawnedScript \{Name = show_star_power_ready}
	killspawnedScript \{Name = hud_glowburst_alert}
	Change \{star_power_ready_on_p1 = 0}
	Change \{star_power_ready_on_p2 = 0}
	killspawnedScript \{Name = event_iterator}
	killspawnedScript \{Name = win_song}
	killspawnedScript \{Name = hand_note_iterator}
	killspawnedScript \{Name = kill_object_later}
	killspawnedScript \{Name = show_coop_raise_axe_for_starpower}
	killspawnedScript \{Name = net_whammy_pitch_shift}
	killspawnedScript \{Name = Crowd_AllPlayAnim}
	killspawnedScript \{Name = hud_activated_star_power_spawned}
	killspawnedScript \{Name = pulsate_all_star_power_bulbs}
	killspawnedScript \{Name = pulsate_star_power_bulb}
	killspawnedScript \{Name = rock_meter_star_power_on}
	killspawnedScript \{Name = rock_meter_star_power_off}
	killspawnedScript \{Name = hud_activated_star_power}
	killspawnedScript \{Name = hud_move_note_scorebar}
	killspawnedScript \{Name = hud_flash_red_bg_p1}
	killspawnedScript \{Name = hud_flash_red_bg_p2}
	killspawnedScript \{Name = hud_flash_red_bg_kill}
	killspawnedScript \{Name = hud_lightning_alert}
	killspawnedScript \{Name = hud_show_note_streak_combo}
	killspawnedScript \{Name = play_intro}
	killspawnedScript \{Name = begin_song_after_intro}
	if gotParam \{kill_cameracuts_iterator}
		killspawnedScript \{Name = cameracuts_iterator}
	endif
	Printf \{"kill_gem_scroller - Killing Event Scripts"}
	killspawnedScript \{Id = song_event_scripts}
	Printf \{"kill_gem_scroller - Killing Event Scripts Finished"}
	Destroy_AllWhammyFX
	destroy_intro
	end_song <...>
endscript
