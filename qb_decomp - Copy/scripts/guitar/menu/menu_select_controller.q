menu_select_controller_icon_positions = [
	{
		C = (370.0, 350.0)
		G = (370.0, 350.0)
		N = (616.0, 475.0)
	}
	{
		C = (900.0, 420.0)
		G = (900.0, 420.0)
		N = (926.0, 475.0)
	}
	{
		C = (565.0, 415.0)
		G = (565.0, 405.0)
	}
	{
		C = (670.0, 440.0)
		G = (670.0, 430.0)
	}
	{
		C = (655.0, 335.0)
		G = (655.0, 325.0)
	}
	{
		C = (630.0, 395.0)
		G = (630.0, 385.0)
	}
	{
		C = (610.0, 450.0)
		G = (610.0, 440.0)
	}
	{
		C = (700.0, 370.0)
		G = (700.0, 360.0)
	}
	{
		C = (595.0, 345.0)
		G = (595.0, 335.0)
	}
]
menu_select_controller_icon_rotations = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
menu_select_num_controllers = 0
menu_select_controller_p1_controller_id = -1
menu_select_controller_p2_controller_id = -1
menu_select_controller_light = [
	180
	180
	180
	255
]
menu_select_controller_dark = [
	100
	100
	100
	255
]
menu_select_controller_sticks_big = (192.0, 192.0)
menu_select_controller_sticks_small = (160.0, 160.0)
menu_select_controller_guitar_big = (384.0, 192.0)
menu_select_controller_guitar_small = (320.0, 160.0)
in_controller_select_menu = 0

script create_select_controller_menu 
	Change \{in_controller_select_menu = 1}
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	Change \{menu_select_controller_p1_controller_id = -1}
	Change \{menu_select_controller_p2_controller_id = -1}
	Change \{player_controls_valid = 0}
	menu_font = text_A5
	createScreenElement \{Type = containerElement PARENT = root_window Id = msc_container pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Controller_2p_BG}
	displayText \{PARENT = msc_container Text = "Select Controller" pos = (690.0, 140.0) scale = 1.4 just = [Center Center] rgba = [90 25 20 255] font = text_a10 Z = 100 noshadow}
	createScreenElement \{Type = textElement PARENT = msc_container Text = "Move the desired controller" pos = (620.0, 570.0) scale = 0.7 just = [Center Center] rgba = [90 25 20 255] font = text_a11 Z = 100 Shadow shadow_rgba = [185 180 135 255] shadow_offs = (2.0, 2.0)}
	createScreenElement \{Type = textElement PARENT = msc_container Text = "to your side of the screen." pos = (620.0, 610.0) scale = 0.7 just = [Center Center] rgba = [90 25 20 255] font = text_a11 Z = 100 Shadow shadow_rgba = [185 180 135 255] shadow_offs = (2.0, 2.0)}
	displaySprite \{PARENT = msc_container Id = peasant_01 tex = controller_2p_LittleMan_01 rgba = [220 145 100 255] Dims = (192.0, 192.0) pos = (60.0, 570.0) Z = 10}
	displaySprite \{PARENT = msc_container Id = peasant_02 tex = controller_2p_LittleMan_02 rgba = [220 145 100 255] Dims = (192.0, 192.0) pos = (160.0, 570.0) Z = 10}
	displaySprite \{PARENT = msc_container Id = peasant_03 tex = controller_2p_LittleMan_04 rgba = [220 145 100 255] Dims = (192.0, 192.0) pos = (240.0, 620.0) Z = 10}
	displaySprite \{PARENT = msc_container Id = peasant_04 tex = controller_2p_LittleMan_03 rgba = [220 145 100 255] Dims = (192.0, 192.0) pos = (320.0, 570.0) Z = 10}
	displaySprite \{PARENT = msc_container Id = peasant_05 tex = controller_2p_LittleMan_01 rgba = [170 180 215 255] Dims = (192.0, 192.0) pos = (760.0, 570.0) Z = 10}
	displaySprite \{PARENT = msc_container Id = peasant_06 tex = controller_2p_LittleMan_02 rgba = [170 180 215 255] Dims = (192.0, 192.0) pos = (860.0, 570.0) Z = 10}
	displaySprite \{PARENT = msc_container Id = peasant_07 tex = controller_2p_LittleMan_03 rgba = [170 180 215 255] Dims = (192.0, 192.0) pos = (940.0, 570.0) Z = 10}
	displaySprite \{PARENT = msc_container Id = peasant_08 tex = controller_2p_LittleMan_04 rgba = [170 180 215 255] Dims = (192.0, 192.0) pos = (1020.0, 570.0) Z = 10}
	createScreenElement \{Type = spriteElement PARENT = msc_container Id = Arrow1 texture = controller_2p_arrow rgba = [240 140 80 255] Dims = (64.0, 128.0) pos = (450.0, 270.0) just = [Left top] Rot_Angle = -20}
	<Id> :SetTags old_pos = (450.0, 270.0)
	createScreenElement \{Type = spriteElement PARENT = msc_container Id = Arrow2 texture = controller_2p_arrow rgba = [130 90 205 255] Dims = (64.0, 128.0) pos = (705.0, 445.0) just = [Left top] flip_v flip_h Rot_Angle = -20}
	<Id> :SetTags old_pos = (680.0, 420.0)
	SpawnScriptNOw \{cs_bounce_arrows}
	SpawnScriptNOw \{jump_up_and_down_peasants}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	create_ready_icons \{pos1 = (300.0, 450.0) pos2 = (835.0, 510.0)}
	I = 0
	begin
	GetRandomValue \{A = -10 B = 10 Name = rand_rot}
	setarrayelement Arrayname = menu_select_controller_icon_rotations globalArray Index = <I> NewValue = <rand_rot>
	<I> = (<I> + 1)
	repeat 7
	SpawnScriptNOw \{menu_select_controller_poll_for_controllers Params = {wait_to_drop_controller = 1}}
endscript

script destroy_select_controller_menu 
	destroy_ready_icons
	Change \{menu_select_num_controllers = 0}
	clean_up_user_control_helpers
	killspawnedScript \{Name = cs_bounce_arrows}
	killspawnedScript \{Name = jump_up_and_down_peasants}
	killspawnedScript \{Name = menu_select_controller_poll_for_controllers}
	destroy_menu \{menu_id = msc_container}
	destroy_menu_backdrop
	Change \{in_controller_select_menu = 0}
endscript

script cs_bounce_arrows 
	begin
	if ScreenelementExists \{Id = Arrow1}
		Arrow1 :getTags
		DoScreenElementMorph Id = Arrow1 pos = (<old_pos> + (15.0, 25.0)) Time = 0.5 Motion = ease_out
	endif
	if ScreenelementExists \{Id = Arrow2}
		Arrow2 :getTags
		DoScreenElementMorph Id = Arrow2 pos = (<old_pos>) Time = 0.5 Motion = ease_out
	endif
	Wait \{0.5 Seconds}
	if ScreenelementExists \{Id = Arrow1}
		Arrow1 :getTags
		DoScreenElementMorph Id = Arrow1 pos = (<old_pos>) Time = 0.5 Motion = ease_in
	endif
	if ScreenelementExists \{Id = Arrow2}
		Arrow2 :getTags
		DoScreenElementMorph Id = Arrow2 pos = (<old_pos> + (15.0, 25.0)) Time = 0.5 Motion = ease_in
	endif
	Wait \{0.5 Seconds}
	repeat
endscript

script jump_up_and_down_peasants 
	I = 1
	begin
	formatText Checksumname = peasant_id 'peasant_0%d' D = <I>
	if ScreenelementExists Id = <peasant_id>
		getScreenElementProps Id = <peasant_id>
		GetRandomValue \{A = 0.05 B = 0.15 Name = rand_time}
		<peasant_id> :SetTags old_pos = <pos> rand_time = <rand_time>
	endif
	<I> = (<I> + 1)
	repeat 8
	begin
	<I> = 1
	begin
	formatText Checksumname = peasant_id 'peasant_0%d' D = <I>
	if ScreenelementExists Id = <peasant_id>
		GetRandomValue \{A = 0 B = 42 Name = pos_off_y Integer}
		<peasant_id> :getTags
		new_pos = (<old_pos> - (<pos_off_y> * (0.0, 1.0)))
		DoScreenElementMorph Id = <peasant_id> pos = <new_pos> Time = <rand_time>
	endif
	<I> = (<I> + 1)
	repeat 8
	GetRandomValue \{A = 0.1 B = 0.2 Name = rand_wait_time}
	Wait <rand_wait_time> Seconds
	<I> = 1
	begin
	formatText Checksumname = peasant_id 'peasant_0%d' D = <I>
	if ScreenelementExists Id = <peasant_id>
		<peasant_id> :getTags
		DoScreenElementMorph Id = <peasant_id> pos = <old_pos> Time = <rand_time>
	endif
	<I> = (<I> + 1)
	repeat 8
	GetRandomValue \{A = 0.1 B = 0.2 Name = rand_wait_time}
	Wait <rand_wait_time> Seconds
	repeat
endscript

script menu_select_controller_poll_for_controllers \{wait_to_drop_controller = 0}
	begin
	active_controllers = [0 0 0 0 0 0 0]
	getActiveControllers
	GetInputHandlerBotIndex \{Player = 1}
	total_change = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		menu_select_controller_add_controllable_icon controller_index = <controller_index> wait_to_drop_controller = <wait_to_drop_controller>
		<total_change> = (<total_change> + <changed>)
	endif
	if (<active_controllers> [<controller_index>] = 0)
		menu_select_controller_remove_controller_icon controller_index = <controller_index> wait_to_drop_controller = <wait_to_drop_controller>
		<total_change> = (<total_change> + <changed>)
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <controller>
	<wait_to_drop_controller> = 0
	Wait \{1 GameFrame}
	repeat
endscript

script menu_select_controller_add_controllable_icon \{controller_index = 0 wait_to_drop_controller = 0}
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	if NOT ScreenelementExists Id = <controller_icon_id>
		if isWinPort
			if WinPortSioIsKeyboard deviceNum = <controller_index>
				c_texture = controller_2p_keyboard
				c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].C)
			else
				c_texture = controller_2p_LesPaul
				c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].G)
			endif
		else
			if isguitarcontroller controller = <controller_index>
				c_texture = controller_2p_LesPaul
				c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].G)
			else
				getplatform
				switch <Platform>
					case XENON
					c_texture = controller_2p_controller_XBOX
					case PS3
					c_texture = controller_2p_controller_PS3
					default
					Scriptassert \{"Unrecognized platform for controller select"}
				endswitch
				c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].C)
			endif
		endif
		createScreenElement {
			Type = spriteElement
			PARENT = msc_container
			Id = <controller_icon_id>
			texture = <c_texture>
			rgba = [220 220 220 250]
			pos = <c_pos>
			Dims = (128.0, 256.0)
			just = [Center Center]
			Rot_Angle = ($menu_select_controller_icon_rotations [<controller_index>])
			z_priority = 10
			rgba = <grey>
			event_handlers = [
				{pad_up menu_select_controller_move_up Params = {controller_index = <controller_index>}}
				{pad_down menu_select_controller_move_down Params = {controller_index = <controller_index>}}
				{pad_choose menu_select_controller_try_to_continue Params = {controller_index = <controller_index>}}
				{pad_back menu_select_controller_go_back Params = {controller_index = <controller_index>}}
			]
			exclusive_device = <controller_index>
		}
		<Id> :SetProps scale = 0.5 relative_scale
		grey_out_controller controller_index = <controller_index>
		<controller_icon_id> :SetTags ready = no location = p0 port = <controller_index>
		Change menu_select_num_controllers = ($menu_select_num_controllers + 1)
		setScreenElementProps Id = <Id> Alpha = 0
		SpawnScriptNOw fall_controller Params = {controller_index = <controller_index> Id = <Id> Wait = <wait_to_drop_controller>}
		return \{changed = 1}
	endif
	return \{changed = 0}
endscript

script fall_controller \{Wait = 0}
	if (<Wait> = 1)
		Wait \{0.25 Seconds}
	endif
	if ScreenelementExists Id = <Id>
		getScreenElementProps Id = <Id>
		hipos = (<pos> - (0.0, 720.0))
		setScreenElementProps Id = <Id> pos = <hipos> Alpha = 1
		<Id> :doMorph pos = (<pos> + (0.0, 50.0)) Motion = ease_in Time = 0.5
		if ScreenelementExists Id = <Id>
			<Id> :doMorph pos = (<pos> - (0.0, 25.0)) Motion = ease_out Time = 0.1 Rot_Angle = RandomRange (-10.0, 10.0)
		endif
		if ScreenelementExists Id = <Id>
			<Id> :doMorph pos = <pos> Motion = ease_in Time = 0.1 Rot_Angle = RandomRange (-5.0, 5.0)
		endif
		if (<controller_index> = $primary_controller)
			menu_select_controller_move_up controller_index = <controller_index> Force = 1
		endif
		if ScreenelementExists Id = <Id>
			launchevent Type = focus Target = <Id>
		endif
	endif
endscript

script menu_select_controller_leave_spot \{controller_index = 0}
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	I = 1
	begin
	formatText Checksumname = controller_Id 'menu_select_controller_p%d_controller_id' D = <I>
	formatText Checksumname = player_ready 'p%d_ready' D = <I>
	if ($<controller_Id> = <controller_index>)
		Change globalName = <controller_Id> NewValue = -1
		<controller_icon_id> :SetTags ready = no location = p0
		grey_out_controller controller_index = <controller_index>
		generic_menu_up_or_down_sound \{Down}
		if ($<player_ready>)
			drop_out_ready_sign Player = <I>
			Change globalName = <player_ready> NewValue = 0
		endif
		return
	endif
	<I> = (<I> + 1)
	repeat 2
endscript

script menu_select_controller_get_spot \{controller_index = 0 Spot = P1 Force = 0}
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	<controller_icon_id> :getTags
	if (<Spot> = P1)
		if ($menu_select_controller_p1_controller_id = -1 || <Force> = 1)
			if (<Force> = 1)
				if NOT ($menu_select_controller_p1_controller_id = -1)
					menu_select_controller_leave_spot controller_index = ($menu_select_controller_p1_controller_id)
				endif
			endif
			Change menu_select_controller_p1_controller_id = <controller_index>
			<controller_icon_id> :SetTags ready = yes location = P1
			light_up_controller controller_index = <controller_index>
			generic_menu_up_or_down_sound \{Up}
		endif
		elseif (<Spot> = P2)
		if ($menu_select_controller_p2_controller_id = -1)
			Change menu_select_controller_p2_controller_id = <controller_index>
			<controller_icon_id> :SetTags ready = yes location = P2
			light_up_controller controller_index = <controller_index>
			generic_menu_up_or_down_sound \{Down}
		endif
	endif
endscript

script menu_select_controller_move_up \{controller_index = 0 Force = 0}
	unfocus_all_controllers
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	if ScreenelementExists Id = <controller_icon_id>
		<controller_icon_id> :getTags
		if (<location> = P2)
			if ($p2_ready)
				focus_all_controllers
				return
			endif
			if (<controller_index> = $primary_controller)
				if ($menu_select_controller_p1_controller_id = -1)
					menu_select_controller_leave_spot controller_index = <controller_index>
					menu_select_controller_get_spot controller_index = <controller_index> Spot = P1
				endif
			else
				menu_select_controller_leave_spot controller_index = <controller_index>
			endif
			elseif (<location> = p0)
			menu_select_controller_get_spot controller_index = <controller_index> Spot = P1 Force = <Force>
		endif
	endif
	focus_all_controllers
endscript

script menu_select_controller_move_down \{controller_index = 0}
	unfocus_all_controllers
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	if ScreenelementExists Id = <controller_icon_id>
		<controller_icon_id> :getTags
		if (<location> = P1)
			if ($p1_ready)
				focus_all_controllers
				return
			endif
			if (<controller_index> = $primary_controller)
				if ($menu_select_controller_p2_controller_id = -1)
					menu_select_controller_leave_spot controller_index = <controller_index>
					menu_select_controller_get_spot controller_index = <controller_index> Spot = P2
				endif
			else
				menu_select_controller_leave_spot controller_index = <controller_index>
			endif
			elseif (<location> = p0)
			menu_select_controller_get_spot controller_index = <controller_index> Spot = P2
		endif
	endif
	focus_all_controllers
endscript

script menu_select_controller_remove_controller_icon 
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	if ScreenelementExists Id = <controller_icon_id>
		if ($menu_select_controller_p1_controller_id = <controller_index>)
			Change \{menu_select_controller_p1_controller_id = -1}
			elseif ($menu_select_controller_p2_controller_id = <controller_index>)
			Change \{menu_select_controller_p2_controller_id = -1}
		endif
		<controller_icon_id> :getTags
		if (<location> = P1 && $p1_ready = 2)
			drop_out_ready_sign \{Player = 1}
			Change \{p1_ready = 0}
		endif
		if (<location> = P2 && $p2_ready = 2)
			drop_out_ready_sign \{Player = 2}
			Change \{p2_ready = 0}
		endif
		DestroyScreenelement Id = <controller_icon_id>
		Change menu_select_num_controllers = ($menu_select_num_controllers - 1)
		return \{changed = 1}
	endif
	return \{changed = 0}
endscript

script unfocus_all_controllers 
	I = 0
	begin
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <I>
	if ScreenelementExists Id = <controller_icon_id>
		launchevent Type = unfocus Target = <controller_icon_id>
	endif
	<I> = (<I> + 1)
	repeat 7
endscript

script focus_all_controllers 
	I = 0
	begin
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <I>
	if ScreenelementExists Id = <controller_icon_id>
		launchevent Type = focus Target = <controller_icon_id>
	endif
	<I> = (<I> + 1)
	repeat 7
endscript

script menu_select_controller_try_to_continue 
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	unfocus_all_controllers
	<controller_icon_id> :getTags
	if (<location> = P1)
		if (<ready> = yes)
			Change player1_device = <controller_index>
			if ($p1_ready = 0)
				if ($p2_ready = 0 || $primary_controller = $player1_device || $primary_controller = $player2_device)
					Change \{p1_ready = 1}
					drop_in_ready_sign \{Player = 1}
					Change \{p1_ready = 2}
				endif
			endif
		endif
		elseif (<location> = P2)
		if (<ready> = yes)
			Change player2_device = <controller_index>
			if ($p2_ready = 0)
				if ($p1_ready = 0 || $primary_controller = $player1_device || $primary_controller = $player2_device)
					Change \{p2_ready = 1}
					drop_in_ready_sign \{Player = 2}
					Change \{p2_ready = 2}
				endif
			endif
		endif
	endif
	if (($p1_ready = 2) && ($p2_ready = 2))
		Change \{p1_ready = 0}
		Change \{p2_ready = 0}
		Change StructureName = player1_status controller = ($player1_device)
		Change StructureName = player2_status controller = ($player2_device)
		Change \{player_controls_valid = 1}
		ui_flow_manager_respond_to_action \{action = Continue}
	else
		focus_all_controllers
	endif
endscript

script menu_select_controller_go_back 
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	<controller_icon_id> :getTags
	if (<location> = P1)
		if ($p1_ready = 2)
			Change \{p1_ready = 0}
			drop_out_ready_sign \{Player = 1}
		else
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
		elseif (<location> = P2)
		if ($p2_ready = 2)
			Change \{p2_ready = 0}
			drop_out_ready_sign \{Player = 2}
		else
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script grey_out_controller 
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	grey = [150 150 150 255]
	if ScreenelementExists Id = <controller_icon_id>
		<controller_icon_id> :getTags
		if isguitarcontroller controller = <port>
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].G)
		else
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].C)
		endif
		DoScreenElementMorph Id = <controller_icon_id> pos = <c_pos> scale = 0.5 Alpha = 0.75 Time = 0.25 relative_scale Motion = ease_in
		runScriptOnScreenElement Id = <controller_icon_id> controller_jiggle Params = {<...>}
		setScreenElementProps Id = <controller_icon_id> rgba = <grey>
	endif
endscript

script light_up_controller 
	formatText Checksumname = controller_icon_id 'controller%d_icon' D = <controller_index>
	Printf \{"Light up controller"}
	White = [255 255 255 255]
	if ScreenelementExists Id = <controller_icon_id>
		<controller_icon_id> :getTags
		<controller_icon_id> :SetTags old_pos = <pos>
		<controller_icon_id> :getTags
		Index = 0
		if (<location> = P2)
			Index = 1
		endif
		if isguitarcontroller controller = <port>
			new_pos = ($menu_select_controller_icon_positions [<Index>].G)
		else
			new_pos = ($menu_select_controller_icon_positions [<Index>].C)
		endif
		DoScreenElementMorph Id = <controller_icon_id> pos = <new_pos> scale = 1.5 Alpha = 1 Time = 0.25 relative_scale Motion = ease_in
		runScriptOnScreenElement Id = <controller_icon_id> controller_jiggle Params = {<...>}
		setScreenElementProps Id = <controller_icon_id> rgba = <White>
	endif
endscript

script controller_jiggle 
	if NOT ScreenelementExists Id = <controller_icon_id>
		return
	endif
	<controller_icon_id> :doMorph pos = {(5.0, 0.0) Relative} Time = 0.1 Motion = ease_in
	<controller_icon_id> :doMorph pos = {(-10.0, 0.0) Relative} Time = 0.05
	<controller_icon_id> :doMorph pos = {(5.0, 0.0) Relative} Time = 0.1 Motion = ease_out
endscript
