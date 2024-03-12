
script create_press_any_button_menu 
	ReAcquireControllers
	change \{primary_controller_assigned = 0}
	change \{main_menu_movie_first_time = 0}
	SoundEvent \{event = Menu_Guitar_Lick_SFX}
	spawnscriptnow \{menu_music_on params = {waitforguitarlick = 1}}
	create_menu_backdrop \{texture = bootup_copyright_bg}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = pab_container
		Pos = (0.0, 0.0)}
	menu_press_any_button_create_obvious_text
	spawnscriptnow \{check_for_any_input}
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	spawnscriptnow \{attract_mode_spawner}
endscript

script destroy_press_any_button_menu 
	destroy_menu \{menu_id = pab_container}
	destroy_menu_backdrop
	KillSpawnedScript \{name = check_for_any_input}
	KillSpawnedScript \{name = attract_mode_spawner}
endscript

script attract_mode_spawner 
	if notcd
		wait_time = 5
	else
		wait_time = 110
	endif
	begin
	printf "Wait_time for begin attract %i" i = <wait_time>
	if (<wait_time> = 0)
		break
	endif
	wait \{1 second}
	wait_time = (<wait_time> - 1)
	repeat
	if ($invalid_controller_lock = 1)
		begin
		if ($invalid_controller_lock = 0)
			break
		endif
		wait \{1 gameframe}
		repeat
	endif
	spawnscriptnow \{ui_flow_manager_respond_to_action params = {action = enter_attract_mode play_sound = 0}}
endscript
Attract_Mode_Info = [
	{
		level = load_z_budokan
		song = cherubrock
		mode = p1_quickplay
		p1_character_id = MIDORI
		p2_character_id = JUDY
		p1_instrument_id = Instrument_SG_Goddess_Blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = evenflow
		mode = p1_quickplay
		p1_character_id = JUDY
		p2_character_id = CASEY
		p1_instrument_id = Instrument_Firebird_Blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_wikker
		song = cultofpersonality
		mode = p1_quickplay
		p1_character_id = XAVIER
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_dive
		song = anarchyintheuk
		mode = p1_quickplay
		p1_character_id = JOHNNY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_White_Vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = knightsofcydonia
		mode = p1_quickplay
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_party
		song = mynameisjonas
		mode = p1_quickplay
		p1_character_id = JUDY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_EpiPaul01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_prison
		song = mississippiqueen
		mode = p1_quickplay
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_wylde
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_wikker
		song = paintitblack
		mode = p1_quickplay
		p1_character_id = JOHNNY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_ES400_Red
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_party
		song = missmurder
		mode = p1_quickplay
		p1_character_id = LARS
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Silver_Vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_budokan
		song = sabotage
		mode = p1_quickplay
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus02
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = theseeker
		mode = p1_quickplay
		p1_character_id = XAVIER
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Marauder_NATO
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 2
		p2_style = 1
	}
	{
		level = load_z_dive
		song = pridenjoy
		mode = p1_quickplay
		p1_character_id = XAVIER
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus02
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = barracuda
		mode = p1_quickplay
		p1_character_id = JUDY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Les_Paul_Black
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_dive
		song = bullsonparade
		mode = p1_quickplay
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_party
		song = prayeroftherefugee
		mode = p1_quickplay
		p1_character_id = JOHNNY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Les_Paul_Red
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_dive
		song = laydown
		mode = p1_quickplay
		p1_character_id = axel
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_wikker
		song = threesandsevens
		mode = p1_quickplay
		p1_character_id = JUDY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Explorer_Black
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_budokan
		song = mycurse
		mode = p1_quickplay
		p1_character_id = axel
		p2_character_id = JUDY
		p1_instrument_id = Instrument_wyldeb
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_prison
		song = paranoid
		mode = p1_quickplay
		p1_character_id = LARS
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Ebony_Vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 2
		p2_style = 1
	}
	{
		level = load_z_prison
		song = talkdirtytome
		mode = p1_quickplay
		p1_character_id = Izzy
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Firebird_Cherry
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
]
last_attract_mode = -1
is_attract_mode = 0

script create_attract_mode 
	change \{is_attract_mode = 1}
	create_loading_screen
	soundbussunlock \{Guitar_Balance}
	soundbussunlock \{Band_Balance}
	setsoundbussparams \{Guitar_Balance = {vol = -100.0} time = 1.5}
	setsoundbussparams \{Band_Balance = {vol = -100.0} time = 1.5}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{Band_Balance}
	kill_start_key_binding
	GetArraySize \{$Attract_Mode_Info}
	if (<array_size> = 1)
		attract_mode_index = 0
	else
		if ($last_attract_mode >= 0)
			getrandomvalue name = attract_mode_index integer a = 0 b = (<array_size> - 2)
			if (<attract_mode_index> >= $last_attract_mode)
				attract_mode_index = (<attract_mode_index> + 1)
			endif
		else
			getrandomvalue name = attract_mode_index integer a = 0 b = (<array_size> - 1)
		endif
		change last_attract_mode = <attract_mode_index>
	endif
	p1_outfit = 1
	p2_outfit = 1
	p1_style = 1
	p2_style = 1
	AddParams ($Attract_Mode_Info [<attract_mode_index>])
	change \{structurename = player1_status bot_play = 1}
	change \{structurename = player2_status bot_play = 1}
	change current_level = <level>
	change game_mode = <mode>
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		change \{current_num_players = 2}
	else
		change \{current_num_players = 1}
	endif
	change structurename = player1_status character_id = <p1_character_id>
	change structurename = player2_status character_id = <p2_character_id>
	change structurename = player1_status instrument_id = <p1_instrument_id>
	change structurename = player2_status instrument_id = <p2_instrument_id>
	change structurename = player1_status outfit = <p1_outfit>
	change structurename = player2_status outfit = <p2_outfit>
	change structurename = player1_status style = <p1_style>
	change structurename = player2_status style = <p2_style>
	soundbussunlock \{master}
	setsoundbussparams \{master = {vol = -11.0} time = 0.5}
	SoundBussLock \{master}
	mark_unsafe_for_shutdown
	UnPauseGame
	Load_Venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	create_attract_mode_text
	stoprendering
	destroy_loading_screen
	soundbussunlock \{Guitar_Balance}
	soundbussunlock \{Band_Balance}
	setsoundbussparams {Guitar_Balance = {vol = (($Default_BussSet.Guitar_Balance.vol) - 1.5)}}
	setsoundbussparams {Band_Balance = {vol = (($Default_BussSet.Band_Balance.vol) - 1.5)}}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{Band_Balance}
	spawnscriptnow \{check_for_attract_mode_input}
endscript

script create_attract_mode_text 
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = am_container
		Pos = (0.0, 0.0)}
	text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (640.0, 637.0)
	CreateScreenElement {
		type = TextElement
		text = <text>
		Pos = <text_pos>
		parent = am_container
		rgba = [220 220 220 255]
		font = fontgrid_title_gh3
		just = [center bottom]
		Scale = 0.9
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [110 20 80 250]
	}
	CreateScreenElement \{type = SpriteElement
		parent = am_container
		texture = logo_GH3_LoR_256
		dims = (225.0, 225.0)
		Pos = (640.0, 490.0)
		just = [
			center
			center
		]}
endscript

script destroy_attract_mode_text 
	destroy_menu \{menu_id = am_container}
	StopAllSounds
	soundbussunlock \{master}
	setsoundbussparams {master = {vol = ($Default_BussSet.master.vol)}}
	SoundBussLock \{master}
endscript

script check_for_attract_mode_input 
	begin
	GetButtonsPressed
	if NOT (<makes> = 0)
		break
	endif
	if NOT ($invite_controller = -1)
		break
	endif
	wait \{1 gameframe}
	repeat
	wait_for_safe_shutdown
	spawnscriptnow \{ui_flow_manager_respond_to_action params = {action = exit_attract_mode}}
endscript

script destroy_attract_mode 
	pausegame
	destroy_attract_mode_text
	KillSpawnedScript \{name = check_for_attract_mode_input}
	kill_gem_scroller
	change \{structurename = player1_status bot_play = 0}
	change \{structurename = player2_status bot_play = 0}
	UnPauseGame
	kill_start_key_binding
	change \{is_attract_mode = 0}
endscript
invalid_controller_lock = 0

script check_for_any_input \{button1 = {} button2 = {}}
	begin
	GetButtonsPressed
	if (<makes> = 0)
		break
	endif
	wait \{1 gameframe}
	repeat
	begin
	if NOT IsWinPort
		if IsStandardGuitarControllerPluggedIn
			if English
				notify_box scale1 = (0.6, 0.75) scale2 = (0.5, 0.6) container_pos = (0.0, 350.0) container_id = notify_invalid_device line1 = "An unsupported guitar peripheral has been detected." line2 = "Connect either a Guitar Hero guitar or" line3 = "Xbox 360 controller and press START to continue." menu_z = 510000 FormatText textname = pakname '%s_text.pak' s = <stem>
			elseif French
				notify_box \{scale1 = (0.6, 0.75)
					scale2 = (0.5, 0.6)
					container_pos = (0.0, 350.0)
					container_id = notify_invalid_device
					line1 = "Une guitare non compatible a été détectée."
					line2 = "Veuillez connecter une manette guitare Guitar Hero ou une"
					line3 = "manette Xbox 360, et appuyez sur Start pour continuer."
					menu_z = 510000}
			elseif Italian
				notify_box \{scale1 = (0.6, 0.75)
					scale2 = (0.5, 0.6)
					container_pos = (0.0, 350.0)
					container_id = notify_invalid_device
					line1 = "È stato rilevato un controller chitarra non supportato."
					line2 = "Connettere una chitarra di Guitar Hero o"
					line3 = "un Controller Xbox 360 e premere START per continuare."
					menu_z = 510000}
			elseif German
				notify_box \{scale1 = (0.38000003, 0.75)
					scale2 = (0.5, 0.6)
					container_pos = (0.0, 350.0)
					container_id = notify_invalid_device
					line1 = "Ein Peripheriegerät wurde gefunden, das nicht von der Xbox 360 Konsole unterstützt wird."
					line2 = "Schließen Sie entweder eine Guitar Hero-Gitarre oder einen"
					line3 = "Xbox 360 Controller an und drücken Sie START, um fortzufahren."
					menu_z = 510000}
			elseif Spanish
				notify_box \{scale1 = (0.45000002, 0.75)
					scale2 = (0.5, 0.6)
					container_pos = (0.0, 350.0)
					container_id = notify_invalid_device
					line1 = "Se ha detectado un mando de guitarra periférico incompatible con la consola."
					line2 = "Conecta el mando de guitarra de Guitar Hero o"
					line3 = "el Mando Xbox 360 y pulsa START para continuar."
					menu_z = 510000}
			endif
			CreateScreenElement \{type = SpriteElement
				id = controller_fader
				parent = root_window
				texture = black
				rgba = [
					0
					0
					0
					255
				]
				Pos = (640.0, 360.0)
				dims = (1280.0, 720.0)
				just = [
					center
					center
				]
				z_priority = 509000
				alpha = 0.7}
			change \{invalid_controller_lock = 1}
			begin
			if NOT IsStandardGuitarControllerPluggedIn
				break
			endif
			wait \{1 gameframe}
			repeat
			kill_notify_box \{container_id = notify_invalid_device}
			DestroyScreenElement \{id = controller_fader}
			change \{invalid_controller_lock = 0}
		endif
	endif
	if NOT ($invite_controller = -1)
		spawnscriptnow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = ($invite_controller)}}
		break
	endif
	continue = 0
	if GotParam \{use_primary_controller}
		if GuitarControllerMake <button1> ($primary_controller)
			<continue> = 1
		elseif GuitarControllerMake <button2> ($primary_controller)
			<continue> = 1
		endif
	else
		GetButtonsPressed <button1>
		if NOT (<makes> = 0)
			<continue> = 1
		endif
	endif
	if (<continue> = 1)
		spawnscriptnow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = <device_num>}}
		break
	endif
	wait \{1 gameframe}
	repeat
endscript

script menu_press_any_button_create_obvious_text 
	text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (670.0, 425.0)
	CreateScreenElement {
		type = TextBlockElement
		parent = pab_container
		font = text_a6
		text = <text>
		dims = (500.0, 200.0)
		Pos = <text_pos>
		just = [left top]
		internal_just = [center top]
		rgba = [215 120 40 255]
		Scale = 0.7
		allow_expansion
	}
endscript
