training_advanced_techniques_tutorial_script = [
	{
		call = training_advanced_techniques_tutorial_startup
	}
	{
		lesson = 1
		call = training_4_1_show_title
	}
	{
		call = training_4_1_explain
	}
	{
		lesson = 2
		call = training_4_2_explain
	}
	{
		call = training_4_2_show_guitar
	}
	{
		call = training_4_2_zoom_guitar
	}
	{
		call = training_4_2_wait_for_hammeron_complete
	}
	{
		call = training_4_2_complete_message
	}
	{
		call = training_4_2_end
	}
	{
		lesson = 3
		call = training_4_3_start_gem_scroller
	}
	{
		call = training_4_3_explain
	}
	{
		call = training_4_3_wait_for_hammerons
	}
	{
		call = training_4_3_complete_message
	}
	{
		lesson = 4
		call = training_4_4_explain
	}
	{
		call = training_4_4_show_guitar
	}
	{
		call = training_4_4_zoom_guitar
	}
	{
		call = training_4_4_wait_for_pulloff_complete
	}
	{
		call = training_4_4_complete_message
	}
	{
		call = training_4_4_end
	}
	{
		lesson = 5
		call = training_4_5_start_gem_scroller
	}
	{
		call = training_4_5_explain
	}
	{
		call = training_4_5_wait_for_hammerons
	}
	{
		call = training_4_5_complete_message
	}
	{
		call = training_advanced_techniques_tutorial_1_end
	}
]

script training_advanced_techniques_tutorial_startup 
	training_init_session
	launchevent \{Type = unfocus Target = root_window}
	training_create_narrator_icons
endscript

script training_4_1_show_title 
	training_show_title \{title = "Hammer-On and Pull-Off Tutorial"}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	create_training_pause_handler
	Wait \{3 Seconds}
	training_destroy_title
endscript

script training_4_1_explain 
	training_set_lesson_header_text \{Text = "LESSON 1: STRING BASICS"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	safe_show \{Id = god_icon}
	training_play_sound \{Sound = 'Tutorial_4A_01_God' Wait}
endscript

script training_4_2_explain 
	training_set_lesson_header_text \{Text = "LESSON 2: HAMMER-ON FINGERING"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
endscript

script training_4_2_show_guitar 
	createScreenElement \{PARENT = training_container Type = spriteElement Id = guitar_sprite just = [Center Center] texture = training_guitar pos = (630.0, 400.0) Rot_Angle = 0 rgba = [255 255 255 255] scale = (0.4, 0.4) z_priority = 4}
	training_create_fret_finger_sprites
	pose_fret_fingers \{Color = NONE}
	training_create_strum_sprites
	pose_strum_fingers \{pos = middle}
	training_play_sound \{Sound = 'Tutorial_4B_01_God'}
	Wait \{20 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 6.15 pos = (360.0, 360.0) scale = 0.7}
	training_add_arrow \{Id = training_strum_arrow life = 4.0 pos = (850.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = Green}
	Wait \{1.0 Seconds IgnoreSlomo}
	pose_strum_fingers \{pos = Down}
	Wait \{1.0 Seconds IgnoreSlomo}
	pose_strum_fingers \{pos = middle}
	Wait \{4.2 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 5.0 pos = (385.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = green_red}
	Wait \{5 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 5.0 pos = (420.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = green_red_yellow}
	training_wait_for_sound \{Sound = 'Tutorial_4B_01_God'}
endscript

script training_4_2_zoom_guitar 
	training_set_lesson_header_body \{Text = "1. Play Green normally (strum)\\n2. Hammer-on Red (no strum)\\n3. Hammer-on Yellow (no strum)"}
	training_show_lesson_header
	training_set_task_header_body \{Text = "Hit 3 hammer-on sequences to continue"}
	training_show_task_header
	hide_strum_fingers
	hide_fret_fingers
	if ScreenelementExists \{Id = guitar_sprite}
		guitar_sprite :doMorph \{scale = (1.0, 1.0) pos = (1100.0, 400.0) Time = 0.75}
	endif
	training_play_sound \{Sound = 'Tutorial_4B_02_God'}
	Wait \{1 Seconds IgnoreSlomo}
	SetMenuAutoRepeatTimes \{(60.0, 60.0)}
endscript

script training_4_2_wait_for_hammeron_complete 
	if ScreenelementExists \{Id = menu_tutorial}
		launchevent \{Type = unfocus Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_up training_hammeron_strummed_guitar}
		{pad_down training_hammeron_strummed_guitar}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	Change \{LESSON_COMPLETE = 0}
	Change \{training_hammerons_played = 0}
	SpawnScriptNOw \{training_watch_buttons Id = training_spawned_script}
	begin
	if ($LESSON_COMPLETE = 1)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if ScreenelementExists \{Id = menu_tutorial}
		launchevent \{Type = unfocus Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	killspawnedScript \{Name = training_watch_buttons}
	hide_pressed_notes
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	Wait \{1 Seconds IgnoreSlomo}
endscript

script training_hammeron_strummed_guitar 
	if ($LESSON_COMPLETE = 1)
		return
	endif
	Printf \{Channel = hammeron "Strummed guitar........."}
	killspawnedScript \{Name = training_watch_for_hammeron}
	SpawnScriptNOw \{training_watch_for_hammeron Id = training_spawned_script}
endscript

script training_count_buttons_pressed 
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	array_count = 0
	note_played = 0
	notes_played = 0
	begin
	if (<hold_pattern> && <check_button>)
		note_played = <array_count>
		notes_played = (<notes_played> + 1)
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat 5
	return notes_played = <notes_played>
endscript
training_hammerons_played = 0
notes_played = 0

script training_watch_for_hammeron 
	Printf \{Channel = hammeron "training_watch_for_hammeron......"}
	training_clear_notes_pressed
	training_count_buttons_pressed
	if issoundeventplaying \{Tutorial_String_2_HOPO_Free}
		Soundevent \{Event = Tutorial_Missed_HOPO_Free}
		Soundevent \{Event = StopNotes_02}
		Soundevent \{Event = StopNotes_03}
		elseif issoundeventplaying \{Tutorial_String_3_HOPO_Free}
		Soundevent \{Event = Tutorial_Missed_HOPO_Free}
		Soundevent \{Event = StopNotes_03}
		Soundevent \{Event = StopNotes_02}
	endif
	if (<notes_played> != 1)
		if issoundeventplaying \{Tutorial_String_1_Strum_Free}
			Soundevent \{Event = Tutorial_Missed_HOPO_Free}
			Soundevent \{Event = StopNotes_01}
			Soundevent \{Event = StopNotes_03}
			Soundevent \{Event = StopNotes_02}
		endif
		return
	endif
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	if (<hold_pattern> && <check_button>)
		training_press_note \{note = 0}
		training_hit_note \{note = 0}
		Soundevent \{Event = Tutorial_String_1_Strum_Free}
		wait_time = 0
		begin
		GetHeldPattern controller = ($player1_status.controller) nobrokenstring
		check_button = 273
		if (<hold_pattern> && <check_button>)
			training_clear_notes_pressed
			Printf \{Channel = hammeron "failed..."}
			Soundevent \{Event = Tutorial_Missed_HOPO_Free}
			Soundevent \{Event = StopNotes_01}
			return
		endif
		check_button = 4096
		if (<hold_pattern> && <check_button>)
			Printf \{Channel = hammeron "red pressed..."}
			break
		endif
		wait_time = (<wait_time> + 1)
		if (<wait_time> >= 60)
			Printf \{Channel = hammeron "times up..."}
			training_clear_notes_pressed
			Soundevent \{Event = Tutorial_Missed_HOPO_Free}
			Soundevent \{Event = StopNotes_01}
			return
		endif
		Wait \{1 GameFrame}
		repeat
		training_press_note \{note = 1}
		training_hit_note \{note = 1}
		Soundevent \{Event = Tutorial_String_2_HOPO_Free}
		Soundevent \{Event = StopNotes_01}
		wait_time = 0
		begin
		GetHeldPattern controller = ($player1_status.controller) nobrokenstring
		check_button = 17
		if (<hold_pattern> && <check_button>)
			training_clear_notes_pressed
			Printf \{Channel = hammeron "failed..."}
			Soundevent \{Event = Tutorial_Missed_HOPO_Free}
			Soundevent \{Event = StopNotes_02}
			return
		endif
		check_button = 256
		if (<hold_pattern> && <check_button>)
			break
		endif
		wait_time = (<wait_time> + 1)
		if (<wait_time> >= 60)
			training_clear_notes_pressed
			Soundevent \{Event = Tutorial_Missed_HOPO_Free}
			Soundevent \{Event = StopNotes_02}
			return
		endif
		Wait \{1 GameFrame}
		repeat
		Soundevent \{Event = Tutorial_String_3_HOPO_Free}
		Soundevent \{Event = StopNotes_02}
		training_press_note \{note = 2}
		training_hit_note \{note = 0}
		training_hit_note \{note = 1}
		training_hit_note \{note = 2}
		Change training_hammerons_played = ($training_hammerons_played + 1)
		if NOT ($training_hammerons_played = 3)
			RandomNoRepeat (
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_02'}
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_04'}
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_05'}
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_06'}
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_09'}
				)
		endif
		if ($training_hammerons_played >= 3)
			Change \{LESSON_COMPLETE = 1}
		endif
		Wait \{2 Seconds IgnoreSlomo}
		training_clear_notes_pressed
	endif
endscript

script training_press_note 
	formatText Checksumname = note_tuned 'note_tuned_%a' A = <note>
	createScreenElement {
		PARENT = training_container
		Type = spriteElement
		Id = <note_tuned>
		just = [Center Center]
		texture = training_guitar_button_tuned
		pos = ((442.0, 396.0) + (1.0, 0.0) * (<note> * 67))
		Rot_Angle = 0
		rgba = [255 255 255 255]
		scale = (0.36, 0.36)
		z_priority = 7
	}
endscript

script training_clear_notes_pressed 
	Printf \{Channel = hammeron "training_clear_notes_pressed...."}
	Safe_Destroy \{Id = note_tuned_0}
	Safe_Destroy \{Id = note_tuned_1}
	Safe_Destroy \{Id = note_tuned_2}
endscript

script training_4_2_complete_message 
	Soundevent \{Event = StopNotes_03}
	Soundevent \{Event = Tutorial_Mode_Finish_Chord}
	Safe_Destroy \{Id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
	training_hide_lesson_header
	training_hide_task_header
	training_clear_notes_pressed
	training_destroy_pressed_notes
	createScreenElement {
		Type = textElement
		PARENT = training_container
		Id = lesson_title_text
		just = [Center Center]
		pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{Sound = 'Tutorial_4B_03_God' Wait}
	DestroyScreenelement \{Id = lesson_title_text}
endscript

script training_4_2_end 
	killspawnedScript \{Name = training_watch_buttons}
	destroy_menu \{menu_id = menu_tutorial_4_2}
	training_destroy_pressed_notes
	Safe_Destroy \{Id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_4_3_start_gem_scroller 
	destroy_band
	training_set_lesson_header_text \{Text = "LESSON 3: HAMMER-ONS"}
	training_set_lesson_header_body \{Text = "1.  Practice hammer-ons"}
	training_show_lesson_header
	safe_show \{Id = god_icon}
	training_start_gem_scroller \{Song = Tutorial_4C}
	killspawnedScript \{Name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_4_3_explain 
	Wait \{1 Seconds IgnoreSlomo}
	training_pause_gem_scroller
	if ScreenelementExists \{Id = menu_tutorial}
		launchevent \{Type = unfocus Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson4_hammeron_note}
		{song_wonp1 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_play_sound \{Sound = 'Tutorial_4c_01_God' Wait}
	training_set_task_header_body \{Text = "Hit 8 notes using the hammer-on technique"}
	training_show_task_header
	training_display_notes_hit \{NOTES_HIT = 0}
	Wait \{1 Seconds IgnoreSlomo}
	training_resume_gem_scroller
endscript

script training_4_3_wait_for_hammerons 
	Change \{training_hammerons_played = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_hammerons_played >= 8)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if ScreenelementExists \{Id = menu_tutorial}
		launchevent \{Type = unfocus Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{1 Seconds IgnoreSlomo}
endscript

script lesson4_hammeron_note 
	if (<hammer_strum> = 1)
		Change training_hammerons_played = ($training_hammerons_played + 1)
		training_display_notes_hit \{NOTES_HIT = $training_hammerons_played}
		if ($training_hammerons_played = 1)
			training_play_sound \{Sound = 'Tutorial_God_Positive_07'}
		endif
	endif
endscript

script training_4_3_complete_message 
	if ScreenelementExists \{Id = notes_hit_text}
		DestroyScreenelement \{Id = notes_hit_text}
	endif
	Wait \{0.75 Seconds IgnoreSlomo}
	Soundevent \{Event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_hide_task_header
	Pausegame
	PauseGH3Sounds
	killcamanim \{Name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{Id = cs_view_cam_id Name = ch_view_cam viewport = Bg_Viewport lockto = World pos = (-0.068807, 1.5990009, 5.7975965) quat = (0.000506, 0.99942994, -0.017537998) fov = 72.0 play_hold = 1 interrupt_current}
	createScreenElement {
		Type = textElement
		PARENT = training_container
		Id = lesson_title_text
		just = [Center Center]
		pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	unpauseGame
	UnPauseGH3Sounds
	training_play_sound \{Sound = 'Tutorial_4B_03_God' Wait}
	safe_hide \{Id = god_icon}
	Safe_Destroy \{Id = lesson_title_text}
endscript

script training_4_4_explain 
	training_set_lesson_header_text \{Text = "LESSON 4: PULL-OFF FINGERING"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	safe_show \{Id = lou_icon}
endscript

script training_4_4_show_guitar 
	createScreenElement \{PARENT = training_container Type = spriteElement Id = guitar_sprite just = [Center Center] texture = training_guitar pos = (630.0, 400.0) Rot_Angle = 0 rgba = [255 255 255 255] scale = (0.4, 0.4) z_priority = 4}
	training_create_fret_finger_sprites
	pose_fret_fingers \{Color = NONE}
	training_create_strum_sprites
	pose_strum_fingers \{pos = middle}
	training_play_sound \{Sound = 'Tutorial_4d_01_Lou'}
	Wait \{15 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 4.9500003 pos = (420.0, 360.0) scale = 0.7}
	training_add_arrow \{Id = training_strum_arrow life = 3.5 pos = (850.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = Yellow}
	Wait \{1.0 Seconds IgnoreSlomo}
	pose_strum_fingers \{pos = Down}
	Wait \{1.0 Seconds IgnoreSlomo}
	pose_strum_fingers \{pos = middle}
	Wait \{3 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 6.0 pos = (385.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = Red}
	Wait \{6 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 4.0 pos = (360.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = Green}
	Wait \{7 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 4.9500003 pos = (420.0, 360.0) scale = 0.7}
	training_add_arrow \{Id = training_strum_arrow life = 4.5 pos = (850.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = green_red_yellow}
	Wait \{3.0 Seconds IgnoreSlomo}
	pose_strum_fingers \{pos = Down}
	Wait \{1.0 Seconds IgnoreSlomo}
	pose_strum_fingers \{pos = middle}
	Wait \{1 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 2.0 pos = (385.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = green_red}
	Wait \{2 Seconds IgnoreSlomo}
	training_add_arrow \{Id = training_arrow life = 3.0 pos = (360.0, 360.0) scale = 0.7}
	pose_fret_fingers \{Color = Green}
	Wait \{3 Seconds IgnoreSlomo}
	training_wait_for_sound \{Sound = 'Tutorial_4d_01_Lou'}
endscript

script training_4_4_zoom_guitar 
	training_set_lesson_header_body \{Text = "1. Play Yellow normally (strum)\\n2. Pull-off Red (no strum)\\n3. Pull-off Green (no strum)"}
	training_show_lesson_header
	training_set_task_header_body \{Text = "Hit 3 pull-off sequences to continue"}
	training_show_task_header
	hide_strum_fingers
	hide_fret_fingers
	if ScreenelementExists \{Id = guitar_sprite}
		guitar_sprite :doMorph \{scale = (1.0, 1.0) pos = (1100.0, 400.0) Time = 0.75}
	endif
	Wait \{1 Seconds IgnoreSlomo}
endscript
training_pulloffs_played = 0

script training_4_4_wait_for_pulloff_complete 
	if ScreenelementExists \{Id = menu_tutorial}
		launchevent \{Type = unfocus Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	Printf \{Channel = hammeron "training_4_2_wait_for_pullofff_complete..."}
	event_handlers = [
		{pad_up training_pulloff_strummed_guitar}
		{pad_down training_pulloff_strummed_guitar}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	Change \{LESSON_COMPLETE = 0}
	Change \{training_pulloffs_played = 0}
	Change \{notes_played = 0}
	SetMenuAutoRepeatTimes \{(60.0, 60.0)}
	SpawnScriptNOw \{training_watch_buttons Id = training_spawned_script}
	begin
	if ($LESSON_COMPLETE = 1)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	launchevent \{Type = unfocus Target = menu_tutorial}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	killspawnedScript \{Name = training_watch_buttons}
	hide_pressed_notes
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	Wait \{1 Seconds IgnoreSlomo}
	Safe_Destroy \{Id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_pulloff_strummed_guitar 
	if ($LESSON_COMPLETE = 1)
		return
	endif
	killspawnedScript \{Name = training_watch_for_pulloff}
	SpawnScriptNOw \{training_watch_for_pulloff Id = training_spawned_script}
endscript

script training_watch_for_pulloff 
	Printf \{Channel = hammeron "training_watch_for_pulloff......"}
	training_clear_notes_pressed
	training_count_buttons_pressed
	if issoundeventplaying \{Tutorial_String_2_HOPO_Free}
		Soundevent \{Event = Tutorial_Missed_HOPO_Free}
		Soundevent \{Event = StopNotes_05}
		Soundevent \{Event = StopNotes_06}
		elseif issoundeventplaying \{Tutorial_String_3_HOPO_Free}
		Soundevent \{Event = Tutorial_Missed_HOPO_Free}
		Soundevent \{Event = StopNotes_06}
		Soundevent \{Event = StopNotes_05}
	endif
	if NOT training_wait_for_pulloff_color \{Color = Yellow IMMEDIATE}
		if issoundeventplaying \{Tutorial_String_3_Strum_Free}
			Soundevent \{Event = Tutorial_Missed_HOPO_Free}
			Soundevent \{Event = StopNotes_04}
			Soundevent \{Event = StopNotes_05}
			Soundevent \{Event = StopNotes_06}
		endif
		return
	endif
	training_press_note \{note = 2}
	training_hit_note \{note = 2}
	Soundevent \{Event = Tutorial_String_3_Strum_Free}
	if NOT training_wait_for_pulloff_color \{Color = Yellow Released}
		Soundevent \{Event = Tutorial_Missed_HOPO_Free}
		Soundevent \{Event = StopNotes_04}
		training_clear_notes_pressed
		return
	endif
	if NOT training_wait_for_pulloff_color \{Color = Red}
		Soundevent \{Event = Tutorial_Missed_HOPO_Free}
		Soundevent \{Event = StopNotes_04}
		training_clear_notes_pressed
		return
	endif
	training_press_note \{note = 1}
	training_hit_note \{note = 1}
	Soundevent \{Event = Tutorial_String_2_HOPO_Free}
	Soundevent \{Event = StopNotes_04}
	if NOT training_wait_for_pulloff_color \{Color = Red Released}
		Soundevent \{Event = Tutorial_Missed_HOPO_Free}
		Soundevent \{Event = StopNotes_05}
		training_clear_notes_pressed
		return
	endif
	if NOT training_wait_for_pulloff_color \{Color = Green}
		Soundevent \{Event = Tutorial_Missed_HOPO_Free}
		Soundevent \{Event = StopNotes_05}
		training_clear_notes_pressed
		return
	endif
	training_press_note \{note = 0}
	training_hit_note \{note = 0}
	training_hit_note \{note = 1}
	training_hit_note \{note = 2}
	Soundevent \{Event = Tutorial_String_1_HOPO_Free}
	Soundevent \{Event = StopNotes_05}
	Change training_pulloffs_played = ($training_pulloffs_played + 1)
	if NOT ($training_pulloffs_played = 3)
		RandomNoRepeat (@ 
			training_play_sound \{Sound = 'Tutorial_Lou_Positive_02'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_03'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_04'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_06'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_07'}
			)
	endif
	if ($training_pulloffs_played >= 3)
		Change \{LESSON_COMPLETE = 1}
	endif
	Wait \{2 Seconds IgnoreSlomo}
	training_clear_notes_pressed
endscript

script training_wait_for_pulloff_color 
	switch (<Color>)
		case Yellow
		button_mask = 256
		maybe_dont_allow = 69632
		dont_allow_mask = 17
		case Red
		button_mask = 4096
		maybe_dont_allow = 65536
		dont_allow_mask = 273
		case Green
		button_mask = 65536
		maybe_dont_allow = 0
		dont_allow_mask = 4369
	endswitch
	if gotParam \{Release}
		max_time = 30
	else
		max_time = 60
	endif
	wait_time = 0
	begin
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	if (<hold_pattern> && <dont_allow_mask>)
		return \{FALSE}
	endif
	if gotParam \{Released}
		if NOT (<hold_pattern> && <button_mask>)
			break
		endif
	else
		if (<hold_pattern> && <button_mask>)
			break
		else
			if (<hold_pattern> && <maybe_dont_allow>)
				return \{FALSE}
			endif
			if gotParam \{IMMEDIATE}
				return \{FALSE}
			endif
		endif
	endif
	wait_time = (<wait_time> + 1)
	if (<wait_time> >= <max_time>)
		return \{FALSE}
	endif
	Wait \{1 GameFrame}
	repeat
	return \{TRUE}
endscript

script training_4_4_complete_message 
	Soundevent \{Event = Tutorial_Mode_Finish_Chord}
	Soundevent \{Event = StopNotes_06}
	Safe_Destroy \{Id = guitar_sprite}
	training_hide_lesson_header
	training_hide_task_header
	training_clear_notes_pressed
	training_destroy_pressed_notes
	createScreenElement {
		Type = textElement
		PARENT = training_container
		Id = lesson_title_text
		just = [Center Center]
		pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{Sound = 'Tutorial_4D_02_Lou' Wait}
	DestroyScreenelement \{Id = lesson_title_text}
endscript

script training_4_4_end 
	killspawnedScript \{Name = training_watch_buttons}
	Safe_Destroy \{Id = guitar_sprite}
	training_destroy_pressed_notes
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_4_5_start_gem_scroller 
	destroy_band
	training_set_lesson_header_text \{Text = "LESSON 5: PULL-OFFS"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	safe_show \{Id = lou_icon}
	training_start_gem_scroller \{Song = Tutorial_4E}
	killspawnedScript \{Name = update_score_fast}
	Change \{training_pulloffs_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_4_5_explain 
	Wait \{1 Seconds IgnoreSlomo}
	training_pause_gem_scroller
	training_set_lesson_header_body \{Text = "1. Practice pull-offs"}
	training_show_lesson_header
	training_set_task_header_body \{Text = "Hit 8 notes using pull-offs to continue"}
	training_show_task_header
	training_display_notes_hit \{NOTES_HIT = 0}
	training_play_sound \{Sound = 'Tutorial_4e_01_Lou' Wait}
	training_resume_gem_scroller
endscript

script training_4_5_wait_for_hammerons 
	if ScreenelementExists \{Id = menu_tutorial}
		launchevent \{Type = unfocus Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_pulloff_note}
		{song_wonp1 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	Change \{training_pulloffs_played = 0}
	Change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_pulloffs_played >= 8)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if ScreenelementExists \{Id = menu_tutorial}
		launchevent \{Type = unfocus Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{1 Seconds IgnoreSlomo}
endscript

script lesson5_pulloff_note 
	if (<hammer_strum> = 1)
		Change training_pulloffs_played = ($training_pulloffs_played + 1)
		training_display_notes_hit \{NOTES_HIT = $training_pulloffs_played}
		if ($training_pulloffs_played = 1)
			training_play_sound \{Sound = 'Tutorial_Lou_Positive_05'}
		endif
	endif
endscript

script training_4_5_complete_message 
	if ScreenelementExists \{Id = notes_hit_text}
		DestroyScreenelement \{Id = notes_hit_text}
	endif
	Wait \{0.75 Seconds IgnoreSlomo}
	Soundevent \{Event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_hide_task_header
	Pausegame
	PauseGH3Sounds
	killcamanim \{Name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{Id = cs_view_cam_id Name = ch_view_cam viewport = Bg_Viewport lockto = World pos = (-0.068807, 1.5990009, 5.7975965) quat = (0.000506, 0.99942994, -0.017537998) fov = 72.0 play_hold = 1 interrupt_current}
	createScreenElement {
		Type = textElement
		PARENT = training_container
		Id = lesson_title_text
		just = [Center Center]
		pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	UnPauseGH3Sounds
	unpauseGame
	training_play_sound \{Sound = 'Tutorial_4e_02_Lou' Wait}
	DestroyScreenelement \{Id = lesson_title_text}
	createScreenElement {
		Type = textElement
		PARENT = training_container
		Id = lesson_title_text
		just = [Center Center]
		pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Advanced Techniques Tutorial Complete!"
		scale = 1.0
		rgba = ($training_text_color)
	}
	safe_hide \{Id = lou_icon}
	training_play_sound \{Sound = 'Tutorial_4_Outro' Wait}
	DestroyScreenelement \{Id = lesson_title_text}
endscript
training_song_over = 0

script training_song_won 
	Change \{training_song_over = 1}
	show_training_pause_screen \{SongFailed}
endscript

script training_advanced_techniques_tutorial_1_end 
	training_kill_session
	if ScreenelementExists \{Id = menu_tutorial}
		launchevent \{Type = unfocus Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	setScreenElementProps \{Id = root_window event_handlers = [{pad_start gh3_start_pressed}] Replace_Handlers}
	setGlobalTags \{training Params = {advanced_techniques_lesson = Complete}}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript

script training_check_for_all_tutorials_finished 
	getglobaltags \{training}
	if (<basic_lesson> != Complete)
		return
	endif
	if (<star_power_lesson> != Complete)
		return
	endif
	if (<guitar_battle_lesson> != Complete)
		return
	endif
	if (<advanced_techniques_lesson> != Complete)
		return
	endif
	WriteAchievements \{Achievement = READY_TO_ROCK}
endscript
