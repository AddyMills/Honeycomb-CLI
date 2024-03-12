store_menu_font = fontgrid_title_gh3
soundcheck_in_store = 0
store_camera_props = {
	main_store_menu = {
		lockto = World
		pos = (27.390575, 0.374346, 10.101139)
		quat = (-0.0021890001, 0.997191, 0.032329)
		fov = 72.0
	}
	guitar_selection = {
		lockto = World
		pos = (28.865236, 1.268629, 3.7361782)
		quat = (-0.00024999998, 0.99804497, 0.062374)
		fov = 90.0
	}
	song_selection = {
		lockto = World
		pos = (27.147392, 0.59662694, 8.347746)
		quat = (-0.000703, 0.87414604, 0.0012660001)
		fov = 72.0
	}
	outfits_selection = {
		lockto = World
		pos = (29.334492, 0.15719901, 7.960009)
		quat = (-0.00127, -0.864339, -0.0021790003)
		fov = 72.0
	}
}
current_store_camera_prop = NONE
target_store_camera_prop = NONE
store_camera_changing = 0
store_view_cam_created = 0

script store_camera_script 
	Change \{current_store_camera_prop = main_store_menu}
	CCam_DoMorph {
		($store_camera_props.main_store_menu)
	}
	begin
	if NOT ($current_store_camera_prop = $target_store_camera_prop)
		Change \{store_camera_changing = 1}
		CCam_DoMorph {
			($store_camera_props.($target_store_camera_prop))
			Time = 0.5
			Motion = smooth
		}
		CCam_WaitMorph
		Change current_store_camera_prop = ($target_store_camera_prop)
		Change \{store_camera_changing = 0}
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script store_camera_wait 
	Wait \{5 gameframes}
	begin
	if ($store_camera_changing = 0)
		break
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script create_store_window_frame \{pos = (0.0, 0.0) hilite_pos = (0.0, 0.0) Dims = (128.0, 128.0) hilite_dims = (128.0, 10.0) hilite_off = (10.0, 0.0) frame_rgba = [120 60 10 255] Z = 10}
	createScreenElement \{Type = containerElement PARENT = root_window Id = store_frame_container}
	<Dims> = (<Dims> - (0.0, 128.0))
	if ((<Dims>.(0.0, 1.0)) >= 360)
		frame_body_tex = window_frame_body_tall
		frane_body_fill_tex = window_fill_body_large
	else
		frame_body_tex = window_frame_body_short
		frane_body_fill_tex = window_fill_body_short
	endif
	createScreenElement {
		Type = spriteElement
		PARENT = store_frame_container
		pos = <pos>
		just = [Center Center]
		texture = <frame_body_tex>
		Dims = <Dims>
		rgba = <frame_rgba>
		z_priority = <Z>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = store_frame_container
		pos = <pos>
		just = [Center Center]
		texture = <frane_body_fill_tex>
		Dims = <Dims>
		rgba = [0 0 0 200]
		z_priority = (<Z> - 1)
	}
	header_pos = (<pos> - (<Dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 32.0))
	header_dims = ((<Dims>.(1.0, 0.0) * (1.0, 0.0)) + (0.0, 64.0))
	createScreenElement {
		Type = spriteElement
		PARENT = store_frame_container
		pos = <header_pos>
		Dims = <header_dims>
		just = [Center Bottom]
		texture = window_header_01
		rgba = [200 200 200 255]
		z_priority = <Z>
	}
	<header_pos> = (<pos> - (<Dims>.(0.0, 1.0)) * (0.0, 0.5))
	createScreenElement {
		Type = spriteElement
		PARENT = store_frame_container
		pos = <header_pos>
		Dims = <header_dims>
		just = [Center Bottom]
		texture = window_frame_cap
		rgba = <frame_rgba>
		z_priority = <Z>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = store_frame_container
		pos = <header_pos>
		Dims = <header_dims>
		just = [Center Bottom]
		texture = window_fill_cap
		rgba = [0 0 0 200]
		z_priority = (<Z> - 1)
	}
	footer_pos = (<pos> + (<Dims>.(0.0, 1.0)) * (0.0, 0.5) - (4.0, 36.0))
	footer_dims = ((<Dims>.(1.0, 0.0) * (0.90999997, 0.0)) + (0.0, 128.0))
	createScreenElement {
		Type = spriteElement
		PARENT = store_frame_container
		pos = <footer_pos>
		Dims = <footer_dims>
		just = [Center Center]
		texture = store_frame_bottom_bg
		z_priority = (<Z> + 1)
		rgba = <frame_rgba>
		flip_h
		flip_v
	}
	if NOT gotParam \{no_hilite}
		createScreenElement {
			Type = containerElement
			PARENT = store_frame_container
			Id = store_hilite_container
			pos = <hilite_pos>
		}
		createScreenElement {
			Type = spriteElement
			PARENT = store_hilite_container
			texture = White
			Dims = <hilite_dims>
			z_priority = (<Z> + 3)
			rgba = [255 255 205 255]
			just = [Center Center]
		}
		createScreenElement {
			Type = spriteElement
			PARENT = store_hilite_container
			texture = character_hub_hilite_bookend
			pos = (<Dims>.(-1.0, 0.0) * (0.5, 0.0) + <hilite_off>)
			z_priority = (<Z> + 2)
			rgba = [255 255 205 255]
			just = [Center Center]
		}
		<hilite_off> = (<hilite_off> * 0.5)
		createScreenElement {
			Type = spriteElement
			PARENT = store_hilite_container
			texture = character_hub_hilite_bookend
			pos = (<Dims>.(1.0, 0.0) * (0.5, 0.0) - <hilite_off>)
			z_priority = (<Z> + 2)
			rgba = [255 255 205 255]
			just = [Center Center]
		}
	else
		box_pos = (<pos> - (<Dims>.(0.0, 1.0)) * (0.0, 0.5) + (-5.0, 16.0))
		box_dims = ((<Dims>.(1.0, 0.0) * (1.0, 0.0)) + (0.0, 128.0))
		createScreenElement {
			Type = spriteElement
			PARENT = store_frame_container
			texture = Char_Select_Frame_BG
			pos = <box_pos>
			Dims = <box_dims>
			z_priority = (<Z> + 3)
			rgba = [255 255 205 255]
			just = [Center Center]
		}
	endif
endscript

script destroy_store_window_frame 
	destroy_menu \{menu_id = store_frame_container}
endscript
store_saved_guitar_id = NONE

script create_store_menu 
	mark_unsafe_for_shutdown
	SpawnScriptNOw \{Menu_Music_On}
	Change \{soundcheck_in_store = 1}
	Change \{generic_select_monitor_p1_changed = 0}
	if ($store_view_cam_created = 0)
		Change store_saved_guitar_id = ($player1_status.instrument_id)
		Change \{StructureName = player1_status style = 1}
		unload_band
		destroy_bg_viewport
		setup_bg_viewport
		PlayIGCCam \{Name = store_view_cam viewport = Bg_Viewport controlscript = store_camera_script play_hold = 1}
		Change \{store_view_cam_created = 1}
	endif
	Change \{target_store_camera_prop = main_store_menu}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	setScreenElementProps \{Id = store_cash_text pos = (900.0, 505.0)}
	hilite_pos = [
		(897.0, 155.0)
		(897.0, 197.0)
		(897.0, 241.0)
		(897.0, 284.0)
		(897.0, 326.0)
		(897.0, 370.0)
		(897.0, 413.0)
		(897.0, 456.0)
	]
	create_store_window_frame pos = (900.0, 360.0) hilite_pos = (<hilite_pos> [0]) Dims = (300.0, 512.0) hilite_dims = (270.0, 40.0)
	back_handlers = [
		{pad_up generic_menu_up_or_down_sound Params = {Up}}
		{pad_down generic_menu_up_or_down_sound Params = {Down}}
		{pad_back menu_store_go_back}
	]
	new_menu scrollid = ms_scroll vmenuid = ms_vmenu Menu_pos = (775.0, 103.0) event_handlers = <back_handlers> Z = 50 Spacing = -20
	Change \{menu_focus_color = [128 0 0 255]}
	Change \{menu_unfocus_color = [180 100 60 255]}
	text_params = {
		PARENT = ms_vmenu
		Type = textElement
		font = ($store_menu_font)
		rgba = ($menu_unfocus_color)
		no_shadow
	}
	createScreenElement {
		<text_params>
		Text = "GUITARS"
		event_handlers = [
			{focus menu_store_focus Params = {hilite_pos = (<hilite_pos> [0])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_guitars}}
			{pad_L3 store_debug_givebandcash}
			{PAD_LEFT store_debug_givebandcash}
		]
	}
	getScreenElementDims Id = <Id>
	if (<width> > 270)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (250.0, 60.0)
	endif
	createScreenElement {
		<text_params>
		Text = "FINISHES"
		event_handlers = [
			{focus menu_store_focus Params = {hilite_pos = (<hilite_pos> [1])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_finishes}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	getScreenElementDims Id = <Id>
	if (<width> > 270)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (250.0, 60.0)
	endif
	createScreenElement {
		<text_params>
		Text = "SONGS"
		event_handlers = [
			{focus menu_store_focus Params = {hilite_pos = (<hilite_pos> [2])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_songs}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	getScreenElementDims Id = <Id>
	if (<width> > 270)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (250.0, 60.0)
	endif
	createScreenElement {
		<text_params>
		Text = "CHARACTERS"
		event_handlers = [
			{focus menu_store_focus Params = {hilite_pos = (<hilite_pos> [3])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_characters}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	getScreenElementDims Id = <Id>
	if (<width> > 270)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (250.0, 60.0)
	endif
	createScreenElement {
		<text_params>
		Text = "OUTFITS"
		event_handlers = [
			{focus menu_store_focus Params = {hilite_pos = (<hilite_pos> [4])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_outfits}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	getScreenElementDims Id = <Id>
	if (<width> > 270)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (250.0, 60.0)
	endif
	createScreenElement {
		<text_params>
		Text = "STYLES"
		event_handlers = [
			{focus menu_store_focus Params = {hilite_pos = (<hilite_pos> [5])}}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_styles}}
			{pad_L3 store_debug_givebandcash}
		]
	}
	getScreenElementDims Id = <Id>
	if (<width> > 270)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (250.0, 60.0)
	endif
	last_hilite_index = 7
	getplatform
	show_videos = 1
	if NOT English
		if (<Platform> = PS2 || <Platform> = PS3)
			<show_videos> = 0
		endif
	endif
	if (<show_videos> = 1)
		createScreenElement {
			<text_params>
			Text = "VIDEOS"
			event_handlers = [
				{focus menu_store_focus Params = {hilite_pos = (<hilite_pos> [6])}}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_videos}}
				{pad_L3 store_debug_givebandcash}
			]
		}
		getScreenElementDims Id = <Id>
		if (<width> > 270)
			setScreenElementProps Id = <Id> scale = 1
			fit_text_in_rectangle Id = <Id> Dims = (250.0, 60.0)
		endif
	else
		<last_hilite_index> = 6
	endif
	if (<Platform> = XENON)
		param_flags = {}
		if isWinPort
			<param_flags> = {NOT_FOCUSABLE rgba = [100 100 100 255]}
		else
			if NOT CheckForSignIn \{local}
				<param_flags> = {NOT_FOCUSABLE rgba = [100 100 100 255]}
			endif
		endif
		createScreenElement {
			<text_params>
			Text = "DOWNLOADS"
			event_handlers = [
				{focus menu_store_focus Params = {hilite_pos = (<hilite_pos> [<last_hilite_index>])}}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_downloads}}
				{pad_L3 store_debug_givebandcash}
				{pad_L3 store_debug_givebandcash}
			]
			<param_flags>
		}
		getScreenElementDims Id = <Id>
		if (<width> > 270)
			setScreenElementProps Id = <Id> scale = 1
			fit_text_in_rectangle Id = <Id> Dims = (250.0, 60.0)
		endif
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	mark_safe_for_shutdown
endscript

script menu_store_focus 
	retail_menu_focus
	if ScreenelementExists \{Id = store_hilite_container}
		store_hilite_container :SetProps pos = <hilite_pos>
	endif
endscript

script menu_store_go_back 
	killcamanim \{Name = store_view_cam}
	Change \{store_view_cam_created = 0}
	clean_up_user_control_helpers
	Change \{soundcheck_in_store = 0}
	Change StructureName = player1_status instrument_id = ($store_saved_guitar_id)
	formatText \{Checksumname = player_status 'player%i_status' I = 1}
	if find_profile_by_id Id = ($<player_status>.character_id)
		get_musician_profile_struct Index = <Index>
		formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = 1 AddToStringLookup = TRUE
		if getglobaltags <default_characterguitartag> noassert = 1
			Change StructureName = <player_status> outfit = <current_outfit>
			Change StructureName = <player_status> style = <current_style>
			formatText \{Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = 1}
			Change globalName = <change_flag> NewValue = 1
		endif
	endif
	if ($shutdown_game_for_signin_change_flag = 0)
		menu_flow_go_back
	endif
endscript

script destroy_store_menu 
	destroy_store_window_frame
	destroy_menu \{menu_id = ms_scroll}
	shut_down_store_hub
endscript

script setup_store_hub \{cash_pos = (0.0, 0.0)}
	Change \{game_mode = p1_career}
	Destroy_Crowd_Models
	GetPakManCurrentName \{map = Zones}
	if gotParam \{pakname}
		if NOT (<pakname> = "z_soundcheck")
			ResetWaypoints
			SetPakManCurrentBlock \{map = Zones pak = Z_Soundcheck block_scripts = 1}
		endif
	else
		ResetWaypoints
		SetPakManCurrentBlock \{map = Zones pak = Z_Soundcheck block_scripts = 1}
	endif
	disable_pause
	createScreenElement \{Type = containerElement PARENT = root_window pos = (0.0, 0.0) just = [Left top] Id = store_container}
	createScreenElement {
		Type = textElement
		pos = <cash_pos>
		PARENT = store_container
		font = text_a4
		Text = ""
		Id = store_cash_text
		rgba = [255 255 205 250]
		z_priority = 50
		just = [Center Center]
	}
	store_update_band_cash
	store_hide_already_owned
endscript

script shut_down_store_hub 
	destroy_band \{unload_paks}
	destroy_menu \{menu_id = store_container}
endscript

script store_update_band_cash 
	get_current_band_info
	getglobaltags <band_info>
	formatText Textname = user_cash_amount "$%d" D = (<Cash>) useCommas
	setScreenElementProps {
		Id = store_cash_text
		Text = (<user_cash_amount>)
	}
	Achievement_CheckBuyAchievements
endscript

script set_store_purchase_price \{price = 0}
	if ScreenelementExists \{Id = store_price_tag_text}
		formatText Textname = price_text "$%d" D = (<price>)
		store_price_tag_text :SetProps Text = <price_text>
		store_price_tag_text :SetTags tag_price = <price>
	endif
endscript

script create_store_songs_menu 
	mark_unsafe_for_shutdown
	menu_music_off
	Change \{target_store_camera_prop = song_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	setScreenElementProps \{Id = store_cash_text pos = (900.0, 550.0)}
	create_store_window_frame \{pos = (900.0, 360.0) Dims = (300.0, 600.0) no_hilite}
	createScreenElement \{Type = containerElement PARENT = root_window Id = select_guitar_container pos = (893.0, -100.0)}
	createScreenElement \{Type = containerElement PARENT = root_window Id = store_songs_container pos = (900.0, 210.0)}
	createScreenElement {
		Type = WindowElement
		PARENT = root_window
		Id = store_info_scroll_window
		pos = ($store_window_pos + (0.0, 60.0))
		Dims = ($store_window_dims - (0.0, 80.0))
	}
	new_menu \{scrollid = ss_scroll vmenuid = ss_vmenu}
	text_params = {PARENT = ss_vmenu Type = textElement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createScreenElement {
		<text_params>
		Text = ""
		event_handlers = [
			{PAD_LEFT store_songs_right}
			{pad_right store_songs_left}
			{pad_down store_songs_right}
			{pad_up store_songs_left}
			{pad_choose store_songs_buy}
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
		]
		Id = store_songs_menu_holder
	}
	createScreenElement {
		Type = textElement
		PARENT = store_songs_container
		just = [Center Center]
		font = ($store_menu_font)
		Text = ""
		scale = 1.0
		Id = store_song_artist
		rgba = [170 90 35 255]
		z_priority = (<text_params>.z_priority)
		pos = (-5.0, -62.0)
	}
	createScreenElement {
		Type = textblockelement
		PARENT = store_songs_container
		just = [Center Center]
		font = text_a6
		Text = ""
		scale = 0.6
		Dims = (380.0, 180.0)
		pos = (0.0, 29.0)
		Id = store_song_title
		rgba = [255 255 205 255]
		z_priority = (<text_params>.z_priority)
	}
	createScreenElement \{Type = spriteElement PARENT = store_songs_container just = [Center Center] texture = store_song_record_frame pos = (-505.0, 127.0) Dims = (300.0, 295.0) Id = store_songs_album_frame z_priority = 1}
	createScreenElement \{Type = spriteElement PARENT = store_songs_container just = [Center Center] pos = (-512.0, 128.0) Id = store_songs_album_cover z_priority = 1}
	createScreenElement \{Type = spriteElement PARENT = store_songs_container texture = char_select_hilite1 pos = (-460.0, 128.0) Dims = (730.0, 500.0) rgba = [255 165 100 255] z_priority = 0}
	createScreenElement \{Type = spriteElement PARENT = store_songs_container texture = store_song_45 pos = (-380.0, 128.0) Id = store_songs_album_45 z_priority = 1}
	runScriptOnScreenElement \{Id = store_songs_album_45 rotate_element_360 Params = {Id = store_songs_album_45 Time = 2}}
	store_show_price_tag \{PARENT = store_songs_album_cover pos = (260.0, -80.0) rot = -10}
	launchevent \{Type = unfocus Target = ss_vmenu}
	launchevent \{Type = focus Target = store_songs_menu_holder}
	store_show_already_owned
	Change \{current_setlist_songpreview = NONE}
	set_store_song_title \{Index = 0}
	Spawnscriptlater \{setlist_songpreview_monitor}
	mark_safe_for_shutdown
endscript

script destroy_store_songs_menu 
	UnPauseSpawnedScript \{setlist_songpreview_monitor}
	begin
	if ($setlist_songpreview_changing = 0)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	killspawnedScript \{Name = setlist_songpreview_monitor}
	if NOT ($current_setlist_songpreview = NONE)
		get_song_prefix Song = ($current_setlist_songpreview)
		formatText Checksumname = song_preview '%s_preview' S = <song_prefix>
		Stopsound <song_preview>
		SongUnLoadFSBIfDownloaded
	endif
	destroy_store_price_tag
	killspawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = store_songs_container}
	destroy_menu \{menu_id = ss_scroll}
	destroy_store_window_frame
	shut_down_store_hub
endscript

script store_scroll_info \{scroll_time = 20 info_block_text = "NO TEXT AVAILABLE."}
	destroy_menu \{menu_id = store_info_block_text_id}
	createScreenElement {
		Type = textblockelement
		Id = store_info_block_text_id
		PARENT = <PARENT>
		just = [Left top]
		internal_just = [Left top]
		pos = (0.0, 0.0)
		scale = (0.58, 0.6)
		Text = <info_block_text>
		font = text_A5
		rgba = [255 165 100 255]
		z_priority = <Z>
		Dims = <Dims>
		line_spacing = 1.25
	}
	<this_ID> = <Id>
	getScreenElementDims Id = <Id>
	end_pos = (<Height> * (0.0, -1.5))
	begin
	Wait \{5 Seconds}
	DoScreenElementMorph Id = <this_ID> pos = <end_pos> Time = <scroll_time>
	Wait (<scroll_time> * 0.8) Seconds
	setScreenElementProps Id = <this_ID> pos = (0.0, 0.0)
	repeat
endscript

script find_bonus_info 
	Array = Bonus_Songs_Info
	if gotParam \{GUITAR}
		Scriptassert \{"Shouldn't be calling this function (find_bonus_info) for guitars!"}
		elseif gotParam \{character}
		Array = Bonus_Characters_Info
	endif
	getArraySize ($<Array>)
	I = 0
	begin
	if (<item_checksum> = ((($<Array>) [<I>]).item))
		return info_index = <I> TRUE
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script menu_store_find_guitar_index_for_blurb 
	<I> = 0
	getArraySize ($musician_instrument)
	begin
	if (<Id> = (($musician_instrument [<I>]).desc_id))
		return guitar_index = <I>
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
endscript

script set_store_song_title \{Index = 0}
	store_hide_already_owned
	get_progression_globals game_mode = ($game_mode) Bonus
	store_song_artist :SetTags song_index = <Index>
	song_checksum = ($<tier_global>.tier1.songs [<Index>])
	find_bonus_info item_checksum = <song_checksum> Song
	select_guitar_change_blurb_text Text = ($Bonus_Songs_Info [<info_index>].Text) x_dims = 430 pos = (-115.0, 375.0) Z = 50
	album_texture = ($Bonus_Songs_Info [<info_index>].album_cover)
	if (<album_texture> = store_song_default)
		if English
			<album_texture> = store_song_default
			elseif French
			<album_texture> = store_song_default_FR
			elseif German
			<album_texture> = store_song_default_DE
			elseif Italian
			<album_texture> = store_song_default_IT
			elseif Spanish
			<album_texture> = store_song_default_SP
			elseif korean
			<album_texture> = store_song_default
		endif
	endif
	store_songs_album_cover :SetProps texture = <album_texture>
	get_song_title Song = (<song_checksum>)
	setScreenElementProps {
		Id = store_song_title
		Text = (<Song_Title>)
	}
	get_song_artist Song = (<song_checksum>) with_year = 0
	setScreenElementProps {
		Id = store_song_artist
		Text = (<song_artist>)
	}
	store_song_artist :SetProps \{scale = (1.0, 1.0) relative_scale}
	getScreenElementDims \{Id = store_song_artist}
	if (<width> >= 280.0)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_song_artist :SetProps scale = <new_scale> relative_scale
	endif
	song_price = ($store_song_data.<song_checksum>.price)
	set_store_purchase_price price = (<song_price>)
	formatText Checksumname = bonus_song_checksum '%p_song%i_tier%s' P = 'bonus' I = (<Index> + 1) S = 1
	getglobaltags <song_checksum>
	if (<unlocked> = 1)
		store_show_already_owned
	endif
	Change target_setlist_songpreview = <song_checksum>
endscript

script store_songs_left 
	if ScreenelementExists \{Id = store_songs_album_45}
		store_songs_album_45 :doMorph Rot_Angle = RandomRange (180.0, -30.0)
		runScriptOnScreenElement \{Id = store_songs_album_45 rotate_element_360 Params = {Id = store_songs_album_45 Time = 2 element_angle = -360}}
	endif
	store_song_artist :getTags
	get_progression_globals game_mode = ($game_mode) Bonus
	getArraySize ($<tier_global>.tier1.songs)
	<song_index> = (<song_index> - 1)
	if (<song_index> < 0)
		<song_index> = (<song_index> + <array_Size>)
	endif
	song_checksum = ($<tier_global>.tier1.songs [<song_index>])
	if NOT find_bonus_info item_checksum = <song_checksum> Song
		store_song_artist :SetTags song_index = <song_index>
		store_songs_left
		return
	endif
	if (<song_index> < 0)
		<song_index> = (<song_index> + <array_Size>)
	endif
	generic_menu_up_or_down_sound \{Up}
	set_store_song_title Index = (<song_index>)
endscript

script store_songs_right 
	if ScreenelementExists \{Id = store_songs_album_45}
		store_songs_album_45 :doMorph Rot_Angle = RandomRange (30.0, 180.0)
		runScriptOnScreenElement \{Id = store_songs_album_45 rotate_element_360 Params = {Id = store_songs_album_45 Time = 2}}
	endif
	store_song_artist :getTags
	get_progression_globals game_mode = ($game_mode) Bonus
	getArraySize ($<tier_global>.tier1.songs)
	<song_index> = (<song_index> + 1)
	if (<song_index> = <array_Size>)
		<song_index> = 0
	endif
	song_checksum = ($<tier_global>.tier1.songs [<song_index>])
	if NOT find_bonus_info item_checksum = <song_checksum> Song
		store_song_artist :SetTags song_index = <song_index>
		store_songs_right
		return
	endif
	if (<song_index> = <array_Size>)
		<song_index> = 0
	endif
	generic_menu_up_or_down_sound \{Down}
	set_store_song_title Index = (<song_index>)
endscript

script store_songs_buy 
	store_song_artist :getTags
	get_progression_globals game_mode = ($game_mode) Bonus
	song_checksum = ($<tier_global>.tier1.songs [<song_index>])
	formatText Checksumname = bonus_song_checksum '%p_song%i_tier%s' P = 'bonus' I = (<song_index> + 1) S = 1
	getglobaltags <song_checksum>
	if (<unlocked> = 0)
		get_current_band_info
		getglobaltags <band_info>
		song_price = ($store_song_data.<song_checksum>.price)
		if ((<Cash> > <song_price>) || (<Cash> = <song_price>))
			<Cash> = (<Cash> - <song_price>)
			setGlobalTags <band_info> Params = {Cash = <Cash>}
			setGlobalTags <bonus_song_checksum> Params = {unlocked = 1}
			setGlobalTags <song_checksum> Params = {unlocked = 1}
			progression_push_current \{force_gamemode = p1_career}
			progression_pop_current \{force_gamemode = p2_career}
			setGlobalTags <bonus_song_checksum> Params = {unlocked = 1}
			setGlobalTags <song_checksum> Params = {unlocked = 1}
			progression_push_current \{force_gamemode = p2_career}
			progression_pop_current \{force_gamemode = p1_career}
			store_update_band_cash
			set_store_song_title Index = (<song_index>)
			Change \{store_autosave_required = 1}
			Soundevent \{Event = Cash_Sound}
		endif
	endif
endscript
store_character_original_id_p1 = NONE
store_character_original_outfit_id_p1 = 0
store_character_original_style_id_p1 = 0

script create_store_character_menu \{for_outfits = 0 for_styles = 0}
	setScreenElementProps \{Id = store_cash_text pos = (900.0, 550.0)}
	create_store_window_frame \{pos = (900.0, 360.0) Dims = (300.0, 600.0) no_hilite}
	Menu_pos = (845.0, 85.0)
	if (<for_outfits> = 1)
		<Menu_pos> = (835.0, 85.0)
	endif
	if (<for_styles> = 1)
		<Menu_pos> = (800.0, 85.0)
	endif
	createScreenElement \{Type = containerElement PARENT = root_window Id = select_guitar_container pos = (893.0, -100.0)}
	createScreenElement \{Type = WindowElement PARENT = root_window Id = store_info_scroll_window pos = $store_window_pos Dims = $store_window_dims}
	new_menu scrollid = cs_scroll vmenuid = cs_vmenu Menu_pos = <Menu_pos>
	text_params = {PARENT = cs_vmenu Type = textElement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createScreenElement {
		<text_params>
		Text = <character_full_name>
		Id = character_name_text
		event_handlers = [
			{pad_back store_go_back}
			{pad_right store_next_character Params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_down store_next_character Params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{PAD_LEFT store_previous_character Params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_up store_previous_character Params = {for_outfits = <for_outfits> for_styles = <for_styles>}}
			{pad_choose store_buy_character}
		]
	}
	launchevent \{Type = unfocus Target = cs_vmenu}
	launchevent \{Type = focus Target = character_name_text}
	store_show_price_tag \{pos = (580.0, 400.0) rot = -10}
endscript

script store_go_back 
	if NOT ($generic_select_monitor_p1_changed = 0)
		return
	endif
	if NOT ($store_guitar_loading = 0)
		return
	endif
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script create_store_characters_menu 
	mark_unsafe_for_shutdown
	kill \{Name = Z_SoundCheck_G_RMM_Kill_me}
	Change store_character_original_id_p1 = ($player1_status.character_id)
	Change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	Change store_character_original_style_id_p1 = ($player1_status.style)
	Change \{target_store_camera_prop = outfits_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	create_store_character_menu
	character_name_text :SetTags \{current_character = -1}
	character_name_text :SetTags \{last_character_change = 0}
	character_name_text :SetTags \{goal_character = 0}
	character_name_text :SetTags character_array = ($Secret_Characters)
	store_update_already_bought_for_character
	store_get_name_from_id character_id = ($Secret_Characters [0].Id)
	set_store_purchase_price price = ($Secret_Characters [0].price)
	formatText Checksumname = character_id '%s' S = <character_name>
	Change StructureName = player1_status character_id = <character_id>
	Change \{StructureName = guitarist_info stance = stance_FrontEnd}
	Change \{StructureName = guitarist_info next_stance = stance_FrontEnd}
	Change \{StructureName = guitarist_info current_anim = Idle}
	Change \{StructureName = guitarist_info cycle_anim = TRUE}
	Change \{StructureName = guitarist_info next_anim = NONE}
	Change \{StructureName = bassist_info stance = stance_FrontEnd}
	Change \{StructureName = bassist_info next_stance = stance_FrontEnd}
	Change \{StructureName = bassist_info current_anim = Idle}
	Change \{StructureName = bassist_info cycle_anim = TRUE}
	Change \{StructureName = bassist_info next_anim = NONE}
	Change \{store_shadow_character = 1}
	Change \{store_shadow_change = 1}
	SpawnScriptNOw \{monitor_store_shadow_character}
	store_show_character character_index = 0 character_id = ($Secret_Characters [0].Id) for_outfits = 0
	SpawnScriptNOw \{generic_select_monitor Params = {Player = 1 player_status = player1_status change_flag = generic_select_monitor_p1_changed Name = GUITARIST node_flags = {node_name = z_soundcheck_TRG_Waypoint_Character_Start}}}
	Wait \{1 GameFrame}
	store_next_character
	store_previous_character
	mark_safe_for_shutdown
endscript

script destroy_store_characters_menu 
	killspawnedScript \{Name = monitor_store_shadow_character}
	killspawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_store_window_frame
	destroy_menu \{menu_id = cs_scroll}
	destroy_menu \{menu_id = character_name_text}
	generic_select_monitor_finish
	shut_down_store_hub
	Change \{StructureName = player1_status character_id = $store_character_original_id_p1}
	Change \{StructureName = player1_status outfit = $store_character_original_outfit_id_p1}
	Change \{StructureName = player1_status style = $store_character_original_style_id_p1}
	create \{Name = Z_SoundCheck_G_RMM_Kill_me}
endscript

script create_store_outfits_menu 
	mark_unsafe_for_shutdown
	kill \{Name = Z_SoundCheck_G_RMM_Kill_me}
	Change store_character_original_id_p1 = ($player1_status.character_id)
	Change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	Change \{target_store_camera_prop = outfits_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	store_build_character_outfit_name profile_name = ($Bonus_Outfits [0].profile_name) character_id = ($Bonus_Outfits [0].Id)
	set_store_purchase_price price = ($Bonus_Outfits [0].price)
	store_get_outfit_name_from_id character_id = ($Bonus_Outfits [0].Id)
	formatText Checksumname = character_id '%s' S = <character_name>
	Change StructureName = player1_status character_id = <character_id>
	Change \{StructureName = guitarist_info stance = stance_FrontEnd}
	Change \{StructureName = guitarist_info next_stance = stance_FrontEnd}
	Change \{StructureName = guitarist_info current_anim = Idle}
	Change \{StructureName = guitarist_info cycle_anim = TRUE}
	Change \{StructureName = guitarist_info next_anim = NONE}
	enablelightgroup \{Name = GUITAR_CENTER_BAND}
	create_store_character_menu \{for_outfits = 1}
	character_name_text :SetTags \{current_character = -1}
	character_name_text :SetTags \{last_character_change = 0}
	character_name_text :SetTags \{goal_character = 0}
	character_name_text :SetTags character_array = ($Bonus_Outfits)
	store_update_already_bought_for_character
	store_show_character {
		character_index = 0
		character_id = ($Bonus_Outfits [0].Id)
		for_outfits = 1
	}
	SpawnScriptNOw \{generic_select_monitor Params = {Player = 1 player_status = player1_status change_flag = generic_select_monitor_p1_changed Name = GUITARIST for_outfits = 1 node_flags = {node_name = z_soundcheck_TRG_Waypoint_Character_Start}}}
	Wait \{1 GameFrame}
	store_next_character \{for_outfits = 1}
	store_previous_character \{for_outfits = 1}
	mark_safe_for_shutdown
endscript

script destroy_store_outfits_menu 
	killspawnedScript \{Name = monitor_store_shadow_character}
	killspawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = cs_scroll}
	destroy_store_window_frame
	destroy_menu \{menu_id = character_name_text}
	generic_select_monitor_finish
	shut_down_store_hub
	Change \{StructureName = player1_status character_id = $store_character_original_id_p1}
	Change \{StructureName = player1_status outfit = $store_character_original_outfit_id_p1}
	create \{Name = Z_SoundCheck_G_RMM_Kill_me}
endscript

script create_store_styles_menu 
	mark_unsafe_for_shutdown
	kill \{Name = Z_SoundCheck_G_RMM_Kill_me}
	Change store_character_original_id_p1 = ($player1_status.character_id)
	Change store_character_original_outfit_id_p1 = ($player1_status.outfit)
	Change store_character_original_style_id_p1 = ($player1_status.style)
	Change \{target_store_camera_prop = outfits_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	store_prune_styles_array
	store_build_character_outfit_name profile_name = (<styles_array> [0].profile_name) character_id = (<styles_array> [0].Id)
	set_store_purchase_price price = (<styles_array> [0].price)
	store_get_outfit_name_from_id character_id = (<styles_array> [0].Id) Array = <styles_array>
	formatText Checksumname = character_id '%s' S = <character_name>
	Change StructureName = player1_status character_id = <character_id>
	create_store_character_menu \{for_outfits = 1 for_styles = 1}
	character_name_text :SetTags \{current_character = -1}
	character_name_text :SetTags \{last_character_change = 0}
	character_name_text :SetTags \{goal_character = 0}
	character_name_text :SetTags character_array = <styles_array>
	enablelightgroup \{Name = GUITAR_CENTER_BAND}
	store_update_already_bought_for_character
	store_show_character {
		character_index = 0
		character_id = ((<styles_array> [0]).Id)
		for_outfits = 1
		for_styles = 1
	}
	SpawnScriptNOw \{generic_select_monitor Params = {Player = 1 player_status = player1_status change_flag = generic_select_monitor_p1_changed Name = GUITARIST for_outfits = 1 node_flags = {node_name = z_soundcheck_TRG_Waypoint_Character_Start}}}
	Wait \{1 GameFrame}
	store_next_character \{for_outfits = 1 for_styles = 1}
	store_previous_character \{for_outfits = 1 for_styles = 1}
	mark_safe_for_shutdown
endscript

script destroy_store_styles_menu 
	killspawnedScript \{Name = monitor_store_shadow_character}
	killspawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = cs_scroll}
	destroy_store_window_frame
	destroy_menu \{menu_id = character_name_text}
	generic_select_monitor_finish
	shut_down_store_hub
	Change \{StructureName = player1_status character_id = $store_character_original_id_p1}
	Change \{StructureName = player1_status outfit = $store_character_original_outfit_id_p1}
	Change \{StructureName = player1_status style = $store_character_original_style_id_p1}
	create \{Name = Z_SoundCheck_G_RMM_Kill_me}
endscript

script store_get_name_from_id 
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	if (<character_id> = (<profile_struct>.musician_body.desc_id))
		return character_name = (<profile_struct>.Name) character_full_name = (<profile_struct>.fullname)
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	printStruct <...>
	Scriptassert \{"Entry not found!"}
endscript

script store_get_outfit_name_from_id \{Array = $Bonus_Outfits}
	getArraySize (<Array>)
	Index = 0
	begin
	if (<character_id> = (<Array> [<Index>].Id))
		return character_name = (<Array> [<Index>].profile_name)
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	printStruct <...>
	Scriptassert \{"Entry not found!"}
endscript

script store_buy_character 
	character_name_text :getTags
	character_id = (<character_array> [<goal_character>].Id)
	getglobaltags <character_id>
	if (<unlocked> = 0)
		price = (<character_array> [<goal_character>].price)
		get_current_band_info
		getglobaltags <band_info>
		if (<character_id> = Guitarist_satan_Outfit2_Style1)
			getglobaltags \{Guitarist_satan_Outfit1_Style1}
			if NOT (<unlocked> = 1)
				return
			endif
		endif
		if ((<Cash> > <price>) || (<Cash> = <price>))
			<Cash> = (<Cash> - <price>)
			setGlobalTags <band_info> Params = {Cash = <Cash>}
			setGlobalTags <character_id> Params = {unlocked = 1}
			getArraySize \{$Musician_Profiles}
			<I> = 0
			begin
			if (($Musician_Profiles [<I>].musician_body.desc_id) = <character_id>)
				<guitar_id> = ($Musician_Profiles [<I>].musician_instrument.desc_id)
				setGlobalTags <guitar_id> Params = {unlocked = 1}
				break
			endif
			<I> = (<I> + 1)
			repeat <array_Size>
			store_update_band_cash
			store_update_already_bought_for_character
			Change \{store_autosave_required = 1}
			Soundevent \{Event = Cash_Sound}
			Change \{store_shadow_change = 1}
			Change \{store_shadow_character = 0}
		endif
	endif
endscript

script monitor_store_shadow_character 
	begin
	if ($store_shadow_change = 1)
		if ($store_shadow_character = 1)
			disablelightgroup \{Name = GUITAR_CENTER_BAND}
		else
			enablelightgroup \{Name = GUITAR_CENTER_BAND}
		endif
		Change \{store_shadow_change = 0}
	endif
	Wait \{1 GameFrame}
	repeat
endscript
store_shadow_character = 1
store_shadow_change = 1

script store_update_already_bought_for_character 
	character_name_text :getTags
	character_id = (<character_array> [<goal_character>].Id)
	getglobaltags <character_id>
	if (<unlocked>)
		Change \{store_shadow_character = 0}
		store_show_already_owned unlocked_for_purchase = <unlocked_for_purchase> for_character = 1
	else
		Change \{store_shadow_character = 1}
		store_hide_already_owned \{for_character = 1}
	endif
endscript

script get_instrument_from_character 
	getArraySize ($Musician_Profiles)
	I = 0
	begin
	if (<Name> = ($Musician_Profiles [<I>].Name))
		return instrument_id = ($Musician_Profiles [<I>].musician_instrument.desc_id)
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	printStruct <...>
	Scriptassert \{"Didn't find the character by id!"}
endscript

script store_show_character \{for_outfits = 0 for_styles = 0}
	character_name_text :getTags
	getArraySize <character_array>
	if (<for_styles>)
		store_build_character_outfit_name profile_name = (<character_array> [<character_index>].profile_name) character_id = (<character_array> [<character_index>].Id)
		setScreenElementProps Id = character_name_text Text = <fullname>
	else
		if (<for_outfits>)
			store_build_character_outfit_name profile_name = (<character_array> [<character_index>].profile_name) character_id = (<character_array> [<character_index>].Id)
			setScreenElementProps Id = character_name_text Text = <character_outfit_name>
			killspawnedScript \{Name = Store_Update_Player_Status}
			SpawnScriptNOw \{Store_Update_Player_Status Params = {style = 1}}
		else
			store_get_name_from_id character_id = <character_id>
			setScreenElementProps Id = character_name_text Text = <character_full_name>
			formatText Checksumname = character_id '%s' S = <character_name>
			get_instrument_from_character Name = <character_name>
			killspawnedScript \{Name = Store_Update_Player_Status}
			SpawnScriptNOw Store_Update_Player_Status Params = {character_id = <character_id>
				instrument_id = <instrument_id>
				outfit = 1
				style = 1}
		endif
	endif
	character_name_text :SetProps \{scale = 1}
	getScreenElementDims \{Id = character_name_text}
	if (<width> > 280)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		character_name_text :SetProps scale = <new_scale> relative_scale
	endif
	if (<for_styles>)
		store_get_outfit_name_from_id character_id = <character_id> Array = $Bonus_Styles
		formatText Checksumname = character_id '%s' S = <character_name>
		get_instrument_from_character Name = <character_name>
		store_find_outfit_and_style_indices {
			profile_name = (<character_array> [<character_index>].profile_name)
			character_id = (<character_array> [<character_index>].Id)
		}
		killspawnedScript \{Name = Store_Update_Player_Status}
		SpawnScriptNOw Store_Update_Player_Status Params = {character_id = <character_id>
			instrument_id = <instrument_id>
			outfit = (<outfit_index> + 1)
			style = (<style_index> + 1)}
		elseif (<for_outfits>)
		store_get_outfit_name_from_id character_id = <character_id> Array = $Bonus_Outfits
		formatText Checksumname = character_id '%s' S = <character_name>
		get_instrument_from_character Name = <character_name>
		killspawnedScript \{Name = Store_Update_Player_Status}
		SpawnScriptNOw Store_Update_Player_Status Params = {character_id = <character_id>
			instrument_id = <instrument_id>
			outfit = <outfit_num>}
	else
	endif
	set_store_purchase_price price = (<character_array> [<character_index>].price)
	if (<for_styles>)
		select_guitar_change_blurb_text Text = <character_outfit_name> x_dims = 430 pos = (-115.0, 320.0) Dims = (388.0, 300.0) Z = 50
	else
		if (<for_outfits>)
			find_bonus_info item_checksum = (<character_array> [<character_index>].info_name) character
			select_guitar_change_blurb_text Text = ($Bonus_Characters_Info [<info_index>].Text) x_dims = 430 pos = (-115.0, 320.0) Dims = (388.0, 300.0) Z = 50 lines_in_window = 9
		else
			store_find_character_blurb_by_id Id = (<character_array> [<character_index>].Id)
			select_guitar_change_blurb_text Text = <blurb_text> x_dims = 430 pos = (-115.0, 320.0) Dims = (388.0, 300.0) Z = 50
		endif
	endif
	character_name_text :SetTags goal_character = <character_index>
	character_name_text :SetTags last_character_change = <startTime>
	store_update_already_bought_for_character
endscript

script Store_Update_Player_Status \{Player = 1}
	formatText Checksumname = player_status 'player%p_status' P = <Player>
	formatText Checksumname = generic_select_monitor_changed 'generic_select_monitor_p%p_changed' P = <Player>
	begin
	Wait \{1 GameFrame}
	if ($<generic_select_monitor_changed> != 1)
		break
	endif
	repeat
	if gotParam \{character_id}
		Change StructureName = <player_status> character_id = <character_id>
	endif
	if gotParam \{instrument_id}
		Change StructureName = <player_status> instrument_id = <instrument_id>
	endif
	if gotParam \{outfit}
		Change StructureName = <player_status> outfit = <outfit>
	endif
	if gotParam \{style}
		Change StructureName = <player_status> style = <style>
	endif
	Change globalName = <generic_select_monitor_changed> NewValue = 1
endscript

script store_find_character_blurb_by_id 
	getArraySize ($Musician_Profiles)
	I = 0
	begin
	if (($Musician_Profiles [<I>].musician_body.desc_id) = <Id>)
		return blurb_text = ($Musician_Profiles [<I>].blurb)
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	printStruct <...>
	Scriptassert \{"Couldn't find the character blurb by id!"}
endscript

script store_next_character \{for_outfits = 0 for_styles = 0}
	character_name_text :getTags
	<goal_character> = (<goal_character> + 1)
	getArraySize <character_array>
	if (<goal_character> = <array_Size>)
		<goal_character> = 0
	endif
	unlocked_for_purchase = 1
	getglobaltags (<character_array> [<goal_character>].Id)
	if ((<character_array> [<goal_character>].Id) = Guitarist_satan_Outfit2_Style1)
		getglobaltags \{Guitarist_satan_Outfit1_Style1 param = unlocked}
		<unlocked_for_purchase> = <unlocked>
	endif
	if (<unlocked_for_purchase> = 0)
		character_name_text :SetTags goal_character = <goal_character>
		store_next_character for_outfits = <for_outfits> for_styles = <for_styles>
		return
	endif
	generic_menu_up_or_down_sound
	store_show_character {
		character_index = <goal_character>
		character_id = (<character_array> [<goal_character>].Id)
		for_outfits = <for_outfits>
		for_styles = <for_styles>
	}
endscript

script store_previous_character \{for_outfits = 0 for_styles = 0}
	character_name_text :getTags
	<goal_character> = (<goal_character> - 1)
	getArraySize <character_array>
	if (<goal_character> = -1)
		<goal_character> = (<array_Size> - 1)
	endif
	unlocked_for_purchase = 1
	getglobaltags (<character_array> [<goal_character>].Id)
	if ((<character_array> [<goal_character>].Id) = Guitarist_satan_Outfit2_Style1)
		getglobaltags \{Guitarist_satan_Outfit1_Style1 param = unlocked}
		<unlocked_for_purchase> = <unlocked>
	endif
	if (<unlocked_for_purchase> = 0)
		character_name_text :SetTags goal_character = <goal_character>
		store_previous_character for_outfits = <for_outfits> for_styles = <for_styles>
		return
	endif
	generic_menu_up_or_down_sound
	store_show_character {
		character_index = <goal_character>
		character_id = (<character_array> [<goal_character>].Id)
		for_outfits = <for_outfits>
		for_styles = <for_styles>
	}
endscript

script store_build_character_outfit_name 
	store_find_outfit_and_style_indices profile_name = <profile_name> character_id = <character_id>
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	if (<profile_struct>.Name = <profile_name>)
		outfit_array = (<profile_struct>.outfits)
		break
	endif
	<Index> = (<Index> + 1)
	repeat (<array_Size>)
	if NOT gotParam \{outfit_array}
		printStruct <...>
		Scriptassert \{"Couldn't find matching musician profile!"}
	else
		if (<style_index> = 0)
			outfit_name = (<outfit_array> [<outfit_index>].Name)
			formatText Textname = character_outfit_name "%o" O = <outfit_name>
			return character_outfit_name = <character_outfit_name> outfit_num = (<outfit_index> + 1) profile_name = <profile_name> fullname = (<profile_struct>.fullname)
		else
			style_name = (<outfit_array> [<outfit_index>].styles [<style_index>])
			formatText Textname = character_outfit_name "%o" O = <style_name>
			return character_outfit_name = <character_outfit_name> outfit_num = (<outfit_index> + 1) profile_name = <profile_name> fullname = (<profile_struct>.fullname)
		endif
	endif
endscript

script store_find_outfit_and_style_indices 
	outfit_index = 1
	begin
	style_index = 1
	begin
	formatText Checksumname = test_outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' N = <profile_name> O = <outfit_index> S = <style_index>
	if (<test_outfit_style_cs> = <character_id>)
		return outfit_index = (<outfit_index> -1) style_index = (<style_index> -1)
	endif
	<style_index> = (<style_index> + 1)
	repeat 4
	<outfit_index> = (<outfit_index> + 1)
	repeat 2
	printStruct <...>
	Scriptassert \{"Couldn't figure out the outfit and style indices!"}
endscript

script store_prune_styles_array 
	styles_array = ($Bonus_Styles)
	getArraySize (<styles_array>)
	<mod_a> = 0
	<I> = 0
	begin
	Mod A = <mod_a> B = 6
	if (<Mod> = 0)
		RemoveArrayElement Array = (<styles_array>) Index = <I>
		<styles_array> = (<Array>)
		<I> = (<I> - 1)
	endif
	<mod_a> = (<mod_a> + 1)
	<I> = (<I> + 1)
	repeat <array_Size>
	getArraySize (<styles_array>)
	Index = 0
	begin
	profile_name = (<styles_array> [<Index>].profile_name)
	character_id = (<styles_array> [<Index>].Id)
	store_find_outfit_and_style_indices profile_name = <profile_name> character_id = <character_id>
	<outfit_index> = (<outfit_index> + 1)
	<style_index> = (<style_index> + 1)
	if NOT (<outfit_index> = 1)
		formatText Checksumname = outfit_cs 'Guitarist_%n_Outfit%o_Style1' N = <profile_name> O = <outfit_index>
		getglobaltags <outfit_cs>
		if (<unlocked> = 0)
			RemoveArrayElement Array = (<styles_array>) Index = <Index>
			<styles_array> = (<Array>)
			<Index> = (<Index> - 1)
		endif
	endif
	<Index> = (<Index> + 1)
	repeat (<array_Size>)
	return styles_array = <styles_array>
endscript

script store_debug_givebandcash \{add_cash = 1000000}
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		add_cash = <Cash>
		get_current_band_info
		getglobaltags <band_info>
		<Cash> = (<Cash> + <add_cash>)
		setGlobalTags <band_info> Params = {Cash = <Cash>}
		setGlobalTags \{achievement_info Params = {total_cash_in_career_mode = 1000000}}
		Achievements_CheckCareerTotals
	endif
	destroy_store_menu
	create_store_menu
endscript
store_guitar_loaded_pak_name = ""
store_window_pos = (780.0, 240.0)
store_window_dims = (300.0, 280.0)

script create_store_guitars_menu 
	mark_unsafe_for_shutdown
	Change \{target_store_camera_prop = guitar_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	setScreenElementProps \{Id = store_cash_text pos = (900.0, 550.0)}
	create_store_window_frame \{pos = (900.0, 360.0) Dims = (300.0, 600.0) no_hilite}
	createScreenElement \{Type = containerElement PARENT = root_window Id = select_guitar_container pos = (893.0, -100.0)}
	createScreenElement \{Type = containerElement PARENT = root_window Id = store_guitar_container pos = (893.0, 200.0)}
	createScreenElement {
		Type = WindowElement
		PARENT = root_window
		Id = store_info_scroll_window
		pos = ($store_window_pos + (0.0, 80.0))
		Dims = (50.0, 50.0)
	}
	new_menu \{scrollid = sg_scroll vmenuid = sg_vmenu Menu_pos = (895.0, 117.0)}
	text_params = {PARENT = sg_vmenu Type = textElement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createScreenElement {
		<text_params>
		Type = containerElement
		Text = ""
		Id = store_guitar_name_container
		Dims = (100.0, 0.0)
		event_handlers = [
			{pad_down store_guitar_next_guitar}
			{pad_up store_guitar_previous_guitar}
			{PAD_LEFT store_guitar_previous_guitar}
			{pad_right store_guitar_next_guitar}
			{pad_choose store_guitar_buy_guitar}
			{pad_back store_go_back}
		]
	}
	createScreenElement {
		<text_params>
		font = text_a4
		PARENT = store_guitar_name_container
		Id = store_guitar_name
		just = [Center Center]
		pos = (0.0, 2.0)
	}
	createScreenElement {
		<text_params>
		Type = containerElement
		Id = store_guitar_name_brand_container
		Dims = (100.0, 0.0)
	}
	createScreenElement {
		<text_params>
		font = text_a4
		rgba = [10 10 10 255]
		PARENT = store_guitar_name_brand_container
		scale = 0.6
		Id = store_guitar_name_brand
		pos = (0.0, 32.0)
		just = [Center Center]
	}
	createScreenElement {
		Type = textElement
		PARENT = store_guitar_container
		just = [Center Center]
		font = text_a4
		Text = ""
		scale = 0.7
		Id = store_guitar_finish_name
		rgba = [255 255 205 255]
		z_priority = (<text_params>.z_priority)
		pos = (0.0, 20.0)
	}
	launchevent \{Type = unfocus Target = sg_vmenu}
	launchevent \{Type = focus Target = store_guitar_name_container}
	guitar_array = ($Bonus_Guitars)
	store_add_secret_guitars_and_basses guitar_array = (<guitar_array>)
	store_guitar_name :SetTags \{guitar_index = 0}
	store_guitar_name :SetTags guitar_array = <guitar_array>
	Change \{store_true_index = -1}
	find_guitar_index_by_id Id = (<guitar_array> [0].Id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [0].price)
	SpawnScriptNOw \{store_monitor_goal_guitar_index}
	store_show_price_tag pos = (520.0, 260.0) price = (<guitar_array> [0].price) rot = -10 z3d = 2
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb Id = ((<guitar_array> [0]).Id)
	Change \{store_guitar_scroll_ready = 1}
	mark_safe_for_shutdown
endscript

script destroy_store_guitars_menu 
	killspawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_store_price_tag
	destroy_store_window_frame
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = store_guitar_container}
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = sg_scroll}
	store_monitor_goal_guitar_finish
	shut_down_store_hub
endscript

script store_guitar_buy_guitar 
	store_guitar_name :getTags
	guitar_id = (<guitar_array> [<guitar_index>].Id)
	getglobaltags <guitar_id>
	if ((<unlocked> = 0) && (<unlocked_for_purchase> = 1))
		guitar_price = (<guitar_array> [<guitar_index>].price)
		get_current_band_info
		getglobaltags <band_info>
		if ((<Cash> > <guitar_price>) || (<Cash> = <guitar_price>))
			<Cash> = (<Cash> - <guitar_price>)
			setGlobalTags <band_info> Params = {Cash = <Cash>}
			setGlobalTags <guitar_id> Params = {unlocked = 1}
			store_update_band_cash
			store_update_already_bought_for_guitar
			Change \{store_autosave_required = 1}
			Soundevent \{Event = Cash_Sound}
		endif
	endif
endscript
store_guitar_scroll_ready = 1

script store_guitar_previous_guitar \{for_finishes = 0}
	if ($store_guitar_scroll_ready = 0)
		return
	endif
	Change \{store_guitar_scroll_ready = 0}
	generic_menu_up_or_down_sound
	store_guitar_name :getTags
	<guitar_index> = (<guitar_index> - 1)
	getArraySize (<guitar_array>)
	if (<guitar_index> < 0)
		<guitar_index> = (<guitar_index> + <array_Size>)
	endif
	store_guitar_name :SetTags guitar_index = <guitar_index>
	bonus_index = <guitar_index>
	find_guitar_index_by_id Id = (<guitar_array> [<bonus_index>].Id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [<bonus_index>].price) for_finishes = <for_finishes>
	Change \{store_guitar_scroll_ready = 1}
endscript

script store_guitar_next_guitar \{for_finishes = 0}
	if ($store_guitar_scroll_ready = 0)
		return
	endif
	Change \{store_guitar_scroll_ready = 0}
	generic_menu_up_or_down_sound
	store_guitar_name :getTags
	<guitar_index> = (<guitar_index> + 1)
	getArraySize (<guitar_array>)
	if (<guitar_index> = <array_Size>)
		<guitar_index> = 0
	endif
	store_guitar_name :SetTags guitar_index = <guitar_index>
	bonus_index = <guitar_index>
	find_guitar_index_by_id Id = (<guitar_array> [<bonus_index>].Id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [<bonus_index>].price) for_finishes = <for_finishes>
	Change \{store_guitar_scroll_ready = 1}
endscript

script find_guitar_index_by_id 
	get_musician_instrument_size
	find_index = 0
	begin
	get_musician_instrument_struct Index = <find_index>
	if (<info_struct>.desc_id = <Id>)
		return guitar_index = (<find_index>)
	endif
	<find_index> = (<find_index> + 1)
	repeat (<array_Size>)
	printStruct <...>
	Scriptassert \{"Didn't find the guitar!"}
endscript
store_last_index_update = 0
store_goal_index = 0
store_true_index = -1

script store_show_guitar \{guitar_index = 0 for_finishes = 0}
	store_update_guitar_blackout
	get_musician_instrument_struct Index = <guitar_index>
	GetUppercaseString (<info_struct>.Name)
	setScreenElementProps Id = store_guitar_name Text = <UppercaseString>
	getScreenElementDims \{Id = store_guitar_name}
	store_guitar_name :SetProps \{scale = (1.0, 1.0) relative_scale}
	getScreenElementDims \{Id = store_guitar_name}
	if (<width> >= 280.0)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_guitar_name :SetProps scale = <new_scale> relative_scale
	endif
	GetUppercaseString (<info_struct>.logo)
	setScreenElementProps Id = store_guitar_name_brand Text = <UppercaseString>
	if (<for_finishes> = 1)
		GetUppercaseString (<info_struct>.finish)
	else
		GetUppercaseString (<info_struct>.name2)
	endif
	store_guitar_finish_name :SetProps Text = <UppercaseString>
	store_guitar_finish_name :SetProps \{scale = (1.0, 1.0) relative_scale}
	getScreenElementDims \{Id = store_guitar_finish_name}
	if (<width> >= 250.0)
		new_scale = ((250.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_guitar_finish_name :SetProps scale = <new_scale> relative_scale
	endif
	set_store_purchase_price price = <price>
	Change store_goal_index = <guitar_index>
	store_guitar_name :getTags
	GetStartTime
	Change store_last_index_update = (<startTime>)
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb Id = ((<guitar_array> [<guitar_index>]).Id)
	select_guitar_change_blurb_text inst_id = (($musician_instrument [<guitar_index>]).desc_id) x_dims = 430 pos = (-115.0, 355.0) Dims = (388.0, 265.0) Z = 50
endscript

script store_update_guitar_blackout 
	store_guitar_name :getTags
	guitar_id = (<guitar_array> [<guitar_index>].Id)
	getglobaltags <guitar_id>
endscript
store_guitar_loading = 0

script store_monitor_goal_guitar_index 
	begin
	if NOT ($store_true_index = $store_goal_index)
		Change store_true_index = ($store_goal_index)
		Change \{store_guitar_loading = 1}
		store_do_guitar_load guitar_index = ($store_goal_index)
		Change \{store_guitar_loading = 0}
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script store_monitor_goal_guitar_finish 
	UnPauseSpawnedScript \{store_monitor_goal_guitar_index}
	begin
	if ($store_guitar_loading = 0)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	Change \{store_guitar_loading = 1}
	killspawnedScript \{Name = store_monitor_goal_guitar_index}
	if compositeObjectexists \{store_display_guitar}
		store_display_guitar :DIE
	endif
	UnloadPakAsync pak_name = ($store_loaded_guitar_pak) Heap = heap_instrument1 async = 1
	Change \{store_guitar_loading = 0}
endscript
store_loaded_guitar_pak = ''

script store_update_already_bought_for_guitar 
	store_guitar_name :getTags
	guitar_id = (<guitar_array> [<guitar_index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked>)
		store_show_already_owned unlocked_for_purchase = <unlocked_for_purchase>
	else
		store_hide_already_owned
	endif
endscript

script create_store_guitar_finishes_menu 
	mark_unsafe_for_shutdown
	Change \{target_store_camera_prop = guitar_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	setScreenElementProps \{Id = store_cash_text pos = (900.0, 550.0)}
	create_store_window_frame \{pos = (900.0, 360.0) Dims = (300.0, 600.0) no_hilite}
	createScreenElement \{Type = containerElement PARENT = root_window Id = select_guitar_container pos = (893.0, -100.0)}
	createScreenElement \{Type = containerElement PARENT = root_window Id = store_guitar_container pos = (893.0, 200.0)}
	createScreenElement \{Type = WindowElement PARENT = root_window Id = store_info_scroll_window pos = $store_window_pos Dims = $store_window_dims}
	new_menu \{scrollid = sgf_scroll vmenuid = sgf_vmenu Menu_pos = (895.0, 117.0)}
	text_params = {PARENT = sgf_vmenu Type = textElement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createScreenElement {
		<text_params>
		Type = containerElement
		Text = ""
		Id = store_guitar_name_container
		Dims = (100.0, 0.0)
		event_handlers = [
			{pad_down store_guitar_next_guitar Params = {for_finishes = 1}}
			{pad_up store_guitar_previous_guitar Params = {for_finishes = 1}}
			{PAD_LEFT store_guitar_previous_guitar Params = {for_finishes = 1}}
			{pad_right store_guitar_next_guitar Params = {for_finishes = 1}}
			{pad_choose store_guitar_buy_guitar}
			{pad_back store_go_back}
		]
	}
	createScreenElement {
		<text_params>
		font = text_a4
		PARENT = store_guitar_name_container
		Id = store_guitar_name
		just = [Center Center]
		pos = (0.0, 2.0)
	}
	createScreenElement {
		<text_params>
		Type = containerElement
		Id = store_guitar_name_brand_container
		Dims = (100.0, 0.0)
	}
	createScreenElement {
		<text_params>
		font = text_a4
		rgba = [10 10 10 255]
		PARENT = store_guitar_name_brand_container
		scale = 0.6
		Id = store_guitar_name_brand
		pos = (0.0, 32.0)
		just = [Center Center]
	}
	createScreenElement {
		Type = textElement
		PARENT = store_guitar_container
		just = [Center Center]
		font = text_a4
		Text = ""
		scale = 0.7
		Id = store_guitar_finish_name
		rgba = [255 255 205 255]
		z_priority = (<text_params>.z_priority)
		pos = (0.0, 20.0)
	}
	launchevent \{Type = unfocus Target = sgf_vmenu}
	launchevent \{Type = focus Target = store_guitar_name_container}
	guitar_array = ($Bonus_Guitar_Finishes)
	getArraySize ($Bonus_Bass_Finishes)
	Index = 0
	begin
	Addarrayelement Array = (<guitar_array>) Element = ($Bonus_Bass_Finishes [<Index>])
	<guitar_array> = (<Array>)
	<Index> = (<Index> + 1)
	repeat <array_Size>
	store_prune_guitar_finishes guitar_array = <guitar_array>
	store_guitar_name :SetTags \{guitar_index = 0}
	store_guitar_name :SetTags guitar_array = <guitar_array>
	Change \{store_true_index = -1}
	find_guitar_index_by_id Id = (<guitar_array> [0].Id)
	store_show_guitar guitar_index = <guitar_index> price = (<guitar_array> [0].price) for_finishes = 1
	SpawnScriptNOw \{store_monitor_goal_guitar_index}
	store_show_price_tag pos = (520.0, 260.0) price = (<guitar_array> [0].price) rot = -10 z3d = 2
	store_update_already_bought_for_guitar
	menu_store_find_guitar_index_for_blurb Id = ((<guitar_array> [0]).Id)
	select_guitar_change_blurb_text inst_id = (($musician_instrument [<guitar_index>]).desc_id) x_dims = 430 pos = (-115.0, 355.0) Dims = (388.0, 265.0) Z = 50
	Change \{store_guitar_scroll_ready = 1}
	mark_safe_for_shutdown
endscript

script destroy_store_guitar_finishes_menu 
	killspawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = store_guitar_container}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = sgf_scroll}
	destroy_store_window_frame
	store_monitor_goal_guitar_finish
	shut_down_store_hub
endscript

script store_prune_guitar_finishes 
	unlocked_guitar_types = [NONE]
	find_guitar_index_by_id Id = ($Free_Guitars [0])
	get_musician_instrument_struct Index = <guitar_index>
	setarrayelement Arrayname = unlocked_guitar_types Index = 0 NewValue = (<info_struct>.GUITAR)
	getArraySize ($Free_Guitars)
	type_index = 1
	begin
	find_guitar_index_by_id Id = ($Free_Guitars [<type_index>])
	get_musician_instrument_struct Index = <guitar_index>
	Addarrayelement Array = (<unlocked_guitar_types>) Element = (<info_struct>.GUITAR)
	<unlocked_guitar_types> = (<Array>)
	<type_index> = (<type_index> + 1)
	repeat (<array_Size> - 1)
	getArraySize ($Free_Basses)
	type_index = 0
	begin
	find_guitar_index_by_id Id = ($Free_Basses [<type_index>])
	get_musician_instrument_struct Index = <guitar_index>
	if NOT arraycontains Array = (<unlocked_guitar_types>) Contains = (<info_struct>.BASS)
		Addarrayelement Array = (<unlocked_guitar_types>) Element = (<info_struct>.BASS)
		<unlocked_guitar_types> = (<Array>)
	endif
	<type_index> = (<type_index> + 1)
	repeat (<array_Size>)
	getArraySize ($Bonus_Basses)
	type_index = 0
	begin
	guitar_id = ($Bonus_Basses [<type_index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked>)
		find_guitar_index_by_id Id = <guitar_id>
		get_musician_instrument_struct Index = <guitar_index>
		if (<info_struct>.Type = GUITAR)
			Addarrayelement Array = (<unlocked_guitar_types>) Element = (<info_struct>.GUITAR)
		else
			Addarrayelement Array = (<unlocked_guitar_types>) Element = (<info_struct>.BASS)
		endif
		<unlocked_guitar_types> = (<Array>)
	endif
	<type_index> = (<type_index> + 1)
	repeat <array_Size>
	getArraySize ($Bonus_Guitars)
	type_index = 0
	begin
	guitar_id = ($Bonus_Guitars [<type_index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked>)
		find_guitar_index_by_id Id = <guitar_id>
		get_musician_instrument_struct Index = <guitar_index>
		if (<info_struct>.Type = GUITAR)
			Addarrayelement Array = (<unlocked_guitar_types>) Element = (<info_struct>.GUITAR)
		else
			Addarrayelement Array = (<unlocked_guitar_types>) Element = (<info_struct>.BASS)
		endif
		<unlocked_guitar_types> = (<Array>)
	endif
	<type_index> = (<type_index> + 1)
	repeat <array_Size>
	getArraySize (<guitar_array>)
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	find_guitar_index_by_id Id = <guitar_id>
	get_musician_instrument_struct Index = <guitar_index>
	if structureContains Structure = (<info_struct>) GUITAR
		guitar_type = (<info_struct>.GUITAR)
	else
		guitar_type = (<info_struct>.BASS)
	endif
	if NOT arraycontains Array = (<unlocked_guitar_types>) Contains = <guitar_type>
		RemoveArrayElement Array = (<guitar_array>) Index = <Index>
		<Index> = (<Index> - 1)
		<guitar_array> = (<Array>)
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return guitar_array = <guitar_array>
endscript

script store_add_secret_guitars_and_basses 
	getArraySize ($Secret_Guitars)
	Index = 0
	begin
	guitar_id = ($Secret_Guitars [<Index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked_for_purchase> = 1)
		Addarrayelement Array = (<guitar_array>) Element = ($Secret_Guitars [<Index>])
		<guitar_array> = (<Array>)
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	getArraySize ($Secret_Basses)
	Index = 0
	begin
	guitar_id = ($Secret_Basses [<Index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked_for_purchase> = 1)
		Addarrayelement Array = (<guitar_array>) Element = ($Secret_Basses [<Index>])
		<guitar_array> = (<Array>)
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	getArraySize ($Bonus_Basses)
	Index = 0
	begin
	Addarrayelement Array = (<guitar_array>) Element = ($Bonus_Basses [<Index>])
	<guitar_array> = (<Array>)
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return guitar_array = <guitar_array>
endscript

script store_do_guitar_load \{pos = (0.0, 0.0, 0.0) node_name = z_soundcheck_TRG_Waypoint_Guitar_Start}
	if gotParam \{guitar_index}
		if gotParam \{node_index}
			get_waypoint_id Index = <node_index>
			GetWaypointPos Name = <waypoint_id>
		else
			if gotParam \{node_name}
				GetWaypointPos Name = <node_name>
			endif
		endif
		existed = 0
		if compositeObjectexists \{store_display_guitar}
			if gotParam \{useOldPos}
				store_display_guitar :Obj_GetPosition
			endif
			store_display_guitar :DIE
			<existed> = 1
		endif
		guitar_pos = <pos>
		get_musician_instrument_struct Index = <guitar_index>
		unformatted_meshname = (<info_struct>.mesh)
		stringremove Text = (<unformatted_meshname>) Remove = 'models\\' new_string = meshname
		find_loaded_pak_file Type = instrument desc_id = (<info_struct>.desc_id)
		if (<found> = 0)
			if (<existed> = 1)
				UnloadPakAsync pak_name = ($store_loaded_guitar_pak) Heap = heap_instrument1 async = 1
			endif
			LoadPakAsync pak_name = (<info_struct>.pak) Heap = heap_instrument1 async = 1
			Change store_loaded_guitar_pak = (<info_struct>.pak)
		endif
		if gotParam \{meshname}
			scale = 1.25
			if (<info_struct>.desc_id = Instrument_Guitar_Demonik)
				<scale> = 0.8
				<guitar_pos> = (<guitar_pos> + (0.0, 0.15, 0.0))
			endif
			if (<info_struct>.desc_id = Instrument_Pend)
				<guitar_pos> = (<guitar_pos> - (0.0, 0.1, 0.0))
			endif
			CreateCompositeObject {
				components = [
					{
						component = Skeleton
						skeletonName = GH3_guitarist_axel
					}
					{
						component = setdisplaymatrix
					}
					{
						component = model
						lightGroup = GUITAR_CENTER
					}
				]
				Params = {
					pos = (<guitar_pos> + (0.6, -0.14, 0.0))
					<info_struct>
					object_type = hud_model_3d
					Name = store_display_guitar
					model = <meshname>
					scale = <scale>
				}
			}
			Profile = {
				<info_struct>
				musician_instrument = {desc_id = (<info_struct>.desc_id)}
			}
			store_display_guitar :Obj_SpawnscriptNow RotateGuitar Params = {guitar_pos = <guitar_pos> scale = (<scale> / 1.25)}
			store_display_guitar :Obj_InitModelFromProfile {
				Struct = <Profile>
				buildScript = create_ped_model_from_appearance
				Params = {
					lightGroup = GUITAR_CENTER_GUITAR
				}
			}
		endif
	endif
endscript

script RotateGuitar 
	pos = (<guitar_pos> + (0.0, -0.14, 0.2))
	rotation = -75.0
	begin
	vrotate = ((0.0, 0.0, 0.53) * <scale>)
	RotateVector vector = <vrotate> ry = (90 - <rotation>)
	store_display_guitar :Obj_SetOrientation Z = -90 X = <rotation>
	store_display_guitar :Obj_SetPosition Position = (<pos> + <result_vector>)
	rotation = (<rotation> + 1.0)
	if (<rotation> > 360.0)
		<rotation> = (<rotation> - 360.0)
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script store_show_price_tag \{PARENT = root_window price = 23 pos = (0.0, 0.0) Z = 10 rot = 0 z3d = 1}
	destroy_store_price_tag
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		pos = <pos>
		Id = store_price_tag_container
		z_priority = <Z>
		Rot_Angle = <rot>
	}
	tex = store_tag_price
	if gotParam \{sold}
		<tex> = store_tag_sold
	else
		formatText Textname = price_text "$%d" D = <price>
		createScreenElement {
			Type = textElement
			PARENT = store_price_tag_container
			Id = store_price_tag_text
			Text = <price_text>
			z_priority = 1
			font = text_A5
			pos = (65.0, 8.0)
			rgba = [7 108 4 255]
			Rot_Angle = 7
		}
		<Id> :SetTags tag_price = 0
	endif
	createScreenElement {
		Type = spriteElement
		PARENT = store_price_tag_container
		Id = store_price_tag
		texture = <tex>
		just = [Center Center]
		rgba = [255 255 255 255]
		Dims = (384.0, 192.0)
		z_priority = 0
	}
	store_price_tag :SetProps z3d = <z3d>
	store_price_tag_text :SetProps z3d = (<z3d> - 0.1)
endscript

script destroy_store_price_tag 
	destroy_menu \{menu_id = store_price_tag_container}
endscript

script store_show_already_owned \{unlocked_for_purchase = 1 for_character = 0}
	if ScreenelementExists \{Id = store_price_tag}
		if (<for_character> = 0)
			store_price_tag :SetProps \{texture = store_tag_sold z3d = 1}
		else
			store_price_tag :SetProps \{texture = store_tag_sold z3d = 1}
		endif
	endif
	if ScreenelementExists \{Id = store_price_tag_text}
		if (<for_character> = 0)
			store_price_tag_text :SetProps \{z3d = 0.9}
		else
			store_price_tag_text :SetProps \{z3d = 0.9}
		endif
		if (<unlocked_for_purchase>)
			store_price_tag_text :SetProps \{Text = "SOLD" rgba = [170 90 35 255]}
		endif
		setScreenElementProps \{Id = store_price_tag_text scale = 1}
		fit_text_in_rectangle \{Id = store_price_tag_text Dims = (130.0, 90.0)}
	endif
endscript

script store_hide_already_owned \{for_character = 0}
	if ScreenelementExists \{Id = store_price_tag}
		if (<for_character> = 0)
			store_price_tag :SetProps \{texture = store_tag_price z3d = 2}
		else
			store_price_tag :SetProps \{texture = store_tag_price z3d = 5}
		endif
		if ScreenelementExists \{Id = store_price_tag_text}
			if (<for_character> = 0)
				store_price_tag_text :SetProps \{rgba = [7 108 4 255] z3d = 1.9}
			else
				store_price_tag_text :SetProps \{rgba = [7 108 4 255] z3d = 4.9}
			endif
			setScreenElementProps \{Id = store_price_tag_text scale = 1}
			fit_text_in_rectangle \{Id = store_price_tag_text Dims = (150.0, 90.0)}
		endif
	endif
endscript

script create_store_videos_menu 
	mark_unsafe_for_shutdown
	Change \{target_store_camera_prop = song_selection}
	setup_store_hub \{cash_pos = (-2000.0, -2000.0)}
	store_camera_wait
	setScreenElementProps \{Id = store_cash_text pos = (900.0, 550.0)}
	create_store_window_frame \{pos = (900.0, 360.0) Dims = (300.0, 600.0) no_hilite}
	createScreenElement \{Type = containerElement PARENT = root_window Id = select_guitar_container pos = (893.0, -100.0)}
	createScreenElement \{Type = containerElement PARENT = root_window Id = store_videos_container pos = (900.0, 215.0)}
	createScreenElement {
		Type = WindowElement
		PARENT = root_window
		Id = store_info_scroll_window
		pos = ($store_window_pos + (0.0, 60.0))
		Dims = ($store_window_dims - (0.0, 70.0))
	}
	new_menu \{scrollid = sv_scroll vmenuid = sv_vmenu}
	text_params = {PARENT = sv_vmenu Type = textElement font = ($store_menu_font) rgba = [170 90 35 255] z_priority = 50 no_shadow}
	createScreenElement {
		<text_params>
		Text = ""
		event_handlers = [
			{PAD_LEFT store_videos_right}
			{pad_right store_videos_left}
			{pad_down store_videos_right}
			{pad_up store_videos_left}
			{pad_choose store_videos_buy}
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
		]
		Id = store_videos_menu_holder
	}
	createScreenElement {
		Type = textElement
		PARENT = store_videos_container
		just = [Center Center]
		font = ($store_menu_font)
		Text = ""
		scale = 1.0
		Id = store_videos_artist
		rgba = [170 90 35 255]
		z_priority = (<text_params>.z_priority)
		pos = (-5.0, -67.0)
	}
	<Id> :SetTags videos_index = 0
	createScreenElement \{Type = spriteElement PARENT = store_videos_container texture = store_video_generic pos = (-500.0, 120.0) just = [Center Center] Dims = (384.0, 384.0) z3d = 1.5}
	store_show_price_tag \{PARENT = store_videos_container pos = (-340.0, 100.0) rot = -10}
	launchevent \{Type = unfocus Target = sv_vmenu}
	launchevent \{Type = focus Target = store_videos_menu_holder}
	set_store_videos_title \{Index = 0}
	mark_safe_for_shutdown
endscript

script destroy_store_videos_menu 
	killspawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_store_price_tag
	destroy_menu \{menu_id = store_info_scroll_window}
	destroy_menu \{menu_id = store_videos_container}
	destroy_menu \{menu_id = sv_scroll}
	destroy_store_window_frame
	shut_down_store_hub
endscript

script set_store_videos_title \{Index = 0}
	store_videos_artist :SetTags videos_index = <Index>
	videos_checksum = ($Bonus_videos [<Index>].Id)
	select_guitar_change_blurb_text Text = ($Bonus_videos [<Index>].info) x_dims = 430 pos = (-115.0, 320.0) Dims = (388.0, 300.0) Z = 50 lines_in_window = 9
	setScreenElementProps {
		Id = store_videos_artist
		Text = ($Bonus_videos [<Index>].Name)
	}
	store_videos_artist :SetProps \{scale = (1.0, 1.0) relative_scale}
	getScreenElementDims \{Id = store_videos_artist}
	if (<width> >= 280.0)
		new_scale = ((280.0 / <width>) * (1.0, 0.0) + (0.0, 1.0))
		store_videos_artist :SetProps scale = <new_scale> relative_scale
	endif
	video_price = ($Bonus_videos [<Index>].price)
	set_store_purchase_price price = (<video_price>)
	store_hide_already_owned
	getglobaltags <videos_checksum>
	if (<unlocked> = 1)
		store_show_already_owned
	endif
endscript

script store_videos_left 
	store_videos_artist :getTags
	<videos_index> = (<videos_index> - 1)
	getArraySize ($Bonus_videos)
	if (<videos_index> < 0)
		<videos_index> = (<videos_index> + <array_Size>)
	endif
	generic_menu_up_or_down_sound \{Up}
	set_store_videos_title Index = (<videos_index>)
endscript

script store_videos_right 
	store_videos_artist :getTags
	<videos_index> = (<videos_index> + 1)
	get_progression_globals game_mode = ($game_mode) Bonus
	getArraySize ($Bonus_videos)
	if (<videos_index> = <array_Size>)
		<videos_index> = 0
	endif
	generic_menu_up_or_down_sound \{Down}
	set_store_videos_title Index = (<videos_index>)
endscript

script store_videos_buy 
	store_videos_artist :getTags
	video_checksum = ($Bonus_videos [<videos_index>].Id)
	video_price = ($Bonus_videos [<videos_index>].price)
	getglobaltags <video_checksum>
	if (<unlocked> = 0)
		get_current_band_info
		getglobaltags <band_info>
		if ((<Cash> > <video_price>) || (<Cash> = <video_price>))
			<Cash> = (<Cash> - <video_price>)
			setGlobalTags <band_info> Params = {Cash = <Cash>}
			setGlobalTags <video_checksum> Params = {unlocked = 1}
			store_update_band_cash
			set_store_videos_title Index = (<videos_index>)
			Change \{store_autosave_required = 1}
			Soundevent \{Event = Cash_Sound}
		endif
	endif
endscript

script rotate_element_360 \{Id = store_songs_album_45 Time = 5 element_angle = 360}
	if ScreenelementExists Id = <Id>
		getScreenElementProps Id = <Id>
		rot_360 = (<Rot_Angle> + <element_angle>)
		<Id> :doMorph Rot_Angle = <rot_360> Time = <Time> Motion = ease_out
	endif
endscript
