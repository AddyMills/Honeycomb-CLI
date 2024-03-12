Practice_NoteMapping = [
	{
		MidiNote = 60
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_Kick
		}
	}
	{
		MidiNote = 61
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_Tom3
		}
	}
	{
		MidiNote = 62
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_Tom2
		}
	}
	{
		MidiNote = 63
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_Tom1
		}
	}
	{
		MidiNote = 64
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_Snare
		}
	}
	{
		MidiNote = 65
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_HiHatClosed
		}
	}
	{
		MidiNote = 66
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_HiHatOpen
		}
	}
	{
		MidiNote = 67
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_Ride
		}
	}
	{
		MidiNote = 68
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_Crash1
		}
	}
	{
		MidiNote = 69
		Scr = Soundevent
		Params = {
			Event = Practice_Mode_Crash2
		}
	}
]

script Practice_DummyFunction 
	Printf \{"Practice_DummyFunction"}
endscript
practice_font = fontgrid_title_gh3

script practicemode_init 
	if NOT ($current_speedfactor = 1.0)
		setnotemappings \{section = drums mapping = $Practice_NoteMapping}
	endif
	Hide_Band
	createScreenElement \{Type = containerElement PARENT = root_window Id = practice_container pos = (0.0, 0.0)}
	createScreenElement {
		Type = textElement
		PARENT = practice_container
		Id = practice_sectiontext
		scale = (1.1, 0.9)
		pos = (640.0, 160.0)
		font = ($practice_font)
		rgba = [255 255 255 255]
		Alpha = 0
		just = [Center top]
		z_priority = 3
	}
	SpawnScriptNOw \{practicemode_section}
endscript

script practicemode_section 
	current_section_index = 0
	begin
	GetSongtimeMS
	if (<Time> > $current_starttime)
		practice_sectiontext :SetProps Text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :doMorph \{Alpha = 1.0 Time = 0.5}
		current_section_index = ($current_section_array_entry)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	begin
	GetSongtimeMS
	if (<Time> > $current_endtime)
		practice_sectiontext :doMorph \{Alpha = 0.0 Time = 0.5}
		break
		elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :doMorph \{Alpha = 0.0 Time = 0.5}
		Wait \{0.5 Second}
		practice_sectiontext :SetProps Text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :doMorph \{Alpha = 1.0 Time = 0.5}
		current_section_index = ($current_section_array_entry)
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script practicemode_deinit 
	ClearNoteMappings \{section = PRACTICE}
	killspawnedScript \{Name = practicemode_section}
	if ScreenelementExists \{Id = practice_container}
		DestroyScreenelement \{Id = practice_container}
	endif
endscript
