guitar_select_available_guitar_array = [
]
guitar_select_available_bass_array = [
]
guitar_select_guitar_indeces = [
]
guitar_select_bass_indeces = [
]
g_old_selected_guitar_index_p1 = 0
g_old_selected_guitar_index_p2 = 0
guitar_select_old_guitar_p1 = 0
guitar_select_old_guitar_p2 = 0
guitar_select_highlighted_guitar_p1 = 0
guitar_select_highlighted_guitar_p2 = 0
guitar_select_total_num_guitars = 0
gs_selected_brand_p1 = 0
gs_old_selected_brand_p1 = 0
gs_selected_brand_p2 = 0
gs_old_selected_brand_p2 = 0
gs_made_first_selection_bool_p1 = 0
gs_made_first_selection_bool_p2 = 0
gs_guitar_brand_ID_p1 = NULL
gs_guitar_finish_ID_p1 = NULL
gs_guitar_brand_ID_p2 = NULL
gs_guitar_finish_ID_p2 = NULL
gh_net_finish_id = 0
online_guitar_highlighted_id_p1 = Instrument_ES335_Red
online_guitar_highlighted_id_p2 = Instrument_ES335_Red
online_old_guitar_id_p1 = Instrument_ES335_Red
online_old_guitar_id_p2 = Instrument_ES335_Red
gs_instrument_blurb_text = "DEFAULT INSTRUMENT BLURB"
gs_select_text = "SELECT GUITAR"
gs_element_offsets = [
	(0.0, 125.0)
	(-4.0, 185.0)
	(-4.0, 200.0)
	(-4.0, 268.0)
	(-100.0, 304.0)
	(0.0, 612.0)
]

script create_select_bass_menu 
	create_select_guitar_menu Player = <Player> instrument_type = BASS
endscript

script create_select_guitar_menu \{Player = 1 instrument_type = GUITAR}
	if (<Player> = 1)
		Change \{gs_made_first_selection_bool_p1 = 0}
	else
		Change \{gs_made_first_selection_bool_p2 = 0}
	endif
	build_gs_available_guitar_array <...>
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	if find_profile_by_id Id = ($<player_status>.character_id)
		get_musician_profile_struct Index = <Index>
		formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
		if getglobaltags <default_characterguitartag> noassert = 1
			if ((<instrument_type> = BASS))
				if (<current_instrument> = GUITAR)
					Change StructureName = <player_status> instrument_id = <current_selected_bass>
					setGlobalTags <default_characterguitartag> Params = {current_instrument = BASS}
					formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
					Change globalName = <change_flag> NewValue = 1
				endif
				elseif ((<instrument_type> = GUITAR))
				if (<current_instrument> = BASS)
					Change StructureName = <player_status> instrument_id = <current_selected_guitar>
					setGlobalTags <default_characterguitartag> Params = {current_instrument = GUITAR}
					formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
					Change globalName = <change_flag> NewValue = 1
				endif
			endif
		endif
	endif
	if (<instrument_type> = GUITAR)
		formatText \{Checksumname = guitar_select_available_instruments 'guitar_select_available_guitar_array'}
	else
		formatText \{Checksumname = guitar_select_available_instruments 'guitar_select_available_bass_array'}
	endif
	select_guitar_build_brand_array instrument_type = GUITAR gs_available_instruments = <guitar_select_available_instruments> Player = <Player>
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up gs_scroll_up_or_down Params = {
				Player = <Player>
				Dir = Up
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
		{pad_down gs_scroll_up_or_down Params = {
				Player = <Player>
				Dir = Down
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
		{pad_back select_guitar_go_back Params = {
				Player = <Player>
				gs_available_instruments = <guitar_select_available_instruments>
				instrument_type = <instrument_type>
			}
		}
		{pad_choose select_guitar_choose Params = {
				guitar_index = $guitar_select_highlighted_guitar_p1
				Player = <Player>
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
	]
	if (<Player> = 1)
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_select_guitar_p1
				vmenuid = vmenu_select_guitar_p1
				Menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
				no_focus = 1
			}
			vparent = vmenu_select_guitar_p1
		else
			new_menu {
				scrollid = scrolling_select_guitar_p1
				vmenuid = vmenu_select_guitar_p1
				Menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
				exclusive_device = <exclusive_dev>
				no_focus = 1
			}
			vparent = vmenu_select_guitar_p1
		endif
	else
		new_menu {
			scrollid = scrolling_select_guitar_p2
			vmenuid = vmenu_select_guitar_p2
			Menu_pos = (700.0, 120.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_dev>
			no_focus = 1
		}
		if ($is_network_game = 1)
			vmenu_select_guitar_p2 :SetProps \{disable_pad_handling}
			launchevent \{Type = unfocus Target = vmenu_select_guitar_p2}
		endif
		vparent = vmenu_select_guitar_p2
	endif
	if ($current_num_players = 1)
		formatText Checksumname = player_status 'player%i_status' I = <Player>
		their_instrument_id = ($<player_status>.instrument_id)
		get_instrument_name_and_index Id = <their_instrument_id>
		select_guitar_get_available_index_from_total_index Index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
		Change guitar_select_highlighted_guitar_p1 = <Index>
		Change guitar_select_old_guitar_p1 = <Index>
		get_musician_instrument_struct Index = <instrument_index>
		Change gs_instrument_blurb_text = (<info_struct>.blurb)
		createScreenElement \{Type = containerElement Id = select_guitar_container PARENT = root_window pos = (386.0, 0.0)}
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<cs_menu_starting_pos> = (0.0, 110.0)
		displaySprite {
			PARENT = select_guitar_container
			tex = window_frame_cap
			pos = <cs_menu_starting_pos>
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = select_guitar_container
			tex = window_fill_cap
			pos = <cs_menu_starting_pos>
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <window_fill_color>
			Z = 0
		}
		displaySprite {
			PARENT = select_guitar_container
			tex = window_header_01
			pos = (<cs_menu_starting_pos> + (0.0, -40.0))
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = [200 200 200 255]
			Z = 1
		}
		displaySprite {
			PARENT = select_guitar_container
			tex = window_frame_body_tall
			pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			Dims = (256.0, 434.0)
			just = [Center top]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = select_guitar_container
			tex = window_fill_body_large
			pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			Dims = (256.0, 498.0)
			just = [Center top]
			rgba = <window_fill_color>
			Z = 0
		}
		createScreenElement {
			Type = spriteElement
			PARENT = select_guitar_container
			pos = (<cs_menu_starting_pos> + (-2.0, 430.0))
			Dims = (242.0, 128.0)
			just = [Center top]
			texture = store_frame_bottom_bg
			z_priority = 1
			rgba = <brown_window_color>
			flip_h
			flip_v
		}
		displayText {
			PARENT = select_guitar_container
			Text = "SELECT GUITAR"
			pos = ($gs_element_offsets [0])
			scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = [185 100 60 255]
			Z = 1
		}
		displaySprite {
			Id = gs_brand_background
			PARENT = select_guitar_container
			tex = Char_Select_Frame_BG
			pos = ($gs_element_offsets [2])
			Dims = (266.0, 128.0)
			just = [Center Center]
			rgba = [250 250 200 255]
			Z = 1
		}
		get_instrument_brand_and_finish Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		displayText {
			PARENT = select_guitar_container
			Text = <instrument_brand>
			pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
			scale = 1
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = [160 80 30 255]
			Z = 2
		}
		Change gs_guitar_brand_ID_p1 = <Id>
		getScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
		if (<width> > 260)
			setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
			fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		createScreenElement {
			Type = textblockelement
			PARENT = select_guitar_container
			Text = <instrument_name2>
			pos = ($gs_element_offsets [3])
			scale = (0.55, 0.55)
			Dims = (440.0, 300.0)
			font = text_a4
			just = [Center Center]
			rgba = [255 255 200 255]
			Z = 2
		}
		Change gs_guitar_finish_ID_p1 = <Id>
		get_instrument_logo Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		displayText {
			Id = gs_guitar_logo_ID_p1
			PARENT = select_guitar_container
			Text = <instrument_logo>
			pos = ($gs_element_offsets [5])
			scale = 0.8
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = [250 250 200 255]
			Z = 2
		}
		createScreenElement {
			Type = WindowElement
			PARENT = select_guitar_container
			Id = gs_instrument_info_scroll_window
			pos = ($gs_element_offsets [4])
			Dims = (388.0, 250.0)
		}
		SpawnScriptNOw {
			select_guitar_scroll_instrument_info
			Params = {
				PARENT = gs_instrument_info_scroll_window
				pos = (($gs_element_offsets [4]) + (0.0, -10.0))
			}
		}
	else
		if (<instrument_type> = GUITAR)
			Change \{gs_select_text = "SELECT GUITAR"}
			elseif (<instrument_type> = BASS)
			Change \{gs_select_text = "SELECT BASS"}
		endif
		if (<Player> = 1)
			formatText Checksumname = player_status 'player%i_status' I = <Player>
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
				if getglobaltags <default_characterguitartag> noassert = 1
					if (<instrument_type> = GUITAR)
						<their_instrument_id> = <current_selected_guitar>
					else
						<their_instrument_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index Id = <their_instrument_id>
					select_guitar_get_available_index_from_total_index Index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
					Change guitar_select_highlighted_guitar_p1 = <Index>
					Change guitar_select_old_guitar_p1 = <Index>
					if NOT (<their_instrument_id> = $<player_status>.instrument_id)
						killspawnedScript \{Name = Store_Update_Player_Status}
						SpawnScriptNOw Store_Update_Player_Status Params = {Player = <Player> instrument_id = <their_instrument_id>}
					endif
				endif
			endif
			createScreenElement \{Type = containerElement Id = select_guitar_container PARENT = root_window pos = (460.0, 500.0)}
			displaySprite \{PARENT = select_guitar_container tex = guitar_select_2p_frame just = [Center Center] Dims = (256.0, 432.0) pos = (0.0, 40.0) Z = 0}
			displaySprite \{PARENT = select_guitar_container tex = guitar_select_2p_wing just = [Center Center] pos = (140.0, -24.0) Z = 0}
			displaySprite \{PARENT = select_guitar_container tex = guitar_select_2p_wing just = [Center Center] pos = (-140.0, -24.0) Z = 0 flip_v}
			displayText \{Id = gs_select_guitar_text_p1 PARENT = select_guitar_container Text = $gs_select_text pos = (0.0, -30.0) scale = (0.5, 0.43) font = fontgrid_title_gh3 just = [Center Center] rgba = [175 105 40 255] Z = 1}
			displaySprite \{Id = gs_brand_background_p1 PARENT = select_guitar_container tex = Char_Select_Frame_BG pos = (0.0, 30.0) Dims = (266.0, 128.0) just = [Center Center] rgba = [250 250 200 255] Z = 1}
			displaySprite \{Id = gs_finish_background_p1 PARENT = select_guitar_container tex = White pos = (0.0, 88.0) Dims = (266.0, 32.0) just = [Center Center] rgba = [120 0 0 255] Z = 1}
			get_instrument_brand_and_finish Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
			displayText {
				PARENT = select_guitar_container
				Text = <instrument_brand>
				pos = (0.0, 10.0)
				scale = 1
				font = text_a4
				just = [Center Center]
				rgba = [80 0 10 255]
				Z = 2
				noshadow
			}
			Change gs_guitar_brand_ID_p1 = <Id>
			getScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			get_instrument_logo Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
			displayText {
				Id = gs_guitar_logo_ID_p1
				PARENT = select_guitar_container
				Text = <instrument_logo>
				pos = (0.0, 40.0)
				scale = 0.6
				font = text_a4
				just = [Center Center]
				rgba = [0 0 0 255]
				Z = 2
				noshadow
			}
			displayText {
				PARENT = select_guitar_container
				Text = <instrument_name2>
				pos = (0.0, 83.0)
				scale = (0.75, 0.5)
				font = text_a4
				just = [Center Center]
				rgba = [250 250 200 255]
				Z = 2
				noshadow
			}
			Change gs_guitar_finish_ID_p1 = <Id>
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p1 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 83.0)
			endif
		else
			formatText Checksumname = player_status 'player%i_status' I = <Player>
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
				if getglobaltags <default_characterguitartag> noassert = 1
					if (<instrument_type> = GUITAR)
						<their_instrument_id> = <current_selected_guitar>
					else
						<their_instrument_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index Id = <their_instrument_id>
					select_guitar_get_available_index_from_total_index Index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
					Change guitar_select_highlighted_guitar_p2 = <Index>
					Change guitar_select_old_guitar_p2 = <Index>
					if NOT (<their_instrument_id> = $<player_status>.instrument_id)
						killspawnedScript \{Name = Store_Update_Player_Status}
						SpawnScriptNOw Store_Update_Player_Status Params = {Player = <Player> instrument_id = <their_instrument_id>}
					endif
				endif
			endif
			createScreenElement \{Type = containerElement Id = select_guitar_container_p2 PARENT = root_window pos = (810.0, 500.0)}
			displaySprite \{PARENT = select_guitar_container_p2 tex = guitar_select_2p_frame just = [Center Center] Dims = (256.0, 432.0) pos = (0.0, 40.0) Z = 0}
			displaySprite \{PARENT = select_guitar_container_p2 tex = guitar_select_2p_wing just = [Center Center] pos = (140.0, -24.0) Z = 0}
			displaySprite \{PARENT = select_guitar_container_p2 tex = guitar_select_2p_wing just = [Center Center] pos = (-140.0, -24.0) Z = 0 flip_v}
			displayText \{Id = gs_select_guitar_text_p2 PARENT = select_guitar_container_p2 Text = $gs_select_text pos = (0.0, -30.0) scale = (0.5, 0.43) font = fontgrid_title_gh3 just = [Center Center] rgba = [140 110 150 255] Z = 1}
			displaySprite \{Id = gs_brand_background_p2 PARENT = select_guitar_container_p2 tex = Char_Select_Frame_BG pos = (0.0, 30.0) Dims = (266.0, 128.0) just = [Center Center] rgba = [240 210 250 255] Z = 1}
			displaySprite \{Id = gs_finish_background_p2 PARENT = select_guitar_container_p2 tex = White pos = (0.0, 88.0) Dims = (266.0, 32.0) just = [Center Center] rgba = [110 0 90 255] Z = 1}
			get_instrument_brand_and_finish Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p2])
			displayText {
				PARENT = select_guitar_container_p2
				Text = <instrument_brand>
				pos = (0.0, 10.0)
				scale = 1
				font = text_a4
				just = [Center Center]
				rgba = [70 0 50 255]
				Z = 2
				noshadow
			}
			Change gs_guitar_brand_ID_p2 = <Id>
			getScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_brand_ID_p2 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			get_instrument_logo Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p2])
			displayText {
				Id = gs_guitar_logo_ID_p2
				PARENT = select_guitar_container_p2
				Text = <instrument_logo>
				pos = (0.0, 40.0)
				scale = 0.6
				font = text_a4
				just = [Center Center]
				rgba = [0 0 0 255]
				Z = 2
				noshadow
			}
			displayText {
				PARENT = select_guitar_container_p2
				Text = <instrument_name2>
				pos = (0.0, 83.0)
				scale = (0.75, 0.5)
				font = text_a4
				just = [Center Center]
				rgba = [240 210 250 255]
				Z = 2
				noshadow
			}
			Change gs_guitar_finish_ID_p2 = <Id>
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p2 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 83.0)
			endif
		endif
	endif
	if (<Player> = 1)
		get_instrument_name_and_index Id = ($player1_status.instrument_id)
		Change g_old_selected_guitar_index_p1 = <instrument_index>
	else
		get_instrument_name_and_index Id = ($player2_status.instrument_id)
		Change g_old_selected_guitar_index_p2 = <instrument_index>
	endif
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	if ($current_num_players = 1)
		Change \{using_guitar_select_camera = 1}
		Change \{lock_guitar_select_camera = 1}
		char_name = ($<player_status>.band_Member)
		launchevent Type = unfocus Target = <vparent>
		if compositeObjectexists Name = <char_name>
			<char_name> :Ragdoll_MarkForReset
			<char_name> :handle_change_stance stance = Stance_FrontEnd_Guitar speed = 2.0 No_wait
		endif
		PlayIGCCam \{Id = gs_view_cam_id Name = gs_view_cam viewport = Bg_Viewport controlscript = guitar_select_camera_morph lockto = World pos = (10.0, 5.0, 1.580106) quat = (0.028251, -0.9906429, 0.13347001) fov = 72.0 play_hold = 1 interrupt_current Time = 0.5}
		begin
		if ($lock_guitar_select_camera = 0)
			break
		else
			Wait \{1 GameFrame}
		endif
		repeat
	endif
	launchevent Type = focus Target = <vparent>
endscript
using_guitar_select_camera = 0
lock_guitar_select_camera = 0

script guitar_select_camera_morph 
	Change \{lock_guitar_select_camera = 1}
	CCam_DoMorph \{lockto = World pos = (2.503113, 1.0385579, 2.869411) quat = (0.028074998, -0.999026, 0.020287) fov = 78.0}
	CCam_WaitMorph
	CCam_DoMorph \{lockto = GUITARIST LockToBone = bone_guitar_neck pos = (0.05, 0.6, -0.4) quat = (0.48735002, 0.463712, -0.514474) fov = 120.0 Time = 0.5 Motion = smooth}
	ScreenFX_AddFXInstance \{viewport = Bg_Viewport Name = GSdof scefName = DoF Time = 0.5 Type = DoF On = 1 BackDist = 0.003 Strength = 0.6 BlurRadius = 6 BlurResolution = half}
	ScreenFX_AddFXInstance \{viewport = Bg_Viewport Name = GSdof2 scefName = dof2 Time = 0.5 Type = DoF On = 1 BackDist = 0.01 Strength = 1.0 BlurRadius = 6 BlurResolution = half}
	CCam_WaitMorph
	CCam_Freeze
	Change \{lock_guitar_select_camera = 0}
endscript

script select_guitar_build_brand_array \{instrument_type = GUITAR Player = 1}
	getArraySize <gs_available_instruments> globalArray
	<our_array_size> = <array_Size>
	get_musician_instrument_size
	<their_array_size> = <array_Size>
	gs_available_brands = []
	<I> = 0
	begin
	<J> = 0
	begin
	get_musician_instrument_struct Index = <J>
	if (($<gs_available_instruments> [<I>]) = (<info_struct>.desc_id))
		<K> = 0
		<found_brand> = 0
		getArraySize (<gs_available_brands>)
		if (<array_Size> > 0)
			begin
			if ((<gs_available_brands> [<K>]) = (<info_struct>.Name))
				<found_brand> = 1
				formatText Checksumname = player_status 'player%i_status' I = <Player>
				if (($<player_status>.instrument_id) = (<info_struct>.desc_id))
					if (<Player> = 1)
						Change gs_selected_brand_p1 = <K>
					else
						Change gs_selected_brand_p2 = <K>
					endif
				endif
				break
			endif
			<K> = (<K> + 1)
			repeat <array_Size>
		endif
		if (<found_brand> = 0)
			Addarrayelement Array = (<gs_available_brands>) Element = (<info_struct>.Name)
			<gs_available_brands> = (<Array>)
			formatText Checksumname = player_status 'player%i_status' I = <Player>
			if (($<player_status>.instrument_id) = (<info_struct>.desc_id))
				if (<Player> = 1)
					Change gs_selected_brand_p1 = <array_Size>
				else
					Change gs_selected_brand_p2 = <array_Size>
				endif
			endif
		endif
	endif
	<J> = (<J> + 1)
	repeat <their_array_size>
	<I> = (<I> + 1)
	repeat <our_array_size>
	return gs_available_brands = <gs_available_brands>
endscript

script select_guitar_build_finish_array \{instrument_type = GUITAR}
	getArraySize <gs_available_instruments> globalArray
	<our_array_size> = <array_Size>
	get_musician_instrument_size
	<their_array_size> = <array_Size>
	gs_available_finishes = []
	<I> = 0
	begin
	<J> = 0
	begin
	get_musician_instrument_struct Index = <J>
	if (($<gs_available_instruments> [<I>]) = (<info_struct>.desc_id))
		get_instrument_brand_and_finish Id = (<info_struct>.desc_id)
		if (<instrument_brand> = <brand>)
			Addarrayelement Array = (<gs_available_finishes>) Element = (<info_struct>.desc_id)
			<gs_available_finishes> = (<Array>)
		endif
	endif
	<J> = (<J> + 1)
	repeat <their_array_size>
	<I> = (<I> + 1)
	repeat <our_array_size>
	return gs_available_finishes = <gs_available_finishes>
endscript

script destroy_select_guitar_menu \{Player = 1}
	if (<Player> = 1)
		destroy_menu \{menu_id = scrolling_select_guitar_p1}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
		if ($current_num_players = 1)
			killspawnedScript \{Name = select_guitar_scroll_instrument_info}
		endif
		destroy_menu \{menu_id = gs_instrument_info_scroll_window}
		destroy_menu \{menu_id = select_guitar_container}
		destroy_menu \{menu_id = select_finish_container}
	else
		destroy_menu \{menu_id = scrolling_select_guitar_p2}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
		destroy_menu \{menu_id = select_guitar_container_p2}
		destroy_menu \{menu_id = select_finish_container_p2}
	endif
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	<band_Member> = ($<player_status>.band_Member)
	if compositeObjectexists Name = <band_Member>
		if <band_Member> :Anim_AnimNodeExists Id = BodyTimer
			<band_Member> :Anim_Command Target = BodyTimer Command = Timer_SetSpeed Params = {speed = 1.0}
		endif
	endif
	if ($current_num_players = 1)
		killcamanim \{Name = gs_view_cam}
	endif
endscript
guitar_select_camera_changing = 0

script guitar_select_exit_camera_morph 
	Change \{guitar_select_camera_changing = 1}
	CCam_DoMorph \{lockto = GUITARIST LockToBone = bone_guitar_neck pos = (0.05, 0.618989, -0.4) quat = (0.48735002, 0.463712, -0.514474) fov = 120.0 Motion = smooth}
	CCam_WaitMorph
	CCam_DoMorph \{lockto = World pos = (2.503113, 1.0385579, 2.869411) quat = (0.028074998, -0.999026, 0.020287) fov = 78.0 Time = 0.5 Motion = smooth}
	ScreenFX_UpdateFXInstanceParams \{viewport = Bg_Viewport Name = GSdof Time = 0.5 Type = DoF On = 1 BackDist = 0.003 Strength = 0 BlurRadius = 6 BlurResolution = half}
	ScreenFX_UpdateFXInstanceParams \{viewport = Bg_Viewport Name = GSdof2 Time = 0.5 Type = DoF On = 1 BackDist = 0.01 Strength = 0 BlurRadius = 6 BlurResolution = half}
	CCam_WaitMorph
	ScreenFX_RemoveFXInstance \{viewport = Bg_Viewport Name = GSdof}
	ScreenFX_RemoveFXInstance \{viewport = Bg_Viewport Name = GSdof2 Time = 2}
	Change \{guitar_select_camera_changing = 0}
endscript

script wait_for_guitar_select_exit_camera 
	Wait \{5 gameframes}
	begin
	if ($guitar_select_camera_changing = 0)
		break
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script gs_wait_to_load_guitar_p1 
	Wait \{0.2 Second}
	Change \{globalName = generic_select_monitor_p1_changed NewValue = 1}
endscript

script gs_wait_to_load_guitar_p2 
	Wait \{0.2 Second}
	Change \{globalName = generic_select_monitor_p2_changed NewValue = 1}
endscript

script gs_scroll_up_or_down \{Player = 1 Dir = Down}
	generic_menu_up_or_down_sound Params = {<Dir>}
	if (<Player> = 1)
		if ($gs_made_first_selection_bool_p1 = 0)
			getArraySize (gs_available_brands)
			<avail_size> = <array_Size>
			if (<Dir> = Down)
				Change gs_selected_brand_p1 = ($gs_selected_brand_p1 + 1)
				if ($gs_selected_brand_p1 = <avail_size>)
					Change \{gs_selected_brand_p1 = 0}
				endif
			endif
			if (<Dir> = Up)
				Change gs_selected_brand_p1 = ($gs_selected_brand_p1 - 1)
				if ($gs_selected_brand_p1 = -1)
					Change gs_selected_brand_p1 = (<avail_size> - 1)
				endif
			endif
			<inst_id> = 0
			select_guitar_get_first_guitar_brand_in_list {
				brand = (<gs_available_brands> [$gs_selected_brand_p1])
				instrument_type = <instrument_type>
				gs_available_instruments = <gs_available_instruments>
			}
			<inst_id> = <instrument_id>
			Change guitar_select_highlighted_guitar_p1 = <instrument_index>
			formatText Checksumname = player_status 'player%i_status' I = <Player>
			if NOT (<inst_id> = $<player_status>.instrument_id)
				killspawnedScript \{Name = Store_Update_Player_Status}
				SpawnScriptNOw Store_Update_Player_Status Params = {Player = <Player> instrument_id = <inst_id>}
				if ($current_num_players = 1)
					select_guitar_change_blurb_text inst_id = <inst_id>
				endif
			endif
			if (($is_network_game) = 1)
				Change online_guitar_highlighted_id_p1 = ($<player_status>.instrument_id)
				if (<Dir> = Up)
					dir_value = 0
				else
					dir_value = 1
				endif
				network_player_lobby_message {
					Type = guitar_select
					action = update
					Checksum = <instrument_type>
					value1 = <dir_value>
				}
			endif
			get_instrument_brand_and_finish Id = <inst_id>
			setScreenElementProps Id = $gs_guitar_brand_ID_p1 Text = <instrument_brand>
			setScreenElementProps Id = $gs_guitar_finish_ID_p1 Text = <instrument_name2>
			if ($current_num_players = 1)
				setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
				getScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
				if (<width> > 260)
					fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
				endif
			else
				setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
				getScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
				if (<width> > 260)
					fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 10.0)
				endif
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p1 scale = 1}
				getScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
				if (<width> > 260)
					fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 0.5))) pos = (0.0, 83.0)
				else
					setScreenElementProps \{Id = $gs_guitar_finish_ID_p1 scale = (0.75, 0.5)}
				endif
			endif
			get_instrument_logo Id = <inst_id>
			setScreenElementProps Id = gs_guitar_logo_ID_p1 Text = <instrument_logo>
		endif
	else
		if ($gs_made_first_selection_bool_p2 = 0)
			getArraySize (gs_available_brands)
			<avail_size> = <array_Size>
			if (<Dir> = Down)
				Change gs_selected_brand_p2 = ($gs_selected_brand_p2 + 1)
				if ($gs_selected_brand_p2 = <avail_size>)
					Change \{gs_selected_brand_p2 = 0}
				endif
			endif
			if (<Dir> = Up)
				Change gs_selected_brand_p2 = ($gs_selected_brand_p2 - 1)
				if ($gs_selected_brand_p2 = -1)
					Change gs_selected_brand_p2 = (<avail_size> - 1)
				endif
			endif
			<inst_id> = 0
			select_guitar_get_first_guitar_brand_in_list {
				brand = (<gs_available_brands> [$gs_selected_brand_p2])
				instrument_type = <instrument_type>
				gs_available_instruments = <gs_available_instruments>
			}
			Change guitar_select_highlighted_guitar_p2 = <instrument_index>
			<inst_id> = <instrument_id>
			formatText Checksumname = player_status 'player%i_status' I = <Player>
			if NOT (<inst_id> = $<player_status>.instrument_id)
				killspawnedScript \{Name = Store_Update_Player_Status}
				SpawnScriptNOw Store_Update_Player_Status Params = {Player = <Player> instrument_id = <inst_id>}
			endif
			get_instrument_brand_and_finish Id = <inst_id>
			setScreenElementProps Id = $gs_guitar_brand_ID_p2 Text = <instrument_brand>
			setScreenElementProps Id = $gs_guitar_finish_ID_p2 Text = <instrument_name2>
			setScreenElementProps \{Id = $gs_guitar_brand_ID_p2 scale = 1}
			getScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setScreenElementProps \{Id = $gs_guitar_finish_ID_p2 scale = 1}
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 0.5))) pos = (0.0, 83.0)
			else
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p2 scale = (0.75, 0.5)}
			endif
			get_instrument_logo Id = <inst_id>
			setScreenElementProps Id = gs_guitar_logo_ID_p2 Text = <instrument_logo>
		endif
	endif
endscript

script select_guitar_go_back \{Player = 1 instrument_type = GUITAR}
	if (<Player> = 1)
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
		Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
		Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
		if ($is_network_game = 1)
			get_musician_instrument_type desc_id = <instrument_id>
			if (<instrument_type> = GUITAR)
				Change player1_selected_guitar = <instrument_id>
			else
				Change player1_selected_bass = <instrument_id>
			endif
		endif
	else
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p2)])
		Change \{guitar_select_highlighted_guitar_p2 = $guitar_select_old_guitar_p2}
		Change \{gs_selected_brand_p2 = $gs_old_selected_brand_p2}
	endif
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	if NOT (<instrument_id> = $<player_status>.instrument_id)
		Change StructureName = <player_status> instrument_id = <instrument_id>
		if NOT ($is_network_game)
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
				if (<instrument_type> = GUITAR)
					setGlobalTags <default_characterguitartag> Params = {current_instrument = GUITAR current_selected_guitar = <instrument_id>}
				else
					setGlobalTags <default_characterguitartag> Params = {current_instrument = BASS current_selected_bass = <instrument_id>}
				endif
			endif
		endif
		formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change globalName = <change_flag> NewValue = 1
		if ($current_num_players = 1)
			select_guitar_change_blurb_text inst_id = <instrument_id>
		endif
		generic_select_monitor_wait
	endif
	if NOT ($is_network_game)
		if find_profile_by_id Id = ($<player_status>.character_id)
			get_musician_profile_struct Index = <Index>
			formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
			setGlobalTags <default_characterguitartag> Params = {current_instrument = <instrument_type>}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back Player = <Player>
endscript

script select_guitar_menu_lose_focus 
	getTags
	setScreenElementProps Id = <Id> rgba = [180 100 60 255]
endscript

script select_guitar_choose \{Player = 1 needs_net_message = 1 includes_finish = 0}
	Soundevent \{Event = ui_sfx_select}
	if ($current_num_players = 1)
		begin
		if ($generic_select_monitor_p1_changed = 0)
			break
		endif
		Wait \{1 GameFrame}
		repeat
	endif
	if (<Player> = 1)
		<inst_id> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p1)])
		Change StructureName = player1_status instrument_id = <inst_id>
		if find_profile_by_id Id = ($player1_status.character_id)
			get_musician_profile_struct Index = <Index>
			formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
			if (<instrument_type> = GUITAR)
				setGlobalTags <default_characterguitartag> Params = {current_instrument = GUITAR current_selected_guitar = <inst_id>}
				Change player1_selected_guitar = <inst_id>
			else
				setGlobalTags <default_characterguitartag> Params = {current_instrument = BASS current_selected_bass = <inst_id>}
				Change player1_selected_bass = <inst_id>
			endif
		endif
		Change \{guitar_select_old_guitar_p1 = $guitar_select_highlighted_guitar_p1}
		Change \{gs_old_selected_brand_p1 = $gs_selected_brand_p1}
		if ($gs_made_first_selection_bool_p1 = 0)
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>
			Change \{gs_made_first_selection_bool_p1 = 1}
		else
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		endif
	else
		<inst_id> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p2)])
		Change StructureName = player2_status instrument_id = <inst_id>
		if NOT ($is_network_game)
			if find_profile_by_id Id = ($player2_status.character_id)
				get_musician_profile_struct Index = <Index>
				formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
				if (<instrument_type> = GUITAR)
					setGlobalTags <default_characterguitartag> Params = {current_instrument = GUITAR current_selected_guitar = <inst_id>}
				else
					setGlobalTags <default_characterguitartag> Params = {current_instrument = BASS current_selected_bass = <inst_id>}
				endif
			endif
		endif
		Change \{guitar_select_old_guitar_p2 = $guitar_select_highlighted_guitar_p2}
		Change \{gs_old_selected_brand_p2 = $gs_selected_brand_p2}
		if ($gs_made_first_selection_bool_p2 = 0)
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>
			Change \{gs_made_first_selection_bool_p2 = 1}
		else
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		endif
	endif
endscript

script get_instrument_name_and_index 
	get_musician_instrument_size
	Index = 0
	begin
	get_musician_instrument_struct Index = <Index>
	if (<Id> = (<info_struct>.desc_id))
		return instrument_name = (<info_struct>.Name) instrument_index = <Index>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	get_instrument_name_and_index \{Id = Instrument_Explorer_White}
	return instrument_name = (<info_struct>.Name) instrument_index = <Index> FALSE
endscript

script get_player_instrument_desc_name \{Player = 1}
	if (<Player> = 1)
		instrument_id = ($player1_status.instrument_id)
	else
		instrument_id = ($player2_status.instrument_id)
	endif
	if find_instrument_index desc_id = (<instrument_id>)
		get_musician_instrument_struct Index = <Index>
		return TRUE instrument_name = (<info_struct>.desc_name)
	else
		return \{FALSE instrument_name = "Instrument not found"}
	endif
endscript

script get_instrument_brand_and_finish 
	get_musician_instrument_size
	Index = 0
	begin
	get_musician_instrument_struct Index = <Index>
	if (<Id> = (<info_struct>.desc_id))
		<ins_fin> = (<info_struct>.finish)
		if gotParam \{ins_fin}
			GetUppercaseString <ins_fin>
			gitaf_instrument_finish = <UppercaseString>
		else
			gitaf_instrument_finish = "Something Bad Happened..."
		endif
		<ins_name2> = (<info_struct>.name2)
		if gotParam \{ins_name2}
			GetUppercaseString <ins_name2>
			gitaf_instrument_name2 = <UppercaseString>
		else
			gitaf_instrument_name2 = "Something Bad Happened..."
		endif
		<ins_brand> = (<info_struct>.Name)
		if gotParam \{ins_fin}
			GetUppercaseString <ins_brand>
			gitaf_instrument_brand = <UppercaseString>
		else
			gitaf_instrument_brand = "Something Bad Happened..."
		endif
		return instrument_brand = <gitaf_instrument_brand> instrument_finish = <gitaf_instrument_finish> instrument_name2 = <gitaf_instrument_name2>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{instrument_brand = "Brand Not Found!!!" instrument_finish = "Finish Not Found!!!"}
endscript

script get_instrument_logo 
	get_musician_instrument_size
	Index = 0
	begin
	get_musician_instrument_struct Index = <Index>
	if (<Id> = (<info_struct>.desc_id))
		<ins_logo> = (<info_struct>.logo)
		if gotParam \{ins_logo}
			GetUppercaseString <ins_logo>
			gitaf_instrument_logo = <UppercaseString>
		else
			gitaf_instrument_logo = "Something Bad Happened..."
		endif
		return instrument_logo = <gitaf_instrument_logo>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{instrument_logo = "Logo Not Found!!!"}
endscript

script select_guitar_change_blurb_text \{lines_in_window = 8}
	if gotParam \{inst_id}
		get_instrument_name_and_index Id = <inst_id>
		get_musician_instrument_struct Index = <instrument_index>
		Change gs_instrument_blurb_text = (<info_struct>.blurb)
	else
		Change gs_instrument_blurb_text = <Text>
	endif
	killspawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	createScreenElement {
		Type = WindowElement
		PARENT = select_guitar_container
		Id = gs_instrument_info_scroll_window
		pos = ($gs_element_offsets [4])
		Dims = (388.0, 250.0)
	}
	my_pos = (($gs_element_offsets [4]) + (0.0, -10.0))
	my_x_dims = 362
	if gotParam \{Dims}
		gs_instrument_info_scroll_window :SetProps Dims = <Dims>
	endif
	if gotParam \{x_dims}
		<my_x_dims> = <x_dims>
	endif
	if gotParam \{pos}
		<my_pos> = <pos>
		gs_instrument_info_scroll_window :SetProps pos = <my_pos>
	endif
	my_z = 2
	if gotParam \{Z}
		<my_z> = <Z>
	endif
	SpawnScriptNOw {
		select_guitar_scroll_instrument_info
		Params = {
			PARENT = gs_instrument_info_scroll_window
			x_dims = <my_x_dims>
			Z = <my_z>
			pos = <my_pos>
			lines_in_window = <lines_in_window>
		}
	}
endscript

script select_guitar_scroll_instrument_info \{Z = 2 x_dims = 362}
	createScreenElement {
		Type = textblockelement
		PARENT = <PARENT>
		just = [Left top]
		internal_just = [Left top]
		pos = (0.0, 0.0)
		scale = (0.58, 0.6)
		Text = $gs_instrument_blurb_text
		font = text_a4
		rgba = [235 145 80 255]
		z_priority = <Z>
		Dims = (<x_dims> * (1.0, 0.0))
		allow_expansion
		line_spacing = 1.25
	}
	<text_id> = <Id>
	SetScreenElementLock Id = <text_id> On
	<text_id> :GetParentID
	getScreenElementDims Id = <parent_id>
	<parent_height> = <Height>
	getScreenElementDims Id = <text_id>
	getScreenElementChildren Id = <text_id>
	getArraySize (<children>)
	<line_nums> = (<array_Size> + 0.01)
	<pixels_per_line> = (<Height> / <line_nums>)
	<fade_time> = 1.5
	<idle_time> = 3.5
	<black_time> = 0.2
	begin
	<text_id> :doMorph Alpha = 0 pos = (0.0, 0.0)
	<text_id> :doMorph Alpha = 1 Time = <fade_time>
	if (<Height> <= <parent_height>)
		break
	endif
	Wait <idle_time> Seconds
	<diff> = (<Height> - <parent_height> + 2.1)
	<lines_to_scroll> = (<diff> / <pixels_per_line>)
	<RATE> = 1.0
	<text_id> :doMorph pos = (<diff> * (0.0, -1.0)) Time = (<RATE> * <lines_to_scroll>)
	Wait <idle_time> Seconds
	<text_id> :doMorph Alpha = 0 Time = <fade_time>
	Wait <black_time> Seconds
	repeat
endscript

script select_guitar_get_first_guitar_brand_in_list \{brand = explorer}
	<I> = 0
	getArraySize <gs_available_instruments> globalArray
	total_size = <array_Size>
	begin
	if (<instrument_type> = GUITAR)
		get_musician_instrument_struct Index = ($guitar_select_guitar_indeces [<I>])
	else
		get_musician_instrument_struct Index = ($guitar_select_bass_indeces [<I>])
	endif
	if ((<info_struct>.Name) = <brand>)
		return instrument_id = (<info_struct>.desc_id) instrument_index = <I>
	endif
	<I> = (<I> + 1)
	repeat <total_size>
endscript

script select_guitar_get_available_index_from_total_index \{Index = 0}
	<I> = 0
	getArraySize <gs_available_instruments> globalArray
	<avail_size> = <array_Size>
	begin
	get_musician_instrument_struct Index = <Index>
	if (($<gs_available_instruments> [<I>]) = (<info_struct>.desc_id))
		return Index = <I>
	endif
	<I> = (<I> + 1)
	repeat <avail_size>
endscript

script select_guitar_create_finish_menu \{Player = 1}
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound Params = {Up}}
		{pad_down generic_menu_up_or_down_sound Params = {Down}}
		{pad_back select_guitar_go_back_from_finish_menu Params = {gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>}}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-270.0, -160.0)
	if (<Player> = 1)
		if ($current_num_players = 2)
			new_menu {
				scrollid = scrolling_guitar_finish_menu_p1
				vmenuid = vmenu_guitar_finish_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				Menu_pos = (<p1_menu_pos> + (-178.0, -210.0))
				exclusive_device = <exclusive_dev>
				internal_just = [Center top]
			}
		else
			new_menu {
				scrollid = scrolling_guitar_finish_menu_p1
				vmenuid = vmenu_guitar_finish_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				Menu_pos = (<p1_menu_pos> + <menu_offset>)
				internal_just = [Center top]
				text_left
			}
			killspawnedScript \{Name = select_guitar_scroll_instrument_info}
			destroy_menu \{menu_id = gs_instrument_info_scroll_window}
		endif
		vparent = vmenu_guitar_finish_menu_p1
	else
		new_menu {
			scrollid = scrolling_guitar_finish_menu_p2
			vmenuid = vmenu_guitar_finish_menu_p2
			use_backdrop = 0
			event_handlers = <event_handlers>
			Menu_pos = <p2_menu_pos>
			exclusive_device = <exclusive_dev>
			internal_just = [Center top]
		}
		if ($is_network_game = 1)
			vmenu_guitar_finish_menu_p2 :SetProps \{disable_pad_handling}
			launchevent \{Type = unfocus Target = vmenu_guitar_finish_menu_p2}
		endif
		vparent = vmenu_guitar_finish_menu_p2
	endif
	if (<Player> = 1)
		launchevent \{Type = unfocus Target = scrolling_select_guitar_p1}
	else
		if NOT ($is_network_game)
			launchevent \{Type = unfocus Target = scrolling_select_guitar_p2}
		endif
	endif
	if ($current_num_players = 1)
		createScreenElement {
			Type = containerElement
			Id = select_finish_container
			PARENT = root_window
			pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [Center top]
		}
		<brown_window_color> = [120 60 10 255]
		setScreenElementProps {
			Id = gs_brand_background
			texture = store_frame_bottom_bg
			Dims = (242.0, 128.0)
			rgba = <brown_window_color>
		}
		setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 rgba = [250 250 200 255] scale = 0.8}
		getScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
		if (<width> > 260)
			setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
			fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((215.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		displaySprite \{Id = gs_bookend1_ID PARENT = select_finish_container tex = character_hub_hilite_bookend Dims = (24.0, 24.0) just = [Left top] rgba = [255 255 205 255] pos = (-64.0, 11.0) Z = 4}
		displaySprite \{Id = gs_bookend2_ID PARENT = select_finish_container tex = character_hub_hilite_bookend Dims = (24.0, 24.0) just = [Right top] rgba = [255 255 205 255] pos = (238.0, 11.0) Z = 4}
		displaySprite \{Id = gs_whiteTexHighlight_ID PARENT = select_finish_container tex = White just = [Left top] rgba = [255 255 205 255] Dims = (264.0, 32.0) pos = (-47.0, 8.0) Z = 2}
		set_focus_color \{rgba = [130 40 40 250]}
		set_unfocus_color \{rgba = [180 100 60 250]}
		get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p1])
		select_guitar_build_finish_array {
			brand = <instrument_brand>
			gs_available_instruments = <gs_available_instruments>
		}
		getArraySize <gs_available_finishes>
		<I> = 0
		begin
		get_instrument_brand_and_finish Id = (<gs_available_finishes> [<I>])
		formatText Checksumname = gs_finish_menu_item_id 'gs_finish_menu_item_%n' N = <I>
		createScreenElement {
			Id = <gs_finish_menu_item_id>
			Type = textElement
			PARENT = <vparent>
			font = text_a4
			scale = (0.7, 0.7)
			rgba = ($menu_unfocus_color)
			just = [Center top]
			Text = <instrument_finish>
			event_handlers = [
				{focus retail_menu_focus}
				{focus select_guitar_finish_highlight Params = {Player = <Player>
						Id = (<gs_available_finishes> [<I>])
						Index = <I>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose select_guitar_finish_choose Params = {Id = (<gs_available_finishes> [<I>])
						Player = <Player>
						gs_available_instruments = <gs_available_instruments>
						instrument_type = <instrument_type>
					}
				}
			]
		}
		getScreenElementDims Id = <Id>
		if (<width> > 180)
			setScreenElementProps Id = <Id> scale = 1
			fit_text_in_rectangle Id = <Id> Dims = ((180.0, 34.0))
		endif
		<I> = (<I> + 1)
		repeat <array_Size>
		if (<array_Size> = 1)
			Change \{gs_made_first_selection_bool_p1 = 1}
			select_guitar_finish_highlight {
				Player = <Player>
				Id = (<gs_available_finishes> [0])
			}
			select_guitar_finish_choose {
				Id = (<gs_available_finishes> [0])
				Player = <Player>
				gs_available_instruments = <gs_available_instruments>
				instrument_type = <instrument_type>
			}
		endif
	else
		if (<Player> = 1)
			launchevent \{Type = unfocus Target = scrolling_select_guitar_p1}
			launchevent Type = focus Target = <vparent>
			setScreenElementProps \{Id = gs_select_guitar_text_p1 Text = "SELECT FINISH"}
			get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p1])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			get_instrument_brand_and_finish Id = (<gs_available_finishes> [0])
			setScreenElementProps \{Id = gs_brand_background_p1 pos = (0.0, 58.0)}
			setScreenElementProps \{Id = gs_finish_background_p1 pos = (0.0, 0.0)}
			setScreenElementProps \{Id = gs_guitar_logo_ID_p1 Hide}
			setScreenElementProps {
				Id = $gs_guitar_brand_ID_p1
				Text = <instrument_brand>
				scale = (0.75, 0.5)
				pos = (0.0, -6.0)
				rgba = [250 250 200 255]
			}
			getScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setScreenElementProps {
				Id = $gs_guitar_finish_ID_p1
				Text = <instrument_finish>
				scale = (1.0, 0.8)
				pos = (0.0, 52.0)
				rgba = [80 0 10 255]
			}
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p1 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 52.0)
			endif
			getArraySize <gs_available_finishes>
			<I> = 0
			begin
			get_instrument_brand_and_finish Id = (<gs_available_finishes> [<I>])
			createScreenElement {
				Type = textElement
				PARENT = <vparent>
				font = text_a4
				scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [Center top]
				Text = <instrument_finish>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_guitar_finish_highlight Params = {Player = <Player>
							Id = (<gs_available_finishes> [<I>])
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_guitar_finish_choose Params = {Id = (<gs_available_finishes> [<I>])
							Player = <Player>
							gs_available_instruments = <gs_available_instruments>
							instrument_type = <instrument_type>
							finish_index = <I>
						}
					}
				]
				exclusive_device = <exclusive_dev>
				Hide
			}
			getScreenElementDims Id = <Id>
			if (<width> > 180)
				fit_text_in_rectangle Id = <Id> Dims = (0.7 * ((160.0, 0.0) + (<Height> * (0.0, 1.0)))) pos = (<p1_menu_pos> + <menu_offset>)
			endif
			<I> = (<I> + 1)
			repeat <array_Size>
			if (<array_Size> = 1)
				Change \{gs_made_first_selection_bool_p1 = 1}
				select_guitar_finish_highlight {
					Player = <Player>
					Id = (<gs_available_finishes> [0])
				}
				select_guitar_finish_choose {
					Id = (<gs_available_finishes> [0])
					Player = <Player>
					gs_available_instruments = <gs_available_instruments>
					instrument_type = <instrument_type>
					needs_net_message = 0
				}
			endif
		else
			if ($is_network_game = 0)
				launchevent \{Type = unfocus Target = scrolling_select_guitar_p2}
				launchevent Type = focus Target = <vparent>
			endif
			setScreenElementProps \{Id = gs_select_guitar_text_p2 Text = "SELECT FINISH"}
			get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p2])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			get_instrument_brand_and_finish Id = (<gs_available_finishes> [0])
			setScreenElementProps \{Id = gs_brand_background_p2 pos = (0.0, 58.0)}
			setScreenElementProps \{Id = gs_finish_background_p2 pos = (0.0, 0.0)}
			setScreenElementProps \{Id = gs_guitar_logo_ID_p2 Hide}
			setScreenElementProps {
				Id = $gs_guitar_brand_ID_p2
				Text = <instrument_brand>
				scale = (0.75, 0.5)
				pos = (0.0, -6.0)
				rgba = [240 210 250 255]
			}
			getScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_brand_ID_p2 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setScreenElementProps {
				Id = $gs_guitar_finish_ID_p2
				Text = <instrument_finish>
				scale = (1.0, 0.8)
				pos = (0.0, 52.0)
				rgba = [70 0 50 255]
			}
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p2 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 52.0)
			endif
			getArraySize <gs_available_finishes>
			get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p2])
			select_guitar_build_finish_array {
				brand = <instrument_brand>
				gs_available_instruments = <gs_available_instruments>
			}
			getArraySize <gs_available_finishes>
			<I> = 0
			begin
			get_instrument_brand_and_finish Id = (<gs_available_finishes> [<I>])
			createScreenElement {
				Type = textElement
				PARENT = <vparent>
				font = text_a4
				scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [Center top]
				Text = <instrument_finish>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_guitar_finish_highlight Params = {Player = <Player>
							Id = (<gs_available_finishes> [<I>])
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_guitar_finish_choose Params = {Id = (<gs_available_finishes> [<I>])
							Player = <Player>
							gs_available_instruments = <gs_available_instruments>
							instrument_type = <instrument_type>
						}
					}
				]
				exclusive_device = <exclusive_dev>
				Hide
			}
			getScreenElementDims Id = <Id>
			if (<width> > 180)
				fit_text_in_rectangle Id = <Id> Dims = (0.7 * ((160.0, 0.0) + (<Height> * (0.0, 1.0)))) pos = (<p1_menu_pos> + <menu_offset>)
			endif
			<I> = (<I> + 1)
			repeat <array_Size>
			if (<array_Size> = 1)
				Change \{gs_made_first_selection_bool_p2 = 1}
				select_guitar_finish_highlight {
					Player = <Player>
					Id = (<gs_available_finishes> [0])
				}
				select_guitar_finish_choose {
					Id = (<gs_available_finishes> [0])
					Player = <Player>
					gs_available_instruments = <gs_available_instruments>
					instrument_type = <instrument_type>
					needs_net_message = 0
				}
			endif
		endif
	endif
endscript

script select_guitar_go_back_from_finish_menu \{Player = 1 instrument_type = GUITAR}
	Soundevent \{Event = Generic_Menu_Back_SFX}
	if ($current_num_players = 1)
		launchevent \{Type = focus Target = scrolling_select_guitar_p1}
		launchevent \{Type = unfocus Target = scrolling_guitar_finish_menu_p1}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
		Change \{gs_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = select_finish_container}
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
		Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
		Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
		if NOT (<instrument_id> = ($player1_status.instrument_id))
			Change StructureName = player1_status instrument_id = <instrument_id>
			formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
			Change globalName = <change_flag> NewValue = 1
		endif
		setScreenElementProps \{Id = gs_brand_background texture = Char_Select_Frame_BG Dims = (266.0, 128.0) rgba = [250 250 200 255]}
		setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 rgba = [160 80 30 255]}
		get_instrument_brand_and_finish Id = <instrument_id>
		setScreenElementProps Id = $gs_guitar_brand_ID_p1 Text = <instrument_brand>
		setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
		getScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
		if (<width> > 260)
			setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
			fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0))
		endif
		setScreenElementProps Id = $gs_guitar_finish_ID_p1 Text = <instrument_name2>
		get_instrument_logo Id = <instrument_id>
		setScreenElementProps Id = gs_guitar_logo_ID_p1 Text = <instrument_logo>
		select_guitar_change_blurb_text inst_id = <instrument_id>
	else
		if (<instrument_type> = GUITAR)
			Change \{gs_select_text = "SELECT GUITAR"}
			elseif (<instrument_type> = BASS)
			Change \{gs_select_text = "SELECT BASS"}
		endif
		if (<Player> = 1)
			setScreenElementProps \{Id = gs_select_guitar_text_p1 Text = $gs_select_text}
			launchevent \{Type = focus Target = scrolling_select_guitar_p1}
			launchevent \{Type = unfocus Target = scrolling_guitar_finish_menu_p1}
			destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
			Change \{gs_made_first_selection_bool_p1 = 0}
			if ($is_network_game = 1)
				network_player_lobby_message {
					Type = skin_select
					action = deselect
					Checksum = <instrument_type>
				}
			endif
			instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
			Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
			Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
			if NOT (<instrument_id> = ($player1_status.instrument_id))
				Change StructureName = player1_status instrument_id = <instrument_id>
				formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change globalName = <change_flag> NewValue = 1
			endif
			get_instrument_brand_and_finish Id = <instrument_id>
			setScreenElementProps \{Id = gs_brand_background_p1 pos = (0.0, 30.0)}
			setScreenElementProps \{Id = gs_finish_background_p1 pos = (0.0, 88.0)}
			setScreenElementProps {
				Id = $gs_guitar_brand_ID_p1
				Text = <instrument_brand>
				scale = 1
				pos = (0.0, 10.0)
				rgba = [80 0 10 255]
			}
			getScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_brand_ID_p1 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setScreenElementProps {
				Id = $gs_guitar_finish_ID_p1
				Text = <instrument_name2>
				scale = (0.75, 0.5)
				pos = (0.0, 83.0)
				rgba = [250 250 200 255]
			}
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p1 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 83.0)
			endif
			get_instrument_logo Id = <instrument_id>
			setScreenElementProps Id = gs_guitar_logo_ID_p1 Text = <instrument_logo>
			setScreenElementProps \{Id = gs_guitar_logo_ID_p1 Unhide}
		else
			setScreenElementProps \{Id = gs_select_guitar_text_p2 Text = $gs_select_text}
			launchevent \{Type = focus Target = scrolling_select_guitar_p2}
			launchevent \{Type = unfocus Target = scrolling_guitar_finish_menu_p2}
			destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
			Change \{gs_made_first_selection_bool_p2 = 0}
			instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p2)])
			Change \{guitar_select_highlighted_guitar_p2 = $guitar_select_old_guitar_p2}
			Change \{gs_selected_brand_p2 = $gs_old_selected_brand_p2}
			if NOT (<instrument_id> = ($player2_status.instrument_id))
				Change StructureName = player2_status instrument_id = <instrument_id>
				formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change globalName = <change_flag> NewValue = 1
			endif
			get_instrument_brand_and_finish Id = <instrument_id>
			setScreenElementProps \{Id = gs_brand_background_p2 pos = (0.0, 30.0)}
			setScreenElementProps \{Id = gs_finish_background_p2 pos = (0.0, 88.0)}
			setScreenElementProps {
				Id = $gs_guitar_brand_ID_p2
				Text = <instrument_brand>
				scale = 1
				pos = (0.0, 10.0)
				rgba = [70 0 50 255]
			}
			getScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_brand_ID_p2 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 10.0)
			endif
			setScreenElementProps {
				Id = $gs_guitar_finish_ID_p2
				Text = <instrument_name2>
				scale = (0.75, 0.5)
				pos = (0.0, 83.0)
				rgba = [240 251 250 255]
			}
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p2 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 83.0)
			endif
			get_instrument_logo Id = <instrument_id>
			setScreenElementProps Id = gs_guitar_logo_ID_p2 Text = <instrument_logo>
			setScreenElementProps \{Id = gs_guitar_logo_ID_p2 Unhide}
		endif
		if (<Player> = 1)
			destroy_menu \{menu_id = select_finish_container}
		else
			destroy_menu \{menu_id = select_finish_container_p2}
		endif
	endif
endscript

script select_guitar_finish_highlight \{Player = 1 Index = 0}
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	if NOT (<Id> = $<player_status>.instrument_id)
		Change StructureName = <player_status> instrument_id = <Id>
		formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change globalName = <change_flag> NewValue = 1
	endif
	get_instrument_brand_and_finish Id = <Id>
	if ($current_num_players = 1)
		setScreenElementProps Id = $gs_guitar_brand_ID_p1 Text = <instrument_brand>
		setScreenElementProps Id = $gs_guitar_finish_ID_p1 Text = <instrument_name2>
		get_instrument_logo Id = <Id>
		setScreenElementProps Id = gs_guitar_logo_ID_p1 Text = <instrument_logo>
		<offset> = (<Index> * (0.0, 33.5))
		<l_pos> = ((-64.0, 11.0) + <offset>)
		<r_pos> = ((238.0, 11.0) + <offset>)
		<hl_pos> = ((-47.0, 8.0) + <offset>)
		setScreenElementProps Id = gs_bookend1_ID pos = <l_pos>
		setScreenElementProps Id = gs_bookend2_ID pos = <r_pos>
		setScreenElementProps Id = gs_whiteTexHighlight_ID pos = <hl_pos>
	else
		if (<Player> = 1)
			setScreenElementProps {
				Id = $gs_guitar_finish_ID_p1
				Text = <instrument_finish>
			}
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p1 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 52.0)
			endif
		else
			setScreenElementProps {
				Id = $gs_guitar_finish_ID_p2
				Text = <instrument_finish>
			}
			getScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
			if (<width> > 260)
				setScreenElementProps \{Id = $gs_guitar_finish_ID_p2 scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) pos = (0.0, 52.0)
			endif
		endif
	endif
endscript

script select_guitar_finish_choose \{Player = 1 needs_net_message = 1}
	if (<Player> = 1)
		get_instrument_name_and_index Id = <Id>
		select_guitar_get_available_index_from_total_index {
			gs_available_instruments = <gs_available_instruments>
			Index = <instrument_index>
		}
		Change guitar_select_highlighted_guitar_p1 = <Index>
		if gotParam \{finish_index}
			Change gh_net_finish_id = <finish_index>
		endif
		select_guitar_choose {
			Player = <Player>
			gs_available_instruments = <gs_available_instruments>
			instrument_type = <instrument_type>
			needs_net_message = <needs_net_message>
			includes_finish = 1
		}
	else
		get_instrument_name_and_index Id = <Id>
		select_guitar_get_available_index_from_total_index {
			gs_available_instruments = <gs_available_instruments>
			Index = <instrument_index>
		}
		Change guitar_select_highlighted_guitar_p2 = <Index>
		select_guitar_choose {
			Player = <Player>
			gs_available_instruments = <gs_available_instruments>
			instrument_type = <instrument_type>
		}
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = select_finish_container}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
	else
		destroy_menu \{menu_id = select_finish_container_p2}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
	endif
endscript

script build_gs_available_guitar_array 
	if (<instrument_type> = GUITAR)
		formatText \{Checksumname = guitar_select_available_instruments 'guitar_select_available_guitar_array'}
		Change \{globalName = guitar_select_guitar_indeces NewValue = []}
		Change globalName = <guitar_select_available_instruments> NewValue = ($Free_Guitars)
		<secret_instrument_array> = ($Secret_Guitars)
		<download_instrument_array> = download_guitars
		num_downloads_on_other_client = ($download_guitars_on_other_client)
		<bonus_guitar_array> = ($Bonus_Guitars)
		<bonus_guitar_finishes_array> = ($Bonus_Guitar_Finishes)
	else
		formatText \{Checksumname = guitar_select_available_instruments 'guitar_select_available_bass_array'}
		Change \{globalName = guitar_select_bass_indeces NewValue = []}
		Change globalName = <guitar_select_available_instruments> NewValue = ($Free_Basses)
		<secret_instrument_array> = ($Secret_Basses)
		<download_instrument_array> = download_basses
		num_downloads_on_other_client = ($download_basses_on_other_client)
		<bonus_guitar_array> = ($Bonus_Basses)
		<bonus_guitar_finishes_array> = ($Bonus_Bass_Finishes)
	endif
	num_downloads = 0
	if Globalexists Name = <download_instrument_array>
		getArraySize ($<download_instrument_array>)
		<download_array_size> = <array_Size>
		<I> = 0
		begin
		find_instrument_index desc_id = ($<download_instrument_array> [<I>])
		if is_musician_instrument_downloaded Index = <Index>
			Addarrayelement Array = $<guitar_select_available_instruments> Element = ($<download_instrument_array> [<I>])
			Change globalName = <guitar_select_available_instruments> NewValue = (<Array>)
			num_downloads = (<num_downloads> + 1)
		endif
		<I> = (<I> + 1)
		repeat <download_array_size>
	endif
	if ($is_network_game = 1 && <Player> = 2 && (($download_guitars_on_other_client - <num_downloads>) > 0))
		begin
		Addarrayelement Array = $<guitar_select_available_instruments> Element = (<guitar_select_available_instruments> [0])
		Change globalName = <guitar_select_available_instruments> NewValue = (<Array>)
		repeat ($download_guitars_on_other_client - <num_downloads>)
	endif
	getArraySize (<secret_instrument_array>)
	<secret_array_size> = <array_Size>
	<I> = 0
	begin
	getglobaltags (<secret_instrument_array> [<I>].Id) param = unlocked
	if (<unlocked>)
		Addarrayelement Array = $<guitar_select_available_instruments> Element = (<secret_instrument_array> [<I>].Id)
		Change globalName = <guitar_select_available_instruments> NewValue = (<Array>)
	endif
	<I> = (<I> + 1)
	repeat <secret_array_size>
	getArraySize (<bonus_guitar_array>)
	<bonus_guitar_array_size> = <array_Size>
	<J> = 0
	begin
	getglobaltags (<bonus_guitar_array> [<J>].Id) param = unlocked
	if (<unlocked>)
		Addarrayelement Array = $<guitar_select_available_instruments> Element = (<bonus_guitar_array> [<J>].Id)
		Change globalName = <guitar_select_available_instruments> NewValue = (<Array>)
	endif
	<J> = (<J> + 1)
	repeat <bonus_guitar_array_size>
	getArraySize (<bonus_guitar_finishes_array>)
	<bonus_guitar_finishes_array_size> = <array_Size>
	<K> = 0
	begin
	getglobaltags (<bonus_guitar_finishes_array> [<K>].Id) param = unlocked
	if (<unlocked>)
		Addarrayelement Array = $<guitar_select_available_instruments> Element = (<bonus_guitar_finishes_array> [<K>].Id)
		Change globalName = <guitar_select_available_instruments> NewValue = (<Array>)
	endif
	<K> = (<K> + 1)
	repeat <bonus_guitar_finishes_array_size>
	getArraySize <guitar_select_available_instruments> globalArray
	Change guitar_select_total_num_guitars = <array_Size>
	<I> = 0
	getArraySize <guitar_select_available_instruments> globalArray
	total_size = <array_Size>
	begin
	<J> = 0
	get_musician_instrument_size
	begin
	get_musician_instrument_struct Index = <J>
	if (($<guitar_select_available_instruments> [<I>]) = (<info_struct>.desc_id))
		if (<instrument_type> = GUITAR)
			Addarrayelement Array = $guitar_select_guitar_indeces Element = <J>
			Change globalName = guitar_select_guitar_indeces NewValue = (<Array>)
		else
			Addarrayelement Array = $guitar_select_bass_indeces Element = <J>
			Change globalName = guitar_select_bass_indeces NewValue = (<Array>)
		endif
		break
	endif
	<J> = (<J> + 1)
	repeat <array_Size>
	<I> = (<I> + 1)
	repeat <total_size>
endscript
