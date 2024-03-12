respond_to_signin_changed = 0
bootup_sequence_fs = {
	Create = start_bootup_sequence
	destroy = end_bootup_sequence
	actions = [
		{
			action = skip_bootup_sequence
			flow_state = bootup_press_any_button_fs
		}
	]
}
bootup_press_any_button_fs = {
	Create = create_press_any_button_menu
	destroy = destroy_press_any_button_menu
	actions = [
		{
			action = enter_attract_mode
			flow_state = bootup_attract_mode_fs
		}
		{
			action = continue
			flow_state_func = bootup_check_autologin
		}
	]
}
bootup_query_autologin_fs = {
	Create = create_network_prompt_menu
	destroy = destroy_network_prompt_menu
	actions = [
		{
			action = select_startup_go_online
			flow_state = online_winport_start_connection_fs
		}
		{
			action = select_startup_stay_offline
			flow_state_func = process_signin_complete
		}
	]
}
bootup_attract_mode_fs = {
	Create = create_attract_mode
	destroy = destroy_attract_mode
	actions = [
		{
			action = exit_attract_mode
			flow_state = bootup_press_any_button_fs
		}
	]
}
legal_timer = 0

script start_legal_timer 
	change \{legal_timer = 0}
	wait \{6 seconds}
	change \{legal_timer = 1}
endscript

script wait_for_legal_timer 
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	begin
	if ($legal_timer = 1)
		break
	endif
	wait \{1 gameframe}
	repeat
endscript

script bootup_sequence 
	wait_for_legal_timer
	startrendering
	PlayMovieAndWait \{movie = 'atvi'}
	PlayMovieAndWait \{movie = 'ro_logo'}
	PlayMovieAndWait \{movie = 'ns_logo'}
	PlayMovieAndWait \{movie = 'Aspyr'}
	if NotIsMacPort
		PlayMovieAndWait \{movie = 'DELL_Cert_3CD'}
	endif
	PlayMovieAndWait \{movie = 'intro'}
	spawnscriptnow \{ui_flow_manager_respond_to_action params = {action = skip_bootup_sequence play_sound = 0}}
endscript

script start_bootup_sequence 
	if notcd
		if ($show_movies = 0)
			startrendering
			spawnscriptnow \{ui_flow_manager_respond_to_action params = {action = skip_bootup_sequence play_sound = 0}}
			return
		endif
	endif
	spawnscriptnow \{bootup_sequence}
endscript

script end_bootup_sequence 
endscript

script check_signin_change_monitor_flag 
	if ($respond_to_signin_changed = 0)
		scriptassert \{"check_signin_change_monitor_flag failed"}
	endif
endscript

script start_checking_for_signin_change 
	printf \{"start_checking_for_signin_change"}
	printscriptinfo \{"start_checking_for_signin_change"}
	printf \{"start_checking_for_signin_change - killing sysnotifys"}
	KillSpawnedScript \{name = sysnotify_handle_signin_change}
	printf \{"start_checking_for_signin_change - begin"}
	change \{respond_to_signin_changed = 1}
	change \{menu_select_difficulty_first_time = 1}
endscript

script bootup_check_autologin 
	KillSpawnedScript \{name = attract_mode_spawner}
	change \{enable_saving = 1}
	if GotParam \{device_num}
		change primary_controller = <device_num>
		change \{primary_controller_assigned = 1}
		change structurename = player1_status controller = ($primary_controller)
	endif
	NetSessionFunc \{func = GetAutoLoginSetting}
	if (<autoLoginSetting> = autoLoginOff || $is_demo_mode = 1)
		process_signin_complete
		return flow_state = <flow_state>
	endif
	if (<autoLoginSetting> = autoLoginOn)
		return \{flow_state = online_winport_start_connection_fs}
	endif
	return \{flow_state = bootup_query_autologin_fs}
endscript

script process_signin_complete 
	RefreshSigninStatus
	if IsXenon
		StartGameProfileSettingsRead
		begin
		if GameProfileSettingsFinished
			break
		endif
		repeat
	endif
	return \{flow_state = bootup_do_memcard_sequence_fs}
endscript
ps3_signin_complete = 0

script wait_for_blade_complete 
	if IsXenon
		wait_for_sysnotify_unpause
	else
		begin
		if (1 = $ps3_signin_complete)
			break
		endif
		wait \{1 frame}
		repeat
	endif
endscript

script signin_complete_callback 
	change \{ps3_signin_complete = 1}
endscript
bootup_signin_warning_fs = {
	Create = create_signin_warning_menu
	destroy = destroy_signin_warning_menu
	actions = [
		{
			action = select_continue_without_saving
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = select_choose_storage_device
			flow_state_func = bootup_check_for_sign_in
		}
		{
			action = select_continue_without_signing_in
			flow_state = bootup_signin_complete_message
		}
	]
}
bootup_do_memcard_sequence_fs = {
	Create = memcard_sequence_begin_bootup
	create_params = {
		StorageSelectorForce = 1
	}
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = bootup_using_guitar_controller_fs
		}
		{
			action = memcard_sequence_load_success
			flow_state = bootup_audio_calibrate_reminder_fs
		}
		{
			action = memcard_sequence_load_failed
			flow_state = bootup_using_guitar_controller_fs
		}
	]
}
bootup_autologin_save_fs = {
	Create = create_autologin_prompt_menu
	destroy = destroy_autologin_prompt_menu
	actions = [
		{
			action = continue
			flow_state_func = bootup_autologin_complete
		}
	]
}

script bootup_autologin_complete 
	process_signin_complete
	return flow_state = <flow_state>
endscript
bootup_using_guitar_controller_fs = {
	Create = create_using_guitar_controller_menu
	destroy = destroy_using_guitar_controller_menu
	actions = [
		{
			action = continue
			flow_state = bootup_using_keyboard_fs
		}
	]
}
bootup_using_keyboard_fs = {
	Create = create_using_guitar_controller_menu
	create_params = {
		keyboard = 1
	}
	destroy = destroy_using_guitar_controller_menu
	actions = [
		{
			action = continue
			flow_state = bootup_audio_calibrate_reminder_fs
		}
	]
}
bootup_audio_calibrate_reminder_fs = {
	Create = winport_create_audio_calibrate_reminder
	destroy = winport_destroy_audio_calibrate_reminder
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
bootup_download_scan_fs = {
	Create = create_download_scan_menu
	destroy = destroy_download_scan_menu
	actions = [
		{
			action = continue
			flow_state = main_menu_fs
		}
	]
}
bootup_signin_complete_message = {
	Create = create_signin_complete_menu
	destroy = destroy_signin_complete_menu
	actions = [
		{
			action = continue
			flow_state_func = process_signin_complete
		}
	]
}
is_shutdown_safe = 1

script mark_unsafe_for_shutdown 
	change \{is_shutdown_safe = 0}
endscript

script mark_safe_for_shutdown 
	change \{is_shutdown_safe = 1}
	unpausespawnedscript \{wait_for_safe_shutdown}
endscript

script wait_for_safe_shutdown 
	begin
	if ($is_shutdown_safe = 1)
		break
	endif
	wait \{1 gameframe}
	repeat
endscript

script handle_signin_changed 
	printf \{"handle_signin_changed"}
	change \{respond_to_signin_changed = 0}
	wait_for_safe_shutdown
	printf \{"handle_signin_changed started"}
	disable_pause
	stoprendering
	shutdown_game_for_signin_change \{signin_change = 1}
	LaunchEvent \{type = unfocus target = root_window}
	create_signin_changed_menu
	startrendering
	printf \{"handle_signin_changed end"}
endscript

script signing_change_confirm_reboot 
	printf \{"signing_change_confirm_reboot"}
	destroy_signin_changed_menu
	enable_pause
	wait \{5 gameframes}
	start_flow_manager \{flow_state = bootup_press_any_button_fs}
	printf \{"signing_change_confirm_reboot end"}
endscript
shutdown_game_for_signin_change_flag = 0

script shutdown_game_for_signin_change \{unloadcontent = 1 signin_change = 0}
	printf \{"shutdown_game_for_signin_change"}
	change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	KillSpawnedScript \{name = online_menu_init}
	KillSpawnedScript \{name = do_calibration_update}
	KillSpawnedScript \{name = cl_do_ping}
	KillSpawnedScript \{name = kill_off_and_finish_calibration}
	KillSpawnedScript \{name = menu_calibrate_lag_create_circles}
	set_demonware_failed
	KillSpawnedScript \{name = create_leaderboard_menu2}
	KillSpawnedScript \{name = create_leaderboard_menu3}
	KillSpawnedScript \{name = add_leaderboard_rows_to_menu}
	shutdown_options_video_monitor
	destroy_alert_popup \{force = 1}
	end_practice_song_slomo
	destroy_loading_screen
	memcard_sequence_cleanup_generic
	destroy_leaving_lobby_dialog
	menu_store_go_back
	destroy_menu \{menu_id = select_style_container}
	destroy_menu \{menu_id = select_style_container_p2}
	shut_down_character_hub
	quit_network_game_early \{signin_change}
	tutorial_shutdown
	shut_down_flow_manager \{player = 1 resetstate}
	shut_down_flow_manager \{player = 2 resetstate}
	store_monitor_goal_guitar_finish
	DeRegisterAtoms
	kill_gem_scroller \{no_render = 1}
	progression_push_current \{force = 1}
	clean_up_user_control_helpers
	Menu_Music_Off
	unload_songqpak
	SetPakManCurrentBlock \{map = zones pak = None block_scripts = 1}
	destroy_band \{unload_paks}
	destroy_downloads_EnumContent
	if (<unloadcontent> = 1)
		Downloads_UnloadContent
		ClearGlobalTags
		setup_globaltags
	endif
	if (<signin_change> = 1)
		clear_cheats
	endif
	if ScreenElementExists \{id = ready_container_p2}
		DestroyScreenElement \{id = ready_container_p2}
	endif
	set_default_misc_globals
	cleanup_songwon_event
	destroy_menu_transition
	UnPauseGame
	change \{shutdown_game_for_signin_change_flag = 0}
	printf \{"shutdown_game_for_signin_change end"}
endscript

script cleanup_songwon_event 
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	KillSpawnedScript \{name = jiggle_text_array_elements}
	KillSpawnedScript \{name = You_Rock_Waiting_Crowd_SFX}
	KillSpawnedScript \{name = GuitarEvent_SongWon_Spawned}
endscript

script set_default_misc_globals 
	change \{show_boss_helper_screen = 0}
	change \{use_last_player_scores = 0}
	change \{old_song = None}
	change \{devil_finish = 0}
	change \{battle_sudden_death = 0}
	change \{menu_flow_locked = 0}
	change \{coop_dlc_active = 0}
endscript
