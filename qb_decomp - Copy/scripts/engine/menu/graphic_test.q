graphic_test_selection = test_graphic1
graphic_test_speed = 5
graphic_test_axis = 0

script launch_graphic_test 
	generic_ui_destroy
	Skater :KillSkater \{no_node}
	Skater :Disableplayerinput
	Change \{graphic_test_selection = test_graphic1}
	DoScreenElementMorph \{Id = player1_panel_container Alpha = 0}
	lock = OFF
	if AreAssetsLocked
		AllowAssetLoading \{On}
		lock = On
	endif
	LoadTexture \{'Test\\graphic_test'}
	LoadTexture \{'Test\\graphic_test2'}
	LoadTexture \{'Test\\graphic_test3'}
	LoadTexture \{'Test\\graphic_test4'}
	if (<lock> = On)
		AllowAssetLoading \{OFF}
	endif
	kill_start_key_binding
	SetAnalogStickActiveForMenus \{1}
	SetScreenElementLock \{Id = root_window OFF}
	if NOT ScreenelementExists \{Id = graphic_test_anchor}
		createScreenElement \{Id = graphic_test_anchor Type = containerElement PARENT = root_window pos = (0.0, 0.0) z_priority = 5000 Alpha = 1 scale = 1}
	endif
	setScreenElementProps \{Id = graphic_test_anchor event_handlers = [{pad_start destroy_graphic_test}{pad_space test_graphic_switch Params = {selection = test_graphic1}}{pad_back test_graphic_switch Params = {selection = test_graphic2}}{pad_choose test_graphic_switch Params = {selection = test_graphic3}}{pad_square test_graphic_switch Params = {selection = test_graphic4}}{pad_up test_graphic_move Params = {Dir = Up}}{pad_right test_graphic_move Params = {Dir = Right}}{pad_down test_graphic_move Params = {Dir = Down}}{PAD_LEFT test_graphic_move Params = {Dir = Left}}{pad_R2 test_graphic_scale Params = {Dir = Up}}{pad_L2 test_graphic_scale Params = {Dir = Down}}{pad_R3 test_graphic_toggle_axis}{pad_R1 test_graphic_z Params = {Up}}{pad_L1 test_graphic_z Params = {Down}}{pad_L3 test_graphic_toggle_speed}] Replace_Handlers}
	DoScreenElementMorph \{Id = graphic_test_anchor Alpha = 1}
	launchevent \{Type = focus Target = graphic_test_anchor}
	Pausegame
	<Elements> = [test_graphic1 test_graphic2 test_graphic3 test_graphic4]
	<textures> = [graphic_test graphic_test2 graphic_test3 graphic_test4]
	<I> = 0
	begin
	<Element> = (<Elements> [<I>])
	if NOT ScreenelementExists Id = <Element>
		createScreenElement {
			Id = <Element>
			PARENT = graphic_test_anchor
			Type = spriteElement
			pos = (320.0, 224.0)
			texture = (<textures> [<I>])
		}
	endif
	<I> = (<I> + 1)
	repeat 4
endscript

script test_graphic_switch 
	Change graphic_test_selection = <selection>
endscript

script test_graphic_move 
	switch <Dir>
		case Up
		<delta> = ((0.0, -1.0) * $graphic_test_speed)
		case Right
		<delta> = ((1.0, 0.0) * $graphic_test_speed)
		case Down
		<delta> = ((0.0, 1.0) * $graphic_test_speed)
		case Left
		<delta> = ((-1.0, 0.0) * $graphic_test_speed)
	endswitch
	getScreenElementProps Id = ($graphic_test_selection)
	DoScreenElementMorph Id = ($graphic_test_selection) pos = (<delta> + <pos>) Time = 0
endscript

script test_graphic_scale 
	getScreenElementProps Id = ($graphic_test_selection)
	getScreenElementDims Id = ($graphic_test_selection)
	if NOT (IsPair <scale>)
		<scale> = (<scale> * (1.0, 1.0))
	endif
	if ($graphic_test_axis = 0)
		<delta> = ((1.0, 0.0) * ($graphic_test_speed / (<width> / <scale> [0])))
	else
		<delta> = ((0.0, 1.0) * ($graphic_test_speed / (<Height> / <scale> [1])))
	endif
	if (<Dir> = Up)
		DoScreenElementMorph Id = ($graphic_test_selection) scale = (<scale> + <delta>) Time = 0
	else
		DoScreenElementMorph Id = ($graphic_test_selection) scale = (<scale> - <delta>) Time = 0
	endif
endscript

script test_graphic_z 
	getScreenElementProps Id = ($graphic_test_selection)
	if gotParam \{Up}
		setScreenElementProps Id = ($graphic_test_selection) z_priority = (<z_priority> + 1)
	else
		setScreenElementProps Id = ($graphic_test_selection) z_priority = (<z_priority> - 1)
	endif
endscript

script test_graphic_toggle_axis 
	if ($graphic_test_axis = 0)
		Change \{graphic_test_axis = 1}
		Printf \{"$graphic_test_axis = y"}
	else
		Change \{graphic_test_axis = 0}
		Printf \{"$graphic_test_axis = x"}
	endif
endscript

script test_graphic_toggle_speed 
	if ($graphic_test_speed = 1)
		Change \{graphic_test_speed = 5}
	else
		Change \{graphic_test_speed = 1}
	endif
	Printf "$graphic_test_speed = %d" D = ($graphic_test_speed)
endscript

script destroy_graphic_test 
	restore_start_key_binding
	unpauseGame
	Skater :Enableplayerinput
	DoScreenElementMorph \{Id = player1_panel_container Alpha = 1}
	if ScreenelementExists \{Id = graphic_test_anchor}
		DoScreenElementMorph \{Id = graphic_test_anchor Alpha = 0}
		launchevent \{Type = unfocus Target = graphic_test_anchor}
		SetAnalogStickActiveForMenus \{0}
	endif
endscript
