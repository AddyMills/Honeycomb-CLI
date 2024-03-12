Z_Video_movie_viewport = {
	id = movie1_viewport
	texture = viewport9
	textureasset = tex/zones/Video_shoot/Video_test.dds
	texdict = zones/z_video/z_video.tex
	textureslot = 0
	movie = 'encore_video_shoot'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface
}
Z_Video_movie_viewport_ps3 = {
	id = movie1_viewport
	texture = viewport9
	textureasset = tex/zones/Video_shoot/Video_test.dds
	texdict = zones/z_video/z_video.tex
	textureslot = 0
	movie = 'encore_video_shoot'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface_ps3
}

script create_movie_viewport 
	GetPakManCurrentName \{map = zones}
	if IsPS3
		FormatText checksumname = movie_viewport '%s_movie_viewport_ps3' s = <pakname>
	else
		FormatText checksumname = movie_viewport '%s_movie_viewport' s = <pakname>
	endif
	if NOT globalexists name = <movie_viewport>
		return
	endif
	CreateScreenElement {
		parent = root_window
		just = [center center]
		type = viewportelement
		id = ($<movie_viewport>.id)
		texture = ($<movie_viewport>.texture)
		Pos = (2000.0, 200.0)
		dims = (64.0, 64.0)
		alpha = 1
		style = ($<movie_viewport>.viewport_style)
	}
	setsearchallassetcontexts
	CreateViewportTextureOverride {
		id = ($<movie_viewport>.id)
		viewportid = ($<movie_viewport>.id)
		texture = ($<movie_viewport>.textureasset)
		texdict = ($<movie_viewport>.texdict)
	}
	setsearchallassetcontexts \{Off}
endscript

script destroy_movie_viewport 
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = movie_viewport '%s_movie_viewport' s = <pakname>
	if NOT globalexists name = <movie_viewport>
		return
	endif
	KillMovie textureslot = ($<movie_viewport>.textureslot)
	if ScreenElementExists id = ($<movie_viewport>.id)
		setsearchallassetcontexts
		DestroyViewportTextureOverride id = ($<movie_viewport>.id)
		setsearchallassetcontexts \{Off}
		DestroyScreenElement id = ($<movie_viewport>.id)
	endif
	KillSpawnedScript \{id = movie_scripts}
endscript

script PauseFullScreenMovie 
	if IsMoviePlaying \{textureslot = 0}
		PauseMovie \{textureslot = 0}
	endif
endscript

script UnPauseFullScreenMovie 
	if IsMoviePlaying \{textureslot = 0}
		ResumeMovie \{textureslot = 0}
	endif
endscript

script PlayMovieAndWait 
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT GotParam \{noblack}
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	if NOT GotParam \{noletterbox}
		GetDisplaySettings
		if (<widescreen> = TRUE)
			SetScreen \{hardware_letterbox = 0}
		else
			SetScreen \{hardware_letterbox = 1}
		endif
	endif
	printf "Playing Movie %s" s = <movie>
	PlayMovie {textureslot = 0
		texturepri = 1000
		no_looping
		no_hold
		<...>}
	wait \{2 gameframes}
	if GotParam \{noblack}
		fadetoblack \{Off time = 0}
	endif
	NotHeld = 0
	begin
	if NOT IsMoviePlaying \{textureslot = 0}
		break
	endif
	GetButtonsPressed \{startanda}
	if NOT (<makes> = 0)
		if (<NotHeld> = 1)
			KillMovie \{textureslot = 0}
			break
		endif
	else
		NotHeld = 1
	endif
	wait \{1 gameframes}
	repeat
	if NOT GotParam \{noblack}
		wait \{2 gameframes}
		printf "Finished Playing Movie %s" s = <movie>
		fadetoblack \{Off time = 0}
	endif
	if NOT GotParam \{noletterbox}
		SetScreen \{hardware_letterbox = 0}
	endif
	mark_safe_for_shutdown
endscript
