
script PlaySubtitledMovie 
	if NOT GotParam \{SubbedMovie}
		printf \{"PlaySubtitledMovie: Requires the SubbedMovie param, see movie_text.q for an example of the structure." channel = ui}
		return
	endif
	if ScreenElementExists \{id = play_subtitled_movie_container}
		printf \{"PlaySubtitledMovie: Script is already running, call KillSubtitledMovie first." channel = ui}
		return
	endif
	if NOT (StructureContains structure = SubbedMovie name = movie_params)
		printf \{"PlaySubtitledMovie: Script Requires the SubbedMovie param to contain a movie_params." channel = ui}
		return
	endif
	if NOT (StructureContains structure = SubbedMovie name = events)
		printf \{"PlaySubtitledMovie: Script Requires the SubbedMovie param to contain an array of event." channel = ui}
		return
	endif
	<container_params> = {}
	<helper_params> = {}
	<skip_helper_params> = {}
	<exit_param> = {}
	if (StructureContains structure = SubbedMovie name = container_params)
		<container_params> = (<SubbedMovie>.container_params)
	endif
	if (StructureContains structure = SubbedMovie name = helper_params)
		<helper_params> = (<SubbedMovie>.helper_params)
	endif
	if (StructureContains structure = SubbedMovie name = skip_helper_params)
		<skip_helper_params> = (<SubbedMovie>.skip_helper_params)
	endif
	if (StructureContains structure = SubbedMovie name = exit_script)
		<exit_params> = {exit_script = (<SubbedMovie>.exit_script)}
		if (StructureContains structure = SubbedMovie name = exit_script_params)
			<exit_params> = {<exit_params> exit_script_params = (<SubbedMovie>.exit_script_params)}
		endif
	endif
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = play_subtitled_movie_main_container
		dims = (1280.0, 702.0)
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT (StructureContains structure = SubbedMovie name = no_skip)
		SetScreenElementProps {
			id = play_subtitled_movie_main_container
			event_handlers = [
				{pad_back NullScript}
				{pad_choose KillSubtitledMovie params = {<exit_params>}}
			]
		}
		CreateScreenElement {
			rgba = [128 128 128 255]
			text = "skip movie \\m0"
			just = [RIGHT center]
			Pos = (1150.0, 620.0)
			alpha = 1.0
			Scale = (0.8, 0.8)
			<skip_helper_params>
			type = TextElement
			parent = play_subtitled_movie_main_container
			id = play_subtitled_skip_helper
			font = text_a1
			z_priority = 1010
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
	endif
	LaunchEvent \{type = focus target = play_subtitled_movie_main_container}
	CreateScreenElement {
		<container_params>
		type = ContainerElement
		parent = play_subtitled_movie_main_container
		id = play_subtitled_movie_container
	}
	printf \{"PlaySubtitledMovie: Container Element has been created." channel = ui}
	CreateScreenElement {
		text = "press \\m1 to continue"
		just = [center center]
		alpha = 0.0
		Scale = (0.8, 0.8)
		<helper_params>
		type = TextElement
		parent = play_subtitled_movie_container
		id = play_subtitled_movie_helper
		font = text_a1
		z_priority = 1010
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	printf \{"PlaySubtitledMovie: Helper Text Element has been created." channel = ui}
	<default_create_element> = {}
	<default_fade_in_params> = {}
	<default_fade_out_params> = {}
	if (StructureContains structure = SubbedMovie name = default_create_element)
		<default_create_element> = (<SubbedMovie>.default_create_element)
	endif
	if (StructureContains structure = SubbedMovie name = default_fade_in_params)
		<default_fade_in_params> = (<SubbedMovie>.default_fade_in_params)
	endif
	if (StructureContains structure = SubbedMovie name = default_fade_out_params)
		<default_fade_out_params> = (<SubbedMovie>.default_fade_out_params)
	endif
	PushSoundBussParams
	if (StructureContains structure = SubbedMovie name = no_music)
		EnableUserMusic \{disable}
		setsoundbussparams \{$No_Music_At_All_BussSet time = 0.3}
	endif
	printf \{"PlaySubtitledMovie: Launching SubtitleMovie..." channel = ui}
	RunScriptOnScreenElement id = play_subtitled_movie_container SubtitleMovie params = {
		movie_params = (<SubbedMovie>.movie_params)
		events = (<SubbedMovie>.events)
		default_create_element = <default_create_element>
		default_fade_in_params = <default_fade_in_params>
		default_fade_out_params = <default_fade_out_params>
		exit_params = <exit_params>
	}
endscript

script KillSubtitledMovie \{exit_script = NullScript exit_params = {}}
	spawnscriptnow <exit_script> params = <exit_params>
	if ScreenElementExists \{id = play_subtitled_movie_main_container}
		EnableUserMusic
		PopSoundBussParams
		DestroyScreenElement \{id = play_subtitled_movie_main_container}
		LaunchEvent \{broadcast type = subtitled_movie_killed}
		printf \{"KillSubtitledMovie: Subtitled movie has been destroyed." channel = ui}
	else
		printf \{"KillSubtitledMovie: There is no subtitled movie playing." channel = ui}
	endif
endscript

script SubtitleMovie_PressToContinue 
	SetSpawnInstanceLimits \{max = 1 management = ignore_spawn_request}
	LaunchEvent \{broadcast type = movie_text_press_to_continue}
endscript

script SubtitleMovie 
	SetSpawnInstanceLimits \{max = 1 management = ignore_spawn_request}
	printf \{"SubtitleMovie: Script has spawned." channel = ui}
	KillAllMovies \{blocking}
	<movie> = (<movie_params>.movie)
	if (StructureContains structure = movie_params name = movie_ps3)
		if IsPS3
			<movie> = (<movie_params>.movie_ps3)
			if (StructureContains structure = movie_params name = movie_ps3x)
				GetEnterButtonAssignment
				if (<assignment> = Circle)
					<movie> = (<movie_params>.movie_ps3x)
				endif
			endif
		endif
	endif
	CreateScreenElement {
		Scale = (1280.0, 720.0)
		<movie_params>
		movie = <movie>
		type = movieelement
		parent = play_subtitled_movie_container
		id = play_subtitled_movie
		textureslot = 0
		z_priority = 1000
		start_frame = (<movie_params>.start_frame)
		loop_start = (<movie_params>.start_frame)
		loop_end = (<movie_params>.end_frame)
	}
	RemoveParameter \{movie}
	RemoveParameter \{movie_params}
	wait \{1 gameframes}
	begin
	if (IsMoviePlaying textureslot = 0)
		printf \{"SubtitleMovie: Movie element has started playing." channel = ui}
		break
	endif
	wait \{1 gameframes}
	repeat
	GetNextArrayElement <events>
	begin
	if NOT GotParam \{element}
		printf \{"SubtitleMovie: All events have completed, breaking out of loop." channel = ui}
		break
	endif
	if NOT IsMoviePlaying \{textureslot = 0}
		printf \{"SubtitleMovie: WARNING: Move unexpectedly ended, breaking out." channel = ui}
		KillSubtitledMovie <exit_params>
		return
	endif
	GetMovieFrame \{textureslot = 0}
	printf "SubtitleMovie: Current Movie Element Frame: %f" f = <frame> channel = ui
	if (<frame> >= (<element>.frame))
		printf "SubtitleMovie: Current Event Frame: %f" f = (<element>.frame) channel = ui
		if (StructureContains structure = element name = destroy_element)
			if GotParam \{curr_element}
				<fade_out_params> = {}
				if (StructureContains structure = element name = fade_out_params)
					<fade_out_params> = (<element>.fade_out_params)
				endif
				RunScriptOnScreenElement id = <curr_element> DestroySubtitledMovieElement params = {
					default_fade_out_params = <default_fade_out_params>
					fade_out_params = <fade_out_params>
				}
				RemoveParameter \{curr_element}
			endif
		endif
		if (StructureContains structure = element name = create_element)
			if GotParam \{curr_element}
				RunScriptOnScreenElement id = <curr_element> DestroySubtitledMovieElement
			endif
			<create_element> = (<element>.create_element)
			if (StructureContains structure = element name = create_element_ps3)
				if IsPS3
					<create_element> = (<element>.create_element_ps3)
				endif
			endif
			CreateScreenElement {
				<default_create_element>
				<create_element>
				parent = play_subtitled_movie_container
				z_priority = 1005
			}
			RemoveParameter \{create_element}
			printf \{"SubtitleMovie: Element has been created." channel = ui}
			<curr_element> = <id>
			if (StructureContains structure = element name = fade_in_params)
				DoScreenElementMorph {
					<default_fade_in_params>
					(<element>.fade_in_params)
					id = <curr_element>
				}
			endif
		endif
		if (StructureContains structure = element name = event_script)
			event_script_params = {}
			if (StructureContains structure = element name = event_script_params)
				event_script_params = (<element>.event_script_params)
			endif
			RunScriptOnScreenElement id = play_subtitled_movie_container (<element>.event_script) params = <event_script_params>
		endif
		if (StructureContains structure = element name = wait_for_input)
			PauseMovie \{textureslot = 0}
			printf \{"SubtitleMovie: Movie element has paused playback." channel = ui}
			DoScreenElementMorph \{id = play_subtitled_movie_helper alpha = 1.0 time = 0.5}
			SetScreenElementProps \{id = play_subtitled_movie_main_container event_handlers = [{pad_back SubtitleMovie_PressToContinue}] replace_handlers}
			Block \{type = movie_text_press_to_continue}
			printf \{"SubtitleMovie: Input has been recieved." channel = ui}
			DoScreenElementMorph \{id = play_subtitled_movie_helper alpha = 0.0 time = 0.5}
			SetScreenElementProps \{id = play_subtitled_movie_main_container event_handlers = [{pad_back NullScript}] replace_handlers}
			ResumeMovie \{textureslot = 0}
			printf \{"SubtitleMovie: Movie element has resumed playback." channel = ui}
		endif
		if (StructureContains structure = element name = wait_time)
			PauseMovie \{textureslot = 0}
			printf \{"SubtitleMovie: Movie element has paused playback." channel = ui}
			wait (<element>.wait_time) seconds ignoreslomo
			printf "SubtitleMovie: Movie element has waited %s seconds." s = (<element>.wait_time) channel = ui
			ResumeMovie \{textureslot = 0}
			printf \{"SubtitleMovie: Movie element has resumed playback." channel = ui}
		endif
		RemoveParameter \{element}
		GetNextArrayElement <events>
	endif
	wait \{1 gameframe}
	repeat
	WaitForMovieLoop \{textureslot = 0}
	printf \{"SubtitleMovie: Movie element has finished playing." channel = ui}
	PauseMovie \{textureslot = 0}
	printf \{"SubtitleMovie: Movie element has paused playback." channel = ui}
	KillSubtitledMovie <exit_params>
endscript

script DestroySubtitledMovieElement \{fade_out_params = {}}
	DoMorph {
		<default_fade_out_params>
		<fade_out_params>
	}
	Die
	printf \{"SubtitleMovie: Element has been destroyed." channel = ui}
endscript
