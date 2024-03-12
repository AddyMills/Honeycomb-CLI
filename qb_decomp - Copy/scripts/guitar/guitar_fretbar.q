thin_fretbar_timesigs = {
	t2d4 = $thin_fretbar_8note_params
	t3d4 = $thin_fretbar_8note_params
	t4d4 = $thin_fretbar_8note_params
	t5d4 = $thin_fretbar_8note_params
	t6d4 = $thin_fretbar_8note_params
	t3d8 = $thin_fretbar_16note_params
	t6d8 = $thin_fretbar_16note_params
	t12d8 = $thin_fretbar_16note_params
}
thin_fretbar_8note_params = {
	low_bpm = 1
	high_bpm = 180
}
thin_fretbar_16note_params = {
	low_bpm = 1
	high_bpm = 120
}
fretbar_prefix_type = {
	thin = 'thin'
	MEDIUM = 'medium'
	thick = 'thick'
}

script create_fretbar \{scale = (40.0, 0.25)}
	Create2DFretbar <...>
endscript

script fretbar_iterator 
	fretbar_iterator_CFunc_Setup
	begin
	if fretbar_iterator_CFunc
		break
	endif
	Wait \{1 GameFrame}
	repeat
	fretbar_iterator_CFunc_Cleanup
endscript

script kill_fretbar2d 
	if ScreenelementExists Id = <fretbar_id>
		DestroyGem Name = <fretbar_id>
	endif
endscript

script fretbar_events 
	SetEventHandler response = switch_script Event = kill_objects Scr = kill_fretbar2d Params = {<...>} Group = gem_group
endscript

script fretbar_update_tempo 
	fretbar_update_tempo_CFunc_Setup
	begin
	if fretbar_update_tempo_CFunc
		break
	endif
	Wait \{1 GameFrame}
	repeat
	fretbar_update_tempo_CFunc_Cleanup
endscript

script fretbar_update_hammer_on_tolerance 
	fretbar_update_hammer_on_tolerance_CFunc_Setup
	begin
	if fretbar_update_hammer_on_tolerance_CFunc
		break
	endif
	Wait \{1 GameFrame}
	repeat
	fretbar_update_hammer_on_tolerance_CFunc_Cleanup
endscript

script create_debug_measure_text 
	if NOT (<fretbar_scale> = thick)
		return
	endif
	if NOT ScreenelementExists \{Id = hud_destroygroup_windowp1}
		return
	endif
	if NOT ScreenelementExists \{Id = debug_measure_window}
		createScreenElement \{Type = containerElement PARENT = hud_destroygroup_windowp1 Id = debug_measure_window pos = (0.0, 0.0) just = [Left top]}
	endif
	formatText Textname = measure_text "%i" I = <measure>
	formatText Checksumname = measure_checksum 'measuretext_%i' I = <measure>
	createScreenElement {
		Type = textElement
		PARENT = debug_measure_window
		Id = <measure_checksum>
		font = text_A1
		pos = (2000.0, 32.0)
		just = [Center top]
		scale = 1.0
		rgba = [210 210 210 250]
		Text = <measure_text>
		z_priority = 1.0
	}
	SpawnScriptNOw move_debug_measure_text Params = {<...>} Id = debug_measure_text
endscript

script move_debug_measure_text 
	begin
	if compositeObjectexists <fretbar_id>
		<fretbar_id> :Obj_GetPosition
		pos = (<pos> + (2.0, 0.0, 0.0))
		GetViewport2DPosFrom3D viewport = 1 pos = <pos>
		pos = (<PosX> * (1.0, 0.0) + <PosY> * (0.0, 1.0))
		<measure_checksum> :doMorph pos = <pos>
		Wait \{1 GameFrame}
	else
		DestroyScreenelement Id = <measure_checksum>
		break
	endif
	repeat
endscript

script destroy_debug_measure_text 
	if ScreenelementExists \{Id = debug_measure_window}
		DestroyScreenelement \{Id = debug_measure_window}
	endif
	killspawnedScript \{Id = debug_measure_text}
endscript
