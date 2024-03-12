
script create_snazzy_dialog_box \{title = "Title" Text = "Default text" anchor_id = dialog_box_anchor vmenu_id = dialog_box_vmenu container_id = dialog_box_container title_font = text_A1 font = text_A1 text_font = text_A1 pos = (320.0, 230.0) just = [Center top] scale = 0.8 line_spacing = 1 title_scale = 0.7 text_scale = 0.6 text_dims = (530.0, 0.0) exclusive_device = -1 pos_tweak = (0.0, -50.0) Bg_rgba = [8 15 24 170] title_rgba = [90 90 70 255] text_rgba = [90 70 50 255] bg_scale = 1 hmenu_pos = (0.0, 50.0) z_priority = 40 no_bg destroy_on_event = 1}
	if ScreenelementExists Id = <anchor_id>
		dialog_box_exit anchor_id = <anchor_id>
	endif
	if NOT innetgame
		if NOT InFrontEnd
		endif
	endif
	SetScreenElementLock \{Id = root_window OFF}
	createScreenElement {
		Type = containerElement
		PARENT = root_window
		Id = <anchor_id>
		Dims = (640.0, 480.0)
		pos = <pos>
		just = [Center Center]
		z_priority = <z_priority>
		Priority = <Priority>
		exclusive_device = <exclusive_device>
	}
	createScreenElement {
		Type = containerElement
		Id = <container_id>
		PARENT = <anchor_id>
		Dims = (640.0, 480.0)
		pos = <pos>
		just = [Center Center]
		z_priority = <z_priority>
		Priority = <Priority>
	}
	createScreenElement {
		Type = containerElement
		PARENT = <anchor_id>
		Dims = (640.0, 480.0)
		pos = (320.0, 240.0)
		just = [Center Center]
		z_priority = <z_priority>
	}
	<bg_anchor_id> = <Id>
	if gotParam \{from_cas}
		make_cas_bg_elements PARENT = <bg_anchor_id>
	else
		if InFrontEnd
			if NOT gotParam \{no_bg}
			endif
		endif
	endif
	if gotParam \{forced_pos}
		pos = <forced_pos>
	endif
	createScreenElement {
		Type = VMenu
		PARENT = <container_id>
		Id = <vmenu_id>
		pos = <pos>
		just = [Center top]
		internal_just = [Center top]
		scale = <scale>
		z_priority = <z_priority>
		padding_scale = 0.8
		exclusive_device = <exclusive_device>
	}
	if NOT gotParam \{no_helper_text}
		if gotParam \{buttons}
			getArraySize <buttons>
			if gotParam \{pad_back_script}
				if (<array_Size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						PARENT = <bg_anchor_id>
						$generic_dialog_helper_text3
						Bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						PARENT = <bg_anchor_id>
						$generic_helper_text
						Bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			else
				if (<array_Size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						PARENT = <bg_anchor_id>
						$generic_dialog_helper_text
						Bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						PARENT = <bg_anchor_id>
						$generic_dialog_helper_text2
						Bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			endif
		endif
	endif
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		local_id = dbox_title
		font = <title_font>
		Text = <title>
		just = [Center top]
		rgba = <title_rgba>
		scale = <title_scale>
		z_priority = <z_priority>
		NOT_FOCUSABLE
		padding_scale = 0.55
	}
	<title_id> = <Id>
	getScreenElementDims Id = <title_id>
	if gotParam \{use_goalmenu_bg}
		Bg_rgba = [20 30 40 80]
		createScreenElement {
			Type = spriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = dialog_frame
			just = [Center top]
			pos = (85.0, -20.0)
			rgba = [0 10 20 255]
			scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createScreenElement {
			Type = spriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = dialog_middle
			just = [Center top]
			pos = (85.0, 10.0)
			rgba = [0 10 20 255]
			scale = (2.125, 1.5)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createScreenElement {
			Type = spriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [Center top]
			pos = (85.0, 30.0)
			rgba = [0 10 20 255]
			scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createScreenElement {
			Type = spriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = menu_selection_white_02
			just = [Center top]
			pos = (85.0, 50.0)
			rgba = [5 15 25 70]
			scale = (1.5, 1.0)
			z_priority = (<z_priority> -1)
		}
		createScreenElement {
			Type = spriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [Center top]
			pos = (85.0, 103.0)
			rgba = [5 15 25 100]
			scale = (2.125, 0.25)
			z_priority = (<z_priority> -1)
		}
	endif
	createScreenElement {
		Type = textblockelement
		PARENT = <vmenu_id>
		font = <text_font>
		Text = <Text>
		just = [Center top]
		Dims = <text_dims>
		rgba = <text_rgba>
		scale = <text_scale>
		line_spacing = <line_spacing>
		allow_expansion
		NOT_FOCUSABLE
		padding_scale = 0.65000004
	}
	<text_id> = <Id>
	getScreenElementDims Id = <text_id>
	if gotParam \{buttons}
		createScreenElement {
			Type = containerElement
			PARENT = <vmenu_id>
			Dims = (<text_dims> + (50.0, 40.0))
			NOT_FOCUSABLE
		}
	endif
	if gotParam \{logo}
		createScreenElement {
			Type = containerElement
			PARENT = <vmenu_id>
			just = [Center Center]
			Dims = (0.0, 88.0)
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <Id>
			texture = <logo>
			just = [Center top]
			rgba = [100 100 100 255]
			scale = ((1.4, 1.3) * 1.4)
		}
		no_icon = no_icon
	endif
	if gotParam \{pad_back_script}
		setScreenElementProps {
			Id = <vmenu_id>
			event_handlers = [{pad_back <pad_back_script> Params = <pad_back_params>}]
			Replace_Handlers
		}
	endif
	SetScreenElementLock Id = <vmenu_id> On
	SetScreenElementLock Id = <vmenu_id> OFF
	getScreenElementDims Id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	if gotParam \{buttons}
		ForEachIn <buttons> do = create_dialog_button Params = {
			font = <font>
			PARENT = <vmenu_id>
			z_priority = (<z_priority> + 4)
			width = <section_width>
			pad_focus_script = <pad_focus_script>
			destroy_on_event = <destroy_on_event>
		}
		getArraySize <buttons>
		if (<array_Size> > 1)
			setScreenElementProps {
				Id = <vmenu_id>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound Params = {Up}}
					{pad_down generic_menu_up_or_down_sound Params = {Down}}
				]
			}
		endif
	endif
	if gotParam \{sub_logo}
		createScreenElement {
			Type = spriteElement
			PARENT = <vmenu_id>
			texture = <sub_logo>
			just = [Center Center]
			rgba = [128 128 128 88]
			scale = (1.25, 1.0)
			NOT_FOCUSABLE
		}
		no_icon = no_icon
	endif
	SetScreenElementLock Id = <vmenu_id> On
	SetScreenElementLock Id = <vmenu_id> OFF
	getScreenElementDims Id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	section_height = 32
	num_parts = (((<Height> * 1.0) / (<section_height> * 1.0)) -1.0)
	if NOT gotParam \{forced_pos}
		centered_pos = ((320.0, 0.0) + ((0.0, 1.0) * (480 - <Height>) / 2) + <pos_tweak>)
		setScreenElementProps Id = <vmenu_id> pos = <centered_pos>
	else
		centered_pos = <forced_pos>
	endif
	<bg_x_scale> = 1.2
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		pos = <centered_pos>
		just = [Center Bottom]
		texture = dialog_frame
		scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <Bg_rgba>
		z_priority = 38
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = dialog_middle
		pos = (<centered_pos> - (0.0, 16.0))
		scale = (((1.0, 0.0) * <bg_x_scale>) + (0.0, 1.0) * (<Height> / 16.0))
		just = [Center top]
		rgba = <Bg_rgba>
		z_priority = 38
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		pos = (<centered_pos> + (0.0, 1.0) * (<Height>) + (0.0, 15.0))
		just = [Center Bottom]
		texture = dialog_frame_b
		scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <Bg_rgba>
		z_priority = 38
	}
	kill_start_key_binding
	if ObjectExists \{Id = no_button}
		launchevent Type = focus Target = <vmenu_id> data = {child_id = no_button}
	else
		launchevent Type = focus Target = <vmenu_id>
	endif
	if gotParam \{delay_input}
		runScriptOnScreenElement Id = <anchor_id> dialog_box_delay_input Params = {delay_input_time = <delay_input_time>}
	endif
	if NOT gotParam \{no_animate}
		if gotParam \{style}
			runScriptOnScreenElement Id = <anchor_id> <style> Params = <...>
		else
			if NOT gotParam \{full_animate}
				runScriptOnScreenElement Id = <container_id> animate_dialog_box_in Params = <...>
			else
				runScriptOnScreenElement Id = <anchor_id> animate_dialog_box_in Params = <...>
			endif
		endif
	endif
	if ObjectExists \{Id = current_menu_anchor}
		launchevent \{Type = unfocus Target = current_menu_anchor}
	endif
	if ObjectExists \{Id = current_menu}
		launchevent \{Type = unfocus Target = current_menu}
	endif
endscript

script special_dialog_style 
	getScreenElementDims Id = <vmenu_id>
	GetScreenElementPosition Id = <vmenu_id>
	createScreenElement {
		Type = spriteElement
		PARENT = dialog_box_container
		Id = left_star
		pos = (<ScreenELementPos> + (40.0, 12.0))
		texture = PA_goals
		scale = 1.8
		flip_v
		rgba = [128 128 128 128]
	}
	createScreenElement {
		Type = spriteElement
		PARENT = dialog_box_container
		Id = right_star
		pos = ((1.0, 0.0) * <width> + <ScreenELementPos> + (-30.0, 12.0))
		texture = PA_goals
		scale = 1.8
		flip_v
		Rot_Angle = -10
		rgba = [100 100 100 255]
	}
	createScreenElement {
		Type = spriteElement
		PARENT = dialog_box_container
		Id = flash3
		pos = ((1.0, 0.0) * <width> + <ScreenELementPos> + (-275.0, 130.0))
		texture = spec_B_M
		scale = (7.3, 6.0)
		flip_v
		rgba = [126 2 84 58]
		z_priority = 11
	}
	createScreenElement {
		Type = spriteElement
		PARENT = dialog_box_container
		Id = topline
		pos = ((1.0, 0.0) * <width> + <ScreenELementPos> + (-275.0, 22.0))
		texture = white2
		scale = (60.0, 0.2)
		flip_v
		rgba = [13 121 4 128]
		z_priority = 11
	}
	createScreenElement {
		Type = spriteElement
		PARENT = dialog_box_container
		Id = topline2
		pos = ((1.0, 0.0) * <width> + <ScreenELementPos> + (-275.0, -5.0))
		texture = white2
		scale = (60.0, 0.2)
		flip_v
		rgba = [13 121 4 128]
		z_priority = 11
	}
	runScriptOnScreenElement \{Id = left_star spin_star Params = {Dir = cw}}
	runScriptOnScreenElement \{Id = right_star spin_star Params = {Dir = ccw}}
	<title_id> :Obj_SpawnScriptLater pulse_dialog_title Params = {Id = <title_id>}
	runScriptOnScreenElement Id = dialog_box_container animate_special_dialog_box_in Params = <...>
endscript

script animate_special_dialog_box_in 
	doMorph \{pos = (1000.0, 260.0) Alpha = 0 Time = 0 scale = 0 Rot_Angle = -220}
	doMorph \{pos = (320.0, 260.0) Alpha = 1 Time = 0.3 scale = 1.0 Rot_Angle = 0}
endscript

script spin_star \{Dir = cw}
	do_random_effect
endscript

script burst_star 
	doMorph \{Time = 0 scale = 0 Alpha = 0}
	doMorph \{Time = 0.4 scale = (7.5, 3.8) Alpha = 0.6}
endscript

script pulse_dialog_title 
	begin
	if ObjectExists Id = <Id>
		DoScreenElementMorph Id = <Id> Time = 0.2 scale = (1.8, 2.0) rgba = [13 121 4 128]
		Wait \{0.2 Seconds}
	else
		break
	endif
	if ObjectExists Id = <Id>
		DoScreenElementMorph Id = <Id> Time = 0.2 scale = (1.5, 1.5) rgba = [13 121 4 128]
		Wait \{0.2 Seconds}
	else
		break
	endif
	repeat
endscript

script theme_dialog_background \{PARENT = current_menu_anchor width = 1 pos = (320.0, 120.0) num_parts = 2 top_height = 1}
	if ScreenelementExists \{Id = dialog_box_bg_vmenu}
		DestroyScreenelement \{Id = dialog_box_bg_vmenu}
	endif
	dialog_bg_rgba = [30 30 35 216]
	SetScreenElementLock Id = <PARENT> OFF
	createScreenElement {
		Type = VMenu
		PARENT = <PARENT>
		Id = dialog_box_bg_vmenu
		font = text_A1
		just = [Left top]
		pos = <pos>
		padding_scale = 1
		internal_scale = 1
		internal_just = [Center Center]
	}
	middle_parts = <num_parts>
	castToInteger \{middle_parts}
	partial_scale = (<num_parts> - <middle_parts>)
	Printf "partial_scale = %p" P = <partial_scale>
	build_theme_dialog_top PARENT = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority> Height = <top_height>
	if (<middle_parts> > 0)
		begin
		build_theme_dialog_middle PARENT = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority>
		repeat <middle_parts>
	endif
	build_theme_dialog_middle PARENT = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority>
	build_theme_dialog_bottom PARENT = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> no_icon = <no_icon> add_loading_anim = <add_loading_anim>
endscript

script build_theme_dialog_top 
	createScreenElement {
		Type = containerElement
		Dims = (0.0, 32.0)
		PARENT = <PARENT>
	}
	anchor_id = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_T_M
		pos = (0.0, 0.0)
		just = [Center top]
		rgba = <dialog_bg_rgba>
		scale = ((1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
		z_priority = <z_priority>
	}
	<top_height> = <Height>
	getScreenElementDims Id = <Id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_T_L
		pos = <left_pos>
		just = [Right top]
		rgba = <dialog_bg_rgba>
		scale = ((1.0, 0.0) + (0.0, 1.0) * <top_height>)
		z_priority = <z_priority>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_T_R
		pos = <right_pos>
		just = [Left top]
		rgba = <dialog_bg_rgba>
		scale = ((1.0, 0.0) + (0.0, 1.0) * <top_height>)
		z_priority = <z_priority>
	}
endscript

script build_theme_dialog_middle \{scale_height = 1}
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		Dims = (0.0, 32.0)
	}
	anchor_id = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_M_M
		pos = (0.0, 0.0)
		just = [Center top]
		rgba = <dialog_bg_rgba>
		scale = ((1.0, 0.0) * <width> + <scale_height> * (0.0, 1.0))
		z_priority = <z_priority>
	}
	getScreenElementDims Id = <Id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	side_scale = ((1.0, 0.0) * 1 + <scale_height> * (0.0, 1.0))
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_M_L
		pos = <left_pos>
		just = [Right top]
		rgba = <dialog_bg_rgba>
		scale = <side_scale>
		z_priority = <z_priority>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_M_R
		pos = <right_pos>
		just = [Left top]
		rgba = <dialog_bg_rgba>
		scale = <side_scale>
		z_priority = <z_priority>
	}
endscript

script build_theme_dialog_bottom 
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		Dims = (0.0, 32.0)
	}
	anchor_id = <Id>
	pos = ((0.0, -1.0) * (32 - (<scale_height> * 32)))
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_B_M
		pos = <pos>
		just = [Center top]
		rgba = <dialog_bg_rgba>
		scale = ((1.0, 0.0) * <width> + (0.0, 1.0))
		z_priority = <z_priority>
	}
	getScreenElementDims Id = <Id>
	right_pos = ((0.5, 0.0) * <width> + <pos>)
	left_pos = ((-0.5, 0.0) * <width> + <pos>)
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_B_L
		pos = <left_pos>
		just = [Right top]
		rgba = <dialog_bg_rgba>
		scale = (1.0, 1.0)
		z_priority = <z_priority>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = snaz_B_R
		pos = <right_pos>
		just = [Left top]
		rgba = <dialog_bg_rgba>
		scale = (1.0, 1.0)
		z_priority = <z_priority>
	}
	if NOT gotParam \{no_icon}
		formatText Checksumname = theme_icon '%i_snaz_icon' I = (THEME_PREFIXES [$current_theme_prefix])
		if gotParam \{add_loading_anim}
			loading_color = [128 123 20 255]
		else
			<loading_color> = [90 90 90 70]
		endif
		createScreenElement {
			Type = spriteElement
			PARENT = <anchor_id>
			texture = <theme_icon>
			pos = ((0.0, 10.0) + <pos>)
			just = [Center Center]
			rgba = <loading_color>
			scale = (1.3, 1.3)
			z_priority = (<z_priority> + 1)
			Alpha = 0.7
		}
		if gotParam \{add_loading_anim}
			runScriptOnScreenElement Id = <Id> spin_dialog_icon
		endif
	endif
endscript

script spin_dialog_icon 
	<Rot_Angle> = 0
	begin
	doMorph Rot_Angle = <Rot_Angle>
	<Rot_Angle> = (<Rot_Angle> + 6)
	if (<Rot_Angle> > 360)
		<Rot_Angle> = (<Rot_Angle> - 360)
	endif
	Wait \{1 gameframes}
	repeat
endscript

script create_error_box \{delay_input_time = 1000}
	create_dialog_box <...> error_box
endscript

script create_dialog_box 
	create_snazzy_dialog_box <...>
endscript

script button_choose_script 
	destroy_dialog_box
	<callBack_Script> <callback_params>
endscript

script create_dialog_button \{focus_script = main_theme_focus focus_params = {highlighted_text_rgba = [0 20 30 255]} unfocus_script = main_theme_unfocus unfocus_params = {text_rgba = [80 90 100 255]} pad_choose_script = destroy_dialog_box font = text_A1 PARENT = dialog_box_vmenu width = 3 z_priority = 14 button_text_scale = 0.5 button_dims = (0.0, 30.0) text_color = [80 90 100 255] destroy_on_event = 1}
	SetScreenElementLock \{Id = root_window OFF}
	SetScreenElementLock Id = <PARENT> OFF
	if NOT gotParam \{ignore_default_option}
		if (<Text> = "No")
			Id = no_button
		endif
	endif
	if (<destroy_on_event> = 1)
		<pad_choose_params> = {callBack_Script = <pad_choose_script> callback_params = <pad_choose_params>}
		<pad_choose_script> = button_choose_script
	else
	endif
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		Id = <Id>
		Dims = <button_dims>
		just = [Center Center]
		event_handlers =
		[
			{focus <focus_script> Params = <focus_params>}
			{unfocus <unfocus_script> Params = <unfocus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_start generic_menu_pad_choose_sound}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
			{pad_start <pad_choose_script> Params = <pad_choose_params>}
		]
		<NOT_FOCUSABLE>
	}
	anchor_id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <anchor_id>
		pos = (0.0, 0.0)
		font = <font>
		Text = <Text>
		just = [Center Center]
		scale = <button_text_scale>
		rgba = <text_color>
		z_priority = <z_priority>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = menu_selection_white_01
		scale = (0.6, 0.5)
		rgba = [86 88 90 155]
		z_priority = (<z_priority> -1)
		local_id = Highlight_Bar
		Alpha = 0
		Random (@ flip_h @ flip_v @ )
	}
	highlight_angle = 0
	bar_scale = ((<width> + 2) * (0.5, 0.0) + (0.0, 0.7))
	highlight_angle = (<highlight_angle> / (<bar_scale>.(1.0, 0.0)))
endscript

script destroy_dialog_box \{anchor_id = dialog_box_anchor}
	if NOT gotParam \{dont_restore_input}
		SetButtonEventMappings \{unblock_menu_input}
	endif
	DeBounce \{X Time = 0.3}
	if ObjectExists Id = <anchor_id>
		DestroyScreenelement Id = <anchor_id>
	endif
	if NOT gotParam \{dont_focus}
		if ObjectExists \{Id = current_menu_anchor}
			launchevent \{Type = focus Target = current_menu_anchor}
		endif
	endif
endscript

script dialog_box_exit \{anchor_id = dialog_box_anchor}
	destroy_dialog_box <...>
	if NOT gotParam \{dont_restore_input}
		SetButtonEventMappings \{unblock_menu_input}
	endif
	DeBounce \{X Time = 0.3}
	if ObjectExists Id = <anchor_id>
		DestroyScreenelement Id = <anchor_id>
	endif
	if NOT gotParam \{no_pad_start}
		if NOT InFrontEnd
			restore_start_key_binding
		endif
	endif
endscript

script dialog_box_delay_input \{delay_input_time = 2000}
	TemporarilyDisableInput Time = <delay_input_time>
endscript
dont_create_speech_boxes = 0

script create_speech_box 
	killspawnedScript \{Id = create_speech_box_guts}
	SpawnScriptNOw create_speech_box_guts Params = {<...>}
endscript

script create_speech_box_guts \{pos = (640.0, 560.0) Bg_rgba = [8 15 24 50] text_rgba = [100 90 80 255] anchor_id = speech_box_anchor scale = (1.7, 0.71999997) pad_choose_script = speech_box_exit pad_choose_params = {} PARENT = root_window bg_x_scale = 1.12 pause_input_time = 1000}
	font = text_A1
	if ObjectExists Id = <anchor_id>
		DestroyScreenelement Id = <anchor_id>
	endif
	SetScreenElementLock \{Id = root_window OFF}
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		Id = <anchor_id>
		pos = <pos>
		just = [Center Bottom]
		scale = <scale>
		z_priority = <z_priority>
	}
	if NOT gotParam \{no_pad_choose}
		setScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_choose speech_box_input_debounce}
				{pad_choose <pad_choose_script> Params = <pad_choose_params>}]
			Replace_Handlers
		}
	endif
	if gotParam \{pad_back_script}
		setScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_back speech_box_input_debounce}
				{pad_back <pad_back_script> Params = <pad_back_params>}]
			Replace_Handlers
		}
	endif
	if gotParam \{pad_option_script}
		setScreenElementProps {
			Id = <anchor_id>
			event_handlers = [
				{pad_option <pad_option_script> Params = <pad_option_params>}]
			Replace_Handlers
		}
	endif
	if gotParam \{pad_option2_script}
		setScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_option2 speech_box_input_debounce}
				{pad_option2 <pad_option2_script> Params = <pad_option2_params>}]
			Replace_Handlers
		}
	endif
	if gotParam \{pad_up_script}
		setScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_up <pad_up_script> Params = <pad_up_params>}]
			Replace_Handlers
		}
	endif
	if gotParam \{pad_down_script}
		setScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_down <pad_down_script> Params = <pad_down_params>}]
			Replace_Handlers
		}
	endif
	if gotParam \{pad_left_script}
		setScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{PAD_LEFT <pad_left_script> Params = <pad_left_params>}]
			Replace_Handlers
		}
	endif
	if gotParam \{pad_right_script}
		setScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_right <pad_right_script> Params = <pad_right_params>}]
			Replace_Handlers
		}
	endif
	if NOT gotParam \{no_pad_start}
		setScreenElementProps {
			Id = root_window
			event_handlers = [{pad_start <pad_choose_script> Params = <pad_choose_params>}]
			Replace_Handlers
		}
	endif
	createScreenElement {
		Type = textblockelement
		PARENT = <anchor_id>
		font = <font>
		Dims = (540.0, 0.0)
		just = [Center Bottom]
		Text = <Text>
		rgba = <text_rgba>
		scale = (0.5, 1.05)
		allow_expansion
	}
	<speech_text> = <Id>
	getScreenElementDims Id = <speech_text>
	speech_text_height = <Height>
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		just = [Center top]
		texture = dialog_frame_b
		scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <Bg_rgba>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		pos = ((0.0, -1.0) * <speech_text_height>)
		just = [Center Bottom]
		texture = dialog_frame
		scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <Bg_rgba>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <anchor_id>
		texture = dialog_middle
		scale = (((1.0, 0.0) * <bg_x_scale>) + ((0.0, 1.0) * (<speech_text_height> / 16.0)))
		just = [Center Bottom]
		rgba = <Bg_rgba>
	}
	getScreenElementProps Id = <Id>
	pos_top = (<pos> [1])
	if gotParam \{style}
		runScriptOnScreenElement Id = <anchor_id> <style> Params = <...>
	endif
	launchevent Type = focus Target = <anchor_id>
	if gotParam \{pause_input}
		Spawnscriptlater TemporarilyDisableInput Params = {Time = <pause_input_time>}
	endif
endscript

script speech_box_exit \{anchor_id = speech_box_anchor}
	if ObjectExists Id = <anchor_id>
		DestroyScreenelement Id = <anchor_id>
	endif
	DeBounce \{X Time = 0.3}
	DeBounce \{CIRCLE Time = 0.3}
	if NOT gotParam \{no_pad_start}
		restore_start_key_binding
	endif
	launchevent \{Type = speech_box_destroyed}
endscript

script speech_box_input_debounce 
	DeBounce \{X Time = 0.3 CLEAR = 1}
	DeBounce \{CIRCLE Time = 0.3 CLEAR = 1}
	DeBounce \{Square Time = 0.3 CLEAR = 1}
	DeBounce \{Triangle Time = 0.3 CLEAR = 1}
endscript

script speech_box_style 
	runScriptOnScreenElement Id = <speech_text> hide_speech_text Params = <...>
	doMorph \{Time = 0 scale = (1.0, 1.0) Alpha = 1}
	Wait \{4 Frame}
	doMorph \{Time = 0.2 scale = (1.0, 1.0) Alpha = 1}
	runScriptOnScreenElement Id = <speech_text> speech_box_style_scale_text Params = <...>
endscript

script hide_speech_text 
	doMorph \{Time = 0 scale = 0}
endscript

script speech_box_style_scale_text 
	Wait \{0.05 Second}
	doMorph \{Time = 0 scale = (1.0, 1.0) Alpha = 0}
	doMorph \{Time = 0.5 scale = (1.0, 1.0) Alpha = 1}
	launchevent Type = focus Target = <anchor_id>
endscript

script animate_dialog_box_in 
	if gotParam \{full_animate}
		setScreenElementProps {
			Id = <bg_anchor_id>
			Hide
		}
	endif
	if NOT gotParam \{delay_input}
		<bg_anchor_id> :Obj_SpawnScriptLater dialog_box_delay_input Params = {delay_input_time = 300}
	endif
	doMorph \{Time = 0 scale = (0.0, 0.0) Alpha = 0.1}
	doMorph \{Time = 0.15 scale = (1.0, 0.0) Alpha = 0.4}
	doMorph \{Time = 0.15 scale = (1.0, 1.0) Alpha = 1.0}
	if gotParam \{full_animate}
		setScreenElementProps {
			Id = <bg_anchor_id>
			Unhide
		}
	endif
endscript

script create_test_dialog 
	if ScreenelementExists \{Id = current_menu_anchor}
		DestroyScreenelement \{Id = current_menu_anchor}
	endif
	create_dialog_box \{pad_back_script = create_test_menu buttons = [{font = text_A1 Text = "No" pad_choose_script = create_test_menu}{font = text_A1 Text = "Yes" pad_choose_script = null_script}]}
endscript

script dialog_box_accept 
	dialog_box_exit
	launchevent \{Type = message_accept}
endscript
