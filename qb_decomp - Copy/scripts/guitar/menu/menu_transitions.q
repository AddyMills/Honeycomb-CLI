transitions_locked = 0

script destroy_menu_transition 
	if ScreenelementExists \{Id = transition_container}
		root_window :SetProps \{just = [Left top]}
		root_window :SetProps \{Alpha = 1 scale = (1.0, 1.0) pos = (0.0, 0.0)}
		DestroyScreenelement \{Id = transition_container}
		Change \{transitions_locked = 0}
	endif
endscript

script menu_transition_out_right \{transition_time = 0.125}
	destroy_menu_transition
	Change \{transitions_locked = 1}
	createScreenElement \{Id = transition_container Type = containerElement PARENT = root_window pos = (0.0, 0.0) Alpha = 0}
	createScreenElement \{Type = spriteElement PARENT = transition_container texture = White just = [Left top] pos = (0.0, 0.0) rgba = [0 0 0 255] Dims = (1280.0, 720.0) z_priority = 5000}
	if isWinPort
	else
		root_window :SetProps \{just = [Right top]}
		runScriptOnScreenElement Id = root_window fade_element Params = {pos = (1280.0, 0.0) Alpha = 1 Time = <transition_time> scale = (2.0, 1.0)}
		transition_container :doMorph Alpha = 1 Time = <transition_time>
	endif
endscript

script menu_transition_in_right \{transition_time = 0.125}
	root_window :SetProps \{just = [Left top]}
	root_window :SetProps \{Alpha = 1 scale = (2.0, 1.0) pos = (0.0, 0.0)}
	runScriptOnScreenElement Id = transition_container fade_element Params = {pos = (0.0, 0.0) Alpha = 0 Time = <transition_time>}
	if isWinPort
		root_window :doMorph Alpha = 1 scale = 1 pos = (0.0, 0.0) Time = <transition_time>
	else
		root_window :doMorph Alpha = 1 scale = 1 Time = <transition_time>
	endif
	Change \{transitions_locked = 0}
	destroy_menu_transition
endscript

script menu_transition_out_left \{transition_time = 0.125}
	destroy_menu_transition
	Change \{transitions_locked = 1}
	createScreenElement \{Id = transition_container Type = containerElement PARENT = root_window pos = (0.0, 0.0) Alpha = 0}
	createScreenElement \{Type = spriteElement PARENT = transition_container texture = White just = [Left top] pos = (0.0, 0.0) rgba = [0 0 0 255] Dims = (1280.0, 720.0) z_priority = 5000}
	root_window :SetProps \{just = [Left top]}
	if isWinPort
		runScriptOnScreenElement Id = root_window fade_element Params = {pos = (0.0, 0.0) Alpha = 1 Time = <transition_time> scale = (2.0, 1.0)}
		transition_container :doMorph pos = (0.0, 0.0) Alpha = 1 Time = <transition_time>
	else
		runScriptOnScreenElement Id = root_window fade_element Params = {Alpha = 1 Time = <transition_time> scale = (2.0, 1.0)}
		transition_container :doMorph Alpha = 1 Time = <transition_time>
	endif
endscript

script menu_transition_in_left \{transition_time = 0.125}
	if isWinPort
	else
		root_window :SetProps \{just = [Right top]}
		root_window :SetProps \{pos = (1280.0, 0.0) Alpha = 1 scale = (2.0, 1.0)}
		runScriptOnScreenElement Id = transition_container fade_element Params = {pos = (0.0, 0.0) Alpha = 0 Time = <transition_time>}
		root_window :doMorph Alpha = 1 scale = 1 pos = (1280.0, 0.0) Time = <transition_time>
	endif
	destroy_menu_transition
	Change \{transitions_locked = 0}
endscript

script fade_element \{Time = 0 pos = (0.0, 0.0) Alpha = 0 scale = 1}
	doMorph Id = <Id> Alpha = <Alpha> Time = <Time> pos = <pos> scale = <scale>
endscript
