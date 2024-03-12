popup_warning_menu_font = fontgrid_title_gh3
popup_event_handlers_options = [
	{
		pad_up
		generic_menu_up_or_down_sound
		params = {
			up
		}
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		params = {
			down
		}
	}
]
popup_event_handlers_nooptions = [
]
g_cpw_have_helper_pills = 0

script create_popup_warning_menu player_device = ($primary_controller)
	printstruct <...>
	change \{g_cpw_have_helper_pills = 0}
	<menu_pos> = (640.0, 510.0)
	<menu_bg_offset> = (0.0, -28.0)
	<event_handlers> = {}
	if GotParam \{options}
		GetArraySize <options>
		if (<array_size> > 1)
			<event_handlers> = ($popup_event_handlers_options)
			<menu_pos> = (642.0, 496.0)
			<menu_bg_offset> = (-2.0, -8.0)
		endif
	endif
	if (<player_device> = -1)
		exclusive_mp_controllers = [0 , 0]
		SetArrayElement arrayName = exclusive_mp_controllers index = 0 newValue = ($player1_device)
		SetArrayElement arrayName = exclusive_mp_controllers index = 1 newValue = ($player2_device)
		<player_device> = <exclusive_mp_controllers>
	endif
	new_menu {
		scrollid = pu_warning_scroll
		vmenuid = pu_warning_vmenu
		menu_pos = <menu_pos>
		spacing = -45
		internal_just = [center center]
		event_handlers = <event_handlers>
		exclusive_device = <player_device>
		focus_color = pink
		unfocus_color = dk_violet_grey
	}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = popup_warning_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT (GotParam no_background)
		displaySprite \{parent = popup_warning_container
			tex = Venue_BG
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z = 96}
		popup_warning_container :settags \{no_background = 0}
	else
		popup_warning_container :settags \{no_background = 1}
	endif
	offwhite = [223 223 223 255]
	z = 100
	displaySprite parent = popup_warning_container tex = Dialog_Title_BG flip_v Pos = (416.0, 100.0) dims = (224.0, 224.0) z = <z>
	displaySprite parent = popup_warning_container tex = Dialog_Title_BG Pos = (640.0, 100.0) dims = (224.0, 224.0) z = <z>
	if GotParam \{options}
		CreateScreenElement {
			type = vmenu
			parent = popup_warning_container
			id = options_bg_id
			Pos = (<menu_pos> + <menu_bg_offset>)
			just = [center top]
			internal_just = [center center]
		}
		displaySprite parent = options_bg_id tex = dialog_bg z = <z>
		displaySprite parent = options_bg_id tex = dialog_bg flip_h z = <z>
	endif
	create_pause_menu_frame z = (<z> - 4)
	create_popup_warning_text <...>
	if GotParam \{options}
		create_popup_warning_menu_options <...>
	endif
	if GotParam \{helper_pills}
		change \{g_cpw_have_helper_pills = 1}
		change \{user_control_pill_text_color = [0 0 0 255]}
		change \{user_control_pill_color = [180 180 180 255]}
		GetArraySize <helper_pills>
		<i> = 0
		begin
		if (<helper_pills> [<i>] = select)
			add_user_control_helper \{text = "SELECT" button = green z = 100}
		elseif (<helper_pills> [<i>] = back)
			add_user_control_helper \{text = "BACK" button = red z = 100}
		elseif (<helper_pills> [<i>] = updown)
			add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script destroy_popup_warning_menu 
	destroy_pause_menu_frame
	if ScreenElementExists \{id = popup_warning_container}
		popup_warning_container :gettags
		if (<no_background> = 0)
			destroy_menu_backdrop
		endif
	endif
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	if ($g_cpw_have_helper_pills = 1)
		clean_up_user_control_helpers
	endif
endscript

script create_popup_warning_text \{Title = "WARNING"}
	<title_scale> = 1.2
	if GotParam \{title_props}
		title_scale = (<title_props>.Scale)
	endif
	CreateScreenElement {
		type = TextElement
		font = ($popup_warning_menu_font)
		text = <Title>
		just = [center center]
		Pos = (640.0, 217.0)
		Scale = <title_scale>
		parent = popup_warning_container
		rgba = [200 200 200 255]
		shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<z> + 2)
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = (280 * (1.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 only_if_larger_y = 0 start_x_scale = <title_scale> start_y_scale = <title_scale>
	if GotParam \{textblock}
		CreateScreenElement {
			type = TextBlockElement
			font = ($popup_warning_menu_font)
			just = [center center]
			Pos = (640.0, 375.0)
			dims = (700.0, 400.0)
			Scale = 0.6
			parent = popup_warning_container
			rgba = (($g_menu_colors).light_brown)
			shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<z> + 2)
			<textblock>
		}
	endif
	if GotParam \{TextElement}
		CreateScreenElement {
			type = TextElement
			font = ($popup_warning_menu_font)
			just = [center center]
			Pos = (640.0, 430.0)
			Scale = 0.85
			parent = popup_warning_container
			rgba = (($g_menu_colors).light_brown)
			shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<z> + 2)
			<TextElement>
		}
	endif
endscript

script create_popup_warning_menu_option \{max_option_width = 300}
	<focus_params> = {use_highlight = 1}
	if GotParam \{pad_back_script}
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose (<option>.func) params = (<option>.params)}
			{pad_back SoundEvent params = {event = Generic_menu_back_SFX}}
			{pad_back <pad_back_script>}
		]
	else
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose (<option>.func) params = (<option>.params)}
		]
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <parent>
		dims = (0.0, 90.0)
		event_handlers = <event_handlers>
	}
	<container_id> = <id>
	CreateScreenElement {
		type = hmenu
		parent = <container_id>
		internal_just = [center top]
		just = [center center]
	}
	<spacer_id> = <id>
	CreateScreenElement {
		type = ContainerElement
		parent = <spacer_id>
		local_id = hi_left_spacer
		dims = (64.0, 64.0)
	}
	CreateScreenElement {
		type = SpriteElement
		local_id = hi_left
		parent = <id>
		texture = Dialog_Highlight
		rgba = (($g_menu_colors).pink)
		Pos = (58.0, 7.0)
		just = [RIGHT top]
		z_priority = (<z> + 0.3)
		alpha = 0
		flip_v
	}
	CreateScreenElement {
		type = TextElement
		font = ($popup_warning_menu_font)
		parent = <spacer_id>
		local_id = text
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		just = [center center]
		z_priority = (<z> + 1)
		(<option>)
	}
	GetScreenElementDims id = <id>
	if GotParam \{max_option_width}
		fit_text_in_rectangle id = <id> dims = (<max_option_width> * (1.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <spacer_id>
		local_id = hi_right_spacer
		dims = (64.0, 64.0)
	}
	CreateScreenElement {
		type = SpriteElement
		local_id = hi_right
		parent = <id>
		texture = Dialog_Highlight
		rgba = (($g_menu_colors).pink)
		Pos = (0.0, 7.0)
		just = [left top]
		z_priority = (<z> + 1)
		alpha = 0
	}
	SetScreenElementLock id = <spacer_id> on
	SetScreenElementLock id = <container_id> on
endscript

script create_popup_warning_menu_options 
	<parent> = pu_warning_vmenu
	GetArraySize <options>
	<i> = 0
	begin
	if GotParam \{pad_back_script}
		create_popup_warning_menu_option {
			option = (<options> [<i>])
			z = <z>
			num_options = <array_size>
			parent = <parent>
			max_option_width = <max_option_width>
			pad_back_script = <pad_back_script>
		}
	else
		create_popup_warning_menu_option {
			option = (<options> [<i>])
			z = <z>
			num_options = <array_size>
			parent = <parent>
			max_option_width = <max_option_width>
		}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<largest_width> = 0
	GetScreenElementChildren \{id = pu_warning_vmenu}
	GetArraySize <children>
	<i> = 0
	begin
	GetScreenElementDims id = {(<children> [<i>]) child = 0}
	if (<largest_width> < <width>)
		<largest_width> = <width>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	GetScreenElementChildren \{id = options_bg_id}
	GetArraySize <children>
	<i> = 0
	begin
	GetScreenElementDims id = (<children> [<i>])
	SetScreenElementProps id = (<children> [<i>]) dims = (<largest_width> * (1.0, 0.0) + <height> * (0.0, 1.0) + (44.0, 0.0)) preserve_flip
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script menu_popup_focus 
	getsingletag \{id}
	ResolveScreenElementID id = {<id> child = {0 child = text}}
	retail_menu_focus id = <resolved_id>
	if (<use_highlight> = 1)
		DoScreenElementMorph id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 1
		DoScreenElementMorph id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 1
	endif
endscript

script menu_popup_unfocus 
	getsingletag \{id}
	ResolveScreenElementID id = {<id> child = {0 child = text}}
	retail_menu_unfocus id = <resolved_id>
	if (<use_highlight> = 1)
		DoScreenElementMorph id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 0
		DoScreenElementMorph id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 0
	endif
endscript
