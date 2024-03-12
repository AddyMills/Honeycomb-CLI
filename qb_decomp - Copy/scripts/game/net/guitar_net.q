num_players_info = [
	{
		Name = "2 Players"
		Checksum = num_2
		num = 2
	}
]
num_private_slots = [
	{
		Name = "0 Players"
		Checksum = num_0
		num = 0
	}
	{
		Name = "1 Players"
		Checksum = num_1
		num = 1
	}
	{
		Name = "2 Players"
		Checksum = num_2
		num = 2
	}
]
FilterTypes = {
	diff = {
		values = [
			"ANY"
			"EASY"
			"MEDIUM"
			"HARD"
			"EXPERT"
		]
		Checksum = [
			dont_care
			EASY
			MEDIUM
			HARD
			EXPERT
		]
	}
	mode = {
		values = [
			"ANY"
			"FACE-OFF"
			"PRO FACE-OFF"
			"BATTLE"
			"CO-OP"
		]
		Checksum = [
			dont_care
			p2_faceoff
			p2_pro_faceoff
			p2_battle
			p2_coop
		]
	}
	Type = {
		values = [
			"PLAYER"
			"RANKED"
		]
		Checksum = [
			Player
			Ranked
		]
	}
	num_songs = {
		values = [
			"ANY"
			"1"
			"Best of 3"
			"Best of 5"
			"Best of 7"
		]
		Checksum = [
			dont_care
			num_1
			num_3
			num_5
			num_7
		]
	}
	tie = {
		values = [
			"ANY"
			"HOST"
			"CLIENT"
			"RANDOM"
		]
		Checksum = [
			dont_care
			host
			CLIENT
			song_rand
		]
	}
	search = {
		values = [
			"ALL TIME"
			"MY RANK"
		]
	}
	song_type = {
		values = [
			"NORMAL SONGS"
			"CO-OP SONGS"
		]
	}
	vport = {
		values = [
			"DOUBLE"
			"SINGLE"
		]
	}
	lb_diff = {
		values = [
			"EASY"
			"MEDIUM"
			"HARD"
			"EXPERT"
		]
	}
}
Leaderboard_Difficulty_Lookup_Table = {
	EASY = 'easy'
	MEDIUM = 'medium'
	HARD = 'hard'
	EXPERT = 'expert'
}
online_light_purple = [
	190
	180
	205
	250
]
online_dark_purple = [
	70
	40
	70
	250
]
online_light_blue = [
	180
	230
	250
	250
]
online_medium_blue = [
	35
	130
	175
	250
]
online_dark_blue = [
	0
	70
	100
	250
]
online_score_bars = [
	60
	50
	70
	128
]
online_trans_grey = [
	0
	0
	0
	200
]
online_grey = [
	75
	75
	75
	250
]
online_light_grey = [
	75
	75
	75
	150
]
online_red = [
	255
	0
	0
	255
]
online_yellow = [
	210
	210
	0
	255
]
online_orange = [
	255
	165
	0
	255
]
online_green = [
	0
	150
	0
	255
]
online_general_menu_pos = (640.0, 75.0)
online_general_menu_hi_lite_ypos = [
	0.0
	0.0
	0.0
	0.0
]
net_current_flow_state = NONE
net_can_send_approval = 1
net_safe_to_enter_net_play = 1
player1_song_selections = [
	NULL
	NULL
	NULL
]
player2_song_selections = [
	NULL
	NULL
	NULL
]
tie_breaker_song = bullsonparade
match_type = Player
opponent_gamertag = NULL
online_song_count = 0
player2_present = 0
player1_max_song_selections = 0
player1_current_song_selections = 0
player2_max_song_selections = 0
player2_current_song_selections = 0
player1_selected_guitar = Instrument_Les_Paul_Black
player1_selected_bass = Instrument_LP_VBRST
player2_selected_guitar = Instrument_Les_Paul_Black
player2_selected_bass = Instrument_LP_VBRST
retrieved_message_of_the_day = 0
message_of_the_day = ""
OptionsGameModeValue = 0
OptionsDifficultyValue = 0
OptionsNumSongsValue = 0
OptionsTieBreakerValue = 0
OptionsHighwayValue = 0
LeaderboardSearchValue = 0
LeaderboardSongTypeValue = 0
LeaderboardDiffValue = 3
CopyOfGlobal = 0
SearchMatchTypeValue = 0
SearchGameModeValue = 0
SearchDifficultyValue = 0
SearchNumSongsValue = 0
SearchTieBreakerValue = 0
TempGameModeValue = 0
TempDifficultyValue = 0
TempNumSongsValue = 0
TempTieBreakerValue = 0
TempHighwayValue = 0
net_game_type_info = [
	{
		Name = "PRO FACEOFF"
		description = "Play a song with the same notes."
		Checksum = p2_pro_faceoff
	}
	{
		Name = "FACEOFF"
		description = "Dueling sections on lead guitar."
		Checksum = p2_faceoff
	}
	{
		Name = "BATTLE"
		description = "Battle mode."
		Checksum = p2_battle
	}
	{
		Name = "CO-OP"
		description = "Mix lead guitar with bass/rhythm guitar."
		Checksum = p2_coop
	}
]
xenon_invite_confirm_title = "GAME INVITE"
xenon_invite_confirm_dialog = "Accepting this invite will lose progress in any currently active goals. Do you want to continue?"
xenon_invite_confirm_yes = "YES"
xenon_invite_confirm_no = "NO"
xenon_session_confirm_title = "JOIN SESSION"
xenon_session_confirm_dialog = "Joining this session will lose progress in any currently active goals. Do you want to continue?"
xenon_session_confirm_yes = "YES"
xenon_session_confirm_no = "NO"
xenon_invite_confirm_inactive_title = "GAME INVITE"
xenon_invite_confirm_inactive_dialog = "You have been invited to play an online game. This title doesn't support inactive controllers joining an online game, so the invite has been rejected."
xenon_invite_confirm_inactive_ok = "OK"
xenon_session_confirm_inactive_title = "JOIN SESSION"
xenon_session_confirm_inactive_dialog = "This title doesn't support inactive controllers joining an online game, so you cannot join this session."
xenon_session_confirm_inactive_ok = "OK"
NO_NET_MODE = 0
LAN_MODE = 1
INTERNET_MODE = 2
new_net_logic = 0

script quit_network_game 
	Printf \{"------ quitting network game"}
	LeaveServer
	Wait \{0.5 Seconds}
	RemoveTimeSyncTask
	NetSessionfunc \{Obj = session func = unpost_game}
	EndGameNetScriptPump
	Change \{battle_sudden_death = 0}
	if ($game_mode = p2_battle)
		Change \{save_current_powerups_p1 = [0 0 0]}
		Change \{save_current_powerups_p2 = [0 0 0]}
		Change \{StructureName = player1_status save_num_powerups = 0}
		Change \{StructureName = player2_status save_num_powerups = 0}
		Change \{StructureName = player1_status save_health = 0.0}
		Change \{StructureName = player2_status save_health = 0.0}
	endif
	SetNetworkPreference {Field = 'private_slots' String = ($num_private_slots [0].Name) Checksum = ($num_private_slots [0].Checksum) num = 0}
	SetNetworkPreference \{Field = 'ranked' String = "player" Checksum = Player num = 1}
	Change \{match_type = Player}
	Change \{net_ready_to_start = 0}
	Change \{current_num_players = 1}
	Change \{player2_present = 0}
	Change \{g_tie_breaker_song = 0}
	Change \{net_can_send_approval = 1}
	Change \{net_current_flow_state = NONE}
	reset_setlist
	reset_net_stats_menu
	Change \{net_song_num = 0}
	Change \{StructureName = player2_status is_local_client = 1}
	Change \{StructureName = player2_status net_id_first = 0}
	Change \{StructureName = player2_status net_id_second = 0}
	if NOT ($game_mode = p2_coop)
		Change \{StructureName = player1_status part = GUITAR}
		Change \{StructureName = player2_status part = GUITAR}
	endif
endscript

script shut_down_net_play 
	Printf \{"shut_down_net_play"}
	Change \{is_network_game = 0}
	Change \{new_net_logic = 0}
	SetNetworkMode
	NetSessionfunc \{Obj = match func = stop_server_list}
	NetSessionfunc \{Obj = match func = free_server_list}
	NetSessionfunc \{func = match_uninit}
	NetSessionfunc \{func = voice_uninit}
	destroy_gamertags
	destroy_net_popup
	cleanup_sessionfuncs
	Change \{StructureName = player1_status highway_layout = default_highway}
	Change \{StructureName = player2_status highway_layout = default_highway}
endscript

script select_quit_network_game 
	if ScreenelementExists \{Id = YouRock_text}
		DestroyScreenelement \{Id = YouRock_text}
	endif
	if ScreenelementExists \{Id = yourock_text_2}
		DestroyScreenelement \{Id = yourock_text_2}
	endif
	quit_network_game_early
endscript

script quit_network_game_early 
	Change \{disable_attacks = 1}
	if NOT ($is_network_game)
		return
	endif
	if ($is_network_game)
		Change \{gIsInNetGame = 0}
	endif
	if ($playing_song)
		send_fail_song_message \{wait_frames = 1 quit_early = 1}
	endif
	Pausegame
	quit_network_game
	if gotParam \{signin_change}
		shut_down_net_play
	else
		kill_gem_scroller
	endif
endscript

script cancel_join_server 
	Printf \{"---cancel_join_server"}
	LeaveServer
	NetSessionfunc \{Obj = session func = unpost_game}
	NetSessionfunc \{Obj = match func = free_server_list}
	NetSessionfunc \{Obj = match func = cancel_join_server}
endscript

script post_network_game 
	if (NetSessionfunc Obj = match func = get_gamertag)
		SetNetworkPreference Field = 'network_id' String = <Name>
		SetNetworkPreference Field = 'server_name' String = <Name>
	endif
	NetSessionfunc \{Obj = session func = post_game}
	SetServerMode
	StartServer
	SetJoinMode \{$JOIN_MODE_PLAY}
	JoinServer
endscript

script set_match_values 
	return {
		DIFFICULTY = ($current_difficulty)
		gamemode = ($game_mode)
		num_songs = ($num_songs)
	}
endscript

script set_network_preferences 
	if (($match_type) = Player)
		Printf \{"set_network_preferences - setting 'player' match"}
		SetNetworkPreference \{Field = 'ranked' String = "player" Checksum = Player num = 1}
	else
		Printf \{"set_network_preferences - setting 'ranked' match"}
		SetNetworkPreference \{Field = 'ranked' String = "ranked" Checksum = Ranked num = 0}
	endif
endscript

script send_game_info_to_client 
	prepare_lobby_message
	SendNetMessage {
		Type = lobby_setup
		game_mode_index = <game_mode_index>
		Venue = ($current_level)
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		character = ($player1_status.character_id)
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		GUITAR = ($player1_status.instrument_id)
		flow_state_index = <flow_state>
	}
	Change \{StructureName = player2_status character_id = Axel}
	Change \{StructureName = player2_status outfit = 1}
	Change \{StructureName = player2_status style = 1}
	Change \{StructureName = player2_status instrument_id = Instrument_Les_Paul_Black}
	Change \{net_match_send_available_items_dirty = 1}
	Change \{character_select_highlighted_character_p2_dirty = 1}
	net_match_send_available_items
	if compositeObjectexists \{Name = BASSIST}
		BASSIST :Unhide
		BASSIST :Ragdoll_MarkForReset
	endif
endscript

script client_lobby_setup 
	Printf \{"--- client_lobby_setup"}
	Change \{current_num_players = 2}
	killspawnedScript \{Name = coop_fail_song}
	set_character_hub_dirty
	Change current_level = <Venue>
	translate_lobby_message {
		game_mode_index = <game_mode_index>
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		p2_flow_state = <flow_state_index>
	}
	Change StructureName = player2_status character_id = <character>
	Change StructureName = player2_status outfit = <outfit>
	Change StructureName = player2_status style = <style>
	Change StructureName = player2_status instrument_id = <GUITAR>
	Change \{StructureName = player1_status character_id = Axel}
	Change \{StructureName = player1_status outfit = 1}
	Change \{StructureName = player1_status style = 1}
	Change \{StructureName = player1_status instrument_id = Instrument_Les_Paul_Black}
	Change \{net_match_send_available_items_dirty = 1}
	Change \{character_select_highlighted_character_p2_dirty = 1}
	Change \{generic_select_monitor_p1_changed = 1}
	Change \{generic_select_monitor_p2_changed = 1}
	net_match_send_available_items
	ui_flow_manager_respond_to_action \{action = join_server}
	resolve_current_flow_state p2_current_flow_state = <p2_flow_state>
endscript

script prepare_lobby_message 
	switch ($game_mode)
		case p2_faceoff
		<game_mode_index> = 1
		case p2_pro_faceoff
		<game_mode_index> = 2
		case p2_battle
		<game_mode_index> = 3
		case p2_coop
		<game_mode_index> = 4
	endswitch
	switch ($current_difficulty)
		case EASY
		<difficulty_index> = 1
		case MEDIUM
		<difficulty_index> = 2
		case HARD
		<difficulty_index> = 3
		case EXPERT
		<difficulty_index> = 4
	endswitch
	switch ($num_songs)
		case num_1
		<number_of_songs_index> = 1
		case num_3
		<number_of_songs_index> = 3
		case num_5
		<number_of_songs_index> = 5
		case num_7
		<number_of_songs_index> = 7
	endswitch
	switch ($tie_breaker)
		case host
		<tie_breaker_index> = 1
		case CLIENT
		<tie_breaker_index> = 2
	endswitch
	switch ($ui_flow_manager_state [0])
		case online_character_select_fs
		<flow_state> = 1
		case online_character_hub_fs
		<flow_state> = 2
		case online_select_outfit_fs
		<flow_state> = 3
		case online_select_style_fs
		<flow_state> = 4
		case online_select_guitar_fs
		<flow_state> = 5
		case online_select_guitar_finish_fs
		<flow_state> = 6
		case online_select_bass_fs
		<flow_state> = 7
	endswitch
	return {
		game_mode_index = <game_mode_index>
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		flow_state = <flow_state>
	}
endscript

script translate_lobby_message 
	switch (<game_mode_index>)
		case 1
		Change \{game_mode = p2_faceoff}
		case 2
		Change \{game_mode = p2_pro_faceoff}
		case 3
		Change \{game_mode = p2_battle}
		case 4
		Change \{game_mode = p2_coop}
	endswitch
	switch (<difficulty_index>)
		case 1
		Change \{current_difficulty = EASY}
		Change \{current_difficulty2 = EASY}
		case 2
		Change \{current_difficulty = MEDIUM}
		Change \{current_difficulty2 = MEDIUM}
		case 3
		Change \{current_difficulty = HARD}
		Change \{current_difficulty2 = HARD}
		case 4
		Change \{current_difficulty = EXPERT}
		Change \{current_difficulty2 = EXPERT}
	endswitch
	switch (<number_of_songs_index>)
		case 1
		Change \{num_songs = num_1}
		case 3
		Change \{num_songs = num_3}
		case 5
		Change \{num_songs = num_5}
		case 7
		Change \{num_songs = num_7}
	endswitch
	switch (<tie_breaker_index>)
		case 1
		Change \{tie_breaker = host}
		case 2
		Change \{tie_breaker = CLIENT}
	endswitch
	switch (<p2_flow_state>)
		case 1
		<p2_flow_state> = online_character_select_fs
		case 2
		<p2_flow_state> = online_character_hub_fs
		case 3
		<p2_flow_state> = online_select_outfit_fs
		case 4
		<p2_flow_state> = online_select_style_fs
		case 5
		<p2_flow_state> = online_select_guitar_fs
		case 6
		<p2_flow_state> = online_select_guitar_finish_fs
		case 7
		<p2_flow_state> = online_select_bass_fs
	endswitch
	return p2_flow_state = <p2_flow_state>
endscript

script resolve_current_flow_state 
	if compositeObjectexists \{Name = BASSIST}
		BASSIST :Unhide
		BASSIST :Ragdoll_MarkForReset
	endif
	set_other_player_present
	network_player_lobby_message \{Type = open_comm action = update}
endscript

script choose_selected_server 
	NetSessionfunc Obj = match func = choose_server Params = <...>
endscript

script cleanup_sessionfuncs 
	Printf \{"---cleanup sessionfuncs"}
	NetSessionfunc \{func = match_uninit}
	NetSessionfunc \{func = voice_uninit}
	NetSessionfunc \{func = motd_uninit}
endscript

script setup_sessionfuncs 
	Printf \{"---setup_sessionfuncs"}
	NetSessionfunc \{func = match_init}
	NetSessionfunc \{func = stats_init}
	NetSessionfunc \{func = voice_init}
	NetSessionfunc \{func = motd_init}
	NetSessionfunc \{Obj = voice func = Enable}
	if NetSessionfunc \{Obj = match func = get_gamertag}
		SetNetworkPreference Field = 'network_id' String = <Name>
		SetNetworkPreference Field = 'server_name' String = <Name>
	endif
	MassiveInit \{sku = 'atvi_guitar_hero_3_pc_na' startZone = 'GlobalZone'}
endscript

script get_current_level_name 
	return level_name = ($levelzones.($current_level).title) Level = 1
endscript

script GetCurrentAreaStringAndChecksum 
	<area_string> = 'z_online_venue'
	<area_checksum> = dummy_value
endscript

script dispatch_player_state 
	if ($<player_status>.Player = 1)
		<other_player_status> = player2_status
	else
		<other_player_status> = player1_status
	endif
	if ($<other_player_status>.highway_layout = solo_highway)
		begin
		formatText \{Checksumname = Type '%s' S = 'player_state_light'}
		SendNetMessage {
			Type = <Type>
			score = ($<player_status>.score)
			current_run = ($<player_status>.current_run)
			star_power_amount = ($<player_status>.star_power_amount)
			current_health = ($<player_status>.current_health)
		}
		Wait \{0.1 Seconds}
		repeat
	else
		begin
		GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
		formatText \{Checksumname = Type '%s' S = 'player_state'}
		SendNetMessage {
			Type = <Type>
			guitar_volume = ($<player_status>.guitar_volume)
			star_power_toggle = ($<player_status>.star_power_used)
			score = ($<player_status>.score)
			current_run = ($<player_status>.current_run)
			star_power_amount = ($<player_status>.star_power_amount)
			hold_pattern = <hold_pattern>
			whammy_length = ($<player_status>.net_whammy)
			current_health = ($<player_status>.current_health)
		}
		Wait \{0.1 Seconds}
		repeat
	endif
endscript

script load_and_sync_timing \{start_delay = 4000}
	if ($<player_status>.highway_layout = solo_highway)
		Change \{current_num_players = 1}
	else
		Change \{current_num_players = 2}
	endif
	EndGameNetScriptPump
	set_rich_presence_game_mode \{ONLINE = 1}
	Change \{StructureName = player2_status is_local_client = 0}
	Load_Venue
	Printf \{"Starting Song with Zone = %i\\n" I = $current_level}
	Change \{net_ready_to_start = 0}
	Change \{current_transition = INTRO}
	Spawnscriptlater restart_gem_scroller Params = {
		song_name = ($current_song)
		DIFFICULTY = ($current_difficulty)
		difficulty2 = ($current_difficulty2)
		device_num = ($player1_status.controller)
	}
endscript

script launch_network_game 
	Change \{net_ready_to_start = 1}
endscript

script ranked_quit_fix_scores 
	get_number_of_songs
	song_index = 0
	begin
	if ($game_mode = p2_battle)
		setarrayelement Arrayname = g_p1_scores globalArray Index = <song_index> NewValue = 8
		setarrayelement Arrayname = g_p2_scores globalArray Index = <song_index> NewValue = -1
	else
		setarrayelement Arrayname = g_p2_scores globalArray Index = <song_index> NewValue = 0
	endif
	<song_index> = (<song_index> + 1)
	repeat <num_songs>
endscript

script network_player_update 
	if ((GameIsOver) || ($playing_song = 0))
		return
	endif
	Change StructureName = <player_status> score = <score>
	Change StructureName = <player_status> current_health = <current_health>
	old_star_power = ($<player_status>.star_power_amount)
	Change StructureName = <player_status> star_power_amount = <star_power_amount>
	if ((<old_star_power> < 50.0) && (<star_power_amount> >= 50.0))
		SpawnScriptNOw show_star_power_ready Params = {player_status = <player_status>}
	endif
	if ($game_mode = p2_coop)
		if (($player1_status.star_power_amount) < ($<player_status>.star_power_amount) && ($player1_status.star_power_used = 0))
			Change StructureName = player1_status star_power_amount = <star_power_amount>
		endif
	endif
	if (($game_mode = p2_coop) && ($<player_status>.current_run > <current_run>))
		Change StructureName = player1_status current_run = <current_run>
	endif
	Change StructureName = <player_status> current_run = <current_run>
	if NOT ($player1_status.highway_layout = solo_highway)
		if NOT (($<player_status>.guitar_volume) = <Volume>)
			Change StructureName = <player_status> guitar_volume = <Volume>
			UpdateGuitarVolume
		endif
		BroadCastEvent Type = net_button_check_p2 data = {hold_pattern = <hold_pattern> player_status = <player_status> whammy_len = <whammy_length>}
		if ($game_mode = p2_coop)
			return
		endif
		if NOT ($<player_status>.star_power_used = <star_Power>)
			if (<star_Power>)
				SpawnScriptNOw star_power_activate_and_drain Params = {
					player_status = <player_status>
					player_Text = ($<player_status>.Text)
					Player = ($<player_status>.Player)}
			endif
		endif
	endif
endscript

script net_check_buttons 
	get_song_prefix Song = <song_name>
	formatText Checksumname = Guitar_Stream '%s_guitar' S = <song_prefix> AddToStringLookup
	GuitarInputLogicInit player_status = <player_status> Guitar_Stream = <Guitar_Stream> time_offset = <time_offset>
	ExtendCrc button_up_pixel_array ($<player_status>.Text) out = pixel_array
	<player_Text> = ($<player_status>.Text)
	getArraySize \{$gem_colors}
	begin
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	button_lip_name = ($button_up_models.<Color>.Name)
	ExtendCrc <button_lip_name> '_lip' out = button_lip_name
	ExtendCrc <button_lip_name> <player_Text> out = button_lip_name
	button_mid_name = ($button_up_models.<Color>.Name)
	ExtendCrc <button_mid_name> '_mid' out = button_mid_name
	ExtendCrc <button_mid_name> <player_Text> out = button_mid_name
	button_neck_name = ($button_up_models.<Color>.Name)
	ExtendCrc <button_neck_name> '_neck' out = button_neck_name
	ExtendCrc <button_neck_name> <player_Text> out = button_neck_name
	button_head_name = ($button_up_models.<Color>.Name)
	ExtendCrc <button_head_name> '_head' out = button_head_name
	ExtendCrc <button_head_name> <player_Text> out = button_head_name
	now_scale = (($nowbar_scale_x * (1.0, 0.0)) + ($nowbar_scale_y * (0.0, 1.0)))
	if ($<player_status>.lefthanded_button_ups = 1)
		<pos2d> = ($button_up_models.<Color>.left_pos_2d)
	else
		<pos2d> = ($button_up_models.<Color>.pos_2d)
	endif
	if ($<player_status>.lefthanded_button_ups = 1)
		<playline_scale> = (((0 - <now_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<now_scale>.(0.0, 1.0) * (0.0, 1.0)))
	else
		<playline_scale> = <now_scale>
	endif
	<y_scale> = ((<pixels> + $neck_lip_add) / $neck_sprite_size)
	<neck_scale> = (((<playline_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<y_scale> * (0.0, 1.0)))
	<head_pos> = (<pos2d> - (<pixels> * (0.0, 1.0)))
	if ScreenelementExists Id = <button_lip_name>
		setScreenElementProps Id = <button_lip_name> z_priority = 4.9
	endif
	if ScreenelementExists Id = <button_mid_name>
		setScreenElementProps Id = <button_mid_name> z_priority = 4.6
	endif
	if ScreenelementExists Id = <button_neck_name>
		setScreenElementProps Id = <button_neck_name> z_priority = 4.7 scale = <neck_scale>
	endif
	if ScreenelementExists Id = <button_head_name>
		setScreenElementProps Id = <button_head_name> z_priority = 4.8 pos = <head_pos>
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	array_count = 0
	GetDeltaTime
	sub_amount = (($button_up_pixels * <delta_time>) / $button_sink_time)
	begin
	pixels = ($<pixel_array> [<array_count>])
	pixels = (<pixels> - <sub_amount>)
	if (<pixels> < 0.0)
		<pixels> = 0.0
	endif
	setarrayelement Arrayname = <pixel_array> globalArray Index = <array_count> NewValue = <pixels>
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Wait \{1 GameFrame}
	repeat
endscript

script network_events 
	SetEventHandler \{response = call_script Event = net_button_check_p2 Scr = network_player_buttons}
	block
endscript

script network_player_buttons 
	getArraySize \{$gem_colors}
	check_button = 65536
	<mask> = ($player2_status.broken_string_mask)
	array_count = 0
	begin
	if NOT (<mask> && <check_button>)
		Color = ($gem_colors [<array_count>])
		button_head_name = ($button_up_models.<Color>.Name)
		ExtendCrc <button_head_name> '_head' out = button_head_name
		ExtendCrc <button_head_name> ($<player_status>.Text) out = button_head_name
		if ScreenelementExists Id = <button_head_name>
			if (<hold_pattern> && <check_button>)
				setScreenElementProps Id = <button_head_name> Material = ($button_up_models.<Color>.material_down)
			else
				setScreenElementProps Id = <button_head_name> Material = ($button_up_models.<Color>.material_head)
			endif
		endif
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if ($display_debug_input = 1)
		input_debug <...>
	endif
endscript

script net_check_note_hold 
	CheckNoteHoldInit Player = <Player> player_status = <player_status> array_entry = <array_entry> Time = <Time> Guitar_Stream = <Guitar_Stream> Song = <Song> pattern = <pattern>
	begin
	if NOT CheckNoteHoldWait Player = <Player>
		break
	endif
	Wait \{1 GameFrame}
	repeat
	CheckNoteHoldStart Player = <Player>
	Spawnscriptlater net_control_whammy_pitch_loop Params = {Song = <Song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> Time = <Time>}
	begin
	if NOT CheckNoteHoldPerFrame Player = <Player>
		break
	endif
	Wait \{1 GameFrame}
	repeat
	killspawnedScript \{Name = net_whammy_pitch_shift}
	killspawnedScript \{Name = net_control_whammy_pitch_loop}
	CheckNoteHoldEnd Player = <Player>
endscript

script net_control_whammy_pitch_loop 
	Change \{pitch_dirty = 1}
	begin
	GetSongtime
	start_time = <songtime>
	block \{Type = net_button_check_p2}
	GetSongtime
	delta_time = (<songtime> - <start_time>)
	<Time> = (<Time> - (<delta_time> * 1000))
	killspawnedScript \{Name = net_whammy_pitch_shift}
	SpawnScriptNOw net_whammy_pitch_shift Params = {Song = <Song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> net_whammy_length = (<event_data>.whammy_len) Time = <Time>}
	repeat
	killspawnedScript \{Name = net_whammy_pitch_shift}
endscript
pitch_dirty = 1
prev_len = 0

script net_whammy_pitch_shift 
	if ($pitch_dirty = 1)
		Change \{pitch_dirty = 0}
		Change prev_len = <net_whammy_length>
		begin
		control_whammy_pitchshift Song = <Song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> net_whammy_length = <net_whammy_length> Time = <Time>
		Wait \{1 GameFrame}
		repeat
	else
		<len_delta> = (<net_whammy_length> - $prev_len)
		<len_base> = ($prev_len)
		Change prev_len = <net_whammy_length>
		<frames> = 5
		<scale> = (1.0 / <frames>)
		<scale_step> = <scale>
		begin
		<len> = (<len_base> + (<len_delta> * <scale>))
		set_whammy_pitchshift control = <len> player_status = <player_status>
		<whammy_scale> = (((<len> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue Value = <whammy_scale> time_remaining = <Time> player_status = <player_status> Player = (<player_status>.Player)
		<scale> = (<scale> + <scale_step>)
		Wait \{1 GameFrame}
		repeat <frames>
		begin
		set_whammy_pitchshift control = <net_whammy_length> player_status = <player_status>
		<whammy_scale> = (((<net_whammy_length> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue Value = <whammy_scale> time_remaining = <Time> player_status = <player_status> Player = (<player_status>.Player)
		Wait \{1 GameFrame}
		repeat
	endif
endscript

script set_net_client_highway 
	Change StructureName = <player_status> highway_layout = <layout>
endscript

script set_net_client_lefty 
	Change StructureName = player2_status lefthanded_gems = <lefty_flip_p2>
	Change StructureName = player2_status lefthanded_button_ups = <lefty_flip_p2>
endscript

script finalize_connection_to_peer 
	Printf \{"---finalize_connection_to_peer"}
	Change opponent_gamertag = <opponent_gamertag>
	Change StructureName = player1_status net_id_first = <p1_net_id_first>
	Change StructureName = player1_status net_id_second = <p1_net_id_second>
	Change StructureName = player2_status net_id_first = <p2_net_id_first>
	Change StructureName = player2_status net_id_second = <p2_net_id_second>
	formatText \{Checksumname = player_status 'player1_status'}
	getglobaltags \{user_options}
	SendNetMessage {
		Type = lefty_update
		lefty_flag = (<lefty_flip_p1>)
	}
	if isHost
		ResetLobbyReady
		send_game_info_to_client
	endif
	StartGameNetScriptPump
endscript

script net_copy_intial_params 
	Change globalName = <copy_to> NewValue = $<copy_from>
endscript

script net_commit_or_reset_params 
	if gotParam \{commit}
		Change globalName = <copy_to> NewValue = $<copy_from>
	else
		if (<Type> = loc)
			<Text> :SetProps Text = ($levelzones.($LevelZoneArray [$<Global>]).title)
		else
			<Text> :SetProps Text = ($FilterTypes.<Type>.values [$<Global>])
		endif
	endif
	change_coop_value_if_ranked
endscript

script net_custom_up_down \{direction = Up}
	if (<Type> = loc)
		getArraySize ($LevelZoneArray)
	else
		getArraySize ($FilterTypes.<Type>.values)
	endif
	if (<direction> = Up)
		if ((<array_Size> -1) = $<Global>)
			Change globalName = <Global> NewValue = 0
		else
			Change globalName = <Global> NewValue = ($<Global> + 1)
		endif
	else
		if (0 = $<Global>)
			Change globalName = <Global> NewValue = (<array_Size> -1)
		else
			Change globalName = <Global> NewValue = (<Global> - 1)
		endif
	endif
	if (<Type> = loc)
		<Text> :SetProps Text = ($levelzones.($LevelZoneArray [$<Global>]).title) scale = 1.0
		fit_text_into_menu_item Id = <Text> max_width = 375
	else
		<Text> :SetProps Text = ($FilterTypes.<Type>.values [$<Global>]) scale = 1.0
		fit_text_into_menu_item Id = <Text> max_width = 375
	endif
	if (($SearchMatchTypeValue = 1) && (<Type> = mode) && ($<Global> = 4) && ($ui_flow_manager_state [0] = custom_match_fs))
		net_custom_up_down <...>
	endif
	if (($<Global> = 2) && (<Type> = search))
		if NOT isxenon
			net_custom_up_down <...>
		endif
	endif
endscript

script change_coop_value_if_ranked 
	if (($SearchMatchTypeValue = 1) && ($SearchGameModeValue = 4))
		net_custom_up_down \{direction = Up Type = mode Global = SearchGameModeValue Text = game_mode_selection_text}
	endif
endscript

script block_unblock_difficulty_actions \{diff_focus = OFF Menu = search}
	if gotParam \{diff_focus}
		<change_color> = ($online_light_blue)
	else
		<change_color> = ($online_dark_purple)
	endif
	if (<Menu> = search)
		<gamemode> = ($SearchGameModeValue)
		<new_text> = ($FilterTypes.diff.values [($SearchDifficultyValue)])
	else
		<gamemode> = ($OptionsGameModeValue)
		<new_text> = ($FilterTypes.diff.values [($OptionsDifficultyValue)])
	endif
	if ((<gamemode> = 0) || (<gamemode> = 2))
		if ScreenelementExists \{Id = DIFFICULTY}
			DIFFICULTY :SetProps rgba = <change_color> unblock_events
		endif
		if ScreenelementExists \{Id = difficulty_selection_text}
			difficulty_selection_text :SetProps rgba = <change_color> Text = <new_text> unblock_events
		endif
	else
		if ScreenelementExists \{Id = DIFFICULTY}
			DIFFICULTY :SetProps rgba = ($online_grey) block_events
		endif
		if ScreenelementExists \{Id = difficulty_selection_text}
			difficulty_selection_text :SetProps rgba = ($online_grey) Text = "N/A" block_events
		endif
	endif
endscript

script online_menu_init 
	Printf \{"--- online_menu_init"}
	Change player1_device = ($primary_controller)
	setup_online_player_settings
	Change \{is_network_game = 1}
	Change \{new_net_logic = 1}
	Change \{current_num_players = 1}
	Change \{player2_present = 0}
	Change \{opponent_gamertag = NULL}
	Change \{StructureName = player1_status part = GUITAR}
	Change \{StructureName = player2_status part = GUITAR}
	create_guitarist \{Name = GUITARIST useOldPos no_strum animpak = 0}
	create_guitarist \{Name = BASSIST useOldPos no_strum animpak = 0}
	SetNetworkMode \{$INTERNET_MODE}
	cleanup_sessionfuncs
	setup_sessionfuncs
	NetSessionfunc \{func = GetNumPlayers}
	create_menu_backdrop \{texture = Online_Background}
	begin
	if ($DEMONWARE_IS_READY = 1)
		break
	endif
	Wait \{1 Frame}
	repeat
endscript

script setup_online_player_settings 
	getglobaltags \{user_options}
	switch (<online_highway>)
		case 0
		Change \{StructureName = player1_status highway_layout = default_highway}
		case 1
		Change \{StructureName = player1_status highway_layout = solo_highway}
	endswitch
endscript

script get_random_song 
	first_song_index = (-1)
	last_song_index = (-1)
	array_entry = 0
	getArraySize \{$gh3_songlist}
	begin
	song_checksum = ($gh3_songlist [<array_entry>])
	get_song_struct Song = <song_checksum>
	if ((<song_struct>.version) = gh3)
		if (<first_song_index> = (-1))
			<first_song_index> = <array_entry>
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	<last_song_index> = (<array_entry> - 1)
	GetRandomValue Name = random_value Integer A = <first_song_index> B = <last_song_index>
	return random_song = ($gh3_songlist [<random_value>])
endscript

script start_network_game 
	if isHost
		StartNetworkGame
	endif
endscript

script check_for_final_song_selection 
	if (($tie_breaker) = song_rand)
		return \{can_select_final_song = FALSE}
		elseif (($tie_breaker) = host)
		if isHost
			return \{can_select_final_song = TRUE}
		else
			return \{can_select_final_song = FALSE}
		endif
		elseif (($tie_breaker) = CLIENT)
		if isHost
			return \{can_select_final_song = FALSE}
		else
			return \{can_select_final_song = TRUE}
		endif
	endif
endscript

script online_fail_song 
	Printf \{"---online fail song"}
	Change \{disable_attacks = 1}
	if (GameIsOver)
		Change \{current_num_players = 2}
		return
	endif
	if (isHost)
		loser = 0
	else
		loser = 1
	endif
	SendNetMessage {
		Type = fail_song
		STARS = ($player1_status.STARS)
		note_streak = ($player1_status.best_run)
		NOTES_HIT = ($player1_status.NOTES_HIT)
		total_notes = ($player1_status.total_notes)
		quit_early_flag = 0
		loser = <loser>
	}
endscript

script online_win_song 
	if ($ui_flow_manager_state [0] = online_pause_fs)
		net_unpausegh3
	endif
	disable_pause
	Printf \{"---online_win_song"}
	Change \{disable_attacks = 1}
	Change StructureName = <player_status> STARS = <STARS>
	Change StructureName = <player_status> best_run = <note_streak>
	Change StructureName = <player_status> total_notes = <total_notes>
	Change StructureName = <player_status> NOTES_HIT = <NOTES_HIT>
	if (<quit_early>)
		Change \{player2_present = 0}
		formatText Textname = notification_text "%n\\n has quit" N = ($opponent_gamertag)
		if ($match_type = Ranked)
			ranked_quit_fix_scores
		endif
		if ($game_mode = p2_battle)
			Change \{StructureName = player1_status current_health = 1.0}
			Change \{StructureName = player2_status current_health = 0.0}
		else
			Change \{StructureName = player2_status score = 0.0}
		endif
		create_net_popup popup_text = <notification_text>
		Wait \{3 Seconds}
		destroy_net_popup
	endif
	player_Text = (<player_status>.Text)
	Change \{current_num_players = 2}
	if ($game_mode = p2_battle)
		if (<losing_player> = 1)
			Change \{StructureName = player1_status current_health = 0.0}
			Change \{StructureName = player2_status current_health = 1.0}
		else
			Change \{StructureName = player1_status current_health = 1.0}
			Change \{StructureName = player2_status current_health = 0.0}
		endif
		GuitarEvent_SongWon \{battle_win = 1}
	else
		ExtendCrc song_won <player_Text> out = Type
		BroadCastEvent Type = <Type>
	endif
endscript

script broadcast_received_winner_stats 
	Change StructureName = <player_status> STARS = <STARS>
	Change StructureName = <player_status> best_run = <note_streak>
	Change StructureName = <player_status> total_notes = <total_notes>
	Change StructureName = <player_status> NOTES_HIT = <NOTES_HIT>
	if ($game_mode = p2_battle)
		record_net_statistics
	endif
endscript

script set_rich_presence_searching 
	Change \{rich_presence_context = presence_online_searching}
endscript

script set_rich_presence_game_mode \{ONLINE = 0}
	if (<ONLINE>)
		Change \{rich_presence_context = presence_online_game_mode}
	else
		switch ($game_mode)
			case p1_career
			Change \{rich_presence_context = presence_career}
			case p1_quickplay
			Change \{rich_presence_context = presence_quick_play}
			case p2_career
			if ($coop_dlc_active)
				Change \{rich_presence_context = presence_2player}
			else
				Change \{rich_presence_context = presence_coop_career}
			endif
			case p2_pro_faceoff
			Change \{rich_presence_context = presence_2player}
			case p2_faceoff
			Change \{rich_presence_context = presence_2player}
			case p2_battle
			Change \{rich_presence_context = presence_battle}
			case training
			Change \{rich_presence_context = presence_practice}
		endswitch
	endif
endscript

script get_custom_match_search_params 
	GetPreferenceChecksum \{Ranked}
	Ranked = <Checksum>
	GetPreferenceValue \{Ranked}
	ranked_value = <Value>
	if (($SearchGameModeValue = 0) || ($SearchGameModeValue = 2))
		difficulty_checksum = ($FilterTypes.diff.Checksum [($SearchDifficultyValue)])
	else
		difficulty_checksum = dont_care
	endif
	return {
		DIFFICULTY = <difficulty_checksum>
		gamemode = ($FilterTypes.mode.Checksum [($SearchGameModeValue)])
		num_songs = ($FilterTypes.num_songs.Checksum [($SearchNumSongsValue)])
		tie_breaker = dont_care
		Ranked = <Ranked>
		ranked_value = <ranked_value>
	}
endscript

script get_quick_match_search_params 
	getglobaltags \{user_options}
	GetPreferenceChecksum \{Ranked}
	Ranked = <Checksum>
	GetPreferenceValue \{Ranked}
	ranked_value = <Value>
	if ((<online_game_mode> = 0) || (<online_game_mode> = 2))
		difficulty_checksum = ($FilterTypes.diff.Checksum [<online_difficulty>])
	else
		difficulty_checksum = dont_care
	endif
	return {
		DIFFICULTY = <difficulty_checksum>
		gamemode = ($FilterTypes.mode.Checksum [<online_game_mode>])
		num_songs = ($FilterTypes.num_songs.Checksum [<online_num_songs>])
		tie_breaker = dont_care
		Ranked = <Ranked>
		ranked_value = <ranked_value>
	}
endscript

script get_private_match_search_params 
	return {
		privateMatchId = ($gPrivateMatchId)
	}
endscript
bPS3SingleSignOnCheckComplete = 0

script xenon_singleplayer_session_init \{ps3_signin_callback = xenon_singleplayer_session_init}
	printScriptInfo \{"--- MJS xenon_singleplayer_session_init"}
	if CheckForSignIn
		if ($is_network_game = 1)
			NetSessionfunc \{func = motd_uninit}
			NetSessionfunc \{func = motd_init}
			if isxenon
				NetSessionfunc \{func = start_singleplayer_session Obj = session}
				MassiveInit \{sku = 'atvi_guitar_hero_3_pc_na' startZone = 'GlobalZone'}
			endif
		endif
	else
		if ($is_attract_mode = 0)
			if NOT gotParam \{from_callback}
				if (0 = $bPS3SingleSignOnCheckComplete)
					NetSessionfunc func = OnlineSignIn Params = {callback = <ps3_signin_callback>}
					Change \{bPS3SingleSignOnCheckComplete = 1}
				endif
			else
				Printf \{"PS3: unable to signin in to the network platform"}
			endif
		endif
	endif
endscript

script begin_singleplayer_game 
	if NetSessionfunc \{Obj = session func = has_active_session}
		NetSessionfunc \{Obj = session func = begin_singleplayer_game}
	endif
endscript

script xenon_singleplayer_session_begin_uninit 
	if isxenon
		NetSessionfunc \{func = stop_singleplayer_session Obj = session}
	endif
endscript

script xenon_singleplayer_session_complete_uninit 
	Printf \{"--- xenon_singleplayer_session_complete_uninit"}
	Change \{net_safe_to_enter_net_play = 0}
	NetSessionfunc \{Obj = session func = unpost_game}
	NetSessionfunc \{func = match_uninit}
	NetSessionfunc \{func = motd_uninit}
	Change \{net_safe_to_enter_net_play = 1}
endscript

script send_leader_board_message 
	printScriptInfo \{"--- MJS send_leader_board_message"}
	player1_xuid = [0 0]
	player2_xuid = [0 0]
	switch (<diff>)
		case EASY
		<rating> = 1
		case MEDIUM
		<rating> = 2
		case HARD
		<rating> = 3
		case EXPERT
		<rating> = 4
	endswitch
	if ($game_mode = p1_career)
		controller = ($primary_controller)
		GetNetID Player = <controller>
		setarrayelement Arrayname = player1_xuid Index = 0 NewValue = <net_id_first>
		setarrayelement Arrayname = player1_xuid Index = 1 NewValue = <net_id_second>
		switch (<diff>)
			case EASY
			<career_leaderboard_id> = lb_career_easy
			<campaign_leaderboard_id> = lb_campaign_easy
			case MEDIUM
			<career_leaderboard_id> = lb_career_med
			<campaign_leaderboard_id> = lb_campaign_med
			case HARD
			<career_leaderboard_id> = lb_career_hard
			<campaign_leaderboard_id> = lb_campaign_hard
			case EXPERT
			<career_leaderboard_id> = lb_career_expert
			<campaign_leaderboard_id> = lb_campaign_expert
		endswitch
		get_progression_globals game_mode = ($game_mode)
		summation_career_score tier_global = <tier_global>
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <leaderboard_Id>
						rating = <rating>
						score = <score>
						write_type = MAX
						columns = [
							{score = <score>}
							{score = <score>}
							{score = <score>}
						]
					}
					{
						leaderboard_Id = <career_leaderboard_id>
						rating = 0
						score = <career_score>
						write_type = MAX
						columns = [
							{score = <career_score>}
							{score = <career_score>}
							{score = <career_score>}
						]
					}
					{
						leaderboard_Id = <campaign_leaderboard_id>
						rating = 0
						score = <score>
						write_type = ACCUMULATE
						columns = [
							{score = <score>}
							{score = <score>}
							{score = <score>}
						]
					}
					{
						leaderboard_Id = lb_campaign
						rating = 0
						score = <score>
						write_type = ACCUMULATE
						columns = [
							{score = <score>}
							{score = <score>}
							{score = <score>}
						]
					}
				]
			}
		]
		elseif (($game_mode = p2_career) && ($coop_dlc_active = 0))
		controller = ($primary_controller)
		GetNetID Player = <controller>
		setarrayelement Arrayname = player1_xuid Index = 0 NewValue = <net_id_first>
		setarrayelement Arrayname = player1_xuid Index = 1 NewValue = <net_id_second>
		net_get_highest_coop_difficulty
		switch <highest_diff>
			case EASY
			rating = 1
			career1_leaderboard_id = lb_coop_career_easy
			case MEDIUM
			rating = 2
			career1_leaderboard_id = lb_coop_career_med
			case HARD
			rating = 3
			career1_leaderboard_id = lb_coop_career_hard
			case EXPERT
			rating = 4
			career1_leaderboard_id = lb_coop_career_expert
		endswitch
		get_progression_globals game_mode = ($game_mode)
		summation_career_score tier_global = <tier_global>
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <leaderboard_Id>
						rating = <rating>
						score = <score>
						write_type = MAX
						columns = [
							{score = <score>}
							{score = <score>}
							{score = <score>}
						]
					}
					{
						leaderboard_Id = <career1_leaderboard_id>
						rating = 0
						score = <career_score>
						write_type = MAX
						columns = [
							{score = <career_score>}
							{score = <career_score>}
							{score = <career_score>}
						]
					}
				]
			}
		]
	else
		controller = ($primary_controller)
		GetNetID Player = <controller>
		setarrayelement Arrayname = player1_xuid Index = 0 NewValue = <net_id_first>
		setarrayelement Arrayname = player1_xuid Index = 1 NewValue = <net_id_second>
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <leaderboard_Id>
						rating = <rating>
						score = <score>
						write_type = MAX
						columns = [
							{score = <score>}
							{score = <score>}
							{score = 0}
						]
					}
				]
			}
		]
	endif
	NetSessionfunc func = stats_write_multiplayer Obj = stats Params = {Player_list = <Player_list>}
endscript

script net_write_single_player_stats 
	net_retrieve_primary_controller_score
	primary_player_score = <primary_score>
	secondary_player_score = <secondary_score>
	if (<primary_player_score> > 0)
		if NOT (($game_mode = p2_battle) || ($game_mode = PRACTICE) || $Cheat_NoFail = 1 || $Cheat_EasyExpert = 1)
			if ($game_mode = p2_career)
				primary_player_score = (<primary_player_score> + <secondary_player_score>)
				castToInteger \{primary_player_score}
				get_song_struct Song = ($current_song)
				formatText Checksumname = coop_song_checksum 'lb_coop_%s' S = (<song_struct>.Name)
				send_leader_board_message score = <primary_player_score> leaderboard_Id = <coop_song_checksum> diff = ($current_difficulty)
			else
				castToInteger \{primary_player_score}
				send_leader_board_message score = <primary_player_score> leaderboard_Id = ($current_song) diff = ($current_difficulty)
			endif
		else
			xenon_singleplayer_session_begin_uninit
		endif
	else
		xenon_singleplayer_session_begin_uninit
	endif
endscript

script net_retrieve_primary_controller_score 
	if (($player1_status.controller) = ($primary_controller))
		return primary_score = ($player1_status.score) secondary_score = ($player2_status.score)
		elseif (($player2_status.controller) = ($primary_controller))
		return primary_score = ($player2_status.score) secondary_score = ($player1_status.score)
	else
		return \{primary_score = 0 secondary_score = 0}
	endif
endscript

script summation_career_score 
	setlist_prefix = ($<tier_global>.Prefix)
	career_score = 0
	Tier = 1
	begin
	formatText Checksumname = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	formatText Checksumname = tier_checksum 'tier%s' S = <Tier>
	getArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	formatText Checksumname = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<array_count> + 1) S = <Tier>
	getglobaltags <song_checksum> param = score
	<career_score> = (<career_score> + <score>)
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
	return career_score = <career_score>
endscript

script online_song_end_write_stats \{song_type = single}
	printScriptInfo \{"MJS --- online_song_end_write_stats"}
	player1_score = ($player1_status.score)
	castToInteger \{player1_score}
	if (<player1_score> > 0)
		player1_xuid = [0 0]
		setarrayelement Arrayname = player1_xuid Index = 0 NewValue = ($player1_status.net_id_first)
		setarrayelement Arrayname = player1_xuid Index = 1 NewValue = ($player1_status.net_id_second)
		if (<song_type> = coop)
			net_get_highest_coop_difficulty
			switch <highest_diff>
				case EASY
				<player1_difficulty_index> = 1
				case MEDIUM
				<player1_difficulty_index> = 2
				case HARD
				<player1_difficulty_index> = 3
				case EXPERT
				<player1_difficulty_index> = 4
			endswitch
			get_song_struct Song = ($net_setlist_songs [($net_song_num)])
			formatText Checksumname = leaderboard_Id 'lb_coop_%s' S = (<song_struct>.Name)
		else
			switch ($current_difficulty)
				case EASY
				<player1_difficulty_index> = 1
				case MEDIUM
				<player1_difficulty_index> = 2
				case HARD
				<player1_difficulty_index> = 3
				case EXPERT
				<player1_difficulty_index> = 4
			endswitch
			leaderboard_Id = ($net_setlist_songs [($net_song_num)])
		endif
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <leaderboard_Id>
						rating = <player1_difficulty_index>
						score = <player1_score>
						write_type = MAX
						columns = [
							{score = <player1_score>}
							{score = <player1_score>}
							{score = 0}
						]
					}
				]
			}
		]
	endif
	if gotParam \{Player_list}
		NetSessionfunc func = stats_write_multiplayer Obj = stats Params = {Player_list = <Player_list> DontEndSessionAfterWrite}
	endif
endscript

script online_match_end_write_stats 
	printScriptInfo \{"MJS --- online_match_end_write_stats"}
	write_stats = 0
	if ($game_mode = p2_coop)
		write_stats = 0
	else
		write_stats = 1
	endif
	printScriptInfo \{"MJS --- checking write_stats"}
	if (<write_stats> = 1)
		printScriptInfo \{"MJS --- <write_stats> = 1"}
		getglobaltags \{net}
		net_get_game_mode_leaderboard_id
		switch ($game_mode)
			case p2_faceoff
			printScriptInfo \{"MJS --- <p2_faceoff>"}
			<total_win_lose_leaderboard_id> = lb_faceoff_winratio
			<streak_leaderboard_id> = lb_faceoff_win_streak
			<streak_score> = <face_off_streak>
			<wins> = <faceoff_wins>
			<loses> = <faceoff_loses>
			case p2_pro_faceoff
			printScriptInfo \{"MJS --- <p2_pro_faceoff>"}
			<total_win_lose_leaderboard_id> = lb_pro_faceoff_winratio
			<streak_leaderboard_id> = lb_pro_faceoff_win_streak
			<streak_score> = <pro_face_off_streak>
			<wins> = <pro_faceoff_wins>
			<loses> = <pro_faceoff_loses>
			case p2_battle
			printScriptInfo \{"MJS --- <p2_battle>"}
			<total_win_lose_leaderboard_id> = lb_battle_winratio
			<streak_leaderboard_id> = lb_battle_win_streak
			<streak_score> = <battle_streak>
			<wins> = <battle_wins>
			<loses> = <battle_loses>
		endswitch
		printScriptInfo \{"MJS --- calling prepare_player_list_array"}
		prepare_player_list_array {
			p1_leaderboard_id = <p1_leaderboard_id>
			p2_leaderboard_id = <p2_leaderboard_id>
			total_win_lose_leaderboard_id = <total_win_lose_leaderboard_id>
			streak_leaderboard_id = <streak_leaderboard_id>
			streak_score = <streak_score>
			wins = <wins>
			loses = <loses>
		}
		if gotParam \{Player_list}
			printScriptInfo \{"MJS --- calling stats_write_multiplayer"}
			printStruct <Player_list>
			NetSessionfunc func = stats_write_multiplayer Obj = stats Params = {Player_list = <Player_list> DontEndSessionAfterWrite}
		endif
	endif
	printScriptInfo \{"MJS --- end_write_stats"}
	Wait \{3 Seconds}
	NetSessionfunc \{Obj = stats func = end_write_stats}
endscript

script net_get_highest_coop_difficulty 
	if (($current_difficulty = EXPERT) || ($current_difficulty2 = EXPERT))
		return \{highest_diff = EXPERT}
	endif
	if (($current_difficulty = HARD) || ($current_difficulty2 = HARD))
		return \{highest_diff = HARD}
	endif
	if (($current_difficulty = MEDIUM) || ($current_difficulty2 = MEDIUM))
		return \{highest_diff = MEDIUM}
	endif
	return \{highest_diff = EASY}
endscript

script online_set_win_losses_streak \{out_come = LOSE}
	getglobaltags \{net}
	switch ($game_mode)
		case p2_battle
		if (<out_come> = WIN)
			setGlobalTags net Params = {battle_streak = (<battle_streak> + 1) battle_wins = (<battle_wins> + 1)}
		else
			setGlobalTags net Params = {battle_streak = 0 battle_loses = (<battle_loses> + 1)}
		endif
		case p2_faceoff
		if (<out_come> = WIN)
			setGlobalTags net Params = {face_off_streak = (<face_off_streak> + 1) faceoff_wins = (<faceoff_wins> + 1)}
		else
			setGlobalTags net Params = {face_off_streak = 0 faceoff_loses = (<faceoff_loses> + 1)}
		endif
		case p2_pro_faceoff
		if (<out_come> = WIN)
			setGlobalTags net Params = {pro_face_off_streak = (<pro_face_off_streak> + 1) pro_faceoff_wins = (<pro_faceoff_wins> + 1)}
		else
			setGlobalTags net Params = {pro_face_off_streak = 0 pro_faceoff_loses = (<pro_faceoff_loses> + 1)}
		endif
	endswitch
endscript

script net_get_game_mode_leaderboard_id 
	Printf \{"net_get_game_mode_leaderboard_id"}
	switch ($game_mode)
		case p2_faceoff
		formatText Checksumname = leaderboard_id_p1 'lb_faceoff_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		formatText Checksumname = leaderboard_id_p2 'lb_faceoff_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
		case p2_pro_faceoff
		formatText Checksumname = leaderboard_id_p1 'lb_pro_faceoff_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		formatText Checksumname = leaderboard_id_p2 'lb_pro_faceoff_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
		case p2_battle
		formatText Checksumname = leaderboard_id_p1 'lb_battle_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		formatText Checksumname = leaderboard_id_p2 'lb_battle_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
	endswitch
	return {p1_leaderboard_id = <leaderboard_id_p1> p2_leaderboard_id = <leaderboard_id_p2>}
endscript

script prepare_player_list_array 
	printScriptInfo \{"MJS --- prepare_player_list_array"}
	net_stats_calculate_wins
	player1_xuid = [0 0]
	player2_xuid = [0 0]
	setarrayelement Arrayname = player1_xuid Index = 0 NewValue = ($player1_status.net_id_first)
	setarrayelement Arrayname = player1_xuid Index = 1 NewValue = ($player1_status.net_id_second)
	setarrayelement Arrayname = player2_xuid Index = 0 NewValue = ($player2_status.net_id_first)
	setarrayelement Arrayname = player2_xuid Index = 1 NewValue = ($player2_status.net_id_second)
	printScriptInfo \{"MJS --- checking wins"}
	Printf "p1=%a p2=%b" A = <p1_wins> B = <p2_wins>
	if (<p1_wins> = <p2_wins>)
		printScriptInfo \{"MJS --- wins are equal"}
		return
		elseif (<p1_wins> > <p2_wins>)
		printScriptInfo \{"MJS --- p1 is greater"}
		get_match_type_leaderboard_info \{p1_wins_value = 1 p1_loses_value = 0 p2_wins_value = 0 p2_loses_value = 1}
		GetLeaderboardWinLoseValue WIN = (<wins> + 1) LOSE = <loses>
		online_set_win_losses_streak \{out_come = WIN}
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <p1_leaderboard_id>
						rating = 0
						score = <score1>
						write_type = <write_type>
						columns = [
							{score = <attrib_acum1>}
							{score = <attrib_score1>}
							{score = <attrib_tot1>}
						]
					}
					{
						leaderboard_Id = <total_win_lose_leaderboard_id>
						rating = 0
						score = <winlosevalue>
						write_type = LAST
						columns = [
							{score = <winlosevalue>}
							{score = <winlosevalue>}
							{score = <winlosevalue>}
						]
					}
					{
						leaderboard_Id = <streak_leaderboard_id>
						rating = 0
						score = (<streak_score> + 1)
						write_type = LAST
						columns = [
							{score = (<streak_score> + 1)}
							{score = (<streak_score> + 1)}
							{score = (<streak_score> + 1)}
						]
					}
				]
			}
			{
				player_xuid = <player2_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <p2_leaderboard_id>
						rating = 0
						score = <score2>
						write_type = <write_type>
						columns =
						[
							{score = <attrib_acum2>}
							{score = <attrib_score2>}
							{score = <attrib_tot2>}
						]
					}
				]
			}
		]
		elseif (<p1_wins> < <p2_wins>)
		printScriptInfo \{"MJS --- p2 is greater"}
		get_match_type_leaderboard_info \{p1_wins_value = 0 p1_loses_value = 1 p2_wins_value = 1 p2_loses_value = 0}
		GetLeaderboardWinLoseValue WIN = <wins> LOSE = (<loses> + 1)
		online_set_win_losses_streak \{outcome = LOSE}
		Player_list = [
			{
				player_xuid = <player2_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <p2_leaderboard_id>
						rating = 0
						score = <score2>
						write_type = <write_type>
						columns = [
							{score = <attrib_acum2>}
							{score = <attrib_score2>}
							{score = <attrib_tot2>}
						]
					}
				]
			}
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <p1_leaderboard_id>
						rating = 0
						score = <score1>
						write_type = <write_type>
						columns = [
							{score = <attrib_acum1>}
							{score = <attrib_score1>}
							{score = <attrib_tot1>}
						]
					}
					{
						leaderboard_Id = <total_win_lose_leaderboard_id>
						rating = 0
						score = <winlosevalue>
						write_type = LAST
						columns = [
							{score = <winlosevalue>}
							{score = <winlosevalue>}
							{score = <winlosevalue>}
						]
					}
					{
						leaderboard_Id = <streak_leaderboard_id>
						rating = 0
						score = 0
						write_type = LAST
						columns = [
							{score = 0}
							{score = 0}
							{score = 0}
						]
					}
				]
			}
		]
	endif
	printStruct <...>
	return Player_list = <Player_list>
endscript

script get_match_type_leaderboard_info 
	if NOT ($game_mode = p2_battle)
		net_stats_calculate_total_scores
		player1_score = <p1_score>
		castToInteger \{player1_score}
		player2_score = <p2_score>
		castToInteger \{player2_score}
		return {
			write_type = MAX
			score1 = <player1_score>
			attrib_acum1 = <player1_score>
			attrib_score1 = <player1_score>
			attrib_tot1 = 0
			score2 = <player2_score>
			attrib_acum2 = <player2_score>
			attrib_score2 = <player2_score>
			attrib_tot2 = 0
		}
	else
		return {
			write_type = ACCUMULATE
			score1 = <p1_wins_value>
			attrib_acum1 = <p1_wins_value>
			attrib_score1 = <p1_wins_value>
			attrib_tot1 = 0
			score2 = <p2_wins_value>
			attrib_acum2 = <p2_wins_value>
			attrib_score2 = <p2_wins_value>
			attrib_tot2 = 0
		}
	endif
endscript

script network_player_lobby_message 
	if NOT ((<Type> = open_comm) || (<Type> = ready_up))
		return
	endif
	switch <Type>
		case character_select
		<selection_type> = 0
		case character_hub_select
		<selection_type> = 1
		case outfit_select
		<selection_type> = 2
		case style_select
		<selection_type> = 3
		case guitar_select
		<selection_type> = 4
		case skin_select
		<selection_type> = 5
		case song_select
		<selection_type> = 6
		case ready_up
		<selection_type> = 7
		case open_comm
		<selection_type> = 8
	endswitch
	switch <action>
		case update
		<selection_action> = 0
		case deselect
		<selection_action> = 1
		case Select
		<selection_action> = 2
	endswitch
	if gotParam \{value1}
		<selection_index1> = <value1>
	else
		<selection_index1> = 0
	endif
	if gotParam \{value2}
		<selection_index2> = <value2>
	else
		<selection_index2> = 0
	endif
	if gotParam \{Checksum}
		<checksum_value> = <Checksum>
	else
		<checksum_value> = NULL
	endif
	SendNetMessage {
		Type = lobby_selection
		selection_type = <selection_type>
		selection_action = <selection_action>
		selection_index1 = <selection_index1>
		selection_index2 = <selection_index2>
		net_checksum = <checksum_value>
	}
endscript

script net_request_play_show 
	if (($p1_ready = 1) && ($p2_ready = 1))
		return
	endif
	if (<action> = 1)
		if ($p1_ready = 0)
			if ScreenelementExists \{Id = vmenu_character_hub_p1}
				launchevent \{Type = unfocus Target = vmenu_character_hub_p1}
			endif
			SendNetMessage {
				Type = lobby_ready
				ready_status = <action>
			}
		endif
	else
		if ($p1_ready = 1)
			if ScreenelementExists \{Id = vmenu_character_hub_p1}
				launchevent \{Type = unfocus Target = vmenu_character_hub_p1}
			endif
			SendNetMessage {
				Type = lobby_ready
				ready_status = <action>
			}
		else
			character_hub_go_back \{Player = 1}
		endif
	endif
endscript

script net_request_play_show_ack 
	if (($p1_ready = 1) && ($p2_ready = 1))
		return
	endif
	if gotParam \{action}
		if (<action> = 0)
			if (<Player> = 1)
				character_hub_go_back Player = <Player>
			else
				character_hub_net_ready_back
			endif
		else
			if (<Player> = 1)
				character_hub_select_play_show Player = <Player>
				if ScreenelementExists \{Id = vmenu_character_hub_p1}
					launchevent \{Type = focus Target = vmenu_character_hub_p1}
				endif
			else
				character_hub_net_ready
			endif
		endif
	endif
endscript

script network_player_lobby_update 
	if NOT (($player2_present) || (<selection_type> = 8))
		Printf "The other player is not connected.  Ignoring this message type=%s" S = <selection_type>
		return
	endif
	switch <selection_type>
		case 0
		switch <selection_action>
			get_musician_profile_struct Index = <checksum_value>
			case 0
			if (<selection_index1> = 0)
				cs_scroll_up_or_down \{Player = 2 Dir = Up}
			else
				cs_scroll_up_or_down \{Player = 2 Dir = Down}
			endif
			case 1
			net_cs_go_back \{Player = 2}
			case 2
			if (<selection_index1> = ($character_select_highlighted_character_p2))
				character_select_choose \{Player = 2}
			endif
		endswitch
		case 1
		switch <selection_action>
			case 1
			character_hub_go_back \{Player = 2}
			case 2
			switch <selection_index1>
				case 1
				character_hub_select_change_outfit \{Player = 2}
				case 2
				character_hub_select_change_guitar \{Player = 2}
				case 3
				character_hub_select_change_guitar \{Player = 2 BASS}
			endswitch
		endswitch
		case 2
		switch <selection_action>
			case 0
			os_scroll_up_or_down \{Player = 2}
			case 1
			select_outfit_go_back \{Player = 2}
			case 2
			select_outfit_choose \{Player = 2}
		endswitch
		case 3
		switch <selection_action>
			case 0
			select_outfit_style_highlight Player = 2 Index = <selection_index1>
			case 1
			destroy_select_style_menu \{Player = 2}
			case 2
			select_outfit_style_choose \{Player = 2}
		endswitch
		case 4
		switch <selection_action>
			case 0
			net_gs_scroll_up_or_down Player = 2 dir_value = <selection_index1> instrument_type = <checksum_value>
			case 1
			SpawnScriptNOw \{select_guitar_go_back Params = {Player = 2}}
			case 2
			net_select_guitar Player = 2 Index = <selection_index1> instrument_type = <checksum_value>
		endswitch
		case 5
		switch <selection_action>
			case 0
			case 1
			net_select_guitar_go_back_from_finish_menu Player = 2 instrument_type = <checksum_value>
			case 2
			net_select_guitar_finish_choose Player = 2 Index = <selection_index1> finish_index = <selection_index2> instrument_type = <checksum_value>
		endswitch
		case 6
		switch <selection_action>
			case 1
			online_song_deselect \{Player = 2}
			case 2
			online_song_select Song = <checksum_value> Player = 2
		endswitch
		case 7
		switch <selection_action>
			case 1
			if (<checksum_value> = Final)
				online_song_deselect \{Player = 2}
				return
			endif
			character_hub_net_ready_back
			case 2
			if (<checksum_value> = Final)
				online_song_select \{Player = 2}
				return
			endif
			character_hub_net_ready
		endswitch
		case 8
		set_other_player_present
	endswitch
endscript

script net_lobby_state_message 
	switch <current_state>
		case NONE
		selection_type = 1
		case character_hub
		selection_type = 1
		case instrument
		selection_type = 2
		case DIFFICULTY
		selection_type = 3
		case Song
		selection_type = 4
	endswitch
	switch <action>
		case request
		selection_action = 0
		case approval
		selection_action = 1
	endswitch
	if gotParam \{request_state}
		switch <request_state>
			case leaving_lobby
			Value = 0
			case character_hub
			Value = 1
			case instrument
			Value = 2
			case DIFFICULTY
			Value = 3
			case Song
			Value = 4
		endswitch
	else
		Value = 1
	endif
	SendNetMessage {
		Type = lobby_state
		selection_type = <selection_type>
		selection_action = <selection_action>
		selection_index = <Value>
	}
endscript

script net_lobby_state_update 
	switch <selection_type>
		case 1
		Change \{net_current_flow_state = character_hub}
		Change \{net_can_send_approval = 1}
		case 2
		Change \{StructureName = player1_status part = GUITAR}
		Change \{StructureName = player2_status part = GUITAR}
		create_guitarist \{Name = GUITARIST useOldPos no_strum animpak = 0}
		create_guitarist \{Name = BASSIST useOldPos no_strum animpak = 0}
		if isHost
			ResetLobbyReady
		endif
		launchevent \{Type = focus Target = si_vmenu_p1}
		Change \{net_current_flow_state = instrument}
		Change \{net_can_send_approval = 1}
		case 3
		if isHost
			ResetLobbyReady
		endif
		launchevent \{Type = focus Target = vmenu_select_difficulty}
		Change \{net_current_flow_state = DIFFICULTY}
		Change \{net_can_send_approval = 1}
		case 4
		if (isHost)
			ResetLobbyReady
			if ($host_songs_to_pick = 0)
				launchevent \{Type = focus Target = ready_container_p1}
			else
				launchevent \{Type = focus Target = vmenu_setlist}
			endif
		else
			if ($client_songs_to_pick = 0)
				launchevent \{Type = focus Target = ready_container_p1}
			else
				launchevent \{Type = focus Target = vmenu_setlist}
			endif
		endif
		Change \{net_current_flow_state = Song}
		Change \{net_can_send_approval = 1}
	endswitch
endscript

script net_pausegh3 
	ui_flow_manager_respond_to_action \{action = pause_game}
	Wait \{1 GameFrame}
endscript

script net_unpausegh3 
	ui_flow_manager_respond_to_action \{action = select_resume}
endscript

script gameinvite_server_unavailable 
	CreateJoinRefusedDialog \{reason = net_status_join_timeout}
endscript

script destroy_join_refuse_dialog 
	destroy_connection_dialog_scroller
	destroy_popup_warning_menu
endscript

script CreateJoinRefusedDialog 
	Printf \{"--CreateJoinRefusedDialog"}
	destroy_net_popup
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	switch (<reason>)
		case net_reason_banned
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_status_join_timeout
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_full_observers
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_wrong_password
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_default
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_rank_limit_low
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_rank_limit_high
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_default
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_full
		<connection_msg> = "THIS SERVER IS NOW FULL"
	endswitch
	createScreenElement \{Type = containerElement PARENT = root_window Id = net_popup_container just = [Center Center] pos = (0.0, 0.0)}
	createScreenElement \{Type = VScrollingMenu PARENT = net_popup_container Id = connection_dialog_scroller just = [Center top] Dims = (400.0, 480.0) pos = (640.0, 400.0) z_priority = 1.0}
	createScreenElement {
		Type = VMenu
		PARENT = connection_dialog_scroller
		Id = connection_dialog_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		internal_just = [Center top]
		Dims = (400.0, 480.0)
		event_handlers = [
			{pad_choose destroy_popup_warning_menu}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_choose cancel_join_server}
			{pad_choose destroy_join_refuse_dialog}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu choose_script = empty_script Z = 200.1 Text = "CONTINUE"}
	displaySprite Id = connect_message_top PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center top] Z = 200
	displaySprite \{Id = connect_message_top_fill PARENT = net_popup_container tex = window_fill_cap rgba = [0 0 0 255] pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center top] Z = 200}
	displaySprite Id = connect_message_body PARENT = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center top] Z = 200 flip_h
	displaySprite \{Id = connect_message_body_fill PARENT = net_popup_container tex = window_fill_body_large rgba = [0 0 0 255] pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center top] Z = 200 flip_h}
	displaySprite Id = connect_message_bottom PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center top] Z = 200 flip_h
	displaySprite \{Id = connect_message_bottom_fill PARENT = net_popup_container tex = window_fill_cap rgba = [0 0 0 255] pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center top] Z = 200 flip_h}
	createScreenElement {
		Type = textblockelement
		PARENT = net_popup_container
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		Text = <connection_msg>
		pos = (640.0, 300.0)
		Dims = (375.0, 200.0)
		z_priority = 200.0
		just = [Center Center]
	}
	launchevent \{Type = focus Target = connection_dialog_vmenu}
endscript

script create_connection_lost_dialog 
	Printf \{"---create_connection_lost_dialog"}
	Change \{player2_present = 0}
	killspawnedScript \{Name = net_hub_stream}
	if ($ui_flow_manager_state [0] = online_loading_fs)
		RemoveTimeSyncTask
		Change \{net_ready_to_start = 1}
	endif
	wait_for_safe_shutdown
	if (gotParam from_invite)
		formatText \{Textname = gt_lost_connection_text "The invite server has been filled." dontassertforchecksums}
		elseif (gotParam player_quit)
		if ($opponent_gamertag = NULL)
			formatText \{Textname = gt_lost_connection_text "Your opponent has quit" dontassertforchecksums}
		else
			formatText Textname = gt_lost_connection_text "%n\\n has quit" N = ($opponent_gamertag) dontassertforchecksums
		endif
	else
		if ($opponent_gamertag = NULL)
			formatText \{Textname = gt_lost_connection_text "LOST CONNECTION TO YOUR OPPONENT" dontassertforchecksums}
		else
			formatText Textname = gt_lost_connection_text "LOST CONNECTION TO\\n%g" G = ($opponent_gamertag) dontassertforchecksums
		endif
	endif
	create_net_popup popup_text = <gt_lost_connection_text>
	if ($playing_song = 1)
		if ($gHandlingWindowClosed = 0)
			Wait \{2 Seconds}
		endif
		if ($ui_flow_manager_state [0] = online_play_song_fs)
			connection_lost_end_song
			elseif ($ui_flow_manager_state [0] = online_pause_fs)
			ui_flow_manager_respond_to_action \{action = select_resume}
			connection_lost_end_song
		else
			destroy_net_popup
			leaving_lobby_select_yes
			return
		endif
		Wait \{2 Seconds}
	else
		if (($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_win_song_fs))
			cleanup_newspaper_other_player_quit
			Wait \{4 Seconds}
		else
			Wait \{4 Seconds}
			lobby_connection_lost
		endif
	endif
	destroy_net_popup
endscript

script create_net_popup \{PARENT = root_window pos = (640.0, 325.0)}
	destroy_net_popup
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		Id = net_popup_container
		just = [Center Center]
		pos = (0.0, 0.0)
	}
	displaySprite Id = connect_message_top PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (<pos> - (0.0, 125.0)) Dims = (448.0, 64.0) just = [Center top] Z = 200
	displaySprite Id = connect_message_top_fill PARENT = net_popup_container tex = window_fill_cap rgba = ($online_trans_grey) pos = (<pos> - (0.0, 125.0)) Dims = (448.0, 64.0) just = [Center top] Z = 200
	displaySprite Id = connect_message_body PARENT = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (<pos> - (0.0, 61.0)) Dims = (448.0, 128.0) just = [Center top] Z = 200 flip_h
	displaySprite Id = connect_message_body_fill PARENT = net_popup_container tex = window_fill_body_large rgba = ($online_trans_grey) pos = (<pos> - (0.0, 61.0)) Dims = (448.0, 128.0) just = [Center top] Z = 200 flip_h
	displaySprite Id = connect_message_bottom PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (<pos> + (0.0, 67.0)) Dims = (448.0, 64.0) just = [Center top] Z = 200 flip_h
	displaySprite Id = connect_message_bottom_fill PARENT = net_popup_container tex = window_fill_cap rgba = ($online_trans_grey) pos = (<pos> + (0.0, 67.0)) Dims = (448.0, 64.0) just = [Center top] Z = 200 flip_h
	createScreenElement {
		Type = textblockelement
		Id = net_popup_text
		PARENT = net_popup_container
		font = fontgrid_title_gh3
		scale = 0.65000004
		rgba = ($online_light_blue)
		Text = <popup_text>
		pos = <pos>
		Dims = (375.0, 200.0)
		z_priority = 200.1
		just = [Center Center]
	}
	if gotParam \{add_waiting_dots}
		runScriptOnScreenElement Id = net_popup_text append_animating_dots Params = {Id = net_popup_text Text = <popup_text>}
	endif
endscript

script append_animating_dots 
	Printf \{"---append_animating_dots"}
	num_dots = 0
	if ScreenelementExists Id = <Id>
		begin
		formatText Textname = new_text "%a\\n%b" A = <Text> B = ($dots_array [<num_dots>])
		<Id> :SetProps Text = <new_text>
		if (<num_dots> = 3)
			<num_dots> = 0
		else
			<num_dots> = (<num_dots> + 1)
		endif
		Wait \{0.5 Second}
		repeat
	endif
endscript

script destroy_net_popup 
	if ScreenelementExists \{Id = net_popup_container}
		DestroyScreenelement \{Id = net_popup_container}
	endif
endscript

script ShowJoinTimeoutNotice 
	cancel_join_server
	setup_sessionfuncs
	SpawnScriptNOw \{timeout_connection_attempt}
endscript

script timeout_connection_attempt 
	create_timeout_dialog
	ui_flow_manager_respond_to_action \{action = timeout}
	net_repeat_last_search
endscript

script FailedToCreateGame 
	cancel_join_server
	setup_sessionfuncs
	create_failed_connection_dialog
endscript

script destroy_connection_dialog_scroller 
	if ScreenelementExists \{Id = connection_dialog_scroller}
		DestroyScreenelement \{Id = connection_dialog_scroller}
	endif
	destroy_net_popup
endscript

script create_timeout_dialog 
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	createScreenElement \{Type = VScrollingMenu PARENT = root_window Id = connection_dialog_scroller just = [Center top] Dims = (400.0, 480.0) pos = (640.0, 400.0) z_priority = 1.0}
	createScreenElement {
		Type = VMenu
		PARENT = connection_dialog_scroller
		Id = connection_dialog_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		internal_just = [Center top]
		Dims = (400.0, 480.0)
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_choose destroy_connection_dialog_scroller}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu choose_script = empty_script Z = 200.1 Text = "CONTINUE"}
	createScreenElement \{Type = containerElement PARENT = root_window Id = net_popup_container just = [Center Center] pos = (0.0, 0.0)}
	displaySprite Id = connect_message_top PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center top] Z = 200
	displaySprite \{Id = connect_message_top_fill PARENT = net_popup_container tex = window_fill_cap rgba = [0 0 0 255] pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center top] Z = 200}
	displaySprite Id = connect_message_body PARENT = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center top] Z = 200 flip_h
	displaySprite \{Id = connect_message_body_fill PARENT = net_popup_container tex = window_fill_body_large rgba = [0 0 0 255] pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center top] Z = 200 flip_h}
	displaySprite Id = connect_message_bottom PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center top] Z = 200 flip_h
	displaySprite \{Id = connect_message_bottom_fill PARENT = net_popup_container tex = window_fill_cap rgba = [0 0 0 255] pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center top] Z = 200 flip_h}
	createScreenElement {
		Type = textblockelement
		PARENT = net_popup_container
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		Text = "CONNECTION TIMED OUT"
		pos = (640.0, 300.0)
		Dims = (375.0, 200.0)
		z_priority = 200.0
		just = [Center Center]
	}
	launchevent \{Type = focus Target = connection_dialog_vmenu}
endscript

script create_failed_connection_dialog 
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	createScreenElement \{Type = VScrollingMenu PARENT = root_window Id = connection_dialog_scroller just = [Center top] Dims = (400.0, 480.0) pos = (640.0, 400.0) z_priority = 1.0}
	createScreenElement {
		Type = VMenu
		PARENT = connection_dialog_scroller
		Id = connection_dialog_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		internal_just = [Center top]
		Dims = (400.0, 480.0)
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_choose cancel_join_server}
			{pad_choose destroy_connection_dialog_scroller}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu choose_script = empty_script Z = 200.1 Text = "CONTINUE"}
	createScreenElement \{Type = containerElement PARENT = root_window Id = net_popup_container just = [Center Center] pos = (0.0, 0.0)}
	displaySprite Id = connect_message_top PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center top] Z = 200
	displaySprite \{Id = connect_message_top_fill PARENT = net_popup_container tex = window_fill_cap rgba = [0 0 0 255] pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center top] Z = 200}
	displaySprite Id = connect_message_body PARENT = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center top] Z = 200 flip_h
	displaySprite \{Id = connect_message_body_fill PARENT = net_popup_container tex = window_fill_body_large rgba = [0 0 0 255] pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center top] Z = 200 flip_h}
	displaySprite Id = connect_message_bottom PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center top] Z = 200 flip_h
	displaySprite \{Id = connect_message_bottom_fill PARENT = net_popup_container tex = window_fill_cap rgba = [0 0 0 255] pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center top] Z = 200 flip_h}
	createScreenElement {
		Type = textblockelement
		PARENT = net_popup_container
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		Text = "FAILED TO CONNECT TO GAME"
		pos = (640.0, 315.0)
		Dims = (375.0, 200.0)
		z_priority = 200.0
		just = [Center Center]
	}
	launchevent \{Type = focus Target = connection_dialog_vmenu}
endscript

script net_repeat_last_search 
	Wait \{1 GameFrame}
	ui_flow_manager_respond_to_action \{action = select_done}
endscript

script check_if_selecting_tie_breaker \{Player = 1}
	if isHost
		if (($tie_breaker = host) && (<Player> = 1))
			return \{selecting_tiebreaker = 1}
		endif
		if (($tie_breaker = CLIENT) && (<Player> = 2))
			return \{selecting_tiebreaker = 1}
		endif
	else
		if (($tie_breaker = host) && (<Player> = 2))
			return \{selecting_tiebreaker = 1}
		endif
		if (($tie_breaker = CLIENT) && (<Player> = 1))
			return \{selecting_tiebreaker = 1}
		endif
	endif
	return \{selecting_tiebreaker = 0}
endscript

script get_num_players_by_gamemode 
	if (($game_mode = p1_career) || ($game_mode = p1_quickplay))
		return \{num_players = 1}
	else
		return \{num_players = 2}
	endif
endscript

script connection_lost_end_song 
	Printf \{"connection_lost_end_song"}
	Change \{current_num_players = 2}
	if ($playing_song = 0)
		return
	endif
	if ($game_mode = p2_battle)
		Change \{StructureName = player1_status current_health = 1.0}
		Change \{StructureName = player2_status current_health = 0.0}
		GuitarEvent_SongWon \{battle_win = 1}
	else
		ExtendCrc \{song_won 'p1' out = Type}
		BroadCastEvent Type = <Type>
	endif
endscript

script test_events \{passed_in_value = 'test value'}
	Printf \{"test_events"}
	printStruct <...>
	NetSessionfunc \{Obj = stats func = write_key_value Params = {wtf_value = 'test value' key = 'test key'}}
endscript

script net_failed_signin 
	Printf \{"--- net_failed_signin"}
	if ($respond_to_signin_changed = 0)
		return
	endif
	if (($ui_flow_manager_state [0]) = online_signin_fs)
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script xbox360_live_not_allowed 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenelementExists \{Id = warning_message_container}
		DestroyScreenelement \{Id = warning_message_container}
	endif
	create_menu_backdrop \{texture = Online_Background}
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound Params = {Up}}
		{pad_down generic_menu_up_or_down_sound Params = {Down}}
		{pad_back online_signin_select_cancel}
	]
	Z = 100.0
	<Menu_pos> = (640.0, 465.0)
	<bookend_r_pos> = (710.0, 533.0)
	<bookend_l_pos> = (500.0, 533.0)
	new_menu scrollid = sign_in_scoller vmenuid = sign_in_vmenu use_backdrop = (0) Menu_pos = <Menu_pos> just = [Left top] event_handlers = <event_handlers> Spacing = -45
	createScreenElement \{Type = containerElement PARENT = root_window Id = signin_container pos = (0.0, 0.0)}
	Change \{menu_focus_color = [180 50 50 255]}
	Change \{menu_unfocus_color = [0 0 0 255]}
	create_pause_menu_frame \{PARENT = signin_container Z = 5}
	displaySprite \{PARENT = signin_container tex = Dialog_Title_BG Dims = (224.0, 224.0) Z = 9 pos = (640.0, 100.0) just = [Right top] flip_v}
	displaySprite \{PARENT = signin_container tex = Dialog_Title_BG Dims = (224.0, 224.0) Z = 9 pos = (640.0, 100.0) just = [Left top]}
	displaySprite \{PARENT = signin_container Id = options_bg_1 tex = Dialog_BG pos = (640.0, 500.0) Dims = (320.0, 64.0) Z = 9 just = [Center botom]}
	displaySprite \{PARENT = signin_container Id = options_bg_2 tex = Dialog_BG pos = (640.0, 530.0) Dims = (320.0, 64.0) Z = 9 just = [Center top] flip_h}
	createScreenElement \{Type = textElement PARENT = signin_container font = fontgrid_title_gh3 scale = 1.3 rgba = [223 223 223 250] Text = "WARNING" just = [Center top] z_priority = 10.0 pos = (640.0, 175.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}
	if isxenon
		<sign_in_text> = "The current Gamer Profile is not enabled for Xbox LIVE multiplayer game play."
	else
		if gotParam \{age_restricted}
			<sign_in_text> = "Online service is disabled on your PLAYSTATION®Network account due to parental control restrictions."
		else
			<sign_in_text> = "You must be signed in to enter the lobby."
		endif
	endif
	scale = 1
	StringLength String = <sign_in_text>
	Printf "len = %d" D = <str_len>
	if (<str_len> >= 135)
		<scale> = 0.8
	endif
	createScreenElement {
		Type = textblockelement
		PARENT = signin_container
		font = fontgrid_title_gh3
		scale = 0.6
		rgba = [210 210 210 250]
		Text = <sign_in_text>
		just = [Center top]
		internal_just = [Center top]
		internal_scale = <scale>
		z_priority = 10.0
		pos = (640.0, 310.0)
		Dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	createScreenElement \{Type = containerElement PARENT = sign_in_vmenu Dims = (0.0, 100.0) event_handlers = [{focus net_warning_focus}{unfocus net_warning_unfocus}{pad_choose ui_flow_manager_respond_to_action Params = {action = go_back}}]}
	container_id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <container_id>
		local_id = Text
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($menu_unfocus_color)
		Text = "CONTINUE"
		just = [Center top]
		z_priority = (<Z> + 5)
	}
	fit_text_into_menu_item Id = <Id> max_width = 240
	getScreenElementDims Id = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		just = [Right Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)))
		Alpha = 0.0
		z_priority = (<Z> + 6)
		scale = (1.0, 1.0)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		just = [Left Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)))
		Alpha = 0.0
		z_priority = (<Z> + 6)
		scale = (1.0, 1.0)
	}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	launchevent \{Type = focus Target = sign_in_vmenu}
endscript

script xenon_auto_load_progress 
	Printf \{"--- xenon_auto_load_progress"}
	if (($ui_flow_manager_state [0]) = online_signin_fs)
		if ($online_signin_autoload_required = 1)
			Change \{online_signin_autoload_required = 0}
			Change \{respond_to_signin_changed = 0}
			FadeToBlack \{On Time = 0 Alpha = 1.0 z_priority = 20000 Id = invite_screenfader}
			Wait \{1 GameFrame}
			StopRendering
			shutdown_game_for_signin_change \{signin_change = 1}
			launchevent \{Type = unfocus Target = root_window}
			StartRendering
			Wait \{1 GameFrame}
			FadeToBlack \{OFF Time = 0 Id = invite_screenfader}
			Wait \{1 GameFrame}
			Change invite_controller = ($primary_controller)
			start_flow_manager \{flow_state = bootup_press_any_button_fs}
		else
			ui_flow_manager_respond_to_action \{action = online_enabled}
		endif
	endif
endscript

script scale_element_to_size \{Time = 0}
	if NOT gotParam \{Id}
		Printf \{'Did not pass in id to scale_element_to_size! Returning'}
		return
	endif
	getScreenElementDims Id = <Id>
	orig_height = <Height>
	orig_width = <width>
	if NOT gotParam \{target_width}
		target_width = <orig_width>
	endif
	if NOT gotParam \{target_height}
		target_height = <orig_height>
	endif
	xScale = (<target_width> / (<orig_width> * 1.0))
	yScale = (<target_height> / (<orig_height> * 1.0))
	<Id> :doMorph scale = (<xScale> * (1.0, 0.0) + <yScale> * (0.0, 1.0)) Time = <Time>
endscript

script translate_screen_element \{Time = 0}
	if NOT gotParam \{Id}
		Printf \{'Did not pass in id to translate_screen_element! Returning'}
		return
	endif
	if NOT gotParam \{pos}
		GetScreenElementPosition Id = <Id>
		new_position = <ScreenELementPos>
	else
		new_position = <pos>
	endif
	<Id> :doMorph pos = <new_position> Time = <Time>
endscript

script get_my_highway_layout 
	Player = 1
	begin
	formatText Checksumname = player_status 'player%p_status' P = <Player>
	if ($<player_status>.is_local_client)
		return my_highway = ($<player_status>.highway_layout)
	endif
	<Player> = (<Player> + 1)
	repeat 2
endscript

script agora_update 
	if ($coop_dlc_active = 1)
		return
	endif
	get_game_mode_name
	get_current_band_info
	getglobaltags <band_info>
	band_id = <band_unique_id>
	formatText Textname = band_name '%s' S = <Name>
	if NOT gotParam \{new_band}
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		if (<game_mode_name> = p2_career)
			coop_difficulty = <difficulty_text_nl>
			get_diff_completion_percentage \{for_p2_career = 1}
		else
			career_difficulty = <difficulty_text_nl>
			get_diff_completion_percentage
		endif
		if ($game_mode = p2_career)
			coop_percent_complete_easy = (<diff_completion_percentage> [0])
			coop_score_overall_easy = (<diff_completion_score> [0])
			coop_percent_complete_medium = (<diff_completion_percentage> [1])
			coop_score_overall_medium = (<diff_completion_score> [1])
			coop_percent_complete_hard = (<diff_completion_percentage> [2])
			coop_score_overall_hard = (<diff_completion_score> [2])
			coop_percent_complete_expert = (<diff_completion_percentage> [3])
			coop_score_overall_expert = (<diff_completion_score> [3])
		else
			career_percent_complete_easy = (<diff_completion_percentage> [0])
			career_score_overall_easy = (<diff_completion_score> [0])
			career_percent_complete_medium = (<diff_completion_percentage> [1])
			career_score_overall_medium = (<diff_completion_score> [1])
			career_percent_complete_hard = (<diff_completion_percentage> [2])
			career_score_overall_hard = (<diff_completion_score> [2])
			career_percent_complete_expert = (<diff_completion_percentage> [3])
			career_score_overall_expert = (<diff_completion_score> [3])
		endif
	endif
	getglobaltags \{achievement_info}
	printStruct <...>
	castToInteger \{total_points_in_career_mode_easy}
	campaign_score_easy = <total_points_in_career_mode_easy>
	castToInteger \{total_points_in_career_mode_medium}
	campaign_score_medium = <total_points_in_career_mode_medium>
	castToInteger \{total_points_in_career_mode_hard}
	campaign_score_hard = <total_points_in_career_mode_hard>
	castToInteger \{total_points_in_career_mode_expert}
	campaign_score_expert = <total_points_in_career_mode_expert>
	campaign_score_overall = (<total_points_in_career_mode_expert> + <total_points_in_career_mode_hard> + <total_points_in_career_mode_medium> + <total_points_in_career_mode_easy>)
	ACHIEVEMENTS = 'what achievements?'
	purchases = 'test purchases'
	WriteUpdate <...>
endscript

script agora_write_stats 
	Printf \{"agora_write_stats %s" S = $game_mode}
	if ($coop_dlc_active = 1)
		QUICKPLAY = 1
	endif
	if ($game_mode = p1_quickplay)
		QUICKPLAY = 1
	endif
	if ($boss_battle = 1)
		return
	endif
	player_id = ($player1_status.controller)
	get_num_players_by_gamemode
	getglobaltags \{user_options param = lefty_flip_p1}
	get_current_band_info
	getglobaltags <band_info>
	band_id = <band_unique_id>
	if ($is_network_game)
		if (NetSessionfunc Obj = match func = get_gamertag)
			formatText Textname = gamertag1 '%s' S = <Name>
		endif
		formatText Textname = gamertag2 '%s' S = ($opponent_gamertag)
		p1_name = <gamertag1>
		p2_name = <gamertag2>
		retrieve_player_net_id \{Player = 2}
		player_id2 = <net_id>
	else
		player_id2 = ($player2_status.controller)
		if ($coop_dlc_active = 0)
			if (($game_mode = p1_career) || ($game_mode = p2_career))
				menu_ebn_get_band_name_text
				StringRemoveTrailingWhitespace String = <band_name_text_string>
				formatText Textname = band_text '%s' S = <band_name_text_string>
				<p1_name> = <band_text>
				<p2_name> = <band_text>
			else
			endif
		endif
	endif
	Venue = (($levelzones.$current_level).Name)
	get_game_mode_name
	switch <game_mode_name>
		case 'p2_battle'
		mode = 'battle'
		case 'p2_faceoff'
		mode = 'face_off'
		case 'p2_pro_faceoff'
		mode = 'pro_face_off'
		case 'p2_career'
		if ($coop_dlc_active = 1)
			mode = 'quickplay_coop'
		else
			mode = 'local_coop'
		endif
		case 'p2_coop'
		mode = 'online_coop'
	endswitch
	get_song_prefix Song = ($current_song)
	title = <song_prefix>
	if ($player1_status.part = GUITAR)
		part = 'guitar'
		elseif ($player1_status.part = BASS)
		part = 'bass'
	else
		part = 'rhythm'
	endif
	get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	DIFFICULTY = <difficulty_text_nl>
	score = ($player1_status.score)
	castToInteger \{score}
	STARS = ($player1_status.STARS)
	NOTES_HIT = ($player1_status.NOTES_HIT)
	notes_missed = (($player1_status.total_notes) - ($player1_status.NOTES_HIT))
	best_streak = ($player1_status.best_run)
	star_power_achieved = ($player1_status.sp_phrases_hit)
	star_power_available = ($player1_status.sp_phrases_total)
	if (<lefty_flip_p1>)
		Lefty = TRUE
	else
		Lefty = FALSE
	endif
	get_character_name \{Player = 1}
	p1_character_name = <character_name>
	get_character_outfit_name \{Player = 1}
	outfit = <outfit_name>
	character_color = ($player1_status.style)
	get_player_instrument_desc_name \{Player = 1}
	GUITAR = <instrument_name>
	skin = <instrument_name>
	if (<num_players> = 2)
		if ($player1_status.score > $player2_status.score)
			winner = 'participant_1'
		else
			winner = 'participant_2'
		endif
		if ($player2_status.part = GUITAR)
			part2 = 'guitar'
			elseif ($player2_status.part = BASS)
			part2 = 'bass'
		else
			part2 = 'rhythm'
		endif
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty2)
		difficulty2 = <difficulty_text_nl>
		score2 = ($player2_status.score)
		castToInteger \{score2}
		stars2 = ($player2_status.STARS)
		notes_hit2 = ($player2_status.NOTES_HIT)
		notes_missed2 = (($player2_status.total_notes) - ($player2_status.NOTES_HIT))
		best_streak2 = ($player2_status.best_run)
		star_power_received2 = ($player2_status.sp_phrases_hit)
		if ($player2_status.lefthanded_button_ups = 1)
			lefty2 = TRUE
		else
			lefty2 = FALSE
		endif
		get_character_name \{Player = 2}
		character_name2 = <character_name>
		get_character_outfit_name \{Player = 2}
		outfit2 = <outfit_name>
		character_color2 = ($player2_status.style)
		get_player_instrument_desc_name \{Player = 2}
		guitar2 = <instrument_name>
		skin2 = <instrument_name>
		character_name = <p1_character_name>
		WriteMultiPerformance <...>
	else
		winner = <p1_name>
		WritePerformance <...>
	endif
endscript

script WritePerformance \{band_id = default_band_id Venue = 'test venue' mode = 'test mode' submode = 'test submode' cheats = 'all cheats' title = 'killing me softly' DIFFICULTY = 'test' speed = 'test' star_power_available = 0 player_id = 0 part = 'guitar' score = 1 STARS = 0 NOTES_HIT = 2 notes_missed = 0 best_streak = 5 star_power_achieved = 1 Lefty = TRUE character_name = 'test' character_color = 1 GUITAR = 'test' skin = 'test' outfit = 'test'}
	if ($Cheat_AirGuitar = 1)
		air_guitar_active = air_guitar_active
	endif
	if ($Cheat_PerformanceMode = 1)
		performance_mode = performance_mode
	endif
	if ($Cheat_hyperspeed > 0)
		hyper_speed = hyper_speed
	endif
	if ($Cheat_NoFail = 1)
		no_fail = no_fail
	endif
	if ($Cheat_EasyExpert = 1)
		easy_expert = easy_expert
	endif
	if ($Cheat_PrecisionMode = 1)
		precision_mode = precision_mode
	endif
	if ($Cheat_BretMichaels = 1)
		bret_michaels = bret_michaels
	endif
	Printf \{"WritePerformance"}
	NetSessionfunc Obj = stats func = write_performance Params = {<...>}
endscript

script WriteMultiPerformance \{winner = 'participant_1' Venue = 'test venue' mode = 'test mode' cheats = 'all cheats' title = 'killing me softly' DIFFICULTY = 'test' speed = 'test' star_power_available = 0 player_id = 0 part = 'guitar' score = 1 STARS = 0 NOTES_HIT = 2 notes_missed = 0 best_streak = 5 star_power_achieved = 0 Lefty = TRUE character_name = 'test' character_color = 1 GUITAR = 'test' skin = 'test' outfit = 'test' player_id2 = 1 part2 = 'bass' score2 = 1 stars2 = 0 notes_hit2 = 2 notes_missed2 = 0 best_streak2 = 5 star_power_achieved2 = 1 lefty2 = TRUE character_name2 = 'test' character_color2 = 'test' guitar2 = 'test' skin2 = 'test' outfit2 = 'test'}
	NetSessionfunc Obj = stats func = write_multi_match Params = {<...>}
endscript

script WriteUpdate \{band_id = 0 band_name = 'test name' Cash = 100 campaign_score_easy = 0 campaign_score_medium = 0 campaign_score_hard = 0 campaign_score_expert = 0 campaign_score_overall = 0 ACHIEVEMENTS = 'temp achievement string'}
	NetSessionfunc Obj = stats func = write_update Params = {<...>}
endscript

script invite_accepted 
	if ($primary_controller_assigned = 0)
		Change invite_controller = <controllerid>
		return
		elseif ($primary_controller != <controllerid>)
		Change invite_controller = <controllerid>
	endif
	if ((($is_network_game = 0) && ($playing_song)) &&
			(($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_career)))
		if (GameIsPaused)
			destroy_pause_menu
		endif
		create_popup_warning_menu {
			textblock = {
				Text = "Are you sure you want to leave this game session?"
				pos = (640.0, 380.0)
			}
			player_device = <controllerid>
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = accepted_invite_agree
					Text = "YES"
				}
				{
					func = accepted_invite_disagree
					Text = "NO"
				}
			]
			no_background
		}
	else
		do_join_invite_stuff <...> accepted_invite
	endif
endscript

script accepted_invite_agree 
	if (GameIsPaused)
		unpausegh3
	endif
	do_join_invite_stuff <...> accepted_invite
endscript

script accepted_invite_disagree 
	destroy_popup_warning_menu
	if (GameIsPaused)
		create_pause_menu
	else
		pausegh3
	endif
endscript

script send_fail_song_message \{wait_frames = 30 quit_early = 0}
	if (isHost)
		loser = 0
	else
		loser = 1
	endif
	SendNetMessage {
		Type = fail_song
		STARS = ($player1_status.STARS)
		note_streak = ($player1_status.best_run)
		NOTES_HIT = ($player1_status.NOTES_HIT)
		total_notes = ($player1_status.total_notes)
		quit_early_flag = <quit_early>
		loser = <loser>
	}
	Wait <wait_frames> gameframes
endscript

script do_join_invite_stuff 
	Printf \{"--- do_join_invite_stuff"}
	if gotParam \{accepted_invite}
		Printf \{"accepted invite"}
		Change \{online_signin_autoload_required = 0}
		wait_for_safe_shutdown
		Printf \{"do_join_invite_stuff started"}
		disable_pause
		if ($primary_controller_assigned = 1 && $primary_controller != $invite_controller && $invite_controller != -1)
			FadeToBlack \{On Time = 0 Alpha = 1.0 z_priority = 20000 Id = invite_screenfader}
			Wait \{1 GameFrame}
			StopRendering
			shutdown_game_for_signin_change \{signin_change = 1}
			launchevent \{Type = unfocus Target = root_window}
			StartRendering
			Wait \{1 GameFrame}
			FadeToBlack \{OFF Time = 0 Id = invite_screenfader}
			Wait \{1 GameFrame}
			start_flow_manager \{flow_state = bootup_press_any_button_fs}
		else
			StopRendering
			shutdown_game_for_signin_change \{unloadcontent = 0}
			Change \{invite_controller = -1}
			launchevent \{Type = unfocus Target = root_window}
			online_menu_init
			start_flow_manager \{flow_state = invite_joining_game_fs}
			StartRendering
			if NOT ($primary_controller = $player1_status.controller)
				Change StructureName = player1_status controller = ($primary_controller)
				getglobaltags \{user_options}
				Change StructureName = player1_status lefthanded_gems = <lefty_flip_p2>
				Change StructureName = player1_status lefthanded_button_ups = <lefty_flip_p2>
			endif
			JoinInviteServer
		endif
	else
		Printf \{"didn't get an invite"}
		if (($ui_flow_manager_state [0]) = online_signin_fs)
			ui_flow_manager_respond_to_action \{action = online_enabled}
		endif
	endif
endscript

script ui_print_gamertags \{pos1 = (235.0, 100.0) pos2 = (1045.0, 100.0) just1 = [Left top] just2 = [Right top] offscreen = 0}
	if (NetSessionfunc Obj = match func = get_gamertag)
		ui_print_gamertag Name = <Name> start_pos = <pos1> Color = ($player1_color) Player = 1 just = <just1> Dims = <Dims> offscreen = <offscreen>
	endif
	ui_print_gamertag Name = ($opponent_gamertag) start_pos = <pos2> Color = ($player2_color) Player = 2 just = <just2> Dims = <Dims> offscreen = <offscreen>
endscript

script ui_print_gamertag start_pos = (235.0, 100.0) Color = ($player1_color) Player = 1 Dims = (450.0, 35.0) Z = 60 offscreen = 0
	if NOT gotParam \{Name}
		get_character_name Player = <Player>
		Name = <display_name>
	endif
	if NOT ScreenelementExists \{Id = gamertag_container}
		if (<offscreen> = 1)
			createScreenElement {
				Type = containerElement
				Id = gamertag_container
				PARENT = root_window
				pos = (0.0, -400.0)
				just = [Center Center]
				z_priority = <Z>
			}
		else
			createScreenElement {
				Type = containerElement
				Id = gamertag_container
				PARENT = root_window
				pos = (0.0, 0.0)
				just = [Center Center]
				z_priority = <Z>
			}
		endif
	endif
	formatText Checksumname = gamertag_text_px 'gamertag_text_p%d' D = <Player>
	formatText Checksumname = debug_gamertag_container_px 'debug_gamertag_container_p%d' D = <Player>
	formatText Checksumname = gt_frame_top 'gt_frame_top_p%d' D = <Player>
	formatText Checksumname = gt_frame_top_fill 'gt_frame_top_fill_p%d' D = <Player>
	formatText Checksumname = gt_frame_bottom 'gt_frame_bottom_p%d' D = <Player>
	formatText Checksumname = gt_frame_bottom_fill 'gt_frame_bottom_fill_p%d' D = <Player>
	if (ScreenelementExists Id = <gamertag_text_px>)
		if ScreenelementExists \{Id = gamertag_icon_container}
			setScreenElementProps \{Id = gamertag_icon_container Alpha = 1}
		endif
		return
	endif
	createScreenElement {
		Type = textElement
		PARENT = gamertag_container
		font = fontgrid_title_gh3
		rgba = <Color>
		Text = <Name>
		Id = <gamertag_text_px>
		pos = (<start_pos> + (0.0, 3.0))
		just = <just>
		scale = 0.75
		z_priority = (<Z> + 1)
	}
	getScreenElementDims Id = <gamertag_text_px>
	x_dim = ((<Dims>.(1.0, 0.0)) * 0.5625)
	y_dim = (<Dims>.(0.0, 1.0) * 0.75)
	x_scale = 1.0
	y_scale = 1.0
	if (<width> > <x_dim>)
		<x_scale> = (<x_dim> / <width>)
	endif
	if (<Height> > <y_dim>)
		<y_scale> = (<y_dim> / <Height>)
	endif
	scale_pair = ((1.0, 0.0) * <x_scale> + (0.0, 1.0) * <y_scale>)
	setScreenElementProps {Id = <gamertag_text_px> scale = <scale_pair>}
	displaySprite {
		Id = <gt_frame_top>
		PARENT = gamertag_container
		tex = window_frame_cap
		rgba = ($online_medium_blue)
		pos = <start_pos>
		just = <just>
		Z = <Z>
	}
	displaySprite {
		Id = <gt_frame_top_fill>
		PARENT = gamertag_container
		tex = window_fill_cap
		rgba = ($online_trans_grey)
		pos = <start_pos>
		just = <just>
		Z = <Z>
	}
	getScreenElementDims Id = <gamertag_text_px>
	text_w = (<width> + 80)
	text_h = (<Dims>.(0.0, 1.0) + 10)
	getScreenElementDims Id = <gt_frame_top>
	frame_w = (<width> / 1.0)
	frame_h = (<Height> / 1.0)
	frame_scale_x = (<text_w> / <frame_w>)
	frame_scale_y = (<text_h> / <frame_h>)
	frame_scale = ((<frame_scale_x> * (1.0, 0.0)) + (<frame_scale_y> * (0.0, 0.5625)))
	setScreenElementProps {Id = <gt_frame_top> scale = <frame_scale>}
	setScreenElementProps {Id = <gt_frame_top_fill> scale = <frame_scale>}
	x_adjust = (0.0, 0.0)
	y_adjust = (0.0, 0.0)
	y_adjust = ((0.0, 1.0) * ((-5 * <y_scale>) -5))
	if ((<just> [0]) = Right)
		x_adjust = ((1.0, 0.0) * 40)
		elseif ((<just> [0]) = Left)
		x_adjust = ((1.0, 0.0) * -40)
	endif
	new_pos = (<start_pos> + (<x_adjust> + <y_adjust>))
	setScreenElementProps {Id = <gt_frame_top> pos = <new_pos>}
	setScreenElementProps {Id = <gt_frame_top_fill> pos = <new_pos>}
	getScreenElementProps Id = <gt_frame_top>
	getScreenElementDims Id = <gt_frame_top>
	displaySprite {
		Id = <gt_frame_bottom>
		PARENT = gamertag_container
		tex = window_frame_cap
		rgba = ($online_medium_blue)
		pos = (<pos> + (<Height> * (0.0, 1.0)))
		just = <just>
		scale = <scale>
		Z = (<Z> + 5)
		flip_h
	}
	displaySprite {
		Id = <gt_frame_bottom_fill>
		PARENT = gamertag_container
		tex = window_fill_cap
		rgba = ($online_trans_grey)
		pos = (<pos> + (<Height> * (0.0, 1.0)))
		just = <just>
		scale = <scale>
		Z = <Z>
		flip_h
	}
	getplatform
endscript

script destroy_gamertags 
	if ScreenelementExists \{Id = gamertag_container}
		DestroyScreenelement \{Id = gamertag_container}
	endif
	if ScreenelementExists \{Id = gamertag_container_p1}
		DestroyScreenelement \{Id = gamertag_container_p1}
	endif
	if ScreenelementExists \{Id = gamertag_container_p2}
		DestroyScreenelement \{Id = gamertag_container_p2}
	endif
	if ScreenelementExists \{Id = debug_gamertag_container_p1}
		DestroyScreenelement \{Id = debug_gamertag_container_p1}
	endif
	if ScreenelementExists \{Id = debug_gamertag_container_p2}
		DestroyScreenelement \{Id = debug_gamertag_container_p2}
	endif
endscript

script destroy_gamertag_container \{Player = 1}
	formatText Checksumname = gamertag_container 'gamertag_container_p%d' D = <Player>
	if ScreenelementExists Id = <gamertag_container>
		DestroyScreenelement Id = <gamertag_container>
	endif
endscript

script morph_gamertags 
	if ScreenelementExists \{Id = gamertag_container}
		move_gamertag_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_gamertag_pos) + (<delta> * ((($g_hud_2d_struct_used).final_gamertag_pos) + <off_set>)))
		DoScreenElementMorph Id = gamertag_container pos = <move_gamertag_pos> Time = <time_to_move>
		if ScreenelementExists \{Id = gamertag_icon_container}
			setScreenElementProps \{Id = gamertag_icon_container Alpha = 0}
		endif
	endif
endscript
net_star_power_pending = 0

script coop_attempt_star_power 
	if ($net_star_power_pending)
		return
	endif
	Change \{net_star_power_pending = 1}
	SendNetMessage \{Type = coop_star_power_notify}
	Wait \{30 frames}
	Change \{net_star_power_pending = 0}
endscript

script test_write_leaderboards 
	Printf \{"test_write_leaderboards"}
	begin_singleplayer_game
	Wait \{0.3 Seconds IgnoreSlomo}
	if NOT should_update_stats_leader_board
		return
	endif
	NetSessionfunc Obj = stats func = write_stats Params = {leaderboard_Id = anarchy_in_the_uk score = 10000 rating = <rating_val>}
endscript

script test_read_leaderboards 
	NetSessionfunc \{Obj = stats func = get_stats Params = {leaderboard_Id = m_test_gh3 callback = test_callback num_rows = 10 listType = rating rating_val = 5 columns = 0}}
endscript

script menu_show_gamercard 
	if NOT (($is_network_game) && (isxenon))
		return
	endif
	retrieve_player_net_id \{Player = 2}
	NetSessionfunc func = ShowGamerCard Params = {player_xuid = <net_id>}
endscript

script menu_show_gamercard_from_netid 
	if NOT ($is_network_game = 1)
		return
	endif
	if gotParam \{net_id}
		NetSessionfunc func = ShowGamerCard Params = {player_xuid = <net_id>}
	endif
endscript

script new_net_logic_init 
	Change boss_controller = ($player2_status.controller)
	Change \{boss_pattern = 0}
	Change \{boss_strum = 0}
	Change \{boss_lastwhammytime = 0}
	Change \{boss_lastbrokenstringtime = 0}
	Change \{boss_hammer_count = 0}
endscript

script new_net_logic_deinit 
	if ($is_network_game)
		Change StructureName = player2_status controller = ($boss_oldcontroller)
		Change \{boss_pattern = 0}
		Change \{boss_strum = 0}
		Change \{boss_lastwhammytime = 0}
		Change \{boss_lastbrokenstringtime = 0}
		Change \{boss_hammer_count = 0}
	endif
endscript

script win_now 
	ExtendCrc \{song_won 'p1' out = Type}
	BroadCastEvent Type = <Type>
endscript
new_message_of_the_day = 0

script splash_callback 
	Printf \{"splash_callback"}
	printStruct <...>
	if gotParam \{motd_text}
		Change \{new_message_of_the_day = 1}
	else
		Change \{new_message_of_the_day = 0}
	endif
endscript

script test_send 
	test1 = 'does this get sent?'
	test2 = DoesThisGetSent
	Test3 = DoesThisGetSent2
	printStruct <...>
	SendStructure callback = test_callback data_to_send = <...>
endscript

script test_callback 
	Printf \{"test_callback"}
	printStruct <...>
endscript

script cleanup_online_lobby_select 
	shut_down_character_hub
	destroy_pause_menu_frame \{container_id = net_quit_warning}
	if ScreenelementExists \{Id = ready_container_p1}
		DestroyScreenelement \{Id = ready_container_p1}
	endif
	if ScreenelementExists \{Id = ready_container_p2}
		DestroyScreenelement \{Id = ready_container_p2}
	endif
	destroy_pause_menu_frame
	if ScreenelementExists \{Id = warning_message_container}
		DestroyScreenelement \{Id = warning_message_container}
	endif
	if ScreenelementExists \{Id = leaving_lobby_dialog_menu}
		DestroyScreenelement \{Id = leaving_lobby_dialog_menu}
	endif
	destroy_gamertags
	shut_down_flow_manager \{Player = 2}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_character_hub_p1}
	destroy_menu \{menu_id = character_hub_p1_container}
	destroy_menu \{menu_id = scrolling_character_hub_p2}
	destroy_menu \{menu_id = character_hub_p2_container}
	killcamanim \{Name = gs_view_cam}
	<Player> = 1
	begin
	formatText Checksumname = scrolling_select_outfit 'scrolling_select_outfit_p%i' I = <Player>
	formatText Checksumname = s_container 's_container_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_outfit>
	destroy_menu menu_id = <s_container>
	<Player> = (<Player> + 1)
	repeat 2
	<Player> = 1
	begin
	formatText Checksumname = scrolling_select_style 'scrolling_select_style_p%i' I = <Player>
	formatText Checksumname = s_container 's_container_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_style>
	destroy_menu menu_id = <s_container>
	<Player> = (<Player> + 1)
	repeat 2
	destroy_menu \{menu_id = scrolling_select_guitar_p1}
	destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = select_finish_container}
	destroy_menu \{menu_id = scrolling_select_guitar_p2}
	destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
	destroy_menu \{menu_id = select_guitar_container_p2}
	destroy_menu \{menu_id = select_finish_container_p2}
	<Player> = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	<band_Member> = ($<player_status>.band_Member)
	if compositeObjectexists Name = <band_Member>
		if <band_Member> :Anim_AnimNodeExists Id = BodyTimer
			<band_Member> :Anim_Command Target = BodyTimer Command = Timer_SetSpeed Params = {speed = 1.0}
		endif
	endif
	<Player> = (<Player> + 1)
	repeat 2
	<Player> = 1
	begin
	formatText Checksumname = scrolling_select_finish 'scrolling_select_finish_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_finish>
	<Player> = (<Player> + 1)
	repeat 2
	ui_flow_manager_respond_to_action \{action = Continue}
endscript
gSavedElementInFocus = 0

script create_link_unplugged_dialog 
	Pausegame
	SaveAndClearFocus
	if (gotParam reason)
		if ($winport_is_in_online_menu_system = 1)
			Text = "Your username has been used to login elsewhere. Your network connection is being disconnected. Returning to the main menu."
		else
			Text = "Your username has been used to login elsewhere. Your network connection is being disconnected."
		endif
	else
		if ($winport_is_in_online_menu_system = 1)
			Text = "Your network connection has been disconnected. Returning to the main menu."
		else
			Text = "Your network connection has been disconnected."
		endif
	endif
	Z = 999
	createScreenElement {
		Type = containerElement
		PARENT = root_window
		Id = connectionLostContainer
		pos = (0.0, 0.0)
		z_priority = <Z>
	}
	createScreenElement {
		Type = VScrollingMenu
		PARENT = connectionLostContainer
		just = [Center top]
		Dims = (500.0, 150.0)
		pos = (640.0, 465.0)
		z_priority = <Z>
	}
	menu_id = <Id>
	createScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = connectionLostMenu
		pos = (298.0, 0.0)
		just = [Center top]
		internal_just = [Center top]
		Dims = (500.0, 150.0)
		z_priority = <Z>
		event_handlers = [
			{pad_choose connection_lost_resume_play}
		]
	}
	create_pause_menu_frame PARENT = connectionLostContainer container_id = connectionLostFrame Z = (<Z> -10)
	displaySprite PARENT = connectionLostContainer tex = Dialog_Title_BG Dims = (224.0, 224.0) pos = (640.0, 100.0) just = [Right top] flip_v Z = (<Z> -5)
	displaySprite PARENT = connectionLostContainer tex = Dialog_Title_BG Dims = (224.0, 224.0) pos = (640.0, 100.0) just = [Left top] Z = (<Z> -5)
	createScreenElement {
		Type = textElement
		PARENT = connectionLostContainer
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [223 223 223 250]
		Text = "DISCONNECTED"
		just = [Center top]
		z_priority = <Z>
		pos = (640.0, 188.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createScreenElement {
		Type = textblockelement
		PARENT = connectionLostContainer
		Id = statusMessage
		Text = <Text>
		font = text_a4
		scale = 0.8
		rgba = [210 210 210 250]
		just = [Center top]
		internal_just = [Center top]
		internal_scale = 1.0
		z_priority = <Z>
		pos = (640.0, 300.0)
		Dims = (800.0, 420.0)
		line_spacing = 1.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 420
	displaySprite PARENT = connectionLostContainer Id = options_bg_1 tex = Dialog_BG pos = (640.0, 500.0) Dims = (320.0, 64.0) Z = (<Z> + 0.1) just = [Center botom]
	displaySprite PARENT = connectionLostContainer Id = options_bg_2 tex = Dialog_BG pos = (640.0, 530.0) Dims = (320.0, 64.0) Z = (<Z> + 0.1) just = [Center top] flip_h
	createScreenElement \{Type = containerElement PARENT = connectionLostMenu Dims = (100.0, 50.0) event_handlers = [{focus net_warning_focus}{unfocus net_warning_unfocus}{pad_choose connection_lost_resume_play}]}
	container_id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <container_id>
		local_id = text_continue
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [180 50 50 255]
		Text = "CONTINUE"
		just = [Center top]
		z_priority = (<Z> + 0.9)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_into_menu_item Id = <Id> max_width = 200
	getScreenElementDims Id = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		just = [Right Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<Z> + 20.0)
		scale = (1.0, 1.0)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		just = [Left Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<Z> + 20.0)
		scale = (1.0, 1.0)
	}
	launchevent \{Type = focus Target = connectionLostMenu}
endscript

script connection_lost_resume_play 
	Printf \{"---connection_lost_resume_play"}
	DestroyScreenelement \{Id = connectionLostContainer}
	RestoreFocus
	unpauseGame
	Change \{g_connection_loss_dialogue = 0}
	if ($winport_is_in_online_menu_system = 1)
		shut_down_flow_manager
		start_flow_manager \{flow_state = main_menu_fs}
	endif
endscript

script RemoveObserverBG 
endscript

script coop_fail_song 
	if ($ui_flow_manager_state [0] = online_pause_fs)
		net_unpausegh3
	endif
	disable_pause
	if (<quit_early>)
		Change \{player2_present = 0}
		formatText Textname = notification_text "%n\\n has quit" N = ($opponent_gamertag)
		create_net_popup popup_text = <notification_text>
		Wait \{3 Seconds}
		destroy_net_popup
	endif
	Change StructureName = <player_status> STARS = <STARS>
	Change StructureName = <player_status> best_run = <note_streak>
	Change StructureName = <player_status> total_notes = <total_notes>
	Change StructureName = <player_status> NOTES_HIT = <NOTES_HIT>
	player_Text = (<player_status>.Text)
	killspawnedScript \{Name = GuitarEvent_SongWon_Spawned}
	SpawnScriptNOw \{GuitarEvent_SongFailed_Spawned}
endscript

script add_searching_menu_item \{Z = 2.1}
	if gotParam \{vmenu_id}
		createScreenElement {
			Type = containerElement
			PARENT = <vmenu_id>
			Dims = (210.0, 35.0)
			pos = (0.0, 0.0)
			just = [Center top]
			internal_just = [Center top]
		}
		<container_element> = <Id>
		<Id> :SetProps {
			event_handlers = [
				{focus searching_menu_focus Params = {PARENT = <Id>}}
				{unfocus searching_menu_unfocus Params = {PARENT = <Id>}}
				{pad_choose <choose_script>}
			]
		}
		createScreenElement {
			Type = textElement
			PARENT = <container_element>
			local_id = text_string
			font = fontgrid_title_gh3
			scale = 0.65000004
			rgba = ($online_light_blue)
			Text = <Text>
			just = [Center top]
			pos = (105.0, 0.0)
			z_priority = <Z>
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = Highlight_Bar
			texture = White
			Dims = (250.0, 35.0)
			rgba = ($online_light_blue)
			pos = (105.0, -3.0)
			just = [Center top]
			z_priority = <Z>
			Alpha = 0.0
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = left_bookend
			texture = character_hub_hilite_bookend
			Dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			pos = (-20.0, -3.0)
			just = [Center top]
			z_priority = <Z>
			Alpha = 0.0
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = right_bookend
			texture = character_hub_hilite_bookend
			Dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			pos = (240.0, -3.0)
			just = [Center top]
			z_priority = <Z>
			Alpha = 0.0
		}
	endif
endscript

script start_final_song 
	Change current_song = ($net_setlist_songs [($net_song_num)])
	Spawnscriptlater \{load_and_sync_timing Params = {start_delay = 3000 player_status = player1_status}}
endscript

script server_disconnection_cleanup 
	Printf \{"---server_disconnection_cleanup"}
	determine_if_game_over
	Change \{player2_present = 0}
	if ($ui_flow_manager_state [0] = online_loading_fs)
		elseif ($playing_song = 0)
		if (($ui_flow_manager_state [0] = online_win_song_fs) || ($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_match_stats_fs))
			if NOT ScreenelementExists \{net_popup_container}
				get_number_of_songs
				if NOT (<game_over>)
					create_connection_lost_dialog \{player_quit}
				endif
			endif
		else
			create_connection_lost_dialog \{player_quit}
		endif
	endif
endscript

script searching_menu_focus 
	Obj_Getid
	if ScreenelementExists Id = {<objId> child = text_string}
		DoScreenElementMorph Id = {<objId> child = text_string} rgba = ($online_dark_purple)
	endif
	if ScreenelementExists Id = {<objId> child = Highlight_Bar}
		DoScreenElementMorph Id = {<objId> child = Highlight_Bar} Alpha = 1.0
	endif
	if ScreenelementExists Id = {<objId> child = left_bookend}
		DoScreenElementMorph Id = {<objId> child = left_bookend} Alpha = 1.0
	endif
	if ScreenelementExists Id = {<objId> child = right_bookend}
		DoScreenElementMorph Id = {<objId> child = right_bookend} Alpha = 1.0
	endif
endscript

script searching_menu_unfocus 
	Obj_Getid
	if ScreenelementExists Id = {<objId> child = text_string}
		DoScreenElementMorph Id = {<objId> child = text_string} rgba = ($online_light_blue)
	endif
	if ScreenelementExists Id = {<objId> child = Highlight_Bar}
		DoScreenElementMorph Id = {<objId> child = Highlight_Bar} Alpha = 0.0
	endif
	if ScreenelementExists Id = {<objId> child = left_bookend}
		DoScreenElementMorph Id = {<objId> child = left_bookend} Alpha = 0.0
	endif
	if ScreenelementExists Id = {<objId> child = right_bookend}
		DoScreenElementMorph Id = {<objId> child = right_bookend} Alpha = 0.0
	endif
endscript

script set_other_player_present 
	Printf \{"set_other_player_present"}
	if NOT ($player2_present)
		Change \{player2_present = 1}
		SpawnScriptNOw \{net_hub_stream}
	endif
	if ScreenelementExists \{Id = character_hub_p1_continue}
		character_hub_p1_continue :SetProps \{rgba = [180 100 60 255] unblock_events}
	endif
	ui_print_gamertag Name = ($opponent_gamertag) start_pos = (1045.0, 50.0) Color = ($player2_color) Player = 2 just = [Right top] Dims = (450.0, 35.0)
endscript

script test_multi_leaderboards 
	Player_list = [
		{
			LEADERBOARDS = [
				{
					write_type = MAX
					leaderboard_Id = anarchyintheuk
					rating = 4
					score = 100
					columns = [
						{
							score = 100
						}
						{
							score = 200
						}
						{
							score = 300
						}
					]
				}
				{
					write_type = MAX
					leaderboard_Id = avalancha
					rating = 3
					score = 100
					columns = [
						{
							score = 100
						}
						{
							score = 200
						}
						{
							score = 300
						}
					]
				}
			]
		}
	]
	NetSessionfunc Obj = stats func = stats_write_multiplayer Params = {DontEndSessionAfterWrite <...>}
endscript

script retrieve_player_net_id 
	net_id = [0 0]
	if gotParam \{Player}
		formatText Checksumname = player_status 'player%i_status' I = <Player>
		setarrayelement Arrayname = net_id Index = 0 NewValue = ($<player_status>.net_id_first)
		setarrayelement Arrayname = net_id Index = 1 NewValue = ($<player_status>.net_id_second)
	else
		setarrayelement Arrayname = net_id Index = 0 NewValue = ($player1_status.net_id_first)
		setarrayelement Arrayname = net_id Index = 1 NewValue = ($player1_status.net_id_second)
	endif
	Printf \{"retrieve_player_net_id"}
	printStruct <...>
	return net_id = <net_id>
endscript

script host_handle_dropped_client 
	Printf \{"---host_handle_dropped_client"}
	determine_if_game_over
	Change \{player2_present = 0}
	killspawnedScript \{Name = net_hub_stream}
	EndGameNetScriptPump
	if ($ui_flow_manager_state [0] = online_character_select_fs)
		drop_client_from_character_select
		net_lobby_state_message \{current_state = character_hub action = request request_state = leaving_lobby}
		ResetLobbyReady
		elseif ($ui_flow_manager_state [0] = online_loading_fs)
		elseif (($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_win_song_fs) || ($ui_flow_manager_state [0] = online_match_stats_fs))
		if NOT ScreenelementExists \{net_popup_container}
			get_number_of_songs
			if NOT (<game_over>)
				create_connection_lost_dialog \{player_quit}
			endif
		endif
	else
		if ($game_mode = p2_coop)
			Change \{StructureName = player1_status part = GUITAR}
			Change \{StructureName = player2_status part = GUITAR}
			create_guitarist \{Name = GUITARIST useOldPos no_strum animpak = 0}
			create_guitarist \{Name = BASSIST useOldPos no_strum animpak = 0}
		endif
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = leaving_lobby
		}
		Wait \{2 Frame}
		if ($playing_song = 0)
			destroy_gamertags
			if (NetSessionfunc Obj = match func = get_gamertag)
				ui_print_gamertag Name = <Name> start_pos = (235.0, 50.0) Color = ($player1_color) Player = 1 just = [Left top] Dims = (450.0, 35.0)
			endif
		endif
		ResetLobbyReady
		Change \{net_can_send_approval = 1}
		ui_flow_manager_respond_to_action \{action = handle_dropped_client}
	endif
	if ($playing_song = 0)
		if compositeObjectexists \{Name = BASSIST}
			BASSIST :Hide
		endif
	endif
endscript

script drop_client_from_character_select 
	destroy_gamertags
	if (NetSessionfunc Obj = match func = get_gamertag)
		ui_print_gamertag Name = <Name> start_pos = (235.0, 50.0) Color = ($player1_color) Player = 1 just = [Left top] Dims = (450.0, 35.0)
	endif
	killspawnedScript \{Name = cs_rotate_hilites_p2}
	Change \{g_cs_scroll_ready_p2 = 1}
	Change \{g_cs_choose_ready_p2 = 0}
	destroy_menu \{menu_id = char_select_character_container_p2}
	destroy_menu \{menu_id = char_select_container_p2}
	destroy_menu \{menu_id = char_select_hilite_container_p2}
	destroy_menu \{menu_id = scrolling_character_select_p2}
	Change \{player2_present = 0}
	Change \{opponent_gamertag = NULL}
	destroy_menu \{menu_id = ready_container_p2}
	if compositeObjectexists \{Name = BASSIST}
		BASSIST :Hide
	endif
endscript

script host_wait_for_client 
	if NOT (isHost)
		return
	endif
	create_net_popup \{popup_text = "Waiting for other player to join" add_waiting_dots pos = (640.0, 275.0)}
	begin
	if ($player2_present = 1)
		break
	endif
	Wait \{30 gameframes}
	repeat
	destroy_net_popup
	cs_event_handlers = [
		{pad_up cs_scroll_up_or_down Params = {Player = 1 Dir = Up}}
		{pad_down cs_scroll_up_or_down Params = {Player = 1 Dir = Down}}
		{pad_back net_cs_go_back Params = {Player = 1}}
		{pad_choose character_select_choose Params = {Player = 1}}
		{pad_start menu_show_gamercard}
	]
	setScreenElementProps Id = vmenu_character_select_p1 event_handlers = <cs_event_handlers> Replace_Handlers
endscript

script net_battle_select_icon 
	begin
	if ScreenelementExists Id = <icon_id>
		<icon_id> :SetProps texture = <icon_texture>
		return
	endif
	Wait \{1 GameFrame}
	repeat 600
	Printf "Couldn't find battle icon id=%i" I = <icon_id>
endscript

script net_hub_stream 
	player_status = player1_status
	begin
	char_data = {
		char_id = ($player1_status.character_id)
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		instrument_id = ($player1_status.instrument_id)
	}
	SendStructure callback = update_net_character data_to_send = {char_data = <char_data>}
	Wait \{1 Second}
	repeat
endscript

script update_net_character 
	player_status = player2_status
	change_made = 0
	char_id = (<char_data>.char_id)
	outfit = (<char_data>.outfit)
	style = (<char_data>.style)
	instrument_id = (<char_data>.instrument_id)
	valid = 0
	if find_profile_by_id Id = <char_id>
		if is_musician_profile_downloaded Index = <Index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		Printf \{"Invalid Character found - changing to axel"}
		char_id = Axel
		outfit = 1
		style = 1
	endif
	valid = 0
	if find_instrument_index desc_id = <instrument_id>
		if is_musician_instrument_downloaded Index = <Index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		Printf \{"Invalid Instrument found - changing to les paul black"}
		instrument_id = Instrument_Les_Paul_Black
	endif
	if NOT ($<player_status>.character_id = <char_id>)
		Change StructureName = <player_status> character_id = <char_id>
		<change_made> = 1
	endif
	if NOT ($<player_status>.outfit = <outfit>)
		Change StructureName = <player_status> outfit = <outfit>
		<change_made> = 1
	endif
	if NOT ($<player_status>.style = <style>)
		Change StructureName = <player_status> style = <style>
		<change_made> = 1
	endif
	if NOT ($<player_status>.instrument_id = <instrument_id>)
		get_musician_instrument_type desc_id = <instrument_id>
		if gotParam (instrument_type)
			if (<instrument_type> = GUITAR)
				if NOT (<instrument_id> = ($player2_selected_guitar))
					Change player2_selected_guitar = <instrument_id>
				endif
			else
				if NOT (<instrument_id> = ($player2_selected_guitar))
					Change player2_selected_bass = <instrument_id>
				endif
			endif
			Change StructureName = <player_status> instrument_id = <instrument_id>
			<change_made> = 1
		endif
	endif
	if (<change_made> = 1)
		Change \{generic_select_monitor_p2_changed = 1}
	endif
endscript

script character_hub_net_ready 
	if NOT (ScreenelementExists Id = ready_container_p2)
		create_ready_icons \{pos2 = (825.0, 450.0) parent2 = root_window}
	endif
	if ($p2_ready = 0)
		Change \{p2_ready = 1}
		if ScreenelementExists \{Id = ready_container_p2}
			ready_container_p2 :Obj_SpawnScriptLater \{drop_in_ready_sign Params = {Player = 2}}
		endif
	endif
	if (($p1_ready = 1) && ($p2_ready = 1))
		if ScreenelementExists \{Id = vmenu_character_hub_p1}
			launchevent \{Type = unfocus Target = vmenu_character_hub_p1}
		endif
		Wait \{0.4 Seconds}
		clean_up_user_control_helpers
		shut_down_flow_manager \{Player = 2}
		shut_down_character_hub
		destroy_ready_icons
		Change \{p1_ready = 0}
		Change \{p2_ready = 0}
		killspawnedScript \{Name = net_hub_stream}
		ui_flow_manager_respond_to_action \{action = select_ready Player = 1 create_params = {Player = 1}}
	endif
endscript

script character_hub_net_ready_back 
	Change \{p2_ready = 0}
	if NOT (ScreenelementExists Id = ready_container_p2)
		create_ready_icons \{pos2 = (825.0, 450.0) parent2 = root_window}
	endif
	drop_out_ready_sign \{Player = 2}
endscript

script debug_print_coop_stats \{identifier = ""}
	Printf "TMR ---------------------------- %s -------------------------" S = <identifier>
	p1_score = ($player1_status.score)
	p2_score = ($player2_status.score)
	p1_health = ($player1_status.current_health)
	p2_health = ($player2_status.current_health)
	p1_note_streak = ($player1_status.best_run)
	p2_note_streak = ($player2_status.best_run)
	p1_total_notes = ($player1_status.total_notes)
	p2_total_notes = ($player2_status.total_notes)
	<p1_percent_complete> = (100 * $player1_status.NOTES_HIT / $player1_status.total_notes)
	<p2_percent_complete> = (100 * $player2_status.NOTES_HIT / $player2_status.total_notes)
	printStruct <...>
endscript

script get_musician_instrument_type 
	get_musician_instrument_size
	Index = 0
	begin
	get_musician_instrument_struct Index = <Index>
	if (<desc_id> = <info_struct>.desc_id)
		return instrument_type = (<info_struct>.Type)
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
endscript

script scale_element_width_to_size \{max_text_width = 400}
	if NOT gotParam \{Id}
		return
	endif
	getScreenElementDims Id = <Id>
	if (<width> > <max_text_width>)
		setScreenElementProps {
			Id = <Id>
			scale = ((1.0, 0.0) + (0.0, 1.0) * (<text_scale>.(0.0, 1.0)))
		}
		scale_element_to_size {
			Id = <Id>
			target_width = <max_text_width>
		}
	endif
endscript

script net_dl_content_compatabilty_warning_fade_out 
	Wait \{10 Seconds}
	if ScreenelementExists Id = <Id>
		<Id> :doMorph Alpha = 0.0 Time = 1.0
	endif
	Wait \{1 Frame}
	if ScreenelementExists \{Id = dl_content_warning}
		DestroyScreenelement \{Id = dl_content_warning}
	endif
endscript

script net_dl_content_compatabilty_warning \{Z = 100 pos = (0.0, 0.0)}
	if NOT gotParam \{PARENT}
		return
	endif
	if ScreenelementExists \{Id = dl_content_warning}
		DestroyScreenelement \{Id = dl_content_warning}
	endif
	createScreenElement {
		Type = containerElement
		Id = dl_content_warning
		PARENT = <PARENT>
		pos = <pos>
	}
	menu_anchor = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_anchor>
		texture = window_frame_cap
		Dims = (128.0, 64.0)
		rgba = ($online_medium_blue)
		pos = (0.0, 0.0)
		just = [Center top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_anchor>
		texture = window_fill_cap
		Dims = (128.0, 64.0)
		rgba = ($online_trans_grey)
		pos = (0.0, 0.0)
		just = [Center top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_anchor>
		texture = window_frame_body_tall
		Dims = (128.0, 512.0)
		rgba = ($online_medium_blue)
		pos = (64.0, 0.0)
		just = [Center top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_anchor>
		texture = window_fill_body_large
		Dims = (128.0, 512.0)
		rgba = ($online_trans_grey)
		pos = (64.0, 0.0)
		just = [Center top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_anchor>
		texture = window_frame_cap
		Dims = (128.0, 64.0)
		rgba = ($online_medium_blue)
		pos = (576.0, 0.0)
		just = [Center top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
		flip_h
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_anchor>
		texture = window_fill_cap
		Dims = (128.0, 64.0)
		rgba = ($online_trans_grey)
		pos = (576.0, 0.0)
		just = [Center top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
		flip_h
	}
	Text = "Both players need to have the same Downloaded Songs in order to use them in multiplayer games."
	createScreenElement {
		Type = textblockelement
		PARENT = <menu_anchor>
		font = text_a4
		scale = (0.7, 0.55)
		rgba = ($online_light_blue)
		Text = <Text>
		just = [Center top]
		z_priority = (<Z> + 0.1)
		pos = (320.0, -55.0)
		Dims = (830.0, 185.0)
		allow_expansion
	}
	<menu_anchor> :Obj_SpawnScriptLater net_dl_content_compatabilty_warning_fade_out Params = {Id = <menu_anchor>}
endscript

script fit_text_into_menu_item 
	if ScreenelementExists Id = <Id>
		getScreenElementDims Id = <Id>
		if (<width> > <max_width>)
			setScreenElementProps {
				Id = <Id>
				scale = 1.0
			}
			scale_element_to_size {
				Id = <Id>
				target_width = <max_width>
				target_height = <Height>
			}
		endif
	endif
endscript

script net_coop_init_star_power 
	Printf \{"Trying to init star power"}
	if NOT (($player1_status.star_power_used = 1) || ($player2_status.star_power_used = 1))
		SpawnScriptNOw \{star_power_activate_and_drain Params = {player_status = player1_status Player = 1 player_Text = 'p1'}}
		SpawnScriptNOw \{star_power_activate_and_drain Params = {player_status = player2_status Player = 2 player_Text = 'p2'}}
	endif
endscript
DEMONWARE_IS_READY = 1

script set_ready_for_input 
	Change \{DEMONWARE_IS_READY = 1}
endscript

script set_demonware_failed 
	Change \{DEMONWARE_IS_READY = 1}
endscript

script set_disable_demonware_input 
	Change \{DEMONWARE_IS_READY = 0}
endscript

script online_end_song 
	Printf \{"---online_end_song"}
	if GameIsOver
		Printf \{"Game is over already, no song win event"}
		return
	endif
	if ($game_mode = p2_battle)
		if (isHost)
			Printf \{"Host sending end_song to client"}
			SendEndSong
			client_handle_end_song
		endif
	else
		client_handle_end_song
	endif
endscript

script client_handle_end_song 
	Printf \{"client_handle_end_song - Broadcasting song won event."}
	ExtendCrc \{song_won 'p1' out = Type}
	BroadCastEvent Type = <Type>
endscript
gHandlingWindowClosed = 0
gIsInNetGame = 0

script netNotifyWindowClosed 
	Printf \{"GTB - netNotifyWindowClosed"}
	if ($gIsInNetGame = 1)
		if ($gHandlingWindowClosed = 0)
			Change \{gHandlingWindowClosed = 1}
			create_connection_lost_dialog
		endif
	endif
endscript
