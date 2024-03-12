Z_Video_movie_viewport = {
	Id = movie1_viewport
	texture = viewport9
	textureasset = tex/zones/Video_shoot/Video_test.dds
	texdict = zones/z_video/z_video.tex
	textureSlot = 0
	movie = 'encore_video_shoot'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface
}
Z_Video_movie_viewport_ps3 = {
	Id = movie1_viewport
	texture = viewport9
	textureasset = tex/zones/Video_shoot/Video_test.dds
	texdict = zones/z_video/z_video.tex
	textureSlot = 0
	movie = 'encore_video_shoot'
	start_frame = 0
	loop_start = 0
	loop_end = -1
	viewport_style = cutscene_movie_surface_ps3
}

script create_movie_viewport 
	GetPakManCurrentName \{map = Zones}
	if ISPS3
		formatText Checksumname = movie_viewport '%s_movie_viewport_ps3' S = <pakname>
	else
		formatText Checksumname = movie_viewport '%s_movie_viewport' S = <pakname>
	endif
	if NOT Globalexists Name = <movie_viewport>
		return
	endif
	createScreenElement {
		PARENT = root_window
		just = [Center Center]
		Type = ViewportElement
		Id = ($<movie_viewport>.Id)
		texture = ($<movie_viewport>.texture)
		pos = (2000.0, 200.0)
		Dims = (64.0, 64.0)
		Alpha = 1
		style = ($<movie_viewport>.viewport_style)
	}
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		Id = ($<movie_viewport>.Id)
		viewportid = ($<movie_viewport>.Id)
		texture = ($<movie_viewport>.textureasset)
		texdict = ($<movie_viewport>.texdict)
	}
	SetSearchAllAssetContexts \{OFF}
endscript

script destroy_movie_viewport 
	GetPakManCurrentName \{map = Zones}
	formatText Checksumname = movie_viewport '%s_movie_viewport' S = <pakname>
	if NOT Globalexists Name = <movie_viewport>
		return
	endif
	KillMovie textureSlot = ($<movie_viewport>.textureSlot)
	if ScreenelementExists Id = ($<movie_viewport>.Id)
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride Id = ($<movie_viewport>.Id)
		SetSearchAllAssetContexts \{OFF}
		DestroyScreenelement Id = ($<movie_viewport>.Id)
	endif
	killspawnedScript \{Id = movie_scripts}
endscript

script PauseFullScreenMovie 
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
endscript

script UnPauseFullScreenMovie 
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
endscript

script PlayMovieAndWait 
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT gotParam \{noblack}
		FadeToBlack \{On Time = 0 Alpha = 1.0 z_priority = -10}
	endif
	if NOT gotParam \{noletterbox}
		GetDisplaySettings
		if (<widescreen> = TRUE)
			SetScreen \{hardware_letterbox = 0}
		else
			SetScreen \{hardware_letterbox = 1}
		endif
	endif
	Printf "Playing Movie %s" S = <movie>
	PlayMovie {textureSlot = 0
		TexturePri = 1000
		no_looping
		no_hold
		<...>}
	Wait \{2 gameframes}
	if gotParam \{noblack}
		FadeToBlack \{OFF Time = 0}
	endif
	NotHeld = 0
	begin
	if NOT IsMoviePlaying \{textureSlot = 0}
		break
	endif
	GetButtonsPressed \{StartAndA}
	if NOT (<makes> = 0)
		if (<NotHeld> = 1)
			KillMovie \{textureSlot = 0}
			break
		endif
	else
		NotHeld = 1
	endif
	Wait \{1 gameframes}
	repeat
	if NOT gotParam \{noblack}
		Wait \{2 gameframes}
		Printf "Finished Playing Movie %s" S = <movie>
		FadeToBlack \{OFF Time = 0}
	endif
	if NOT gotParam \{noletterbox}
		SetScreen \{hardware_letterbox = 0}
	endif
	mark_safe_for_shutdown
endscript
