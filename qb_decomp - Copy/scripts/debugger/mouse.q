
script UpdateDebuggerMousePosition 
	if NOT ScreenelementExists \{Id = mouse_cursor}
		SetScreenElementLock \{Id = root_window OFF}
		createScreenElement \{Type = spriteElement PARENT = root_window Id = mouse_cursor texture = mouse_cursor rgba = [128 128 128 85] just = [Left top] z_priority = 3000003 tags = {hide_from_debugger}}
	endif
	DoScreenElementMorph Id = mouse_cursor pos = ((1.0, 0.0) * <X> + (0.0, 1.0) * <Y>)
endscript

script DestroyMouseCursor 
	if ScreenelementExists \{Id = mouse_cursor}
		DestroyScreenelement \{Id = mouse_cursor}
	endif
	DestroyMouseText
	killspritehighlighteffect
endscript

script DestroyMouseText 
	if ScreenelementExists \{Id = mouse_text}
		DestroyScreenelement \{Id = mouse_text}
	endif
endscript

script SetMouseText 
	if NOT ScreenelementExists \{Id = mouse_text}
		SetScreenElementLock \{Id = root_window OFF}
		createScreenElement \{Id = mouse_text PARENT = root_window Type = textElement just = [Center top] pos = (0.0, 0.0) font = text_A1 scale = 0.5 Text = "" rgba = [80 128 128 128] z_priority = 3000002 tags = {hide_from_debugger}}
	endif
	setScreenElementProps Id = mouse_text Text = <Text>
	DoScreenElementMorph Id = mouse_text pos = ((1.0, 0.0) * <X> + (0.0, 1.0) * <Y> + (8.0, 16.0))
endscript

script MouseClickEffect 
	doMorph \{Id = mouse_text scale = 1.1 Time = 0}
	Wait \{2 gameframes}
	doMorph \{Id = mouse_text scale = 1 Time = 0}
endscript

script DoMouseClickEffect 
	if ScreenelementExists \{Id = mouse_text}
		runScriptOnScreenElement \{Id = mouse_text MouseClickEffect}
	endif
endscript
