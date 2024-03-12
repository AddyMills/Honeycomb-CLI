
script create_bonus_videos_menu \{came_from_movie = 0}
	kill_start_key_binding
	if (<came_from_movie> = 1)
		spawnscriptnow \{menu_music_on}
	endif
	change \{bv_id_index = 0}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = bv_container
		Pos = (0.0, 0.0)}
	displaySprite \{parent = bv_container
		tex = options_videos_poster
		just = [
			center
			center
		]
		Pos = (640.0, 320.0)
		dims = (850.0, 850.0)
		rot_angle = 3
		z = 51}
	displaySprite \{parent = bv_container
		tex = white
		rgba = [
			220
			100
			100
			255
		]
		just = [
			center
			center
		]
		Pos = (640.0, 360.0)
		dims = (700.0, 700.0)
		rot_angle = 3}
	displaySprite {
		parent = bv_container
		id = bv_hilite
		tex = white
		rgba = [105 130 85 255]
		just = [center top]
		Pos = ($bv_hilite_array [0])
		dims = (700.0, 40.0)
		rot_angle = 4
		z = 49
	}
	displaySprite \{parent = bv_container
		tex = Toprockers_Tape_1
		Pos = (250.0, 130.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 100}
	displaySprite \{parent = bv_container
		tex = Toprockers_Tape_1
		rgba = [
			0
			0
			0
			128
		]
		Pos = (255.0, 135.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 99}
	displaySprite \{parent = bv_container
		tex = Toprockers_Tape_2
		Pos = (1070.0, 270.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 100
		flip_v}
	displaySprite \{parent = bv_container
		tex = Toprockers_Tape_1
		rgba = [
			0
			0
			0
			128
		]
		Pos = (1075.0, 275.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 99
		flip_v}
	CreateScreenElement \{type = SpriteElement
		parent = bv_container
		texture = controller_2p_arrow
		Pos = (640.0, 450.0)
		just = [
			center
			center
		]
		dims = (32.0, 64.0)
		id = venue_down_arrow
		z_priority = 99
		alpha = 1
		flip_h
		flip_v}
	CreateScreenElement \{type = SpriteElement
		parent = bv_container
		texture = controller_2p_arrow
		Pos = (640.0, 450.0)
		just = [
			center
			center
		]
		dims = (40.0, 72.0)
		id = venue_down_arrow2
		z_priority = 99
		rgba = [
			0
			0
			0
			255
		]
		alpha = 1
		flip_h
		flip_v}
	CreateScreenElement \{type = SpriteElement
		parent = bv_container
		texture = controller_2p_arrow
		Pos = (640.0, 170.0)
		just = [
			center
			center
		]
		dims = (32.0, 64.0)
		id = venue_up_arrow
		z_priority = 99
		alpha = 0}
	CreateScreenElement \{type = SpriteElement
		parent = bv_container
		texture = controller_2p_arrow
		Pos = (640.0, 170.0)
		just = [
			center
			center
		]
		dims = (40.0, 72.0)
		id = venue_up_arrow2
		z_priority = 99
		rgba = [
			0
			0
			0
			255
		]
		alpha = 0}
	Pos = ($bv_hilite_pos)
	i = 0
	begin
	FormatText checksumname = text_id 'bv_text_%d' d = <i>
	displayText {
		parent = bv_container
		id = <text_id>
		font = text_a3
		text = ($bv_text_array [<i>].text)
		rgba = [255 245 225 255]
		z = 50
		rot = 4
		just = [left top]
		Pos = <Pos>
		Scale = 1.2
		noshadow
	}
	GetScreenElementDims id = <text_id>
	SetScreenElementProps id = <text_id> Scale = 1.25
	fit_text_in_rectangle id = <text_id> only_if_larger_x = 1 dims = ((270.0, 0.0) + <height> * (0.0, 1.25)) start_x_scale = 1.2
	<Pos> = (<Pos> + (-2.0, 40.0))
	if (<i> >= 1)
		if bv_should_gray_out_selection text = ($bv_text_array [<i>].text)
			SetScreenElementProps id = <text_id> rgba = [140 55 60 255]
		else
			SetScreenElementProps id = <text_id> rgba = [255 245 225 255]
		endif
	endif
	<i> = (<i> + 1)
	repeat 5
	event_handlers = [
		{pad_up bonus_videos_scroll_up}
		{pad_down bonus_videos_scroll_down}
		{pad_back bonus_videos_go_back}
	]
	new_menu {
		scrollid = mbv_scroll
		vmenuid = mbv_vmenu
		menu_pos = (480.0, 130.0)
		text_left
		spacing = -12
		rot_angle = 1
		no_wrap
		event_handlers = <event_handlers>
		no_focus = 1
	}
	text_params = {parent = mbv_vmenu type = TextElement font = text_a3 rgba = [255 245 225 255] z_priority = -50 rot_angle = 3 Scale = 1.2}
	CreateScreenElement {
		<text_params>
		id = video_option_id_0
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {text = ($bv_text_array [0].text) action = select_credits}}
		]
	}
	GetArraySize ($bv_text_array)
	change bv_max_videos = <array_size>
	i = 1
	begin
	FormatText checksumname = video_option_id 'video_option_id_%i' i = <i>
	CreateScreenElement {
		<text_params>
		id = <video_option_id>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video params = {text = ($bv_text_array [<i>].text) movie = ($bv_text_array [<i>].movie)}}
		]
	}
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	LaunchEvent \{type = focus target = mbv_vmenu}
	scroll_count = ($bv_index)
	change \{bv_index = 0}
	i = 0
	if (<scroll_count> > 0)
		begin
		LaunchEvent \{type = pad_down target = mbv_vmenu}
		<i> = (<i> + 1)
		repeat <scroll_count>
	endif
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
endscript

script replace_video_option_handlers 
	GetArraySize ($bv_text_array)
	i = 0
	begin
	FormatText checksumname = video_option_id 'video_option_id_%i' i = <i>
	SetScreenElementProps id = <video_option_id> event_handlers = [] replace_handlers
	<i> = (<i> + 1)
	repeat (<array_size>)
endscript

script destroy_bonus_videos_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = bv_container}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mbv_scroll}
endscript

script bonus_videos_go_back 
	if ($transitions_locked = 0)
		LaunchEvent \{type = unfocus target = mbv_vmenu}
	endif
	menu_flow_go_back
endscript
bv_text_array = [
	{
		text = "CREDITS"
	}
	{
		text = "GETTING TOGETHER"
		id = AO_Long_1
		movie = 'AO_long_1'
	}
	{
		text = "FIRST TASTE"
		id = AO_long_2
		movie = 'AO_long_2'
	}
	{
		text = "THE RETURN"
		id = AO_long_3
		movie = 'AO_long_3'
	}
	{
		text = "SUPERSTARS"
		id = AO_long_4
		movie = 'AO_long_4'
	}
	{
		text = "AMERICAN BAND"
		id = AO_Long_5
		movie = 'AO_long_5'
	}
	{
		text = "LEGENDS"
		id = AO_long_6
		movie = 'AO_long_6'
	}
	{
		text = "WHAT'S NEXT?"
		id = AO_long_7
		movie = 'AO_long_7'
	}
	{
		text = "CAREER 1"
		id = AO_short_1
		movie = 'AO_short_1'
	}
	{
		text = "CAREER 2"
		id = AO_short_2
		movie = 'AO_short_2'
	}
	{
		text = "CAREER 3"
		id = AO_short_3
		movie = 'AO_short_3'
	}
	{
		text = "CAREER 4"
		id = AO_short_4
		movie = 'AO_short_4'
	}
	{
		text = "CAREER 5"
		id = AO_short_5
		movie = 'AO_short_5'
	}
	{
		text = "CAREER 6"
		id = AO_short_6
		movie = 'AO_short_6'
	}
	{
		text = "CAREER END"
		id = singleplayer_end
		movie = 'singleplayer_end'
	}
	{
		text = "ACTIVISION"
		id = atvi
		movie = 'atvi'
	}
	{
		text = "RED OCTANE"
		id = ro_logo
		movie = 'ro_logo'
	}
	{
		text = "NEVERSOFT"
		id = ns_logo
		movie = 'ns_logo'
	}
	{
		text = "ASPYR"
		id = Aspyr
		movie = 'Aspyr'
	}
	{
		text = "INTRO"
		id = intro
		movie = 'intro'
	}
]
mac_bv_text_array = [
	{
		text = "CREDITS"
	}
	{
		text = "GETTING TOGETHER"
		id = AO_Long_1
		movie = 'AO_long_1'
	}
	{
		text = "FIRST TASTE"
		id = AO_long_2
		movie = 'AO_long_2'
	}
	{
		text = "THE RETURN"
		id = AO_long_3
		movie = 'AO_long_3'
	}
	{
		text = "SUPERSTARS"
		id = AO_long_4
		movie = 'AO_long_4'
	}
	{
		text = "AMERICAN BAND"
		id = AO_Long_5
		movie = 'AO_long_5'
	}
	{
		text = "LEGENDS"
		id = AO_long_6
		movie = 'AO_long_6'
	}
	{
		text = "WHAT'S NEXT?"
		id = AO_long_7
		movie = 'AO_long_7'
	}
	{
		text = "CAREER 1"
		id = AO_short_1
		movie = 'AO_short_1'
	}
	{
		text = "CAREER 2"
		id = AO_short_2
		movie = 'AO_short_2'
	}
	{
		text = "CAREER 3"
		id = AO_short_3
		movie = 'AO_short_3'
	}
	{
		text = "CAREER 4"
		id = AO_short_4
		movie = 'AO_short_4'
	}
	{
		text = "CAREER 5"
		id = AO_short_5
		movie = 'AO_short_5'
	}
	{
		text = "CAREER 6"
		id = AO_short_6
		movie = 'AO_short_6'
	}
	{
		text = "CAREER END"
		id = singleplayer_end
		movie = 'singleplayer_end'
	}
	{
		text = "ACTIVISION"
		id = atvi
		movie = 'atvi'
	}
	{
		text = "RED OCTANE"
		id = ro_logo
		movie = 'ro_logo'
	}
	{
		text = "NEVERSOFT"
		id = ns_logo
		movie = 'ns_logo'
	}
	{
		text = "ASPYR"
		id = Aspyr
		movie = 'Aspyr'
	}
	{
		text = "INTRO"
		id = intro
		movie = 'intro'
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
bv_hilite_pos = (455.0, 190.0)
bv_max_videos = 6

script WinPortBonusVideosUpdateTextArray 
	if NotIsMacPort
		return
	endif
	change \{bv_text_array = $mac_bv_text_array}
endscript

script bv_unlock_intro_videos 
	if IsWinPort
		GetArraySize ($bv_text_array)
		i = 15
		begin
		SetGlobalTags ($bv_text_array [<i>].id) params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat (<array_size> - 15)
	else
		SetGlobalTags ($bv_text_array [15].id) params = {unlocked = 1}
		SetGlobalTags ($bv_text_array [16].id) params = {unlocked = 1}
		SetGlobalTags ($bv_text_array [17].id) params = {unlocked = 1}
		SetGlobalTags ($bv_text_array [18].id) params = {unlocked = 1}
	endif
endscript

script bv_find_first_career_movie_index 
	GetArraySize \{$bv_text_array}
	<i> = 0
	begin
	if ($bv_text_array [<i>].text = "CAREER 1")
		return index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	scriptassert \{"Index not found in bv_find_first_career_movie_index"}
endscript

script bv_should_gray_out_selection 
	GetPlatform
	if NOT English
		if (<platform> = ps2 || <platform> = ps3)
			return \{FALSE}
		endif
	endif
	GetArraySize ($Bonus_Videos)
	bonus_size = <array_size>
	GetArraySize ($bv_text_array)
	i = 1
	begin
	if GotParam \{text}
		if (<text> = ($bv_text_array [<i>].text))
			GetGlobalTags ($bv_text_array [<i>].id)
			if (<unlocked> = 0)
				return \{TRUE}
			else
				return \{FALSE}
			endif
		endif
	elseif GotParam \{movie}
		if (<movie> = ($bv_text_array [<i>].movie))
			GetGlobalTags ($bv_text_array [<i>].id)
			if (<unlocked> = 0)
				return \{TRUE}
			else
				return \{FALSE}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	return \{FALSE}
endscript

script get_movie_id_by_name 
	GetArraySize ($bv_text_array)
	i = 5
	begin
	if (($bv_text_array [<i>].movie) = <movie>)
		return id = ($bv_text_array [<i>].id)
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 5)
	printstruct <...>
	scriptassert \{"Movie not found in get_movie_id_by_name!"}
endscript

script bonus_videos_scroll_down \{quick = 0}
	FormatText checksumname = video_text_id 'bv_text_%d' d = ($bv_id_index)
	make_sound = 1
	if ($bv_id_index < 4)
		change bv_id_index = ($bv_id_index + 1)
		SetScreenElementProps id = bv_hilite Pos = ($bv_hilite_array [$bv_id_index])
		change bv_index = ($bv_index + 1)
	else
		SetScreenElementProps \{id = venue_up_arrow alpha = 1}
		SetScreenElementProps \{id = venue_up_arrow2 alpha = 1}
		if ($bv_index < ($bv_max_videos - 1))
			change bv_index = ($bv_index + 1)
			if ($bv_index = ($bv_max_videos - 1))
				SetScreenElementProps \{id = venue_down_arrow alpha = 0 flip_h}
				SetScreenElementProps \{id = venue_down_arrow2 alpha = 0 flip_h}
			endif
			i = 0
			begin
			GetUpperCaseString ($bv_text_array [($bv_index - <i>)].text)
			FormatText checksumname = video_text_id 'bv_text_%d' d = (4 - <i>)
			SetScreenElementProps id = <video_text_id> text = <uppercasestring>
			GetScreenElementDims id = <video_text_id>
			SetScreenElementProps id = <video_text_id> Scale = 1.25
			fit_text_in_rectangle id = <video_text_id> only_if_larger_x = 1 dims = ((270.0, 0.0) + <height> * (0.0, 1.25)) start_x_scale = 1.25
			if bv_should_gray_out_selection text = <uppercasestring>
				SetScreenElementProps id = <video_text_id> rgba = [140 55 60 255]
			else
				SetScreenElementProps id = <video_text_id> rgba = [255 245 225 255]
			endif
			<i> = (<i> + 1)
			repeat 5
		else
			<make_sound> = 0
		endif
	endif
	if (<make_sound> = 1)
		if (<quick> = 0)
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script bonus_videos_scroll_up 
	make_sound = 1
	FormatText checksumname = video_text_id 'bv_text_%d' d = ($bv_id_index)
	if ($bv_id_index > 0)
		change bv_id_index = ($bv_id_index -1)
		SetScreenElementProps id = bv_hilite Pos = ($bv_hilite_array [$bv_id_index])
		change bv_index = ($bv_index -1)
	else
		SetScreenElementProps \{id = venue_down_arrow
			alpha = 1
			flip_h
			flip_v}
		SetScreenElementProps \{id = venue_down_arrow2
			alpha = 1
			flip_h
			flip_v}
		if ($bv_index > 0)
			change bv_index = ($bv_index -1)
			if ($bv_index = 0)
				SetScreenElementProps \{id = venue_up_arrow alpha = 0}
				SetScreenElementProps \{id = venue_up_arrow2 alpha = 0}
			endif
			i = 0
			begin
			GetUpperCaseString ($bv_text_array [($bv_index + <i>)].text)
			FormatText checksumname = video_text_id 'bv_text_%d' d = <i>
			SetScreenElementProps id = <video_text_id> text = <uppercasestring>
			GetScreenElementDims id = <video_text_id>
			SetScreenElementProps id = <video_text_id> Scale = 1.25
			fit_text_in_rectangle id = <video_text_id> only_if_larger_x = 1 dims = ((270.0, 0.0) + <height> * (0.0, 1.25)) start_x_scale = 1.25
			if bv_should_gray_out_selection text = <uppercasestring>
				SetScreenElementProps id = <video_text_id> rgba = [140 55 60 255]
			else
				SetScreenElementProps id = <video_text_id> rgba = [255 245 225 255]
			endif
			<i> = (<i> + 1)
			repeat 5
		else
			<make_sound> = 0
		endif
	endif
	if (<make_sound> = 1)
		generic_menu_up_or_down_sound \{up}
	endif
endscript

script bv_morph_hilite \{time = 0.01}
	bv_hilite :DoMorph Pos = (<Pos> - (0.0, 20.0)) Scale = (1.0, 0.25) time = <time> relative_scale
	bv_hilite :DoMorph Pos = (<Pos>) Scale = 1 time = <time> relative_scale
endscript

script menu_bonus_videos_play_video \{movie = 'atvi'}
	if bv_should_gray_out_selection text = <text>
	else
		LaunchEvent \{type = unfocus target = mbv_vmenu}
		Menu_Music_Off
		PlayMovieAndWait movie = <movie>
		spawnscriptnow \{menu_music_on}
		LaunchEvent \{type = focus target = mbv_vmenu}
	endif
endscript

script shutdown_options_video_monitor 
	KillSpawnedScript \{name = options_video_monitor}
	KillSpawnedScript \{name = PlayMovieAndWait}
	KillMovie \{textureslot = 0}
	KillMovie \{textureslot = 1}
	fadetoblack \{Off time = 0}
endscript
