
script init_play_log 
	if ($show_play_log = 1)
		<pos> = (256.0, 32.0)
		<Name> = log_line
		<line> = 0
		begin
		formatText Checksumname = Id 'log_line_%l' L = <line> dontassertforchecksums
		createScreenElement {
			Type = textElement
			PARENT = root_window
			Id = <Id>
			font = Debug
			pos = <pos>
			just = [Left top]
			scale = (0.7, 0.4)
			rgba = [210 210 210 250]
			Text = "Some Text"
			z_priority = 1000.0
			Alpha = 1
		}
		<pos> = (<pos> + (0.0, 16.0))
		<line> = (<line> + 1)
		repeat $play_log_lines
		<blank_text> = " "
		Change log_strings = ($log_strings + {log_line_0 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_1 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_2 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_3 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_4 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_5 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_6 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_7 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_8 = <blank_text>})
		Change log_strings = ($log_strings + {log_line_9 = <blank_text>})
		<line> = 0
		begin
		formatText Checksumname = Id 'log_line_%l' L = <line> dontassertforchecksums
		setScreenElementProps Id = <Id> Text = ($log_strings.<Id>)
		<line> = (<line> + 1)
		repeat $play_log_lines
	endif
endscript

script kill_debug_elements 
	<line> = 0
	begin
	formatText Checksumname = Id 'log_line_%l' L = <line> dontassertforchecksums
	if ScreenelementExists Id = <Id>
		DestroyScreenelement Id = <Id>
	endif
	<line> = (<line> + 1)
	repeat $play_log_lines
	if ScreenelementExists \{Id = guitar_tilt_debug}
		DestroyScreenelement \{Id = guitar_tilt_debug}
	endif
endscript
log_strings = {
	log_line_0 = " "
	log_line_1 = " "
	log_line_2 = " "
	log_line_3 = " "
	log_line_4 = " "
	log_line_5 = " "
	log_line_6 = " "
	log_line_7 = " "
	log_line_8 = " "
	log_line_9 = " "
	log_line_0_color = Green
	log_line_1_color = Green
	log_line_2_color = Green
	log_line_3_color = Green
	log_line_4_color = Green
	log_line_5_color = Green
	log_line_6_color = Green
	log_line_7_color = Green
	log_line_8_color = Green
	log_line_9_color = Green
}

script output_log_text 
	if ($show_play_log = 1)
		formatText Textname = text_string <...>
		<line_1> = ($log_strings.log_line_1)
		<line_2> = ($log_strings.log_line_2)
		<line_3> = ($log_strings.log_line_3)
		<line_4> = ($log_strings.log_line_4)
		<line_5> = ($log_strings.log_line_5)
		<line_6> = ($log_strings.log_line_6)
		<line_7> = ($log_strings.log_line_7)
		<line_8> = ($log_strings.log_line_8)
		<line_9> = ($log_strings.log_line_9)
		Change log_strings = ($log_strings + {log_line_0 = <line_1>})
		Change log_strings = ($log_strings + {log_line_1 = <line_2>})
		Change log_strings = ($log_strings + {log_line_2 = <line_3>})
		Change log_strings = ($log_strings + {log_line_3 = <line_4>})
		Change log_strings = ($log_strings + {log_line_4 = <line_5>})
		Change log_strings = ($log_strings + {log_line_5 = <line_6>})
		Change log_strings = ($log_strings + {log_line_6 = <line_7>})
		Change log_strings = ($log_strings + {log_line_7 = <line_8>})
		Change log_strings = ($log_strings + {log_line_8 = <line_9>})
		<color_1> = ($log_strings.log_line_1_color)
		<color_2> = ($log_strings.log_line_2_color)
		<color_3> = ($log_strings.log_line_3_color)
		<color_4> = ($log_strings.log_line_4_color)
		<color_5> = ($log_strings.log_line_5_color)
		<color_6> = ($log_strings.log_line_6_color)
		<color_7> = ($log_strings.log_line_7_color)
		<color_8> = ($log_strings.log_line_8_color)
		<color_9> = ($log_strings.log_line_9_color)
		Change log_strings = ($log_strings + {log_line_0_color = <color_1>})
		Change log_strings = ($log_strings + {log_line_1_color = <color_2>})
		Change log_strings = ($log_strings + {log_line_2_color = <color_3>})
		Change log_strings = ($log_strings + {log_line_3_color = <color_4>})
		Change log_strings = ($log_strings + {log_line_4_color = <color_5>})
		Change log_strings = ($log_strings + {log_line_5_color = <color_6>})
		Change log_strings = ($log_strings + {log_line_6_color = <color_7>})
		Change log_strings = ($log_strings + {log_line_7_color = <color_8>})
		Change log_strings = ($log_strings + {log_line_8_color = <color_9>})
		switch ($play_log_lines)
			case 1
			Change log_strings = ($log_strings + {log_line_0 = <text_string>})
			Change log_strings = ($log_strings + {log_line_0_color = <Color>})
			case 2
			Change log_strings = ($log_strings + {log_line_1 = <text_string>})
			Change log_strings = ($log_strings + {log_line_1_color = <Color>})
			case 3
			Change log_strings = ($log_strings + {log_line_2 = <text_string>})
			Change log_strings = ($log_strings + {log_line_2_color = <Color>})
			case 4
			Change log_strings = ($log_strings + {log_line_3 = <text_string>})
			Change log_strings = ($log_strings + {log_line_3_color = <Color>})
			case 5
			Change log_strings = ($log_strings + {log_line_4 = <text_string>})
			Change log_strings = ($log_strings + {log_line_4_color = <Color>})
			case 6
			Change log_strings = ($log_strings + {log_line_5 = <text_string>})
			Change log_strings = ($log_strings + {log_line_5_color = <Color>})
			case 7
			Change log_strings = ($log_strings + {log_line_6 = <text_string>})
			Change log_strings = ($log_strings + {log_line_6_color = <Color>})
			case 8
			Change log_strings = ($log_strings + {log_line_7 = <text_string>})
			Change log_strings = ($log_strings + {log_line_7_color = <Color>})
			case 9
			Change log_strings = ($log_strings + {log_line_8 = <text_string>})
			Change log_strings = ($log_strings + {log_line_8_color = <Color>})
			case 10
			Change log_strings = ($log_strings + {log_line_9 = <text_string>})
			Change log_strings = ($log_strings + {log_line_9_color = <Color>})
		endswitch
		<line> = 0
		begin
		formatText Checksumname = Id 'log_line_%l' L = <line> dontassertforchecksums
		setScreenElementProps Id = <Id> Text = ($log_strings.<Id>)
		formatText Checksumname = col 'log_line_%l_color' L = <line> dontassertforchecksums
		switch ($log_strings.<col>)
			case Green
			setScreenElementProps Id = <Id> rgba = [48 210 48 250]
			case darkgreen
			setScreenElementProps Id = <Id> rgba = [16 160 16 250]
			case Red
			setScreenElementProps Id = <Id> rgba = [210 48 48 250]
			case darkred
			setScreenElementProps Id = <Id> rgba = [160 16 16 250]
			case Orange
			setScreenElementProps Id = <Id> rgba = [210 128 16 250]
			default
			setScreenElementProps Id = <Id> rgba = [210 210 210 250]
		endswitch
		<line> = (<line> + 1)
		repeat $play_log_lines
	endif
endscript

script guitar_tilt_debug_display 
	if ($show_guitar_tilt = 1)
		if NOT ScreenelementExists \{Id = guitar_tilt_debug}
			createScreenElement \{Type = textElement PARENT = root_window Id = guitar_tilt_debug font = Debug pos = (640.0, 400.0) just = [Center Center] scale = 2.0 rgba = [210 210 210 250] Text = "Tilt!" z_priority = 10.0 Alpha = 1}
		endif
		formatText \{Textname = text_string " ???"}
		controller = 0
		begin
		if isguitarcontroller controller = <controller>
			GuitarGetAnalogueInfo controller = <controller>
			formatText Textname = text_string "Tilt: %d" D = <RightY>
		endif
		<controller> = (<controller> + 1)
		repeat 4
		setScreenElementProps Id = guitar_tilt_debug Text = <text_string>
	endif
endscript

script guitar_sensor_debug 
	if ($show_sensor_debug)
		if NOT ScreenelementExists \{Id = guitar_sensor_debug}
			createScreenElement \{Type = textblockelement PARENT = root_window Id = guitar_sensor_debug font = Debug scale = 0.75 pos = (64.0, 64.0) Dims = (256.0, 256.0) just = [Left top] rgba = [210 210 210 255] z_priority = 10.0 Alpha = 0.8}
		endif
		control = -1
		if isguitarcontroller \{controller = 0}
			<control> = 0
		else
			if isguitarcontroller \{controller = 1}
				<control> = 1
			endif
		endif
		if (<control> >= 0)
			GuitarGetAnalogueInfo controller = <control>
			formatText {
				Textname = text_string
				"Tilt: %a\\nLean: %b\\nNeck: %c\\nWhammy: %d"
				A = <r2raw>
				B = <l2raw>
				C = <RightY>
				D = <RightX>
			}
			setScreenElementProps Id = guitar_sensor_debug Text = <text_string>
		endif
	endif
endscript

script check_input_debug 
	GetHeldPattern controller = <controller> player_status = <player_status>
	pressed = 0
	switch hold_pattern
		case 65536
		if (<button> = X)
			<pressed> = 1
		endif
		case 4096
		if (<button> = CIRCLE)
			<pressed> = 1
		endif
		case 256
		if (<button> = Triangle)
			<pressed> = 1
		endif
		case 16
		if (<button> = Square)
			<pressed> = 1
		endif
		case 1
		if (<button> = L1)
			<pressed> = 1
		endif
	endswitch
	if (<pressed> = 1)
		formatText Textname = Text "%t%c" T = <Text> C = <char>
	else
		formatText Textname = Text "%t." T = <Text>
	endif
	return <...>
endscript

script get_input_debug_text 
	<Text> = "* "
	check_input_debug <...> controller = ($<player_status>.controller) button = X char = "G"
	check_input_debug <...> controller = ($<player_status>.controller) button = CIRCLE char = "R"
	check_input_debug <...> controller = ($<player_status>.controller) button = Triangle char = "Y"
	check_input_debug <...> controller = ($<player_status>.controller) button = Square char = "B"
	check_input_debug <...> controller = ($<player_status>.controller) button = L1 char = "O"
	if isguitarcontroller controller = ($<player_status>.controller)
		formatText Textname = Text "%t *+* " T = <Text>
	else
		formatText Textname = Text "%t *-*" T = <Text>
	endif
	return input_text = <Text>
endscript

script input_debug 
	get_input_debug_text <...>
	GuitarGetAnalogueInfo controller = ($<player_status>.controller)
	formatText Textname = input_text "%t %l %r %d %x %y" T = <input_text> L = <LeftTrigger> R = <RightTrigger> D = <VerticalDist> X = <RightX> Y = <RightY>
	if ScreenelementExists \{Id = input_textp1}
		setScreenElementProps Id = input_textp1 Text = <input_text>
	endif
endscript

script debug_gem_text 
	if (<pattern> && 65536)
		formatText Textname = Text "%t%pG" T = <Text> P = <Prefix>
	else
		formatText Textname = Text "%t%p." T = <Text> P = <Prefix>
	endif
	if (<pattern> && 4096)
		formatText Textname = Text "%tR" T = <Text>
	else
		formatText Textname = Text "%t." T = <Text>
	endif
	if (<pattern> && 256)
		formatText Textname = Text "%tY" T = <Text>
	else
		formatText Textname = Text "%t." T = <Text>
	endif
	if (<pattern> && 16)
		formatText Textname = Text "%tB" T = <Text>
	else
		formatText Textname = Text "%t." T = <Text>
	endif
	if (<pattern> && 1)
		formatText Textname = Text "%tO " T = <Text>
	else
		formatText Textname = Text "%t. " T = <Text>
	endif
	return <...>
endscript

script debug_output 
	if ($output_log_file = 1)
		<showtime> = (<Time> - ($check_time_early * 1000.0))
		formatText Textname = Text "%t: %d:(%c)" T = <showtime> D = ($<Song> [<array_entry>] [6]) C = ($<player_status>.controller)
		if (<ignore_time> >= 0)
			debug_gem_text Text = <Text> pattern = <ignore_strum> Prefix = "Ig: "
		else
			formatText Textname = Text "%tIg: ..... " T = <Text>
		endif
		GetHeldPattern controller = ($<player_status>.controller) nobrokenstring
		debug_gem_text Text = <Text> pattern = <strummed_pattern> Prefix = "LS: "
		debug_gem_text Text = <Text> pattern = <original_strum> Prefix = "Or: "
		debug_gem_text Text = <Text> pattern = <hold_pattern> Prefix = "He: "
		if (<hit_strum> = 1)
			if (<fake_strum> = 1)
				formatText Textname = Text "%t H " T = <Text>
			else
				formatText Textname = Text "%t S " T = <Text>
			endif
		else
			if (<fake_strum> = 1)
				formatText Textname = Text "%t F " T = <Text>
			else
				formatText Textname = Text "%t . " T = <Text>
			endif
		endif
		if (<strummed_before_forming> >= 0.0)
			formatText Textname = Text "%t T " T = <Text>
		else
			formatText Textname = Text "%t   " T = <Text>
		endif
		get_input_debug_text <...>
		formatText Textname = Text "%t%h%m%u%l%i" T = <Text> H = <action_hit> M = <action_mis> U = <action_unn> L = <action_tol> I = <input_text>
		formatText Textname = Text "%t :%o:" T = <Text> O = ($<player_status>.hammer_on_tolerance)
		<check_entry> = <array_entry>
		if (<Time> >= $<Song> [<check_entry>] [0])
			begin
			GetStrumPattern Song = <Song> entry = <check_entry>
			<hammer> = ($<Song> [<check_entry>] [6])
			if (<hammer> = 1)
				debug_gem_text Text = <Text> pattern = <Strum> Prefix = "h"
			else
				debug_gem_text Text = <Text> pattern = <Strum> Prefix = ">"
			endif
			if ((<check_entry> + 1) < <song_array_size>)
				<check_entry> = (<check_entry> + 1)
			else
				break
			endif
			if (<Time> < ($<Song> [<check_entry>] [0]))
				break
			endif
			repeat
		endif
		getArraySize <strum_hits>
		if (<array_Size> > 0)
			formatText Textname = Text "%t S(" T = <Text>
			<Index> = 0
			begin
			<Strum> = (<strum_hits> [<Index>])
			debug_gem_text Text = <Text> pattern = <Strum> Prefix = ""
			<Index> = (<Index> + 1)
			repeat <array_Size>
			formatText Textname = Text "%t)" T = <Text>
		endif
		getArraySize <hammer_hits>
		if (<array_Size> > 0)
			formatText Textname = Text "%t H(" T = <Text>
			<Index> = 0
			begin
			<Strum> = (<hammer_hits> [<Index>])
			debug_gem_text Text = <Text> pattern = <Strum> Prefix = ""
			<Index> = (<Index> + 1)
			repeat <array_Size>
			formatText Textname = Text "%t)" T = <Text>
		endif
		ExtendCrc log ($<player_status>.Text) out = log_channel
		Printf Channel = <log_channel> <Text>
	endif
endscript

script start_sensor_debug_output 
	killspawnedScript \{Name = sensor_debug_output}
	if NOT gotParam \{controller}
		controller = $primary_controller
	endif
	SpawnScriptNOw sensor_debug_output Params = <...>
endscript

script stop_sensor_debug_output 
	killspawnedScript \{Name = sensor_debug_output}
endscript

script sensor_debug_output 
	last_righty = 0.0
	drighty = 0.0
	last_drighty = 0.0
	ddrighty = 0.0
	spike_threshold = 0.3
	begin
	GuitarGetAnalogueInfo controller = <controller>
	Printf "Sensor Value %v" v = <RightY>
	drighty = (<RightY> - <last_righty>)
	ddrighty = (<drighty> - <last_drighty>)
	if (<drighty> > <spike_threshold> || <drighty> < -1.0 * <spike_threshold>)
		Printf \{"Velocity Spike!!!"}
	endif
	if (<ddrighty> > 2.0 * <spike_threshold> || <ddrighty> < -2.0 * <spike_threshold>)
		Printf \{"Acceleration Spike!!!"}
	endif
	<last_righty> = (<RightY>)
	<last_drighty> = (<drighty>)
	Wait \{1 GameFrame}
	repeat
endscript

script FlexParticleWarning 
	SetScreenElementLock \{Id = root_window OFF}
	if ObjectExists \{Id = particle_warn_anchor}
		DestroyScreenelement \{Id = particle_warn_anchor}
	endif
	createScreenElement \{Type = containerElement PARENT = root_window Id = particle_warn_anchor pos = (25.0, 80.0) just = [Center Center] internal_just = [Left Center]}
	createScreenElement \{Type = textElement PARENT = particle_warn_anchor Id = particle_warn_text pos = (0.0, 0.0) Text = "Particle failed: Too many at once" font = text_A1 rgba = [255 0 0 255] just = [Left top]}
	SetScreenElementLock \{Id = root_window On}
	Wait \{2 Seconds}
	if ObjectExists \{Id = particle_warn_anchor}
		DestroyScreenelement \{Id = particle_warn_anchor}
	endif
endscript
