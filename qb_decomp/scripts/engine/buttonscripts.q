select_shift = 0
memcard_screenshots = 0
skater_cam_0_mode = 2
skater_cam_1_mode = 2
screenshotmode = 0
arl_text = "Bot Star Power\\b6"
arr_text = "\\b5Poor>Good"
aru_text = "Toggle 2D"
ard_text = "Profiler"
all_text = "\\b6Profile Cams"
alr_text = "\\b5Lighting"
alu_text = "Win Song"
ald_text = "Model Viewer"
root_text = {
	arl_text = "Bot Star Power\\b6"
	arr_text = "\\b5Poor>Good"
	aru_text = "Toggle 2D"
	ard_text = "Profiler"
	all_text = "\\b6Profile Cams"
	alr_text = "\\b5Lighting"
	alu_text = "Win Song"
	ald_text = "Model Viewer"
}
modelviewer_text = {
	arl_text = "Bot Star Power\\b6"
	arr_text = "\\b5AI Displays"
	aru_text = "Toggle 2D"
	ard_text = "Profiler"
	all_text = "Set Player\\b6"
	alr_text = "\\b5Reset Camera"
	alu_text = "Win Song"
	ald_text = "Model Viewer"
}
select_text = root_text

script set_select_text \{text = $root_text}
	change all_text = (<text>.all_text)
	change alr_text = (<text>.alr_text)
	change alu_text = (<text>.alu_text)
	change ald_text = (<text>.ald_text)
	change arl_text = (<text>.arl_text)
	change arr_text = (<text>.arr_text)
	change aru_text = (<text>.aru_text)
	change ard_text = (<text>.ard_text)
	change select_text = <text>
	refresh_analog_options
endscript

script refresh_analog_options 
	hide_analog_options
	show_analog_options
endscript

script UserSelectSelect 
	if InFrontend
		return
	endif
	if IsObserving
		return
	endif
	if IsSurveying
		return
	endif
	if ScreenElementExists \{id = current_menu_anchor}
		return
	endif
	if ScreenElementExists \{id = root_window}
		if root_window :getsingletag \{menu_state}
			if (<menu_state> = on)
				return
			endif
		endif
	endif
	if ScreenElementExists \{id = videophone_notification}
		return
	endif
	if ObjectExists \{id = skatercam0}
		switch skater_cam_0_mode
			case 1
			change \{skater_cam_0_mode = 2}
			case 2
			change \{skater_cam_0_mode = 3}
			case 3
			change \{skater_cam_0_mode = 4}
			case 4
			change \{skater_cam_0_mode = 1}
		endswitch
		skatercam0 :sc_setmode \{mode = skater_cam_0_mode}
	endif
endscript

script UserSelectSelect2 
	if InFrontend
		return
	endif
	if IsObserving
		return
	endif
	if IsSurveying
		return
	endif
	if ScreenElementExists \{id = current_menu_anchor}
		return
	endif
	if ScreenElementExists \{id = root_window}
		if root_window :getsingletag \{menu_state}
			if (<menu_state> = on)
				return
			endif
		endif
	endif
	if ObjectExists \{id = skatercam1}
		switch skater_cam_1_mode
			case 1
			change \{skater_cam_1_mode = 2}
			case 2
			change \{skater_cam_1_mode = 3}
			case 3
			change \{skater_cam_1_mode = 4}
			case 4
			change \{skater_cam_1_mode = 1}
		endswitch
		skatercam1 :sc_setmode \{mode = skater_cam_1_mode}
	endif
endscript
view_mode = 0
render_mode = 0
wireframe_mode = 0
drop_in_car = 0
drop_in_car_setup = MiniBajaCarSetup

script userselecttriangle 
	if ($NEWSCREENSHOTMODE)
	endif
	if ($view_mode = 1)
		return
	endif
	if ($screenshotmode = 0)
		change \{screenshotmode = 1}
		<text> = "ScreenShot Paused"
	else
		change \{screenshotmode = 0}
		<text> = "ScreenShot Unpaused"
	endif
	if ScreenElementExists \{id = center_tri}
		SetScreenElementProps {
			id = center_tri
			text = <text>
		}
	endif
	return
	if notcd
		switch $render_mode
			case 0
			change \{render_mode = 1}
			show_wireframe_mode
			case 1
			change \{render_mode = 2}
			show_wireframe_mode
			case 2
			change \{render_mode = 3}
			toggle_wireframe_skins
			case 3
			change \{render_mode = 4}
			toggle_wireframe_skins
			case 4
			change \{render_mode = 0}
			toggle_wireframe_skins
		endswitch
		if (($render_mode = 3) || ($render_mode = 4))
			setRenderMode \{mode = 0}
		else
			setRenderMode \{mode = $render_mode}
		endif
	endif
endscript
viewer_taking_screenshot = 0

script do_screenshot 
	change \{viewer_taking_screenshot = 1}
	hide_analog_options
	if toggle2d \{Off}
		wait \{2 frames}
		hide_analog_options
		wait \{2 frames}
		ScreenShot
		wait \{2 frames}
		toggle2d \{on}
		change \{viewer_taking_screenshot = 0}
	else
		wait \{2 frames}
		hide_analog_options
		wait \{2 frames}
		ScreenShot
		wait \{2 frames}
		change \{viewer_taking_screenshot = 0}
	endif
endscript

script userselectsquare 
	if notcd
		SpawnScriptLater \{do_screenshot}
	endif
endscript

script userselectcircle 
	if ($render_mode)
		if notcd
			switch wireframe_mode
				case 0
				change \{wireframe_mode = 1}
				case 1
				change \{wireframe_mode = 2}
				case 2
				change \{wireframe_mode = 3}
				case 3
				change \{wireframe_mode = 4}
				case 4
				change \{wireframe_mode = 5}
				case 5
				change \{wireframe_mode = 6}
				case 6
				change \{wireframe_mode = 0}
			endswitch
			setwireframemode \{mode = wireframe_mode}
			show_wireframe_mode
		endif
	endif
endscript

script userselectstart 
	if notcd
		change \{render_mode = 0}
		setRenderMode \{mode = $render_mode}
		TogglePass \{pass = 0}
	endif
endscript

script show_analog_options 
	if ($viewer_taking_screenshot = 1)
		return
	endif
	if ($profiling_cameracuts = TRUE)
		return
	endif
	if NOT ScreenElementExists \{id = viewer_options_anchor}
		SetScreenElementLock \{id = root_window Off}
		CreateScreenElement \{id = viewer_options_anchor
			type = ContainerElement
			parent = root_window
			Pos = (0.0, 0.0)
			z_priority = 6000}
		CreateScreenElement \{id = viewer_options_bg
			type = SpriteElement
			parent = viewer_options_anchor
			dims = (1280.0, 160.0)
			Pos = (0.0, 20.0)
			just = [
				left
				top
			]
			rgba = [
				0
				0
				0
				255
			]
			alpha = 0.3}
		CreateScreenElement \{id = left_anchor
			type = ContainerElement
			parent = viewer_options_anchor
			Scale = 1.0
			Pos = (256.0, 96.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{id = analog_l_l
			type = TextElement
			parent = left_anchor
			font = text_a1
			text = $all_text
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				RIGHT
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_r
			type = TextElement
			parent = left_anchor
			font = text_a1
			text = $alr_text
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_t_button
			type = TextElement
			parent = left_anchor
			font = text_a1
			text = "\\b7"
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_t
			type = TextElement
			parent = left_anchor
			font = text_a1
			text = $alu_text
			Scale = 0.8
			Pos = (0.0, -28.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_b_button
			type = TextElement
			parent = left_anchor
			font = text_a1
			text = "\\b4"
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_b
			type = TextElement
			parent = left_anchor
			font = text_a1
			text = $ald_text
			Scale = 0.8
			Pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = right_anchor
			type = ContainerElement
			parent = viewer_options_anchor
			Scale = 1.0
			Pos = (1024.0, 96.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{id = analog_r_l
			type = TextElement
			parent = right_anchor
			font = text_a1
			text = $arl_text
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				RIGHT
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_r
			type = TextElement
			parent = right_anchor
			font = text_a1
			text = $arr_text
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_t_button
			type = TextElement
			parent = right_anchor
			font = text_a1
			text = "\\b7"
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_t
			type = TextElement
			parent = right_anchor
			font = text_a1
			text = $aru_text
			Scale = 0.8
			Pos = (0.0, -28.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_b_button
			type = TextElement
			parent = right_anchor
			font = text_a1
			text = "\\b4"
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_b
			type = TextElement
			parent = right_anchor
			font = text_a1
			text = $ard_text
			Scale = 0.8
			Pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = center_anchor
			type = ContainerElement
			parent = viewer_options_anchor
			Scale = 1.0
			Pos = (640.0, 96.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{id = center_square
			type = TextElement
			parent = center_anchor
			font = text_a1
			text = "Screen\\b1"
			Scale = 0.8
			Pos = (-16.0, 0.0)
			just = [
				RIGHT
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = center_circle
			type = TextElement
			parent = center_anchor
			font = text_a1
			text = "\\b2Drop"
			Scale = 0.8
			Pos = (16.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = center_tri_button
			type = TextElement
			parent = center_anchor
			font = text_a1
			text = "\\b0"
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		if ($screenshotmode = 0)
			<text> = "ScreenShot Unpaused"
		else
			<text> = "ScreenShot Paused"
		endif
		CreateScreenElement {
			id = center_tri
			type = TextElement
			parent = center_anchor
			font = text_a1
			text = <text>
			Scale = 0.8
			Pos = (0.0, -16.0)
			just = [center bottom]
			rgba = [100 100 100 255]
		}
		CreateScreenElement \{id = center_x_button
			type = TextElement
			parent = center_anchor
			font = text_a1
			text = "\\b3"
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = center_x
			type = TextElement
			parent = center_anchor
			font = text_a1
			text = "Viewer"
			Scale = 0.8
			Pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		SetScreenElementLock \{id = root_window on}
	endif
endscript

script hide_analog_options 
	if ScreenElementExists \{id = viewer_options_anchor}
		DestroyScreenElement \{id = viewer_options_anchor}
	endif
endscript
toggleviewmode_enabled = FALSE

script ToggleViewMode 
	if ($toggleviewmode_enabled = FALSE)
		return
	endif
	switch $view_mode
		case 0
		GetViewportCameraPos \{viewport = bg_viewport}
		GetViewportCameraOrient \{viewport = bg_viewport}
		change \{viewercam_nofail = 1}
		SetSaveZoneNameToCurrent
		SetAnalogStickActiveForMenus \{0}
		change \{view_mode = 1}
		SetEnableMovies \{0}
		MakeGemsVisibleOnAllViewports
		pausegh3
		unpausespawnedscript \{update_crowd_model_cam}
		disable_bg_viewport
		enable_crowd_models_cfunc \{active = TRUE}
		if ScreenElementExists \{id = hud_destroygroup_windowp1}
			DoScreenElementMorph \{id = hud_destroygroup_windowp1 alpha = 0}
		endif
		case 1
		change \{view_mode = 2}
		case 2
		change \{viewercam_nofail = 0}
		if NOT GotParam \{no_reload}
			GetSaveZoneName
			SetPakManCurrentBlock map = zones pakname = <save_zone>
		endif
		change \{view_mode = 0}
		SetAnalogStickActiveForMenus \{1}
		viewer_cam :sethfov hfov = ($camera_fov)
		SetEnableMovies \{1}
		if ScreenElementExists \{id = hud_destroygroup_windowp1}
			DoScreenElementMorph \{id = hud_destroygroup_windowp1 alpha = 1}
		endif
		enable_bg_viewport
		unpausegh3
		enable_pause
	endswitch
	SetViewMode \{$view_mode}
	if ($view_mode = 1)
		SetViewportCameraOrient viewport = bg_viewport at = <at> left = <left> up = <up>
		SetViewportCameraPos viewport = bg_viewport Pos = <Pos>
	endif
	if ($view_mode = 2)
		ToggleViewMode
	endif
endscript
NEWSCREENSHOTMODE = 0

script userselectx 
	if IsTrue \{$soft_assert_active}
		return
	endif
	change \{viewer_rotation_angle = 0}
	ToggleViewMode
	switch_to_env_speed
	if ($view_mode = 1)
		set_viewer_speed
	endif
	if ($show_battle_text = 1)
		change \{show_battle_text = 0}
	else
		change \{show_battle_text = 1}
	endif
endscript

script userselectrightanalogup 
	toggle2d
endscript

script userselectrightanalogdown 
	ToggleMetrics
endscript

script flip_crowd_debug_mode 
	if ($crowd_debug_mode = 1)
		change \{crowd_debug_mode = 0}
	else
		change \{crowd_debug_mode = 1}
	endif
endscript
pak_mode = 0

script userselectrightanalogleft 
	battlemode_fill
endscript
toggle_nav_view_mode = 0

script userselectrightanalogright 
	Pos = (1000.0, 170.0)
	if ($debug_forcescore = Off)
		change \{debug_forcescore = poor}
		create_panel_message text = "AutoPlay: Poor" Pos = <Pos> id = autoplay
	elseif ($debug_forcescore = poor)
		change \{debug_forcescore = medium}
		create_panel_message text = "AutoPlay: Medium" Pos = <Pos> id = autoplay
	elseif ($debug_forcescore = medium)
		change \{debug_forcescore = good}
		create_panel_message text = "AutoPlay: Good" Pos = <Pos> id = autoplay
	elseif ($debug_forcescore = good)
		change \{debug_forcescore = Off}
		create_panel_message text = "AutoPlay: OFF" Pos = <Pos> id = autoplay
	endif
	crowdincrease \{player_status = player1_status}
endscript

script userselectleftanalogup 
	calc_songscoreinfo
	if ($debug_forcescore = Off)
		change structurename = player1_status Score = ($player1_status.base_score * 2.8 + 1)
		change structurename = player1_status total_notes = ($player1_status.max_notes)
		change structurename = player1_status notes_hit = ($player1_status.total_notes)
	elseif ($debug_forcescore = poor)
		change structurename = player1_status Score = ($player1_status.base_score / 2 + 1)
	elseif ($debug_forcescore = medium)
		change structurename = player1_status Score = ($player1_status.base_score + 1)
	elseif ($debug_forcescore = good)
		change structurename = player1_status Score = ($player1_status.base_score * 2.8 + 1)
		change structurename = player1_status total_notes = ($player1_status.max_notes)
		change structurename = player1_status notes_hit = ($player1_status.total_notes)
	endif
	if ($game_mode = training)
		finish_practice_song
	else
		GuitarEvent_SongWon
	endif
endscript

script userselectleftanalogdown 
	if NOT ScreenElementExists \{id = view_models_menu}
		set_select_text \{text = $modelviewer_text}
	else
		set_select_text \{text = $root_text}
	endif
	switch_to_obj_speed
	toggle_model_viewer
	if ScreenElementExists \{id = view_models_menu}
		set_viewer_speed
	endif
endscript

script userselectleftanalogleft 
	if ScreenElementExists \{id = view_models_menu}
		set_player_to_model
	else
		spawnscriptnow \{profile_camera_cuts}
	endif
endscript

script userselectleftanalogright 
	if ScreenElementExists \{id = view_models_menu}
		ResetModelViewerCamera
	else
		CycleReviewLighting
	endif
endscript
viewer_rotation_angle = 0

script UserViewerX 
	if ($viewer_rotation_angle = 0)
		change \{viewer_rotation_angle = 1}
		CenterCamera \{Scale = 0.5 y = -45}
	else
		if ($viewer_rotation_angle = 1)
			CenterCamera \{Scale = 0.5 y = -135}
			change \{viewer_rotation_angle = 2}
		else
			if ($viewer_rotation_angle = 2)
				change \{viewer_rotation_angle = 3}
				CenterCamera \{Scale = 0.5 y = -225}
			else
				if ($viewer_rotation_angle = 3)
					change \{viewer_rotation_angle = 0}
					CenterCamera \{Scale = 0.5 y = -315}
				endif
			endif
		endif
	endif
endscript

script UserViewerSquare 
	if ($viewer_rotation_angle = 0)
		change \{viewer_rotation_angle = 1}
		CenterCamera \{x = -10 y = -90 Scale = 0.7}
	else
		if ($viewer_rotation_angle = 1)
			CenterCamera \{x = -10 y = -180 Scale = 0.7}
			change \{viewer_rotation_angle = 2}
		else
			if ($viewer_rotation_angle = 2)
				change \{viewer_rotation_angle = 3}
				CenterCamera \{x = -10 y = -270 Scale = 0.7}
			else
				if ($viewer_rotation_angle = 3)
					change \{viewer_rotation_angle = 0}
					CenterCamera \{x = -10 y = 0 Scale = 0.7}
				endif
			endif
		endif
	endif
endscript
Viewer_move_mode = 1
Obj_Viewer_move_mode = 0
Env_Viewer_move_mode = 2
viewer_speed = env
USER_VIEWER_TRIANGLE_TOD = 1

script UserViewerTriangle 
endscript

script switch_to_env_speed 
	change Viewer_move_mode = ($Env_Viewer_move_mode)
	change \{viewer_speed = env}
endscript

script switch_to_obj_speed 
	change Viewer_move_mode = ($Obj_Viewer_move_mode)
	change \{viewer_speed = obj}
endscript

script set_viewer_speed 
	switch $Viewer_move_mode
		case 0
		SetMovementVelocity \{2.5}
		SetRotateVelocity \{50}
		create_panel_message \{id = viewermovemode
			text = "1 Super Slow cam"
			Pos = (320.0, 84.0)
			rgba = [
				64
				0
				0
				128
			]}
		case 1
		SetMovementVelocity \{6}
		SetRotateVelocity \{80}
		create_panel_message \{id = viewermovemode
			text = "2 Slow cam"
			Pos = (320.0, 84.0)
			rgba = [
				128
				64
				0
				128
			]}
		case 2
		SetMovementVelocity \{18}
		SetRotateVelocity \{120}
		create_panel_message \{id = viewermovemode
			text = "3 Medium cam"
			Pos = (320.0, 84.0)
			rgba = [
				96
				96
				0
				128
			]}
		case 3
		SetMovementVelocity \{43}
		SetRotateVelocity \{160}
		create_panel_message \{id = viewermovemode
			text = "4 Medium Fast cam"
			Pos = (320.0, 84.0)
			rgba = [
				128
				128
				0
				128
			]}
		case 4
		SetMovementVelocity \{127}
		SetRotateVelocity \{200}
		create_panel_message \{id = viewermovemode
			text = "5 Fast cam"
			Pos = (320.0, 84.0)
			rgba = [
				0
				128
				0
				128
			]}
	endswitch
	if ($viewer_speed = env)
		change Env_Viewer_move_mode = ($Viewer_move_mode)
	else
		change Obj_Viewer_move_mode = ($Viewer_move_mode)
	endif
endscript

script UserViewerL1 
	change \{viewer_rotation_angle = 0}
	switch $Viewer_move_mode
		case 0
		change \{Viewer_move_mode = 1}
		case 1
		change \{Viewer_move_mode = 2}
		case 2
		change \{Viewer_move_mode = 3}
		case 3
		change \{Viewer_move_mode = 4}
		case 4
		change \{Viewer_move_mode = 0}
	endswitch
	set_viewer_speed
endscript

script UserViewerL2 
	change \{viewer_rotation_angle = 0}
	switch $Viewer_move_mode
		case 0
		change \{Viewer_move_mode = 4}
		case 1
		change \{Viewer_move_mode = 0}
		case 2
		change \{Viewer_move_mode = 1}
		case 3
		change \{Viewer_move_mode = 2}
		case 4
		change \{Viewer_move_mode = 3}
	endswitch
	set_viewer_speed
endscript

script show_wireframe_mode 
	switch wireframe_mode
		case 0
		wireframe_message \{text = "Wireframe : Face Flags"}
		case 1
		wireframe_message \{text = "Wireframe : Poly Density"}
		case 2
		wireframe_message \{text = "Wireframe : Low Poly Highlight"}
		case 3
		wireframe_message \{text = "Wireframe : Unique object colors"}
		case 4
		wireframe_message \{text = "Wireframe : Renderable Unique MESH colors"}
		case 5
		wireframe_message \{text = "Wireframe : Renderable MESH vertex density"}
		case 6
		wireframe_message \{text = "Wireframe : Occlusion Map"}
	endswitch
endscript

script wireframe_message \{text = "Wireframe"}
	create_panel_message text = <text> id = wireframe_mess rgba = [200 128 128 128] Pos = (20.0, 340.0) just = [left center] Scale = 5 style = wireframe_style
endscript

script wireframe_style 
	DoMorph \{time = 0 Scale = (1.0, 1.0)}
	DoMorph \{time = 3 Scale = (1.0, 1.0)}
	DoMorph \{time = 1 alpha = 0}
	Die
endscript

script viewerleft 
	viewer_cam :gethfov
	hfov = (<hfov> + 1)
	if (<hfov> > 150)
		hfov = 150
	endif
	viewer_cam :sethfov hfov = <hfov>
	viewer_print_debug_info
endscript

script viewerright 
	viewer_cam :gethfov
	hfov = (<hfov> -1)
	if (<hfov> < 5)
		hfov = 5
	endif
	viewer_cam :sethfov hfov = <hfov>
	viewer_print_debug_info
endscript

script viewerup 
	printf \{"ViewerUp - Deprecated"}
endscript

script viewerdown 
	printf \{"ViewerDown - Deprecated"}
endscript

script viewer_print_debug_info 
endscript
