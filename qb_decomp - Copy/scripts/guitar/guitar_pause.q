
script setup_pause 
	setScreenElementProps \{Id = root_window event_handlers = [{pad_start gh3_start_pressed}] Replace_Handlers}
	launchevent \{Type = focus Target = root_window}
endscript
winport_block_pause = 0
winport_block_net_pause = 0

script disable_pause 
	kill_start_key_binding
	Change \{winport_block_pause = 1}
endscript

script enable_pause 
	printScriptInfo \{"enable_pause"}
	restore_start_key_binding
	Change \{winport_block_pause = 0}
endscript

script pausegh3 
	Printf \{"--------------"}
	Printf \{"Pausing Game"}
	Printf \{"--------------"}
	BroadCastEvent \{Type = event_pause_game}
	PauseGH3Sounds <...>
	PauseFullScreenMovie
	Pausegame
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		PauseMovie \{textureSlot = 1}
	endif
	if NOT (SkaterCamAnimFinished Name = cutscene)
		MovieMembFunc \{Name = cutscene func = Cut_GEL_Pause}
	endif
	ui_flow_manager_respond_to_action \{action = pause_game}
	Wait \{1 GameFrame}
endscript

script unpausegh3 
	Printf \{"------------"}
	Printf \{"Unpausing Game"}
	Printf \{"------------"}
	Wait \{1 GameFrame}
	UnPauseGH3Sounds <...>
	UnPauseFullScreenMovie
	unpauseGame
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
	if IsMoviePlaying \{textureSlot = 1}
		ResumeMovie \{textureSlot = 1}
	endif
	if NOT (SkaterCamAnimFinished Name = cutscene)
		MovieMembFunc \{Name = cutscene func = Cut_GEL_Pause Params = {OFF}}
	endif
	Change \{toggleviewmode_enabled = TRUE}
	if NOT ISPS3
		ResumeControllerChecking
	endif
	Change \{paused_for_hardware = 0}
	ui_flow_manager_respond_to_action \{action = select_resume}
endscript
last_start_pressed_device = 0

script gh3_start_pressed \{device_num = -1}
	printScriptInfo \{"gh3_start_pressed"}
	if (<device_num> = -1)
		if ($player1_status.bot_play = 1)
			start_pressed_device = ($primary_controller)
		else
			start_pressed_device = ($player1_status.controller)
		endif
	else
		if ($is_attract_mode = 1)
			return
		endif
		if ($player1_status.bot_play = 1)
			start_pressed_device = ($primary_controller)
			elseif (<device_num> = ($player1_status.controller))
			start_pressed_device = <device_num>
			elseif ($current_num_players = 2 && $is_network_game = 0 && $boss_battle = 0)
			if (<device_num> = $player2_status.controller)
				start_pressed_device = <device_num>
			else
				return
			endif
		else
			return
		endif
	endif
	if GameIsPaused
		if NOT (<device_num> = -1)
			if NOT (<start_pressed_device> = $last_start_pressed_device)
				return
			endif
		endif
		if NOT (<device_num> = -1)
			SetInput controller = <device_num> pattern = 0 Strum = 0
		endif
	else
		Change last_start_pressed_device = <start_pressed_device>
	endif
	SpawnScriptNOw gh3_start_pressed_spawned Params = {<...>}
endscript

script gh3_start_pressed_spawned 
	Printf \{"gh3_start_pressed_spawned"}
	if NOT ($view_mode = 0)
		if GameIsPaused
			UnPauseGH3Sounds <...>
			unpauseGame
		else
			PauseGH3Sounds <...>
			Pausegame
			UnPauseSpawnedScript \{update_crowd_model_cam}
		endif
		return
	endif
	if GameIsPaused
		unpausegh3 <...>
		SpawnScriptNOw \{destroy_gh3_pause_menu}
		BroadCastEvent \{Type = event_unpause_game}
		Change \{viewer_buttons_enabled = 1}
	else
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
			return
			elseif ($is_network_game && $playing_song)
			net_pausegh3
			return
		endif
		pausegh3 <...>
		safe_create_gh3_pause_menu <...>
		Change \{viewer_buttons_enabled = 0}
		SpawnScriptNOw \{block_input}
	endif
endscript

script block_input 
	if ($fade_overlay_count = 0)
		SetButtonEventMappings \{block_menu_input}
		Wait \{0.25 Seconds}
		SetButtonEventMappings \{unblock_menu_input}
	endif
endscript

script create_gh3_pause_menu 
	Change \{toggleviewmode_enabled = FALSE}
	createScreenElement \{Type = containerElement PARENT = root_window Id = pause_menu pos = (0.0, 0.0) just = [Left top]}
endscript

script destroy_gh3_pause_menu 
	if ScreenelementExists \{Id = pause_menu}
		DestroyScreenelement \{Id = pause_menu}
	endif
	DoScreenElementMorph \{Id = hud_window Alpha = 1}
endscript

script safe_create_gh3_pause_menu 
	killspawnedScript \{Name = destroy_loading_screen_spawned}
	if NOT ScreenelementExists \{Id = pause_menu}
		create_gh3_pause_menu <...>
	endif
endscript

script create_generic_backdrop 
	if NOT ScreenelementExists \{Id = generic_backdrop_container}
		createScreenElement \{Type = containerElement PARENT = root_window Id = generic_backdrop_container pos = (0.0, 0.0) just = [Left top]}
		createScreenElement \{Type = spriteElement Id = pause_backdrop PARENT = generic_backdrop_container texture = Venue_BG rgba = [255 255 255 255] pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 0 Alpha = 1}
		DoScreenElementMorph \{Id = hud_window Alpha = 0 Time = 0.5}
	endif
endscript

script destroy_generic_backdrop 
	if ScreenelementExists \{Id = generic_backdrop_container}
		DestroyScreenelement \{Id = generic_backdrop_container}
	endif
endscript
