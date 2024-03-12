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

script set_select_text \{Text = $root_text}
	Change all_text = (<Text>.all_text)
	Change alr_text = (<Text>.alr_text)
	Change alu_text = (<Text>.alu_text)
	Change ald_text = (<Text>.ald_text)
	Change arl_text = (<Text>.arl_text)
	Change arr_text = (<Text>.arr_text)
	Change aru_text = (<Text>.aru_text)
	Change ard_text = (<Text>.ard_text)
	Change select_text = <Text>
	refresh_analog_options
endscript

script refresh_analog_options 
	hide_analog_options
	show_analog_options
endscript

script UserSelectSelect 
	if InFrontEnd
		return
	endif
	if IsObserving
		return
	endif
	if IsSurveying
		return
	endif
	if ScreenelementExists \{Id = current_menu_anchor}
		return
	endif
	if ScreenelementExists \{Id = root_window}
		if root_window :GetSingleTag \{menu_state}
			if (<menu_state> = On)
				return
			endif
		endif
	endif
	if ScreenelementExists \{Id = videophone_notification}
		return
	endif
	if ObjectExists \{Id = skatercam0}
		switch skater_cam_0_mode
			case 1
			Change \{skater_cam_0_mode = 2}
			case 2
			Change \{skater_cam_0_mode = 3}
			case 3
			Change \{skater_cam_0_mode = 4}
			case 4
			Change \{skater_cam_0_mode = 1}
		endswitch
		skatercam0 :sc_setmode \{mode = skater_cam_0_mode}
	endif
endscript

script UserSelectSelect2 
	if InFrontEnd
		return
	endif
	if IsObserving
		return
	endif
	if IsSurveying
		return
	endif
	if ScreenelementExists \{Id = current_menu_anchor}
		return
	endif
	if ScreenelementExists \{Id = root_window}
		if root_window :GetSingleTag \{menu_state}
			if (<menu_state> = On)
				return
			endif
		endif
	endif
	if ObjectExists \{Id = skatercam1}
		switch skater_cam_1_mode
			case 1
			Change \{skater_cam_1_mode = 2}
			case 2
			Change \{skater_cam_1_mode = 3}
			case 3
			Change \{skater_cam_1_mode = 4}
			case 4
			Change \{skater_cam_1_mode = 1}
		endswitch
		skatercam1 :sc_setmode \{mode = skater_cam_1_mode}
	endif
endscript
view_mode = 0
render_mode = 0
wireframe_mode = 0
drop_in_car = 0
drop_in_car_setup = MiniBajaCarSetup

script UserSelectTriangle 
	if ($NEWSCREENSHOTMODE)
	endif
	if ($view_mode = 1)
		return
	endif
	if ($screenshotmode = 0)
		Change \{screenshotmode = 1}
		<Text> = "ScreenShot Paused"
	else
		Change \{screenshotmode = 0}
		<Text> = "ScreenShot Unpaused"
	endif
	if ScreenelementExists \{Id = center_tri}
		setScreenElementProps {
			Id = center_tri
			Text = <Text>
		}
	endif
	return
	if NotCD
		switch $render_mode
			case 0
			Change \{render_mode = 1}
			show_wireframe_mode
			case 1
			Change \{render_mode = 2}
			show_wireframe_mode
			case 2
			Change \{render_mode = 3}
			toggle_wireframe_skins
			case 3
			Change \{render_mode = 4}
			toggle_wireframe_skins
			case 4
			Change \{render_mode = 0}
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
	Change \{viewer_taking_screenshot = 1}
	hide_analog_options
	if toggle2d \{OFF}
		Wait \{2 frames}
		hide_analog_options
		Wait \{2 frames}
		screenshot
		Wait \{2 frames}
		toggle2d \{On}
		Change \{viewer_taking_screenshot = 0}
	else
		Wait \{2 frames}
		hide_analog_options
		Wait \{2 frames}
		screenshot
		Wait \{2 frames}
		Change \{viewer_taking_screenshot = 0}
	endif
endscript

script UserSelectSquare 
	if NotCD
		Spawnscriptlater \{do_screenshot}
	endif
endscript

script UserSelectCircle 
	if ($render_mode)
		if NotCD
			switch wireframe_mode
				case 0
				Change \{wireframe_mode = 1}
				case 1
				Change \{wireframe_mode = 2}
				case 2
				Change \{wireframe_mode = 3}
				case 3
				Change \{wireframe_mode = 4}
				case 4
				Change \{wireframe_mode = 5}
				case 5
				Change \{wireframe_mode = 6}
				case 6
				Change \{wireframe_mode = 0}
			endswitch
			setwireframemode \{mode = wireframe_mode}
			show_wireframe_mode
		endif
	endif
endscript

script UserSelectStart 
	if NotCD
		Change \{render_mode = 0}
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
	if NOT ScreenelementExists \{Id = viewer_options_anchor}
		SetScreenElementLock \{Id = root_window OFF}
		createScreenElement \{Id = viewer_options_anchor Type = containerElement PARENT = root_window pos = (0.0, 0.0) z_priority = 6000}
		createScreenElement \{Id = viewer_options_bg Type = spriteElement PARENT = viewer_options_anchor Dims = (1280.0, 160.0) pos = (0.0, 20.0) just = [Left top] rgba = [0 0 0 255] Alpha = 0.3}
		createScreenElement \{Id = left_anchor Type = containerElement PARENT = viewer_options_anchor scale = 1.0 pos = (256.0, 96.0) just = [Left top]}
		createScreenElement \{Id = analog_l_l Type = textElement PARENT = left_anchor font = text_A1 Text = $all_text scale = 0.8 pos = (0.0, 0.0) just = [Right Center] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_l_r Type = textElement PARENT = left_anchor font = text_A1 Text = $alr_text scale = 0.8 pos = (0.0, 0.0) just = [Left Center] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_l_t_button Type = textElement PARENT = left_anchor font = text_A1 Text = "\\b7" scale = 0.8 pos = (0.0, 0.0) just = [Center Bottom] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_l_t Type = textElement PARENT = left_anchor font = text_A1 Text = $alu_text scale = 0.8 pos = (0.0, -28.0) just = [Center Bottom] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_l_b_button Type = textElement PARENT = left_anchor font = text_A1 Text = "\\b4" scale = 0.8 pos = (0.0, 0.0) just = [Center top] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_l_b Type = textElement PARENT = left_anchor font = text_A1 Text = $ald_text scale = 0.8 pos = (0.0, 32.0) just = [Center top] rgba = [100 100 100 255]}
		createScreenElement \{Id = right_anchor Type = containerElement PARENT = viewer_options_anchor scale = 1.0 pos = (1024.0, 96.0) just = [Left top]}
		createScreenElement \{Id = analog_r_l Type = textElement PARENT = right_anchor font = text_A1 Text = $arl_text scale = 0.8 pos = (0.0, 0.0) just = [Right Center] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_r_r Type = textElement PARENT = right_anchor font = text_A1 Text = $arr_text scale = 0.8 pos = (0.0, 0.0) just = [Left Center] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_r_t_button Type = textElement PARENT = right_anchor font = text_A1 Text = "\\b7" scale = 0.8 pos = (0.0, 0.0) just = [Center Bottom] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_r_t Type = textElement PARENT = right_anchor font = text_A1 Text = $aru_text scale = 0.8 pos = (0.0, -28.0) just = [Center Bottom] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_r_b_button Type = textElement PARENT = right_anchor font = text_A1 Text = "\\b4" scale = 0.8 pos = (0.0, 0.0) just = [Center top] rgba = [100 100 100 255]}
		createScreenElement \{Id = analog_r_b Type = textElement PARENT = right_anchor font = text_A1 Text = $ard_text scale = 0.8 pos = (0.0, 32.0) just = [Center top] rgba = [100 100 100 255]}
		createScreenElement \{Id = center_anchor Type = containerElement PARENT = viewer_options_anchor scale = 1.0 pos = (640.0, 96.0) just = [Left top]}
		createScreenElement \{Id = center_square Type = textElement PARENT = center_anchor font = text_A1 Text = "Screen\\b1" scale = 0.8 pos = (-16.0, 0.0) just = [Right Center] rgba = [100 100 100 255]}
		createScreenElement \{Id = center_circle Type = textElement PARENT = center_anchor font = text_A1 Text = "\\b2Drop" scale = 0.8 pos = (16.0, 0.0) just = [Left Center] rgba = [100 100 100 255]}
		createScreenElement \{Id = center_tri_button Type = textElement PARENT = center_anchor font = text_A1 Text = "\\b0" scale = 0.8 pos = (0.0, 0.0) just = [Center Bottom] rgba = [100 100 100 255]}
		if ($screenshotmode = 0)
			<Text> = "ScreenShot Unpaused"
		else
			<Text> = "ScreenShot Paused"
		endif
		createScreenElement {
			Id = center_tri
			Type = textElement
			PARENT = center_anchor
			font = text_A1
			Text = <Text>
			scale = 0.8
			pos = (0.0, -16.0)
			just = [Center Bottom]
			rgba = [100 100 100 255]
		}
		createScreenElement \{Id = center_x_button Type = textElement PARENT = center_anchor font = text_A1 Text = "\\b3" scale = 0.8 pos = (0.0, 0.0) just = [Center top] rgba = [100 100 100 255]}
		createScreenElement \{Id = center_x Type = textElement PARENT = center_anchor font = text_A1 Text = "Viewer" scale = 0.8 pos = (0.0, 32.0) just = [Center top] rgba = [100 100 100 255]}
		SetScreenElementLock \{Id = root_window On}
	endif
endscript

script hide_analog_options 
	if ScreenelementExists \{Id = viewer_options_anchor}
		DestroyScreenelement \{Id = viewer_options_anchor}
	endif
endscript
toggleviewmode_enabled = FALSE

script ToggleViewMode 
	if ($toggleviewmode_enabled = FALSE)
		return
	endif
	switch $view_mode
		case 0
		GetViewportCameraPos \{viewport = Bg_Viewport}
		GetViewportCameraOrient \{viewport = Bg_Viewport}
		Change \{viewercam_nofail = 1}
		SetSaveZoneNameToCurrent
		SetAnalogStickActiveForMenus \{0}
		Change \{view_mode = 1}
		SetEnableMovies \{0}
		MakeGemsVisibleOnAllViewports
		pausegh3
		UnPauseSpawnedScript \{update_crowd_model_cam}
		disable_bg_viewport
		enable_crowd_models_cfunc \{Active = TRUE}
		if ScreenelementExists \{Id = hud_destroygroup_windowp1}
			DoScreenElementMorph \{Id = hud_destroygroup_windowp1 Alpha = 0}
		endif
		case 1
		Change \{view_mode = 2}
		case 2
		Change \{viewercam_nofail = 0}
		if NOT gotParam \{no_reload}
			GetSaveZoneName
			SetPakManCurrentBlock map = Zones pakname = <save_zone>
		endif
		Change \{view_mode = 0}
		SetAnalogStickActiveForMenus \{1}
		viewer_cam :SetHFOV hFOV = ($camera_fov)
		SetEnableMovies \{1}
		if ScreenelementExists \{Id = hud_destroygroup_windowp1}
			DoScreenElementMorph \{Id = hud_destroygroup_windowp1 Alpha = 1}
		endif
		enable_bg_viewport
		unpausegh3
		enable_pause
	endswitch
	SetViewMode \{$view_mode}
	if ($view_mode = 1)
		SetViewportCameraOrient viewport = Bg_Viewport at = <at> Left = <Left> Up = <Up>
		SetViewportCameraPos viewport = Bg_Viewport pos = <pos>
	endif
	if ($view_mode = 2)
		ToggleViewMode
	endif
endscript
NEWSCREENSHOTMODE = 0

script UserSelectX 
	if IsTrue \{$soft_assert_active}
		return
	endif
	Change \{viewer_rotation_angle = 0}
	ToggleViewMode
	switch_to_env_speed
	if ($view_mode = 1)
		set_viewer_speed
	endif
	if ($show_battle_text = 1)
		Change \{show_battle_text = 0}
	else
		Change \{show_battle_text = 1}
	endif
endscript

script UserSelectRightAnalogUp 
	toggle2d
endscript

script UserSelectRightAnalogDown 
	ToggleMetrics
endscript

script flip_crowd_debug_mode 
	if ($crowd_debug_mode = 1)
		Change \{crowd_debug_mode = 0}
	else
		Change \{crowd_debug_mode = 1}
	endif
endscript
pak_mode = 0

script UserSelectRightAnalogLeft 
	battlemode_fill
endscript
toggle_nav_view_mode = 0

script UserSelectRightAnalogRight 
	pos = (1000.0, 170.0)
	if ($debug_forcescore = OFF)
		Change \{debug_forcescore = Poor}
		create_panel_message Text = "AutoPlay: Poor" pos = <pos> Id = autoplay
		elseif ($debug_forcescore = Poor)
		Change \{debug_forcescore = MEDIUM}
		create_panel_message Text = "AutoPlay: Medium" pos = <pos> Id = autoplay
		elseif ($debug_forcescore = MEDIUM)
		Change \{debug_forcescore = GOOD}
		create_panel_message Text = "AutoPlay: Good" pos = <pos> Id = autoplay
		elseif ($debug_forcescore = GOOD)
		Change \{debug_forcescore = OFF}
		create_panel_message Text = "AutoPlay: OFF" pos = <pos> Id = autoplay
	endif
	CrowdIncrease \{player_status = player1_status}
endscript

script UserSelectLeftAnalogUp 
	calc_songscoreinfo
	if ($debug_forcescore = OFF)
		Change StructureName = player1_status score = ($player1_status.base_score * 2.8 + 1)
		Change StructureName = player1_status total_notes = ($player1_status.max_notes)
		Change StructureName = player1_status NOTES_HIT = ($player1_status.total_notes)
		elseif ($debug_forcescore = Poor)
		Change StructureName = player1_status score = ($player1_status.base_score / 2 + 1)
		elseif ($debug_forcescore = MEDIUM)
		Change StructureName = player1_status score = ($player1_status.base_score + 1)
		elseif ($debug_forcescore = GOOD)
		Change StructureName = player1_status score = ($player1_status.base_score * 2.8 + 1)
		Change StructureName = player1_status total_notes = ($player1_status.max_notes)
		Change StructureName = player1_status NOTES_HIT = ($player1_status.total_notes)
	endif
	if ($game_mode = training)
		finish_practice_song
	else
		GuitarEvent_SongWon
	endif
endscript

script UserSelectLeftAnalogDown 
	if NOT ScreenelementExists \{Id = view_models_menu}
		set_select_text \{Text = $modelviewer_text}
	else
		set_select_text \{Text = $root_text}
	endif
	switch_to_obj_speed
	toggle_model_viewer
	if ScreenelementExists \{Id = view_models_menu}
		set_viewer_speed
	endif
endscript

script UserSelectLeftAnalogLeft 
	if ScreenelementExists \{Id = view_models_menu}
		set_player_to_model
	else
		SpawnScriptNOw \{profile_camera_cuts}
	endif
endscript

script UserSelectLeftAnalogRight 
	if ScreenelementExists \{Id = view_models_menu}
		ResetModelViewerCamera
	else
		CycleReviewLighting
	endif
endscript
viewer_rotation_angle = 0

script UserViewerX 
	if ($viewer_rotation_angle = 0)
		Change \{viewer_rotation_angle = 1}
		CenterCamera \{scale = 0.5 Y = -45}
	else
		if ($viewer_rotation_angle = 1)
			CenterCamera \{scale = 0.5 Y = -135}
			Change \{viewer_rotation_angle = 2}
		else
			if ($viewer_rotation_angle = 2)
				Change \{viewer_rotation_angle = 3}
				CenterCamera \{scale = 0.5 Y = -225}
			else
				if ($viewer_rotation_angle = 3)
					Change \{viewer_rotation_angle = 0}
					CenterCamera \{scale = 0.5 Y = -315}
				endif
			endif
		endif
	endif
endscript

script UserViewerSquare 
	if ($viewer_rotation_angle = 0)
		Change \{viewer_rotation_angle = 1}
		CenterCamera \{X = -10 Y = -90 scale = 0.7}
	else
		if ($viewer_rotation_angle = 1)
			CenterCamera \{X = -10 Y = -180 scale = 0.7}
			Change \{viewer_rotation_angle = 2}
		else
			if ($viewer_rotation_angle = 2)
				Change \{viewer_rotation_angle = 3}
				CenterCamera \{X = -10 Y = -270 scale = 0.7}
			else
				if ($viewer_rotation_angle = 3)
					Change \{viewer_rotation_angle = 0}
					CenterCamera \{X = -10 Y = 0 scale = 0.7}
				endif
			endif
		endif
	endif
endscript
Viewer_move_mode = 1
Obj_Viewer_move_mode = 0
Env_Viewer_move_mode = 2
viewer_speed = ENV
USER_VIEWER_TRIANGLE_TOD = 1

script UserViewerTriangle 
endscript

script switch_to_env_speed 
	Change Viewer_move_mode = ($Env_Viewer_move_mode)
	Change \{viewer_speed = ENV}
endscript

script switch_to_obj_speed 
	Change Viewer_move_mode = ($Obj_Viewer_move_mode)
	Change \{viewer_speed = Obj}
endscript

script set_viewer_speed 
	switch $Viewer_move_mode
		case 0
		SetMovementVelocity \{2.5}
		SetRotateVelocity \{50}
		create_panel_message \{Id = viewermovemode Text = "1 Super Slow cam" pos = (320.0, 84.0) rgba = [64 0 0 128]}
		case 1
		SetMovementVelocity \{6}
		SetRotateVelocity \{80}
		create_panel_message \{Id = viewermovemode Text = "2 Slow cam" pos = (320.0, 84.0) rgba = [128 64 0 128]}
		case 2
		SetMovementVelocity \{18}
		SetRotateVelocity \{120}
		create_panel_message \{Id = viewermovemode Text = "3 Medium cam" pos = (320.0, 84.0) rgba = [96 96 0 128]}
		case 3
		SetMovementVelocity \{43}
		SetRotateVelocity \{160}
		create_panel_message \{Id = viewermovemode Text = "4 Medium Fast cam" pos = (320.0, 84.0) rgba = [128 128 0 128]}
		case 4
		SetMovementVelocity \{127}
		SetRotateVelocity \{200}
		create_panel_message \{Id = viewermovemode Text = "5 Fast cam" pos = (320.0, 84.0) rgba = [0 128 0 128]}
	endswitch
	if ($viewer_speed = ENV)
		Change Env_Viewer_move_mode = ($Viewer_move_mode)
	else
		Change Obj_Viewer_move_mode = ($Viewer_move_mode)
	endif
endscript

script UserViewerL1 
	Change \{viewer_rotation_angle = 0}
	switch $Viewer_move_mode
		case 0
		Change \{Viewer_move_mode = 1}
		case 1
		Change \{Viewer_move_mode = 2}
		case 2
		Change \{Viewer_move_mode = 3}
		case 3
		Change \{Viewer_move_mode = 4}
		case 4
		Change \{Viewer_move_mode = 0}
	endswitch
	set_viewer_speed
endscript

script UserViewerL2 
	Change \{viewer_rotation_angle = 0}
	switch $Viewer_move_mode
		case 0
		Change \{Viewer_move_mode = 4}
		case 1
		Change \{Viewer_move_mode = 0}
		case 2
		Change \{Viewer_move_mode = 1}
		case 3
		Change \{Viewer_move_mode = 2}
		case 4
		Change \{Viewer_move_mode = 3}
	endswitch
	set_viewer_speed
endscript

script show_wireframe_mode 
	switch wireframe_mode
		case 0
		wireframe_message \{Text = "Wireframe : Face Flags"}
		case 1
		wireframe_message \{Text = "Wireframe : Poly Density"}
		case 2
		wireframe_message \{Text = "Wireframe : Low Poly Highlight"}
		case 3
		wireframe_message \{Text = "Wireframe : Unique object colors"}
		case 4
		wireframe_message \{Text = "Wireframe : Renderable Unique MESH colors"}
		case 5
		wireframe_message \{Text = "Wireframe : Renderable MESH vertex density"}
		case 6
		wireframe_message \{Text = "Wireframe : Occlusion Map"}
	endswitch
endscript

script wireframe_message \{Text = "Wireframe"}
	create_panel_message Text = <Text> Id = wireframe_mess rgba = [200 128 128 128] pos = (20.0, 340.0) just = [Left Center] scale = 5 style = wireframe_style
endscript

script wireframe_style 
	doMorph \{Time = 0 scale = (1.0, 1.0)}
	doMorph \{Time = 3 scale = (1.0, 1.0)}
	doMorph \{Time = 1 Alpha = 0}
	DIE
endscript

script ViewerLeft 
	viewer_cam :GetHFOV
	hFOV = (<hFOV> + 1)
	if (<hFOV> > 150)
		hFOV = 150
	endif
	viewer_cam :SetHFOV hFOV = <hFOV>
	viewer_print_debug_info
endscript

script ViewerRight 
	viewer_cam :GetHFOV
	hFOV = (<hFOV> -1)
	if (<hFOV> < 5)
		hFOV = 5
	endif
	viewer_cam :SetHFOV hFOV = <hFOV>
	viewer_print_debug_info
endscript

script ViewerUp 
	Printf \{"ViewerUp - Deprecated"}
endscript

script ViewerDown 
	Printf \{"ViewerDown - Deprecated"}
endscript

script viewer_print_debug_info 
endscript
