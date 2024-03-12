popup_warning_menu_font = fontgrid_title_gh3
popup_event_handlers_options = [
	{
		pad_up
		generic_menu_up_or_down_sound
		Params = {
			Up
		}
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		Params = {
			Down
		}
	}
]
popup_event_handlers_nooptions = [
]

script create_popup_warning_menu player_device = ($primary_controller)
	printStruct <...>
	<Menu_pos> = (640.0, 510.0)
	<menu_bg_offset> = (0.0, -28.0)
	<event_handlers> = {}
	if gotParam \{options}
		getArraySize <options>
		if (<array_Size> > 1)
			<event_handlers> = ($popup_event_handlers_options)
			<Menu_pos> = (640.0, 490.0)
			<menu_bg_offset> = (0.0, -8.0)
		endif
	endif
	new_menu {
		scrollid = pu_warning_scroll
		vmenuid = pu_warning_vmenu
		Menu_pos = <Menu_pos>
		Spacing = -45
		internal_just = [Center Center]
		event_handlers = <event_handlers>
		exclusive_device = <player_device>
	}
	set_focus_color \{rgba = [130 0 0 250]}
	set_unfocus_color \{rgba = [0 0 0 255]}
	createScreenElement \{Type = containerElement PARENT = root_window Id = popup_warning_container pos = (0.0, 0.0) just = [Left top]}
	if NOT (gotParam no_background)
		displaySprite \{PARENT = popup_warning_container tex = brick_bg pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] Z = 96}
	endif
	offwhite = [223 223 223 255]
	Z = 100
	displaySprite PARENT = popup_warning_container tex = Dialog_Title_BG flip_v pos = (416.0, 100.0) Dims = (224.0, 224.0) Z = <Z>
	displaySprite PARENT = popup_warning_container tex = Dialog_Title_BG pos = (640.0, 100.0) Dims = (224.0, 224.0) Z = <Z>
	if gotParam \{options}
		createScreenElement {
			Type = VMenu
			PARENT = popup_warning_container
			Id = options_bg_id
			pos = (<Menu_pos> + <menu_bg_offset>)
			just = [Center top]
			internal_just = [Center Center]
		}
		displaySprite PARENT = options_bg_id tex = Dialog_BG Z = <Z>
		displaySprite PARENT = options_bg_id tex = Dialog_BG flip_h Z = <Z>
	endif
	create_pause_menu_frame Z = (<Z> - 4)
	create_popup_warning_text <...>
	if gotParam \{options}
		create_popup_warning_menu_options <...>
	endif
endscript

script destroy_popup_warning_menu 
	destroy_pause_menu_frame
	destroy_menu_backdrop
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
endscript

script create_popup_warning_text \{title = "WARNING"}
	<title_scale> = 1.2
	if gotParam \{title_props}
		title_scale = (<title_props>.scale)
	endif
	createScreenElement {
		Type = textElement
		font = ($popup_warning_menu_font)
		Text = <title>
		just = [Center Center]
		pos = (640.0, 217.0)
		scale = <title_scale>
		PARENT = popup_warning_container
		rgba = [200 200 200 255]
		Shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<Z> + 2)
	}
	getScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = (280 * (1.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 only_if_larger_y = 0 start_x_scale = <title_scale> start_y_scale = <title_scale>
	if gotParam \{textblock}
		createScreenElement {
			Type = textblockelement
			font = ($popup_warning_menu_font)
			just = [Center Center]
			pos = (640.0, 375.0)
			Dims = (700.0, 400.0)
			scale = 0.6
			PARENT = popup_warning_container
			rgba = [210 130 0 250]
			Shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<Z> + 2)
			<textblock>
		}
	endif
	if gotParam \{textElement}
		createScreenElement {
			Type = textElement
			font = ($popup_warning_menu_font)
			just = [Center Center]
			pos = (640.0, 430.0)
			scale = 0.85
			PARENT = popup_warning_container
			rgba = [210 130 0 250]
			Shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<Z> + 2)
			<textElement>
		}
	endif
endscript

script create_popup_warning_menu_option \{max_option_width = 450}
	<focus_params> = {use_highlight = 1}
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		Dims = (0.0, 90.0)
		event_handlers = [
			{focus menu_popup_focus Params = <focus_params>}
			{unfocus menu_popup_unfocus Params = <focus_params>}
			{pad_choose (<option>.func)}
		]
	}
	<container_id> = <Id>
	createScreenElement {
		Type = HMenu
		PARENT = <container_id>
		internal_just = [Center top]
		just = [Center Center]
	}
	<spacer_id> = <Id>
	createScreenElement {
		Type = containerElement
		PARENT = <spacer_id>
		local_id = hi_left_spacer
		Dims = (64.0, 64.0)
	}
	createScreenElement {
		Type = spriteElement
		local_id = hi_left
		PARENT = <Id>
		texture = Dialog_Highlight
		rgba = [255 255 255 255]
		pos = (58.0, 7.0)
		just = [Right top]
		z_priority = (<Z> + 0.3)
		Alpha = 0
		flip_v
	}
	createScreenElement {
		Type = textElement
		font = ($popup_warning_menu_font)
		PARENT = <spacer_id>
		local_id = Text
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		just = [Center Center]
		z_priority = (<Z> + 1)
		(<option>)
	}
	getScreenElementDims Id = <Id>
	if gotParam \{max_option_width}
		fit_text_in_rectangle Id = <Id> Dims = (<max_option_width> * (1.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1
	endif
	createScreenElement {
		Type = containerElement
		PARENT = <spacer_id>
		local_id = hi_right_spacer
		Dims = (64.0, 64.0)
	}
	createScreenElement {
		Type = spriteElement
		local_id = hi_right
		PARENT = <Id>
		texture = Dialog_Highlight
		rgba = [255 255 255 255]
		pos = (0.0, 7.0)
		just = [Left top]
		z_priority = (<Z> + 1)
		Alpha = 0
	}
	SetScreenElementLock Id = <spacer_id> On
	SetScreenElementLock Id = <container_id> On
endscript

script create_popup_warning_menu_options 
	<PARENT> = pu_warning_vmenu
	getArraySize <options>
	<I> = 0
	begin
	create_popup_warning_menu_option option = (<options> [<I>]) Z = <Z> num_options = <array_Size> PARENT = <PARENT> max_option_width = <max_option_width>
	<I> = (<I> + 1)
	repeat <array_Size>
	<largest_width> = 0
	getScreenElementChildren \{Id = pu_warning_vmenu}
	getArraySize <children>
	<I> = 0
	begin
	getScreenElementDims Id = {(<children> [<I>]) child = 0}
	if (<largest_width> < <width>)
		<largest_width> = <width>
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	getScreenElementChildren \{Id = options_bg_id}
	getArraySize <children>
	<I> = 0
	begin
	getScreenElementDims Id = (<children> [<I>])
	setScreenElementProps Id = (<children> [<I>]) Dims = (<largest_width> * (1.0, 0.0) + <Height> * (0.0, 1.0) + (32.0, 0.0)) preserve_flip
	<I> = (<I> + 1)
	repeat <array_Size>
endscript

script menu_popup_focus 
	GetSingleTag \{Id}
	ResolveScreenElementId Id = {<Id> child = {0 child = Text}}
	retail_menu_focus Id = <resolved_id>
	if (<use_highlight> = 1)
		DoScreenElementMorph Id = {<Id> child = {0 child = {hi_right_spacer child = 0}}} Alpha = 1
		DoScreenElementMorph Id = {<Id> child = {0 child = {hi_left_spacer child = 0}}} Alpha = 1
	endif
endscript

script menu_popup_unfocus 
	GetSingleTag \{Id}
	ResolveScreenElementId Id = {<Id> child = {0 child = Text}}
	retail_menu_unfocus Id = <resolved_id>
	if (<use_highlight> = 1)
		DoScreenElementMorph Id = {<Id> child = {0 child = {hi_right_spacer child = 0}}} Alpha = 0
		DoScreenElementMorph Id = {<Id> child = {0 child = {hi_left_spacer child = 0}}} Alpha = 0
	endif
endscript
