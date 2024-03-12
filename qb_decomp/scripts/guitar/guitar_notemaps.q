drums_autonotemapping = [
	{
		midinote = 70
		scr = Countoff_NoteMap
		params = {
		}
	}
]
Crowd_AutoNoteMapping = [
	{
		midinote = 72
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = applause
			override_state = 1
		}
	}
	{
		midinote = 73
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_fast
			override_state = 1
		}
	}
	{
		midinote = 74
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_slow
			override_state = 1
		}
	}
	{
		midinote = 75
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = applause
		}
	}
	{
		midinote = 76
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_fast
		}
	}
	{
		midinote = 77
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_slow
		}
	}
	{
		midinote = 78
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = applause
			override_state = 1
		}
	}
	{
		midinote = 79
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_fast
			override_state = 1
		}
	}
	{
		midinote = 80
		scr = GH3_Crowd_Event_Listener
		params = {
			event_type = surge_slow
			override_state = 1
		}
	}
]

script NoteMap_Dummy 
	printf \{"dummy"}
endscript

script Countoff_NoteMap 
	spawnscriptnow GH_SFX_Countoff_Logic params = {<...>}
endscript

script notemap_startiterator 
	FormatText checksumname = global_notemapping '%s_AutoNoteMapping' s = <event_string>
	if NOT globalexists name = <global_notemapping> type = array
		return
	endif
	FormatText checksumname = event_checksum '%s' s = <event_string>
	SetNoteMappings section = <event_checksum> mapping = $<global_notemapping>
	spawnscriptnow notemap_iterator params = {<...>}
endscript

script notemap_deinit 
	ClearNoteMappings \{section = all}
	KillSpawnedScript \{name = notemap_iterator}
	KillSpawnedScript \{name = notemap_startiterator}
endscript

script notemap_iterator 
	printf "Notemap Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_%e_notes' s = <song_prefix> e = <event_string> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{"No Drums Notes for Drums Iterator?"}
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	event_array_size = <array_size>
	getsongtimems time_offset = <time_offset>
	if NOT (<event_array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <event_array_size>
		event_array_size = (<event_array_size> - <array_entry>)
		if NOT (<event_array_size> = 0)
			begin
			TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
			begin
			if TimeMarkerReached
				getsongtimems time_offset = <time_offset>
				break
			endif
			wait \{1 gameframe}
			repeat
			TimeMarkerReached_ClearParams
			note = ($<event_array> [<array_entry>] [1])
			if GetNoteMapping section = <event_checksum> note = <note>
				GetArraySize ($<event_array> [<array_entry>])
				velocity = 100
				if (<array_size> > 3)
					velocity = ($<event_array> [<array_entry>] [3])
				endif
				spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) Length = ($<event_array> [<array_entry>] [2]) velocity = <velocity>}
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <event_array_size>
		endif
	endif
endscript
