practice_notemapping = [
	{
		midinote = 60
		scr = SoundEvent
		params = {
			event = Practice_Mode_Kick
		}
	}
	{
		midinote = 61
		scr = SoundEvent
		params = {
			event = Practice_Mode_Tom3
		}
	}
	{
		midinote = 62
		scr = SoundEvent
		params = {
			event = Practice_Mode_Tom2
		}
	}
	{
		midinote = 63
		scr = SoundEvent
		params = {
			event = Practice_Mode_Tom1
		}
	}
	{
		midinote = 64
		scr = SoundEvent
		params = {
			event = Practice_Mode_Snare
		}
	}
	{
		midinote = 65
		scr = SoundEvent
		params = {
			event = Practice_Mode_HiHatClosed
		}
	}
	{
		midinote = 66
		scr = SoundEvent
		params = {
			event = Practice_Mode_HiHatOpen
		}
	}
	{
		midinote = 67
		scr = SoundEvent
		params = {
			event = Practice_Mode_Ride
		}
	}
	{
		midinote = 68
		scr = SoundEvent
		params = {
			event = Practice_Mode_Crash1
		}
	}
	{
		midinote = 69
		scr = SoundEvent
		params = {
			event = Practice_Mode_Crash2
		}
	}
]

script Practice_DummyFunction 
	printf \{"Practice_DummyFunction"}
endscript
practice_font = fontgrid_title_gh3

script practicemode_init 
	if NOT ($current_speedfactor = 1.0)
		SetNoteMappings \{section = Drums mapping = $practice_notemapping}
	endif
	hide_band
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = practice_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		type = TextElement
		parent = practice_container
		id = practice_sectiontext
		Scale = (1.1, 0.9)
		Pos = (640.0, 160.0)
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 0
		just = [center top]
		z_priority = 3
	}
	spawnscriptnow \{practicemode_section}
endscript

script practicemode_section 
	current_section_index = 0
	begin
	getsongtimems
	if (<time> > $current_starttime)
		practice_sectiontext :setprops text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :DoMorph \{alpha = 1.0 time = 0.5}
		current_section_index = ($current_section_array_entry)
		break
	endif
	wait \{1 gameframe}
	repeat
	begin
	getsongtimems
	if (<time> > $current_endtime)
		practice_sectiontext :DoMorph \{alpha = 0.0 time = 0.5}
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :DoMorph \{alpha = 0.0 time = 0.5}
		wait \{0.5 second}
		practice_sectiontext :setprops text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :DoMorph \{alpha = 1.0 time = 0.5}
		current_section_index = ($current_section_array_entry)
	endif
	wait \{1 gameframe}
	repeat
endscript

script practicemode_deinit 
	ClearNoteMappings \{section = practice}
	KillSpawnedScript \{name = practicemode_section}
	if ScreenElementExists \{id = practice_container}
		DestroyScreenElement \{id = practice_container}
	endif
endscript
