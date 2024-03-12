winport_bb_device_num = 0
winport_bb_text_color = [
	202
	243
	113
	255
]
winport_bb_text_dropshadow_color = [
	0
	0
	0
	255
]
winport_bb_text_highlight_color = [
	64
	184
	246
	255
]
winport_bb_text_disable_color = [
	139
	198
	17
	255
]
winport_bb_kb_menuItems = [
	{
		Text = "Green Fret / Confirm"
		handler = winport_bb_choose_control
		actionNum = 0
	}
	{
		Text = "Red Fret / Cancel"
		handler = winport_bb_choose_control
		actionNum = 1
	}
	{
		Text = "Yellow Fret"
		handler = winport_bb_choose_control
		actionNum = 2
	}
	{
		Text = "Blue Fret"
		handler = winport_bb_choose_control
		actionNum = 3
	}
	{
		Text = "Orange Fret"
		handler = winport_bb_choose_control
		actionNum = 4
	}
	{
		Text = "Star Power"
		handler = winport_bb_choose_control
		actionNum = 5
	}
	{
		Text = "Whammy"
		handler = winport_bb_choose_control
		actionNum = 12
	}
	{
		Text = "Mouse Whammy"
		controlName = "X-Axis"
		handler = winport_null_script
		disable
	}
	{
		Text = "Strum Up / Menu Up"
		handler = winport_bb_choose_control
		actionNum = 10
	}
	{
		Text = "Strum Down / Menu Down"
		handler = winport_bb_choose_control
		actionNum = 9
	}
	{
		Text = ""
		handler = winport_null_script
		disable
	}
	{
		Text = "Reset to Default Keyboard/Mouse"
		handler = winport_bb_reset_to_config1
	}
	{
		Text = "Reset to Default Keyboard"
		handler = winport_bb_reset_to_config2
	}
]
winport_bb_menuItems = [
]

script winport_null_script 
endscript

script winport_create_bind_buttons 
	Change \{winport_bb_menuItems = $winport_bb_kb_menuItems}
	menuDim = (600.0, 500.0)
	menuPos = (640.0, 370.0)
	menuItemDim = (600.0, 32.0)
	menuItemOptionDim = (250.0, 32.0)
	menuItemOptionPos = (0.0, 16.0)
	menuItemOptionJust = [Left Center]
	menuItemValueDim = (300.0, 32.0)
	menuItemValuePos = (630.0, 16.0)
	menuItemValueJust = [Right Center]
	menuItemHiliteDim = (665.0, 50.0)
	menuItemHilitePos = (-25.0, 34.0)
	menuItemHiliteJust = [Left Center]
	menuItemHiliteRot = -0.5
	createScreenElement \{Type = containerElement PARENT = root_window Id = screen_container pos = (0.0, 0.0) just = [Left top]}
	create_menu_backdrop \{texture = Venue_BG}
	createScreenElement \{Type = spriteElement Id = light_overlay PARENT = screen_container texture = Venue_Overlay pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 100}
	displaySprite \{PARENT = screen_container tex = controller_config_poster pos = (640.0, 360.0) scale = (1.5, 1.7) just = [Center Center] Z = 1 Rot_Angle = -2}
	createScreenElement \{Type = textElement PARENT = screen_container Text = "KEYBOARD" pos = (830.0, 100.0) scale = (1.51, 1.3) just = [Center Center] rgba = [202 243 113 255] font = text_A5 z_priority = 10 Rot_Angle = -2.8 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (-3.0, 3.0)}
	displaySprite \{PARENT = screen_container tex = Tape_V_01 pos = (205.0, 65.0) Dims = (96.0, 192.0) Z = 5 Rot_Angle = -1}
	displaySprite \{PARENT = screen_container tex = Tape_V_01 rgba = [0 0 0 128] pos = (202.0, 68.0) Dims = (96.0, 192.0) Z = 4 Rot_Angle = -1}
	displaySprite \{PARENT = screen_container tex = Tape_H_02 pos = (945.0, 550.0) Dims = (132.0, 64.0) Z = 5 Rot_Angle = 8}
	displaySprite \{PARENT = screen_container tex = Tape_H_02 rgba = [0 0 0 128] pos = (942.0, 553.0) Dims = (132.0, 64.0) Z = 4 Rot_Angle = 8}
	createScreenElement {
		Type = VMenu
		Id = Menu
		PARENT = screen_container
		pos = <menuPos>
		Dims = <menuDim>
		Rot_Angle = -2
		just = [Center Center]
		event_handlers = $default_event_handlers
	}
	menuTextProps = {
		Type = textElement
		font = text_a11
		scale = (0.7, 0.5)
		rgba = $winport_bb_text_color
		z_priority = 20
		Shadow
		shadow_rgba = $winport_bb_text_dropshadow_color
		shadow_offs = (-1.5, 1.5)
	}
	getArraySize \{$winport_bb_menuItems}
	I = 0
	begin
	formatText Checksumname = itemId 'item%d' D = <I>
	formatText Checksumname = actionId 'action%d' D = <I>
	formatText Checksumname = controlId 'control%d' D = <I>
	formatText Checksumname = hiliteId 'hilite%d' D = <I>
	createScreenElement {
		Type = containerElement
		Id = <itemId>
		PARENT = Menu
		Dims = <menuItemDim>
	}
	setScreenElementProps {
		Id = <itemId>
		event_handlers = [
			{pad_choose (($winport_bb_menuItems [<I>]).handler) Params = {Index = <I> menuItem = ($winport_bb_menuItems [<I>])}}
			{focus winport_bb_focus Params = {Index = <I>}}
			{unfocus winport_bb_unfocus Params = {Index = <I>}}
		]
	}
	createScreenElement {
		Type = spriteElement
		Id = <hiliteId>
		PARENT = <itemId>
		texture = controller_config_highlight
		pos = <menuItemHilitePos>
		Dims = <menuItemHiliteDim>
		just = <menuItemHiliteJust>
		Rot_Angle = <menuItemHiliteRot>
		Alpha = 0
		z_priority = 3
	}
	createScreenElement {
		<menuTextProps>
		Id = <actionId>
		Text = (($winport_bb_menuItems [<I>]).Text)
		PARENT = <itemId>
		Dims = <menuItemOptionDim>
		pos = <menuItemOptionPos>
		just = <menuItemOptionJust>
	}
	createScreenElement {
		<menuTextProps>
		Id = <controlId>
		Text = ""
		PARENT = <itemId>
		Dims = <menuItemValueDim>
		pos = <menuItemValuePos>
		just = <menuItemValueJust>
	}
	if structureContains Structure = ($winport_bb_menuItems [<I>]) Name = disable
		setScreenElementProps Id = <itemId> NOT_FOCUSABLE
		setScreenElementProps Id = <actionId> rgba = $winport_bb_text_disable_color
		setScreenElementProps Id = <controlId> rgba = $winport_bb_text_disable_color
	endif
	I = (<I> + 1)
	repeat <array_Size>
	winport_bb_update_option_values
	launchevent \{Type = focus Target = Menu}
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript

script winport_destroy_bind_buttons 
	DestroyScreenelement \{Id = screen_container}
	clean_up_user_control_helpers
endscript

script winport_bb_update_option_values 
	getArraySize \{$winport_bb_menuItems}
	I = 0
	begin
	formatText Checksumname = controlId 'control%d' D = <I>
	if structureContains Structure = ($winport_bb_menuItems [<I>]) Name = actionNum
		WinPortSioGetControlBinding deviceNum = $winport_bb_device_num actionNum = (($winport_bb_menuItems [<I>]).actionNum)
		WinPortSioGetControlName deviceNum = $winport_bb_device_num controlNum = <controlNum>
		setScreenElementProps Id = <controlId> Text = <controlName>
		elseif structureContains Structure = ($winport_bb_menuItems [<I>]) Name = controlName
		setScreenElementProps Id = <controlId> Text = (($winport_bb_menuItems [<I>]).controlName)
	endif
	I = (<I> + 1)
	repeat <array_Size>
endscript

script winport_bb_choose_control 
	launchevent \{Type = unfocus Target = Menu}
	winport_bb_focus Index = <Index>
	formatText Checksumname = controlId 'control%d' D = <Index>
	setScreenElementProps Id = <controlId> rgba = $winport_bb_text_highlight_color
	winport_wait_for_no_control_press deviceNum = $winport_bb_device_num actionNum = (<menuItem>.actionNum)
	winport_wait_for_control_press deviceNum = $winport_bb_device_num actionNum = (<menuItem>.actionNum)
	winport_wait_for_no_control_press deviceNum = $winport_bb_device_num actionNum = (<menuItem>.actionNum)
	WinPortSioSetControlBinding deviceNum = $winport_bb_device_num actionNum = (<menuItem>.actionNum) controlNum = <controlNum>
	setScreenElementProps Id = <controlId> rgba = $winport_bb_text_color
	winport_bb_update_option_values
	launchevent \{Type = focus Target = Menu}
endscript

script winport_bb_reset_to_config1 
	getArraySize \{$winport_bb_menuItems}
	I = 0
	begin
	if structureContains Structure = ($winport_bb_menuItems [<I>]) Name = actionNum
		WinPortSioSetControlBinding deviceNum = $winport_bb_device_num actionNum = (($winport_bb_menuItems [<I>]).actionNum) controlNum = -1
	endif
	I = (<I> + 1)
	repeat <array_Size>
	winport_bb_update_option_values
endscript

script winport_bb_reset_to_config2 
	getArraySize \{$winport_bb_menuItems}
	I = 0
	begin
	if structureContains Structure = ($winport_bb_menuItems [<I>]) Name = actionNum
		WinPortSioSetControlBinding deviceNum = $winport_bb_device_num actionNum = (($winport_bb_menuItems [<I>]).actionNum) controlNum = -2
	endif
	I = (<I> + 1)
	repeat <array_Size>
	winport_bb_update_option_values
endscript

script winport_bb_focus 
	formatText Checksumname = hiliteId 'hilite%d' D = <Index>
	setScreenElementProps Id = <hiliteId> Alpha = 1
endscript

script winport_bb_unfocus 
	formatText Checksumname = hiliteId 'hilite%d' D = <Index>
	setScreenElementProps Id = <hiliteId> Alpha = 0
endscript

script winport_wait_for_no_control_press 
	begin
	if NOT WinPortSioGetControlPress deviceNum = <deviceNum> actionNum = <actionNum>
		break
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script winport_wait_for_control_press 
	begin
	if WinPortSioGetControlPress deviceNum = <deviceNum> actionNum = <actionNum>
		break
	endif
	Wait \{1 GameFrame}
	repeat
	return controlNum = <controlNum>
endscript
