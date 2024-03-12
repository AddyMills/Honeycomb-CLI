loading_screen_tips = [
	"Having trouble?  Check out the tutorials in the training menu."
	"Having trouble?  Check out the tutorials in the training menu."
	"Check out the store for new songs and cool outfits and styles."
	"Check out the store for new songs and cool outfits and styles."
	"Wanna rock with a friend?  Start a new band in Co-op career."
	"Wanna rock with a friend?  Start a new band in Co-op career."
	"Going into practice can help you nail those tricky solos."
	"Going into practice can help you nail those tricky solos."
	"If you haven't recorded on a 4-track, you aren't a real band."
	"Make sure the crowd is willing to catch you before you stage dive."
	"Do NOT use homemade pyrotechnics."
	"Showing up 30 minutes late to practice is just tradition."
	"Can I get a little less suck out of the monitors?"
	"Never think you were the first band to wear all black on stage."
	"Yes, the stage monitors are in fact, diving boards."
	"Never ever leave the singer in charge of the mix."
	"It can always be much louder."
	"We're a real angry band, but that doesn't mean we don't believe in peace."
	"20 minute free-form jazz odysseys are not O.K."
	"People don't want to pay money to hear you jam."
	"It takes a long time to look like you just woke up."
	"Make sure someone in the band knows how to change a flat tire."
	"Turn that amp up.  My ears are barely even bleeding."
	"I used to freak out when my amp caught on fire.  Now I kinda dig the tone."
	"Smashed guitars just seem to sound better than their unsmashed brethren."
	"You're only as good as your last gig... which sucked."
	"You played great.  I'm sure they were just booing your outfits."
	"Maybe a drum machine would show up to practice on time."
	"You seem to be having a problem with your bass amp.  I can hear it!"
	"Go out there, rock hard and sell a bunch of t-shirts so we can eat."
	"Let's open with our latest single.  That way we can get that piece of *&?#@! out of the way early!"
	"I'm the drummer.  I don't get paid to understand any of this!"
	"I swear officer, the dressing room TV just un-bolted itself from the wall and flew out the window!"
	"Solo play getting old? Go online and battle some live competition!"
	"Need new songs? Check the online menu to see if new content is available!"
	"Want to play Co-Op but don't have a friend? Play online to hook up and jam!"
	"Who's a Guitar God? Check the leaderboards in the online menu."
	"Having trouble hitting notes?  Try using the Calibrate Audio Lag tool in the Options menu."
]
g_loading_screen_split_container_id = Id

script create_loading_screen \{mode = play_song}
	kill_start_key_binding
	if ($is_changing_levels = 1)
		return
	endif
	Change \{is_changing_levels = 1}
	getArraySize ($loading_screen_tips)
	GetRandomValue Name = rand_num A = 0 B = (<array_Size> - 1) Integer
	rand_tip = ($loading_screen_tips [<rand_num>])
	if (<mode> = play_song || <mode> = play_encore || <mode> = play_boss || <mode> = restart_song)
		killspawnedScript \{Name = jiggle_text_array_elements}
		if ScreenelementExists \{Id = $g_loading_screen_split_container_id}
			DestroyScreenelement \{Id = $g_loading_screen_split_container_id}
		endif
		movie = 'loading_flying'
		if NOT IsMovieInBuffer movie = <movie>
			buffer_slot = 0
			FreeMovieBuffer buffer_slot = <buffer_slot>
			if GotExtraMemory
				MemPushContext \{debugheap}
			endif
			AllocateMovieBuffer buffer_slot = <buffer_slot> movie = 'movies\\bik\\loading_flying.bik.xen'
			if GotExtraMemory
				MemPopContext
			endif
			LoadMovieIntoBuffer buffer_slot = <buffer_slot> movie = <movie>
		endif
		PlayMovieFromBuffer {
			buffer_slot = <buffer_slot>
			textureSlot = 2
			no_hold
			wait_until_rendered
			TexturePri = 4999
		}
		createScreenElement {
			Type = textblockelement
			PARENT = root_window
			Id = loading_tip_text
			Text = <rand_tip>
			font = text_a4
			scale = 0.9
			just = [Center Center]
			Dims = (350.0, 480.0)
			pos = (860.0, 300.0)
			rgba = [255 255 255 255]
			z_priority = 5000
			Shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
		}
		split_text_into_array_elements \{Text = "LOADING" text_pos = (400.0, 560.0) space_between = (40.0, 0.0) flags = {rgba = [255 255 255 255] scale = 2.0 z_priority = 6000 font = text_a10 just = [Center Center] Alpha = 1}}
		Change g_loading_screen_split_container_id = <container_id>
		SpawnScriptNOw \{jiggle_text_array_elements Params = {Id = $g_loading_screen_split_container_id Time = 1.0 wait_time = 3000 explode = 0}}
	else
		killspawnedScript \{Name = destroy_loading_screen_spawned}
		createScreenElement \{Type = containerElement PARENT = root_window Id = loading_screen_container pos = (0.0, 0.0)}
		createScreenElement \{Type = spriteElement PARENT = loading_screen_container texture = loading_flying_static pos = (640.0, 360.0) just = [Center Center] Dims = (1280.0, 720.0)}
	endif
endscript

script destroy_loading_screen 
	destroy_menu \{menu_id = loading_tip_text}
	killspawnedScript \{Name = jiggle_text_array_elements}
	if ScreenelementExists \{Id = $g_loading_screen_split_container_id}
		DestroyScreenelement \{Id = $g_loading_screen_split_container_id}
	endif
	if IsMoviePlaying \{textureSlot = 2}
		KillMovie \{textureSlot = 2}
	endif
	SpawnScriptNOw \{destroy_loading_screen_spawned}
	Hideloadingscreen
	if ($playing_song = 0)
		Change \{is_changing_levels = 0}
	endif
endscript

script destroy_loading_screen_spawned \{Time = 0.3}
	onexitrun \{destroy_loading_screen_finish}
	if (<Time> > 0)
		if ScreenelementExists \{Id = menu_backdrop_container}
			DoScreenElementMorph Id = menu_backdrop_container Alpha = 0 Time = <Time>
		endif
		if ScreenelementExists \{Id = loading_screen_container}
			DoScreenElementMorph Id = loading_screen_container Alpha = 0 Time = <Time>
		endif
		Wait <Time> Seconds
	endif
endscript

script destroy_loading_screen_finish 
	if isWinPort
		if IsMoviePlaying \{textureSlot = 2}
			KillMovie \{textureSlot = 2}
		endif
	endif
	if ScreenelementExists \{Id = loading_screen_container}
		DestroyScreenelement \{Id = loading_screen_container}
	endif
	destroy_menu_backdrop
endscript

script refresh_screen 
	destroy_loading_screen
	create_loading_screen
endscript
