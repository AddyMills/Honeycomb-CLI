igc_debug = 0
igc_debug_hold_camera = 0
igc_playing = 0

script igc_temporarily_disable_input 
	DeBounce \{X}
	killspawnedScript \{Id = igc_input_toggle}
	SpawnScriptNOw \{TemporarilyDisableInput Params = {Time = 350} Id = igc_input_toggle}
endscript

script TemporarilyDisableInput \{Time = 1500}
	onexitrun \{TemporarilyDisableInput_Reenable}
	SetButtonEventMappings \{block_menu_input}
	if gotParam \{Seconds}
		Wait <Time> Seconds IgnoreSlomo
	else
		Wait <Time> IgnoreSlomo
	endif
endscript

script TemporarilyDisableInput_Reenable 
	SetButtonEventMappings \{unblock_menu_input}
endscript

script igc_immediately_start_rendering 
	killspawnedScript \{Id = igc_render_toggle}
	StartRendering
endscript

script igc_temporarily_disable_rendering 
	if NOT IsTrue \{$is_changing_levels}
		killspawnedScript \{Id = igc_render_toggle}
		SpawnScriptNOw igc_temporarily_disable_rendering_with_wait Params = <...> Id = igc_render_toggle
	endif
endscript

script igc_temporarily_disable_rendering_with_wait 
	onexitrun \{igc_temporarily_disable_rendering_with_wait_end}
	StopRendering
	Wait <...>
endscript

script igc_temporarily_disable_rendering_with_wait_end 
	StartRendering
endscript
