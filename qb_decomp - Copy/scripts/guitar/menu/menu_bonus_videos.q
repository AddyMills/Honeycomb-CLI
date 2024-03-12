
script create_bonus_videos_menu \{came_from_movie = 0}
	kill_start_key_binding
	if (<came_from_movie> = 1)
		SpawnScriptNOw \{Menu_Music_On}
	endif
	Change \{bv_id_index = 0}
	create_menu_backdrop \{texture = Venue_BG}
	createScreenElement \{Type = containerElement PARENT = root_window Id = bv_container pos = (0.0, 0.0)}
	displaySprite \{PARENT = bv_container tex = options_videos_poster just = [Center Center] pos = (640.0, 320.0) Dims = (850.0, 850.0) Rot_Angle = 3 Z = 51}
	displaySprite \{PARENT = bv_container tex = White rgba = [220 100 100 255] just = [Center Center] pos = (640.0, 360.0) Dims = (700.0, 700.0) Rot_Angle = 3}
	displaySprite {
		PARENT = bv_container
		Id = bv_hilite
		tex = White
		rgba = [105 130 85 255]
		just = [Center top]
		pos = ($bv_hilite_array [0])
		Dims = (700.0, 40.0)
		Rot_Angle = 4
		Z = 49
	}
	displaySprite \{PARENT = bv_container tex = Toprockers_Tape_1 pos = (250.0, 130.0) Rot_Angle = 75 Dims = (192.0, 96.0) Z = 100}
	displaySprite \{PARENT = bv_container tex = Toprockers_Tape_1 rgba = [0 0 0 128] pos = (255.0, 135.0) Rot_Angle = 75 Dims = (192.0, 96.0) Z = 99}
	displaySprite \{PARENT = bv_container tex = Toprockers_Tape_2 pos = (1070.0, 270.0) Rot_Angle = 75 Dims = (192.0, 96.0) Z = 100 flip_v}
	displaySprite \{PARENT = bv_container tex = Toprockers_Tape_1 rgba = [0 0 0 128] pos = (1075.0, 275.0) Rot_Angle = 75 Dims = (192.0, 96.0) Z = 99 flip_v}
	createScreenElement \{Type = spriteElement PARENT = bv_container texture = controller_2p_arrow pos = (640.0, 450.0) just = [Center Center] Dims = (32.0, 64.0) Id = venue_down_arrow z_priority = 99 Alpha = 1 flip_h flip_v}
	createScreenElement \{Type = spriteElement PARENT = bv_container texture = controller_2p_arrow pos = (640.0, 450.0) just = [Center Center] Dims = (40.0, 72.0) Id = venue_down_arrow2 z_priority = 99 rgba = [0 0 0 255] Alpha = 1 flip_h flip_v}
	createScreenElement \{Type = spriteElement PARENT = bv_container texture = controller_2p_arrow pos = (640.0, 170.0) just = [Center Center] Dims = (32.0, 64.0) Id = venue_up_arrow z_priority = 99 Alpha = 0}
	createScreenElement \{Type = spriteElement PARENT = bv_container texture = controller_2p_arrow pos = (640.0, 170.0) just = [Center Center] Dims = (40.0, 72.0) Id = venue_up_arrow2 z_priority = 99 rgba = [0 0 0 255] Alpha = 0}
	pos = ($bv_hilite_pos)
	I = 0
	begin
	formatText Checksumname = text_id 'bv_text_%d' D = <I>
	displayText {
		PARENT = bv_container
		Id = <text_id>
		font = text_a3
		Text = ($bv_text_array [<I>].Text)
		rgba = [255 245 225 255]
		Z = 50
		rot = 4
		just = [Left top]
		pos = <pos>
		scale = 1.2
		noshadow
	}
	getScreenElementDims Id = <text_id>
	setScreenElementProps Id = <text_id> scale = 1.25
	fit_text_in_rectangle Id = <text_id> only_if_larger_x = 1 Dims = ((350.0, 0.0) + <Height> * (0.0, 1.25))
	<pos> = (<pos> + (-2.0, 40.0))
	if (<I> >= 1)
		if bv_should_gray_out_selection Text = ($bv_text_array [<I>].Text)
			setScreenElementProps Id = <text_id> rgba = [140 55 60 255]
		else
			setScreenElementProps Id = <text_id> rgba = [255 245 225 255]
		endif
	endif
	<I> = (<I> + 1)
	repeat 5
	event_handlers = [
		{pad_up bonus_videos_scroll_up}
		{pad_down bonus_videos_scroll_down}
		{pad_back bonus_videos_go_back}
	]
	new_menu {
		scrollid = mbv_scroll
		vmenuid = mbv_vmenu
		Menu_pos = (480.0, 130.0)
		text_left
		Spacing = -12
		Rot_Angle = 1
		no_wrap
		event_handlers = <event_handlers>
		no_focus = 1
	}
	text_params = {PARENT = mbv_vmenu Type = textElement font = text_a3 rgba = [255 245 225 255] z_priority = -50 Rot_Angle = 3 scale = 1.2}
	createScreenElement {
		<text_params>
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {Text = ($bv_text_array [0].Text) action = select_credits}}
		]
	}
	createScreenElement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video Params = {Text = ($bv_text_array [1].Text) movie = 'sexpistols'}}
		]
	}
	createScreenElement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video Params = {Text = ($bv_text_array [2].Text) movie = 'brettmichaels'}}
		]
	}
	createScreenElement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video Params = {Text = ($bv_text_array [3].Text) movie = 'slash'}}
		]
	}
	createScreenElement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video Params = {Text = ($bv_text_array [4].Text) movie = 'tommorello'}}
		]
	}
	getArraySize ($bv_text_array)
	Change bv_max_videos = <array_Size>
	I = 5
	begin
	createScreenElement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video Params = {Text = ($bv_text_array [<I>].Text) movie = ($bv_text_array [<I>].movie)}}
		]
	}
	<I> = (<I> + 1)
	repeat (<array_Size> - 5)
	setGlobalTags ($bv_text_array [5].Id) Params = {unlocked = 1}
	launchevent \{Type = focus Target = mbv_vmenu}
	scroll_count = ($bv_index)
	Change \{bv_index = 0}
	I = 0
	if (<scroll_count> > 0)
		begin
		launchevent \{Type = pad_down Target = mbv_vmenu}
		<I> = (<I> + 1)
		repeat <scroll_count>
	endif
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript

script destroy_bonus_videos_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = bv_container}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mbv_scroll}
endscript

script bonus_videos_go_back 
	if ($transitions_locked = 0)
		launchevent \{Type = unfocus Target = mbv_vmenu}
	endif
	menu_flow_go_back
endscript
bv_text_array = [
	{
		Text = "CREDITS"
	}
	{
		Text = "SEX PISTOLS"
		Id = sexpistols
	}
	{
		Text = "BRET MICHAELS"
		Id = brettmichaels
	}
	{
		Text = "SLASH"
		Id = Slash
	}
	{
		Text = "TOM MORELLO"
		Id = tommorello
	}
	{
		Text = "INTRO"
		Id = INTRO
		movie = 'intro'
	}
	{
		Text = "CAREER 01"
		Id = singleplayer_01
		movie = 'singleplayer_01'
	}
	{
		Text = "CAREER 02"
		Id = singleplayer_02
		movie = 'singleplayer_02'
	}
	{
		Text = "CAREER 03"
		Id = singleplayer_03
		movie = 'singleplayer_03'
	}
	{
		Text = "CAREER 04"
		Id = singleplayer_04
		movie = 'singleplayer_04'
	}
	{
		Text = "CAREER 05"
		Id = singleplayer_05
		movie = 'singleplayer_05'
	}
	{
		Text = "CAREER 06"
		Id = singleplayer_06
		movie = 'singleplayer_06'
	}
	{
		Text = "CAREER 07"
		Id = singleplayer_07
		movie = 'singleplayer_07'
	}
	{
		Text = "CAREER 08"
		Id = singleplayer_08
		movie = 'singleplayer_08'
	}
	{
		Text = "CAREER END"
		Id = singleplayer_end
		movie = 'singleplayer_end'
	}
	{
		Text = "COOP CAREER 01"
		Id = coop_01
		movie = 'coop_01'
	}
	{
		Text = "COOP CAREER 02"
		Id = coop_02
		movie = 'coop_02'
	}
	{
		Text = "COOP CAREER 03"
		Id = coop_03
		movie = 'coop_03'
	}
	{
		Text = "COOP CAREER 04"
		Id = coop_04
		movie = 'coop_04'
	}
	{
		Text = "COOP CAREER 05"
		Id = coop_05
		movie = 'coop_05'
	}
	{
		Text = "COOP CAREER 06"
		Id = coop_06
		movie = 'coop_06'
	}
]
bv_hilite_array = [
	(640.0, 207.0)
	(640.0, 247.0)
	(640.0, 287.0)
	(640.0, 327.0)
	(640.0, 367.0)
]
bv_index = 0
bv_id_index = 0
bv_hilite_pos = (470.0, 190.0)
bv_max_videos = 6

script bv_should_gray_out_selection 
	getplatform
	if NOT English
		if (<Platform> = PS2 || <Platform> = PS3)
			return \{FALSE}
		endif
	endif
	getArraySize ($Bonus_videos)
	bonus_size = <array_Size>
	getArraySize ($bv_text_array)
	I = 1
	begin
	if gotParam \{Text}
		if (<Text> = ($bv_text_array [<I>].Text))
			getglobaltags ($bv_text_array [<I>].Id)
			if (<unlocked> = 0)
				return \{TRUE}
			else
				return \{FALSE}
			endif
		endif
		elseif gotParam \{movie}
		if (<movie> = ($bv_text_array [<I>].movie))
			getglobaltags ($bv_text_array [<I>].Id)
			if (<unlocked> = 0)
				return \{TRUE}
			else
				return \{FALSE}
			endif
		endif
	endif
	<I> = (<I> + 1)
	repeat (<array_Size> - 1)
	return \{FALSE}
endscript

script get_movie_id_by_name 
	getArraySize ($bv_text_array)
	I = 5
	begin
	if (($bv_text_array [<I>].movie) = <movie>)
		return Id = ($bv_text_array [<I>].Id)
	endif
	<I> = (<I> + 1)
	repeat (<array_Size> - 5)
	printStruct <...>
	Scriptassert \{"Movie not found in get_movie_id_by_name!"}
endscript

script bonus_videos_scroll_down \{quick = 0}
	formatText Checksumname = video_text_id 'bv_text_%d' D = ($bv_id_index)
	make_sound = 1
	if ($bv_id_index < 4)
		Change bv_id_index = ($bv_id_index + 1)
		setScreenElementProps Id = bv_hilite pos = ($bv_hilite_array [$bv_id_index])
		Change bv_index = ($bv_index + 1)
	else
		setScreenElementProps \{Id = venue_up_arrow Alpha = 1}
		setScreenElementProps \{Id = venue_up_arrow2 Alpha = 1}
		if ($bv_index < ($bv_max_videos - 1))
			Change bv_index = ($bv_index + 1)
			if ($bv_index = ($bv_max_videos - 1))
				setScreenElementProps \{Id = venue_down_arrow Alpha = 0 flip_h}
				setScreenElementProps \{Id = venue_down_arrow2 Alpha = 0 flip_h}
			endif
			I = 0
			begin
			GetUppercaseString ($bv_text_array [($bv_index - <I>)].Text)
			formatText Checksumname = video_text_id 'bv_text_%d' D = (4 - <I>)
			setScreenElementProps Id = <video_text_id> Text = <UppercaseString>
			getScreenElementDims Id = <video_text_id>
			setScreenElementProps Id = <video_text_id> scale = 1.25
			fit_text_in_rectangle Id = <video_text_id> only_if_larger_x = 1 Dims = ((350.0, 0.0) + <Height> * (0.0, 1.25))
			if bv_should_gray_out_selection Text = <UppercaseString>
				setScreenElementProps Id = <video_text_id> rgba = [140 55 60 255]
			else
				setScreenElementProps Id = <video_text_id> rgba = [255 245 225 255]
			endif
			<I> = (<I> + 1)
			repeat 5
		else
			<make_sound> = 0
		endif
	endif
	if (<make_sound> = 1)
		if (<quick> = 0)
			generic_menu_up_or_down_sound \{Down}
		endif
	endif
endscript

script bonus_videos_scroll_up 
	make_sound = 1
	formatText Checksumname = video_text_id 'bv_text_%d' D = ($bv_id_index)
	if ($bv_id_index > 0)
		Change bv_id_index = ($bv_id_index -1)
		setScreenElementProps Id = bv_hilite pos = ($bv_hilite_array [$bv_id_index])
		Change bv_index = ($bv_index -1)
	else
		setScreenElementProps \{Id = venue_down_arrow Alpha = 1 flip_h flip_v}
		setScreenElementProps \{Id = venue_down_arrow2 Alpha = 1 flip_h flip_v}
		if ($bv_index > 0)
			Change bv_index = ($bv_index -1)
			if ($bv_index = 0)
				setScreenElementProps \{Id = venue_up_arrow Alpha = 0}
				setScreenElementProps \{Id = venue_up_arrow2 Alpha = 0}
			endif
			I = 0
			begin
			GetUppercaseString ($bv_text_array [($bv_index + <I>)].Text)
			formatText Checksumname = video_text_id 'bv_text_%d' D = <I>
			setScreenElementProps Id = <video_text_id> Text = <UppercaseString>
			getScreenElementDims Id = <video_text_id>
			setScreenElementProps Id = <video_text_id> scale = 1.25
			fit_text_in_rectangle Id = <video_text_id> only_if_larger_x = 1 Dims = ((350.0, 0.0) + <Height> * (0.0, 1.25))
			if bv_should_gray_out_selection Text = <UppercaseString>
				setScreenElementProps Id = <video_text_id> rgba = [140 55 60 255]
			else
				setScreenElementProps Id = <video_text_id> rgba = [255 245 225 255]
			endif
			<I> = (<I> + 1)
			repeat 5
		else
			<make_sound> = 0
		endif
	endif
	if (<make_sound> = 1)
		generic_menu_up_or_down_sound \{Up}
	endif
endscript

script bv_morph_hilite \{Time = 0.01}
	bv_hilite :doMorph pos = (<pos> - (0.0, 20.0)) scale = (1.0, 0.25) Time = <Time> relative_scale
	bv_hilite :doMorph pos = (<pos>) scale = 1 Time = <Time> relative_scale
endscript

script menu_bonus_videos_play_video \{movie = 'atvi'}
	if bv_should_gray_out_selection Text = <Text>
	else
		launchevent \{Type = unfocus Target = mbv_vmenu}
		menu_music_off
		PlayMovieAndWait movie = <movie>
		SpawnScriptNOw \{Menu_Music_On}
		launchevent \{Type = focus Target = mbv_vmenu}
	endif
endscript

script shutdown_options_video_monitor 
	killspawnedScript \{Name = options_video_monitor}
	killspawnedScript \{Name = PlayMovieAndWait}
	KillMovie \{textureSlot = 0}
	KillMovie \{textureSlot = 1}
	FadeToBlack \{OFF Time = 0}
endscript
