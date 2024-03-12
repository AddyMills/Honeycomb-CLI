g_ec_balloons_pos_left = [
	(315.0, 325.0)
	(465.0, 405.0)
	(590.0, 340.0)
	(360.0, 440.0)
]
g_ec_balloons_pos_right = [
	(960.0, 340.0)
	(790.0, 400.0)
	(690.0, 360.0)
	(915.0, 440.0)
]
g_encore_ready = 0

script create_encore_confirmation_menu 
	kill_start_key_binding
	menu_font = fontgrid_title_gh3
	Menu_pos = (640.0, 480.0)
	new_menu scrollid = ec_scroll vmenuid = ec_vmenu Menu_pos = <Menu_pos> event_handlers = <ec_eh> Spacing = -45
	launchevent \{Type = unfocus Target = ec_vmenu}
	createScreenElement \{Type = containerElement Id = ec_container PARENT = root_window pos = (0.0, 0.0)}
	offwhite = [223 223 223 255]
	menu_z = 100
	createScreenElement \{Type = spriteElement Id = encore_gradient PARENT = ec_container texture = gradient_128 rgba = [0 0 0 180] pos = (0.0, 0.0) Dims = (1280.0, 720.0) just = [Left top] z_priority = -1}
	get_song_struct Song = ($current_song)
	if (<song_struct>.Checksum = bosstom)
		bossText = "PLAY AN ENCORE WITH TOM MORELLO!"
		bossdims = (800.0, 0.0)
		elseif (<song_struct>.Checksum = bossslash)
		bossText = "PLAY AN ENCORE WITH SLASH!"
		bossdims = (800.0, 0.0)
	endif
	if gotParam \{bossText}
		displayText {
			PARENT = ec_container
			pos = (640.0, 165.0)
			just = [Center Center]
			font = fontgrid_title_gh3
			rgba = [130 170 200 255]
			scale = 1
			Text = <bossText>
			Z = <menu_z>
		}
		fit_text_in_rectangle Id = <Id> Dims = <bossdims> keep_ar = 1
	else
		encore_text = "ENCORE!"
		StringLength String = <encore_text>
		StringToCharArray String = <encore_text>
		space_between = (50.0, 0.0)
		I = 0
		begin
		formatText Checksumname = encore_id 'ec_encore_text_%d' D = (<I> + 1)
		displayText {
			Id = <encore_id>
			PARENT = ec_container
			pos = <pos>
			scale = 2.25
			Text = (<char_array> [<I>])
			just = [Center Center]
			rgba = [130 170 200 255]
			font = fontgrid_title_gh3
			noshadow
			Z = <menu_z>
		}
		getScreenElementDims Id = <Id>
		if (<I> = 0)
			<pos> = ((660.0, 165.0) - (((<str_len> - 1) * <width>) * (0.5, 0.0)))
			setScreenElementProps Id = <Id> pos = <pos>
		endif
		<pos> = (<pos> + <space_between>)
		<I> = (<I> + 1)
		repeat <str_len>
		SpawnScriptNOw ec_raise_headline Params = {str_len = <str_len>}
	endif
	displaySprite \{Id = ec_flash PARENT = ec_container tex = Encore_Flash Alpha = 0 Dims = (128.0, 128.0) just = [Center Center]}
	arm_pos = (270.0, 300.0)
	arm_add = (80.0, 0.0)
	arm_z = [1 3 5 7 8 6 4 2]
	arm_index = 0
	begin
	formatText Checksumname = arm_id 'ec_arm_0%d' D = <arm_index>
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText Checksumname = arm_tex 'Encore_Arm_%d' D = <rand_arm>
	displaySprite Id = <arm_id> PARENT = ec_container tex = <arm_tex> pos = <arm_pos> Dims = (180.0, 340.0) Z = (<menu_z> + 10 + (<arm_z> [<arm_index>]))
	if (<rand_arm> = 4 || <rand_arm> = 8)
		<arm_id> :SetTags Higher = 1
	else
		<arm_id> :SetTags Higher = 0
	endif
	<arm_pos> = (<arm_pos> + <arm_add>)
	<arm_index> = (<arm_index> + 1)
	repeat 8
	SpawnScriptNOw \{ec_raise_fists}
	SpawnScriptNOw \{ec_flashes}
	get_song_struct Song = ($current_song)
	if NOT structureContains Structure = <song_struct> boss
		STARS = ($player1_status.STARS)
		Cash = ($player1_status.new_cash)
		Change \{StructureName = player1_status new_cash = 0}
		if ($game_mode = p2_career)
			score = ($player1_status.score + $player2_status.score)
		else
			score = ($player1_status.score)
		endif
		if (<STARS> < 3)
			<STARS> = 3
		endif
		castToInteger \{score}
		formatText Textname = scoretext "%d" D = <score> useCommas
		formatText Textname = moneytext "$%d" D = <Cash> useCommas
		textscale = 0.8
		starscale = 0.125
		displayText {
			Id = ec_scoretext
			font = text_a6
			PARENT = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 10
			Text = <scoretext>
			just = [Right Center]
			Z = (<menu_z> + 20)
		}
		I = 0
		begin
		formatText Checksumname = starchecksum 'star_id0%d' D = <I>
		GetRandomValue \{A = 0 B = 360 Name = rot}
		displaySprite {
			PARENT = ec_container
			Id = <starchecksum>
			pos = (20000.0, 20000.0)
			tex = Encore_Star_Outline
			just = [Center Center]
			scale = 10
			rgba = [223 223 223 255]
			Rot_Angle = <rot>
			Z = (<menu_z> + 20)
			relative_scale
		}
		formatText Checksumname = starchecksum 'star_id0%d_2' D = <I>
		displaySprite {
			PARENT = ec_container
			Id = <starchecksum>
			pos = (20000.0, 20000.0)
			tex = Encore_Star_Outline
			just = [Center Center]
			scale = 10
			rgba = [110 30 20 255]
			Rot_Angle = <rot>
			Z = (<menu_z> + 21)
			relative_scale
		}
		<I> = (<I> + 1)
		repeat <STARS>
		displayText {
			Id = ec_moneytext
			font = text_a6
			PARENT = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 10
			Text = <moneytext>
			just = [Left Center]
			Z = (<menu_z> + 20)
		}
		Wait \{1 Seconds}
		setScreenElementProps \{Id = ec_scoretext pos = (520.0, 220.0) Alpha = 0}
		DoScreenElementMorph Id = ec_scoretext scale = <textscale> Time = 0.5 Alpha = 1
		Soundevent \{Event = GH3_Score_FlyIn}
		Wait \{1 Seconds}
		setScreenElementProps \{Id = ec_moneytext pos = (760.0, 220.0) Alpha = 0}
		DoScreenElementMorph Id = ec_moneytext scale = <textscale> Time = 0.5 Alpha = 1
		Soundevent \{Event = GH3_Cash_FlyIn}
		Wait \{0.5 Seconds}
		Soundevent \{Event = GH3_Cash_FlyIn_Hit}
		Wait \{0.5 Seconds}
		star_add = (40.0, 0.0)
		star_pos = (600.0, 220.0)
		switch <STARS>
			case 4
			<star_pos> = (580.0, 220.0)
			case 5
			<star_pos> = (560.0, 220.0)
		endswitch
		<I> = 0
		begin
		Soundevent \{Event = GH3_Star_FlyIn}
		formatText Checksumname = starchecksum 'star_id0%d' D = <I>
		setScreenElementProps Id = <starchecksum> pos = <star_pos>
		DoScreenElementMorph Id = <starchecksum> scale = <starscale> Time = 0.25 relative_scale
		formatText Checksumname = starchecksum 'star_id0%d_2' D = <I>
		setScreenElementProps Id = <starchecksum> pos = <star_pos>
		DoScreenElementMorph Id = <starchecksum> scale = (<starscale> - 0.025) Time = 0.25 relative_scale
		Wait \{0.25 Seconds}
		<star_pos> = (<star_pos> + <star_add>)
		<I> = (<I> + 1)
		repeat <STARS>
	else
		Cash = ($player1_status.new_cash)
		Change \{StructureName = player1_status new_cash = 0}
		formatText Textname = moneytext "$%d" D = <Cash> useCommas
		displayText {
			Id = ec_moneytext
			font = text_a6
			PARENT = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 200
			Text = <moneytext>
			just = [Center Center]
			noshadow
			Z = (<menu_z> + 20)
		}
		Wait \{1 Seconds}
		setScreenElementProps \{Id = ec_moneytext pos = (640.0, 220.0) Alpha = 0}
		DoScreenElementMorph \{Id = ec_moneytext scale = 1 Time = 0.5 Alpha = 1}
		Wait \{1 Seconds}
	endif
	displaySprite PARENT = ec_container Id = ec_crowd_1 pos = (-2000.0, -2000.0) tex = Encore_Balloon just = [Center Center] scale = 2 Z = (<menu_z> + 50)
	displaySprite PARENT = ec_container Id = ec_crowd_2 pos = (-2000.0, -2000.0) tex = Encore_Balloon just = [Center Center] scale = 2 Z = (<menu_z> + 50)
	displaySprite PARENT = ec_container Id = ec_crowd_3 pos = (-2000.0, -2000.0) tex = Encore_Balloon just = [Center Center] scale = 2 Z = (<menu_z> + 50)
	displaySprite PARENT = ec_container Id = ec_crowd_4 pos = (-2000.0, -2000.0) tex = Encore_Balloon just = [Center Center] scale = 2 Z = (<menu_z> + 50)
	displayText Id = ec_crowd_text_1 PARENT = ec_crowd_1 Text = "yay!" pos = (60.0, 35.0) rgba = [0 0 0 255] Z = (<menu_z> + 51) just = [Center Center] scale = 0.8 noshadow
	displayText Id = ec_crowd_text_2 PARENT = ec_crowd_2 Text = "yay!" pos = (60.0, 35.0) rgba = [0 0 0 255] Z = (<menu_z> + 51) just = [Center Center] scale = 0.8 noshadow
	displayText Id = ec_crowd_text_3 PARENT = ec_crowd_3 Text = "yay!" pos = (60.0, 35.0) rgba = [0 0 0 255] Z = (<menu_z> + 51) just = [Center Center] scale = 0.8 noshadow
	displayText Id = ec_crowd_text_4 PARENT = ec_crowd_4 Text = "yay!" pos = (60.0, 35.0) rgba = [0 0 0 255] Z = (<menu_z> + 51) just = [Center Center] scale = 0.8 noshadow
	SpawnScriptNOw \{encore_crowd_shout}
	Wait \{1 Second}
	Change \{g_encore_ready = 1}
	displaySprite PARENT = ec_container Id = options_bg_1 tex = Encore_Menu_BG pos = (640.0, 550.0) Dims = (384.0, 192.0) just = [Center Center] Z = (<menu_z> + 50)
	set_focus_color \{rgba = [110 30 20 255]}
	set_unfocus_color \{rgba = [135 170 200 255]}
	if NOT gotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	largest_width = 0
	createScreenElement \{Type = containerElement PARENT = ec_vmenu Dims = (0.0, 100.0) event_handlers = [{focus ec_yes_highlight_focus Params = {Id = ec_play_encore}}{unfocus retail_menu_unfocus Params = {Id = ec_play_encore}}{pad_choose encore_play}]}
	createScreenElement {
		Type = textElement
		Id = ec_play_encore
		PARENT = <Id>
		font = fontgrid_title_gh3
		Text = "PLAY ENCORE"
		scale = (0.9, 1.0)
		rgba = [135 170 200 255]
		just = [Center Center]
		z_priority = (<menu_z> + 51)
	}
	setScreenElementProps {
		Id = <Id>
		exclusive_device = <exclusive_device>
	}
	getScreenElementDims Id = <Id>
	if (<width> > <largest_width>)
		<largest_width> = <width>
	endif
	createScreenElement \{Type = containerElement PARENT = ec_vmenu Dims = (0.0, 100.0) event_handlers = [{focus ec_no_highlight_focus Params = {Id = ec_leave_encore}}{unfocus retail_menu_unfocus Params = {Id = ec_leave_encore}}{pad_choose encore_leave}]}
	createScreenElement {
		Type = textElement
		Id = ec_leave_encore
		PARENT = <Id>
		font = fontgrid_title_gh3
		Text = "LEAVE"
		scale = (0.9, 1.0)
		rgba = [135 170 200 255]
		just = [Center Center]
		z_priority = (<menu_z> + 51)
	}
	setScreenElementProps {
		Id = <Id>
		exclusive_device = <exclusive_device>
	}
	getScreenElementDims Id = <Id>
	if (<width> > <largest_width>)
		<largest_width> = <width>
	endif
	getScreenElementDims \{Id = options_bg_1}
	setScreenElementProps Id = options_bg_1 Dims = (<largest_width> * (1.0, 0.0) + (150.0, 0.0) + (0.0, 192.0))
	get_song_struct Song = ($current_song)
	if ((structureContains Structure = <song_struct> boss) || $game_mode = p2_battle)
		set_current_battle_first_play
	endif
	displaySprite Id = ec_hi_left PARENT = ec_container tex = Encore_Menu_Bookend rgba = [110 30 20 255] Z = (<menu_z> + 51)
	displaySprite Id = ec_hi_right PARENT = ec_container tex = Encore_Menu_Bookend rgba = [110 30 20 255] Z = (<menu_z> + 51)
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	ec_yes_highlight_focus \{Id = ec_play_encore}
	launchevent \{Type = focus Target = ec_vmenu}
	add_user_control_helper Text = "SELECT" button = Green Z = (<menu_z> + 100)
	add_user_control_helper Text = "UP/DOWN" button = Strumbar Z = (<menu_z> + 100)
endscript

script destroy_encore_confirmation_menu 
	restore_start_key_binding
	clean_up_user_control_helpers
	killspawnedScript \{Name = ec_flashes}
	killspawnedScript \{Name = ec_raise_fists}
	Change \{g_encore_ready = 0}
	destroy_menu \{menu_id = ec_scroll}
	destroy_menu \{menu_id = ec_container}
	destroy_pause_menu_frame
	killspawnedScript \{Name = encore_crowd_shout}
	PreEncore_Crowd_Build_SFX_STOP
endscript

script ec_yes_highlight_focus 
	retail_menu_focus <...>
	getScreenElementDims Id = <Id>
	setScreenElementProps Id = ec_hi_left pos = ((630.0, 500.0) - (<width> * (0.5, 0.0))) flip_v just = [Right top]
	setScreenElementProps Id = ec_hi_right pos = ((650.0, 500.0) + (<width> * (0.5, 0.0))) just = [Left top]
endscript

script ec_no_highlight_focus 
	retail_menu_focus <...>
	getScreenElementDims Id = <Id>
	setScreenElementProps Id = ec_hi_left pos = ((630.0, 560.0) - (<width> * (0.5, 0.0))) flip_v just = [Right top]
	setScreenElementProps Id = ec_hi_right pos = ((650.0, 560.0) + (<width> * (0.5, 0.0))) just = [Left top]
endscript

script encore_play 
	if ($g_encore_ready)
		SpawnScriptNOw \{GH3_SFX_Encore_Accept}
		ui_flow_manager_respond_to_action \{action = Continue}
	endif
endscript

script encore_leave 
	if ($g_encore_ready)
		SpawnScriptNOw \{GH3_SFX_Encore_Decline}
		SpawnScriptNOw \{xenon_singleplayer_session_complete_uninit}
		ui_flow_manager_respond_to_action \{action = quit}
	endif
endscript

script encore_crowd_shout 
	shout_text = [
		"yeah!"
		"rock!"
		"again!"
		"whoo!"
		"yay!"
		"more!"
	]
	getArraySize <shout_text>
	begin
	I = 0
	begin
	formatText Checksumname = balloon_id 'ec_crowd_%d' D = <I>
	formatText Checksumname = balloon_text 'ec_crowd_text_%d' D = <I>
	Side = Random (@ 1 @ 2 )
	rand = Random (@ 0 @ 1 @ 2 @ 3 )
	if (<Side> = 1)
		balloon_array = g_ec_balloons_pos_left
	else
		balloon_array = g_ec_balloons_pos_right
	endif
	GetRandomValue A = 0 B = (<array_Size> - 1) Name = rand_text Integer
	if ScreenelementExists Id = <balloon_id>
		setScreenElementProps Id = <balloon_id> pos = ($<balloon_array> [<rand>])
		if ScreenelementExists Id = <balloon_text>
			setScreenElementProps Id = <balloon_text> Text = (<shout_text> [<rand_text>]) scale = 1
			fit_text_in_rectangle Id = <balloon_text> only_if_larger_x = 1 Dims = (90.0, 50.0) keep_ar = 1
		endif
		DoScreenElementMorph Id = <balloon_id> Alpha = 1 Time = 0.125
		Wait \{0.5 Seconds}
		DoScreenElementMorph Id = <balloon_id> Alpha = 0 Time = 0.5
		Wait \{0.5 Seconds}
	endif
	Mod A = <I> B = 2
	if (<Mod> = 0)
		Wait \{1 Second}
	endif
	<I> = (<I> + 1)
	repeat 4
	repeat
endscript

script ec_raise_fists 
	begin
	I = 0
	begin
	GetRandomValue \{A = 0.1 B = 0.3 Name = wait_time}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText Checksumname = arm_id 'ec_arm_0%d' D = <I>
	getScreenElementProps Id = <arm_id>
	if ScreenelementExists Id = <arm_id>
		<arm_id> :getTags
		<arm_id> :SetTags pos = <pos> chance = <rand_arm>
		if (<Higher> = 1)
			up_pos = (<pos> - (0.0, 80.0))
		else
			up_pos = (<pos> - (0.0, 50.0))
		endif
		DoScreenElementMorph Id = <arm_id> pos = <up_pos> Time = <wait_time> Motion = ease_in
	endif
	<I> = (<I> + 1)
	repeat 8
	Wait \{0.3 Seconds}
	<I> = 0
	begin
	GetRandomValue \{A = 0.1 B = 0.3 Name = wait_time}
	formatText Checksumname = arm_id 'ec_arm_0%d' D = <I>
	if ScreenelementExists Id = <arm_id>
		<arm_id> :getTags
		DoScreenElementMorph Id = <arm_id> pos = (<pos>) Time = (<wait_time> * 2.0) Motion = ease_out
	endif
	<I> = (<I> + 1)
	repeat 8
	Wait \{0.3 Seconds}
	repeat
endscript

script ec_raise_headline 
	begin
	I = 0
	begin
	GetRandomValue \{A = 0.05 B = 0.15 Name = wait_time}
	formatText Checksumname = text_id 'ec_encore_text_%d' D = (<I> + 1)
	if ScreenelementExists Id = <text_id>
		getScreenElementProps Id = <text_id>
		<text_id> :getTags
		<text_id> :SetTags pos = <pos>
		DoScreenElementMorph Id = <text_id> pos = (<pos> - (0.0, 22.0)) Time = <wait_time>
	endif
	<I> = (<I> + 1)
	repeat <str_len>
	Wait \{0.15 Seconds}
	<I> = 0
	begin
	GetRandomValue \{A = 0.05 B = 0.15 Name = wait_time}
	formatText Checksumname = text_id 'ec_encore_text_%d' D = (<I> + 1)
	if ScreenelementExists Id = <text_id>
		<text_id> :getTags
		DoScreenElementMorph Id = <text_id> pos = <pos> Time = (<wait_time> * 2.0)
	endif
	<I> = (<I> + 1)
	repeat <str_len>
	Wait \{0.15 Seconds}
	repeat
endscript

script ec_flashes 
	begin
	GetRandomValue \{A = 400 B = 900 Name = x_pos}
	GetRandomValue \{A = 400 B = 500 Name = y_pos}
	GetRandomValue \{A = 96 B = 256 Name = rand_dim}
	GetRandomValue \{A = 0 B = 360 Name = rand_rot}
	pos = (<x_pos> * (1.0, 0.0) + <y_pos> * (0.0, 1.0))
	Dims = (<rand_dim> * (1.0, 0.0) + <rand_dim> * (0.0, 1.0))
	if ScreenelementExists \{Id = ec_flash}
		setScreenElementProps Id = ec_flash pos = <pos> Dims = <Dims> Rot_Angle = <rand_rot> Alpha = 1
		ec_flash :doMorph Alpha = 0 Dims = (<Dims> * 0.5) Time = 0.2
		ec_flash :doMorph Dims = <Dims>
	endif
	repeat
endscript
