winport_gfx_device_num = 0
winport_gfx_text_color = [
	255
	255
	255
	255
]
winport_gfx_text_dropshadow_color = [
	0
	0
	0
	255
]
winport_gfx_text_highlight_color = [
	230
	171
	60
	255
]
winport_gfx_menuItems = [
	{
		Text = "Resolution"
		handler = winport_gfx_option_handler
		option = 0
		needRestart = 1
	}
	{
		Text = "Graphics Detail"
		handler = winport_gfx_option_handler
		option = 1
		needRestart = 1
		choices = [
			"Low"
			"High"
		]
	}
	{
		Text = "Crowd"
		handler = winport_gfx_option_handler
		option = 2
		needRestart = 0
		choices = [
			"Empty"
			"Normal"
			"Packed"
		]
	}
	{
		Text = "Physics"
		handler = winport_gfx_option_handler
		option = 3
		needRestart = 0
		choices = [
			"Off"
			"On"
		]
	}
	{
		Text = "Lens Flare"
		handler = winport_gfx_option_handler
		option = 4
		needRestart = 0
		choices = [
			"Off"
			"On"
		]
	}
	{
		Text = "Front Row Camera"
		handler = winport_gfx_option_handler
		option = 5
		needRestart = 0
		choices = [
			"Off"
			"On"
		]
	}
	{
	}
	{
		Text = "Reset to Defaults"
		handler = winport_gfx_reset_handler
	}
]
winport_gfx_values_old = [
	0
	0
	0
	0
	0
	0
]
winport_gfx_values_new = [
]
winport_gfx_need_restart = 0

script winport_gfx_get_choices 
	if structureContains Structure = ($winport_gfx_menuItems [<I>]) Name = choices
		return choices = (($winport_gfx_menuItems [<I>]).choices)
	else
		WinPortGfxGetOptionChoices option = (($winport_gfx_menuItems [<I>]).option)
		return choices = <choices>
	endif
endscript

script winport_gfx_set_value 
	setarrayelement Arrayname = winport_gfx_values_new globalArray Index = <I> NewValue = <v>
endscript

script winport_gfx_load_values 
	getArraySize \{$winport_gfx_values_old}
	valueCount = <array_Size>
	I = 0
	begin
	if structureContains Structure = ($winport_gfx_menuItems [<I>]) Name = option
		WinPortGfxGetOptionValue option = (($winport_gfx_menuItems [<I>]).option)
		setarrayelement Arrayname = winport_gfx_values_old globalArray Index = <I> NewValue = <Value>
	endif
	I = (<I> + 1)
	repeat <valueCount>
	Change \{winport_gfx_values_new = $winport_gfx_values_old}
	Change \{winport_gfx_need_restart = 0}
endscript

script winport_gfx_save_values 
	getArraySize \{$winport_gfx_values_new}
	valueCount = <array_Size>
	I = 0
	begin
	if structureContains Structure = ($winport_gfx_menuItems [<I>]) Name = option
		WinPortGfxSetOptionValue option = (($winport_gfx_menuItems [<I>]).option) Value = ($winport_gfx_values_new [<I>])
	endif
	if ((($winport_gfx_menuItems [<I>]).needRestart) = 1)
		if NOT (($winport_gfx_values_new [<I>]) = ($winport_gfx_values_old [<I>]))
			Change \{winport_gfx_need_restart = 1}
		endif
	endif
	I = (<I> + 1)
	repeat <valueCount>
	Change \{winport_gfx_values_old = $winport_gfx_values_new}
	WinPortGfxApplyOptions
	destroy_bg_viewport
endscript

script winport_gfx_reset_values 
	getArraySize \{$winport_gfx_values_new}
	valueCount = <array_Size>
	I = 0
	begin
	if structureContains Structure = ($winport_gfx_menuItems [<I>]) Name = option
		WinPortGfxGetDefaultOptionValue option = (($winport_gfx_menuItems [<I>]).option)
		setarrayelement Arrayname = winport_gfx_values_new globalArray Index = <I> NewValue = <Value>
	endif
	I = (<I> + 1)
	repeat <valueCount>
endscript

script winport_create_gfx_settings_menu 
	menuDim = (600.0, 500.0)
	menuPos = (640.0, 350.0)
	menuItemDim = (600.0, 40.0)
	menuItemOptionDim = (250.0, 40.0)
	menuItemOptionPos = (0.0, 20.0)
	menuItemOptionJust = [Left Center]
	menuItemValueDim = (250.0, 40.0)
	menuItemValuePos = (600.0, 20.0)
	menuItemValueJust = [Right Center]
	menuItemHiliteDim = (650.0, 60.0)
	menuItemHilitePos = (-25.0, 34.0)
	menuItemHiliteJust = [Left Center]
	menuItemHiliteRot = -0.5
	createScreenElement \{Type = containerElement PARENT = root_window Id = screen_container pos = (0.0, 0.0) just = [Left top]}
	create_menu_backdrop \{texture = Venue_BG}
	createScreenElement \{Type = spriteElement Id = light_overlay PARENT = screen_container texture = Venue_Overlay pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 100}
	displaySprite \{PARENT = screen_container tex = graphics_options_poster_part1 pos = (640.0, 360.0) scale = (1.6, 1.7) just = [Center Center] Z = 1 Rot_Angle = 2}
	displaySprite \{PARENT = screen_container tex = graphics_options_poster_part2 pos = (640.0, 360.0) scale = (1.6, 1.7) just = [Center Center] Z = 2 Rot_Angle = 2}
	displaySprite \{PARENT = screen_container tex = graphics_options_poster_part3 pos = (640.0, 360.0) scale = (1.6, 1.7) just = [Center Center] Z = 3 Rot_Angle = 2}
	createScreenElement \{Type = textElement PARENT = screen_container Text = "GRAPHICS" pos = (837.0, 180.0) scale = (1.8, 1.6800001) just = [Center Center] rgba = [50 0 0 255] font = text_A5 z_priority = 10 Rot_Angle = 6 Shadow shadow_rgba = [160 130 105 255] shadow_offs = (-3.0, 3.0)}
	displaySprite \{PARENT = screen_container tex = Tape_V_01 pos = (1070.0, 330.0) Dims = (96.0, 192.0) Z = 5 Rot_Angle = 190}
	displaySprite \{PARENT = screen_container tex = Tape_V_01 rgba = [0 0 0 128] pos = (1067.0, 333.0) Dims = (96.0, 192.0) Z = 5 Rot_Angle = 190}
	displaySprite \{PARENT = screen_container tex = Tape_H_02 pos = (190.0, 475.0) Dims = (127.0, 64.0) Z = 5 Rot_Angle = -4}
	displaySprite \{PARENT = screen_container tex = Tape_H_02 rgba = [0 0 0 128] pos = (187.0, 478.0) Dims = (127.0, 64.0) Z = 5 Rot_Angle = -4}
	createScreenElement {
		Type = VMenu
		Id = Menu
		PARENT = screen_container
		pos = <menuPos>
		Dims = <menuDim>
		just = [Center Center]
		Rot_Angle = 2
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_back winport_gfx_back_handler}
		]
	}
	menuTextProps = {
		Type = textElement
		font = text_a4
		scale = 0.7
		rgba = $winport_gfx_text_color
		z_priority = 20
		Shadow
		shadow_rgba = $winport_gfx_text_dropshadow_color
		shadow_offs = (-1.5, 1.5)
	}
	getArraySize \{$winport_gfx_menuItems}
	menuItemCount = <array_Size>
	I = 0
	begin
	formatText Checksumname = itemId 'item%i' I = <I>
	formatText Checksumname = optionId 'option%i' I = <I>
	formatText Checksumname = valueId 'value%i' I = <I>
	formatText Checksumname = hiliteId 'hilite%i' I = <I>
	createScreenElement {
		Type = containerElement
		Id = <itemId>
		PARENT = Menu
		Dims = <menuItemDim>
	}
	if structureContains Structure = ($winport_gfx_menuItems [<I>]) Name = Text
		setScreenElementProps {
			Id = <itemId>
			event_handlers = [
				{pad_choose (($winport_gfx_menuItems [<I>]).handler) Params = {I = <I>}}
				{focus winport_gfx_focus_handler Params = {I = <I>}}
				{unfocus winport_gfx_unfocus_handler Params = {I = <I>}}
			]
		}
		createScreenElement {
			Type = spriteElement
			Id = <hiliteId>
			PARENT = <itemId>
			texture = graphics_options_highlight
			pos = <menuItemHilitePos>
			Dims = <menuItemHiliteDim>
			Rot_Angle = <menuItemHiliteRot>
			just = <menuItemHiliteJust>
			Alpha = 0
			z_priority = 1.5
			<mode_disable>
		}
		createScreenElement {
			<menuTextProps>
			Id = <optionId>
			Text = (($winport_gfx_menuItems [<I>]).Text)
			PARENT = <itemId>
			Dims = <menuItemOptionDim>
			pos = <menuItemOptionPos>
			just = <menuItemOptionJust>
			<mode_disable>
		}
		if structureContains Structure = ($winport_gfx_menuItems [<I>]) Name = option
			createScreenElement {
				<menuTextProps>
				Id = <valueId>
				Text = "Value"
				PARENT = <itemId>
				Dims = <menuItemValueDim>
				pos = <menuItemValuePos>
				just = <menuItemValueJust>
				<mode_disable>
			}
			if (<I> = 1)
				if (WinPortIsSM2Card)
					setScreenElementProps Id = <itemId> NOT_FOCUSABLE
					setScreenElementProps Id = <optionId> rgba = [80 80 80 255]
					setScreenElementProps Id = <valueId> rgba = [80 80 80 255]
				endif
			endif
			formatText Checksumname = choiceMenuId 'choiceMenu%i' I = <I>
			createScreenElement {
				Type = VMenu
				Id = <choiceMenuId>
				PARENT = <itemId>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound Params = {Up}}
					{pad_down generic_menu_up_or_down_sound Params = {Down}}
					{pad_back winport_gfx_choice_end_handler Params = {I = <I>}}
					{pad_choose winport_gfx_choice_end_handler Params = {I = <I>}}
				]
			}
			winport_gfx_get_choices I = <I>
			getArraySize <choices>
			choiceCount = <array_Size>
			C = 0
			begin
			formatText Checksumname = choiceItemId 'choiceItem%i_%c' I = <I> C = <C>
			createScreenElement {
				<menuTextProps>
				Id = <choiceItemId>
				PARENT = <choiceMenuId>
				event_handlers = [
					{focus winport_gfx_choice_focus_handler Params = {I = <I> C = <C>}}
				]
				<mode_disable>
			}
			C = (<C> + 1)
			repeat <choiceCount>
		endif
	else
		setScreenElementProps Id = <itemId> NOT_FOCUSABLE
	endif
	I = (<I> + 1)
	repeat <menuItemCount>
	winport_gfx_load_values
	winport_gfx_update_value_items
	launchevent \{Type = focus Target = Menu}
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript

script winport_destroy_gfx_settings_menu 
	DestroyScreenelement \{Id = screen_container}
	clean_up_user_control_helpers
endscript

script winport_gfx_back_handler 
	winport_gfx_save_values
	if ($winport_gfx_need_restart = 1)
		ui_flow_manager_respond_to_action \{action = need_restart}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script winport_gfx_update_value_items 
	getArraySize \{$winport_gfx_menuItems}
	menuItemCount = <array_Size>
	I = 0
	begin
	if structureContains Structure = ($winport_gfx_menuItems [<I>]) Name = option
		winport_gfx_get_choices I = <I>
		formatText Checksumname = valueId 'value%i' I = <I>
		setScreenElementProps Id = <valueId> Text = (<choices> [($winport_gfx_values_new [<I>])])
	endif
	I = (<I> + 1)
	repeat <menuItemCount>
endscript

script winport_gfx_reset_handler 
	winport_gfx_reset_values
	winport_gfx_update_value_items
endscript

script winport_gfx_choice_focus_handler 
	winport_gfx_set_value I = <I> v = <C>
	winport_gfx_update_value_items
endscript

script winport_gfx_focus_handler 
	formatText Checksumname = hiliteId 'hilite%i' I = <I>
	setScreenElementProps Id = <hiliteId> Alpha = 1
endscript

script winport_gfx_unfocus_handler 
	formatText Checksumname = hiliteId 'hilite%i' I = <I>
	setScreenElementProps Id = <hiliteId> Alpha = 0
endscript

script winport_gfx_option_handler 
	formatText Checksumname = valueId 'value%i' I = <I>
	setScreenElementProps Id = <valueId> rgba = $winport_gfx_text_highlight_color
	formatText Checksumname = choiceMenuId 'choiceMenu%i' I = <I>
	formatText Checksumname = choiceItemId 'choiceItem%i_%c' I = <I> C = ($winport_gfx_values_new [<I>])
	launchevent \{Type = unfocus Target = Menu}
	launchevent Type = focus Target = <choiceMenuId> data = {child_id = <choiceItemId>}
	winport_gfx_focus_handler I = <I>
endscript

script winport_gfx_choice_end_handler 
	formatText Checksumname = valueId 'value%i' I = <I>
	setScreenElementProps Id = <valueId> rgba = $winport_gfx_text_color
	formatText Checksumname = choiceMenuId 'choiceMenu%i' I = <I>
	launchevent Type = unfocus Target = <choiceMenuId>
	launchevent \{Type = focus Target = Menu}
endscript

script winport_create_gfx_settings_restart_popup_menu 
	create_popup_warning_menu \{textblock = {Text = "Graphics option changes will not take effect until the game is restarted."} Menu_pos = (640.0, 490.0) dialog_dims = (288.0, 64.0) options = [{func = {ui_flow_manager_respond_to_action Params = {action = Continue}} Text = "CONTINUE" scale = (1.0, 1.0)}]}
endscript

script winport_destroy_gfx_settings_restart_popup_menu 
	destroy_popup_warning_menu
endscript
