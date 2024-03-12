enable_soft_asserts = 1
soft_assert_active = 0

script soft_assert 
	Dumpheaps
	printStruct <...>
	Printf "SOFT ASSERT: %s" S = <reason>
	if IsTrue \{$enable_soft_asserts}
		if IsTrue \{$soft_assert_active}
			Printf \{"Soft Assert already active, ignoring!"}
		else
			pause_game = 1
			if Globalexists \{Type = Integer Name = view_mode}
				if ($view_mode > 0)
					pause_game = 0
				endif
			endif
			if (<pause_game> = 1)
				if GameIsPaused
					formatText Textname = full_message "SOFT ASSERT: %r (game was paused, so promoted to hard assert)" R = <reason>
					Scriptassert <full_message>
				endif
				PauseMusic \{1}
				PauseStream \{1}
				Pausegame
			endif
			Change \{soft_assert_active = 1}
			StartRendering
			Hideloadingscreen
			screenshot \{FileName = 'Assert'}
			soft_assert_message <...>
		endif
	endif
endscript

script soft_assert_keep_player_paused 
	MangleChecksums \{A = 0 B = 0}
	begin
	if compositeObjectexists Name = <mangled_ID>
		<mangled_ID> :pause
	endif
	Wait \{1 gameframes}
	repeat
endscript

script soft_assert_confirm 
	unpause_game = 1
	if Globalexists \{Type = Integer Name = view_mode}
		if ($view_mode > 0)
			unpause_game = 0
		endif
	endif
	if (<unpause_game> = 1)
		unpauseGame
		PauseMusic \{0}
		PauseStream \{0}
	endif
	Change \{soft_assert_active = 0}
	DestroyScreenelement \{Id = soft_assert_anchor}
endscript

script soft_assert_message \{message = ""}
	if gotParam \{file}
		formatText Textname = message "%m\\c2File:\\c0 %f\\n" M = <message> F = <file>
	endif
	if gotParam \{line}
		formatText Textname = message "%m\\c2Line:\\c0 %l\\n" M = <message> L = <line>
	endif
	if gotParam \{sig}
		formatText Textname = message "%m\\c2Signature:\\c0 %s\\n" M = <message> S = <sig>
	endif
	if gotParam \{reason}
		formatText Textname = message "%m\\n\\c2Message:\\c0 %r\\n" M = <message> R = <reason>
	endif
	if ScreenelementExists \{Id = soft_assert_anchor}
		DestroyScreenelement \{Id = soft_assert_anchor}
	endif
	SetScreenElementLock \{Id = root_window OFF}
	top = (0.0, 40.0)
	createScreenElement \{Type = containerElement Id = soft_assert_anchor PARENT = root_window z_priority = 10000}
	createScreenElement \{Type = spriteElement PARENT = soft_assert_anchor rgba = [0 0 0 70] Dims = (1280.0, 720.0) pos = (0.0, 0.0) just = [Left top]}
	createScreenElement {
		Type = textElement
		PARENT = soft_assert_anchor
		font = text_A1
		Text = "\\c2ASSERTION:"
		rgba = [255 255 255 255]
		Alpha = 1
		scale = 0.65000004
		pos = ((640.0, 0.0) + <top>)
		just = [Center top]
		z_priority = 10002
	}
	if ($highdefviewer = 1)
		<this_text_scale> = 0.45000002
	else
		<this_text_scale> = 0.6
	endif
	createScreenElement {
		Type = textblockelement
		PARENT = soft_assert_anchor
		font = text_A1
		Text = <message>
		rgba = [255 255 255 255]
		Alpha = 1
		scale = <this_text_scale>
		pos = ((100.0, 50.0) + <top>)
		Dims = (880.0, 0.0)
		allow_expansion
		just = [Left top]
		internal_just = [Left top]
	}
	getScreenElementDims Id = <Id>
	if gotParam \{callstack}
		dim_h = (325 - <Height>)
		if (<dim_h> < 100)
			dim_h = 100
		endif
		createScreenElement {
			Type = VScrollingMenu
			PARENT = soft_assert_anchor
			Id = soft_assert_callstack_v
			just = [Left top]
			pos = ((120.0, 90.0) + (<Height> * (0.0, 0.85)))
			Dims = ((840.0, 0.0) + (<dim_h> * (0.0, 1.0)))
			z_priority = 10005
		}
		createScreenElement \{Type = VMenu Id = soft_assert_callstack PARENT = soft_assert_callstack_v internal_just = [Left top] dont_allow_wrap}
		getArraySize <callstack>
		I = 0
		begin
		createScreenElement {
			Type = textblockelement
			PARENT = soft_assert_callstack
			font = text_A1
			Text = (<callstack> [<I>])
			rgba = [160 160 255 255]
			scale = <this_text_scale>
			just = [Left top]
			Dims = (880.0, 0.0)
			allow_expansion
			internal_just = [Left top]
		}
		I = (<I> + 1)
		repeat <array_Size>
		Height = 330
		launchevent \{Type = focus Target = soft_assert_callstack}
	endif
	createScreenElement {
		Type = spriteElement
		PARENT = soft_assert_anchor
		rgba = [0 0 0 70]
		Dims = (1100.0, 720.0)
		pos = ((640.0, 0.0) + <top>)
		just = [Center top]
	}
	create_helper_text \{helper_text_elements = [{Text = "\\be - \\bf - \\be = Continue"}] PARENT = soft_assert_anchor z_priority = 10004}
	soft_assert_input
	launchevent \{Type = focus Target = soft_assert_anchor}
	runScriptOnScreenElement \{Id = soft_assert_anchor soft_assert_keep_player_paused}
endscript

script soft_assert_input \{step = 0}
	Steps = [
		{event_name = pad_L1 button_name = L1}
		{event_name = pad_R1 button_name = R1}
		{event_name = pad_L1 button_name = L1}
	]
	if gotParam \{Wait}
		Wait <Wait> Seconds
	endif
	getArraySize <Steps>
	if NOT (<step> < <array_Size>)
		I = 0
		begin
		DeBounce (<Steps> [<I>].button_name)
		ControllerDebounce (<Steps> [<I>].button_name)
		I = (<I> + 1)
		repeat <array_Size>
		Goto \{soft_assert_confirm}
	endif
	I = 0
	begin
	if (<step> = <I>)
		event_handlers = [{(<Steps> [<I>].event_name) soft_assert_input Params = {step = (<step> + 1)}}]
	else
		event_handlers = [{(<Steps> [<I>].event_name) nullScript}]
	endif
	soft_assert_anchor :SetProps event_handlers = <event_handlers> Replace_Handlers
	I = (<I> + 1)
	if gotParam \{Reset}
		if NOT (<I> < <array_Size>)
			Goto \{soft_assert_input}
		endif
	else
		if (<I> > <step>)
			break
		endif
	endif
	repeat
	soft_assert_anchor :Obj_KillSpawnedScript \{Name = soft_assert_input}
	soft_assert_anchor :Obj_SpawnScriptLater \{soft_assert_input Params = {Wait = 0.3 Reset}}
endscript
