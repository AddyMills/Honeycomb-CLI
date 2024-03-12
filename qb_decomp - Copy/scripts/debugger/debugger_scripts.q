
script OnDebuggerStartup 
	Printf \{"Starting up debugger scripts..."}
	SendScriptFunctionsToDebugger
	debuggersendmodetext
endscript

script ondebuggerquit 
	ClearSpritePreview
endscript

script debuggersendmodetext 
	DebuggerGetModeText
	RunRemoteScript {
		objId = mouse_window
		scriptname = SetTitle
		Params = {
			('Mouse window: ' + <mode_text>)
		}
	}
endscript

script GetGameScriptFunctionList 
	ScriptFunctions = [
		{Text = 'Toggle Mouse Select Mode' , scriptname = DebuggerCycleSelectMode}
		{Text = 'Preview Image' , scriptname = RequestImagePreview}
		{Text = 'Clear Previewed Images' , scriptname = ClearSpritePreview}
		{Text = 'Send Camera to Clipboard' , scriptname = CopyCameraLocationToClipboard}
	]
	return <...>
endscript

script GetAndCombineScriptFunctionLists 
	GetGameScriptFunctionList
	if Scriptexists \{GetUserScriptFunctionList}
		GetUserScriptFunctionList
		if gotParam \{UserScriptFunctions}
			return {
				functionsets = [
					{setname = 'User Scripts' functions = <UserScriptFunctions>}
					{setname = 'Game Scripts' functions = <ScriptFunctions>}
				]
				title = 'Script Function List'
				Id = scriptfuncs
				ButtonScript = RunRemoteScript
			}
		endif
	endif
	return {
		functionsets = [
			{setname = 'Game Scripts' functions = <ScriptFunctions>}
		]
		title = 'Script Function List'
		Id = scriptfuncs
		ButtonScript = RunRemoteScript
	}
endscript

script SendScriptFunctionsToDebugger 
	GetAndCombineScriptFunctionLists
	RunRemoteScript scriptname = createfunctionlistwindow Params = <...>
endscript

script dospritehighlighteffect 
	SetScreenElementLock \{Id = root_window OFF}
	createScreenElement \{PARENT = root_window Id = debugger_sprite_highlight Type = containerElement tags = {hide_from_debugger} just = [Left top] z_priority = 3000000}
	box_border_width = 3
	box_color = [128 30 128 128]
	resize_color = [128 80 0 128]
	createScreenElement {
		PARENT = debugger_sprite_highlight
		Type = spriteElement
		pos = (<X> * (1.0, 0.0) + <Y> * (0.0, 1.0))
		Dims = (<W> * (1.0, 0.0) + <box_border_width> * (0.0, 1.0))
		rgba = <box_color>
		just = [Left top]
	}
	createScreenElement {
		PARENT = debugger_sprite_highlight
		Type = spriteElement
		pos = (<X> * (1.0, 0.0) + <Y> * (0.0, 1.0) + <H> * (0.0, 1.0))
		Dims = (<W> * (1.0, 0.0) + <box_border_width> * (0.0, 1.0))
		rgba = <box_color>
		just = [Left Bottom]
	}
	createScreenElement {
		PARENT = debugger_sprite_highlight
		Type = spriteElement
		pos = (<X> * (1.0, 0.0) + <Y> * (0.0, 1.0))
		Dims = (<box_border_width> * (1.0, 0.0) + <H> * (0.0, 1.0))
		rgba = <box_color>
		just = [Left top]
	}
	createScreenElement {
		PARENT = debugger_sprite_highlight
		Type = spriteElement
		pos = (<X> * (1.0, 0.0) + <W> * (1.0, 0.0) + <Y> * (0.0, 1.0))
		Dims = (<box_border_width> * (1.0, 0.0) + <H> * (0.0, 1.0))
		rgba = <box_color>
		just = [Right top]
	}
	resize_handle_x = 10
	resize_handle_y = 10
	if (<W> < <resize_handle_x>)
		resize_handle_x = <W>
	endif
	if (<H> < <resize_handle_y>)
		resize_handle_y = <H>
	endif
	createScreenElement {
		PARENT = debugger_sprite_highlight
		Type = spriteElement
		pos = (<X> * (1.0, 0.0) + <W> * (1.0, 0.0) + <Y> * (0.0, 1.0) + <H> * (0.0, 1.0))
		Dims = (<resize_handle_x> * (1.0, 0.0) + <resize_handle_y> * (0.0, 1.0))
		rgba = <resize_color>
		just = [Right Bottom]
	}
	runScriptOnScreenElement \{Id = debugger_sprite_highlight debugger_sprite_highlight_flash}
endscript

script debugger_sprite_highlight_flash 
	begin
	doMorph \{Alpha = 0.5 Time = 1}
	doMorph \{Alpha = 1 Time = 1}
	repeat
endscript

script killspritehighlighteffect 
	if ScreenelementExists \{Id = debugger_sprite_highlight}
		DestroyScreenelement \{Id = debugger_sprite_highlight}
	endif
endscript

script RequestImagePreview 
	RunRemoteScript \{scriptname = GetOpenFileName DisableTimeout Params = {typename = 'PNG Images' typefilter = '*.png'} LocalCallback = RequestImagePreview_GotFile}
endscript

script RequestImagePreview_GotFile 
	if gotParam \{FileName}
		formatText Textname = args '-pp -f%a' A = <FileName>
		RunRemoteScript {
			scriptname = RunShellCommand
			DisableTimeout
			Params = {
				Command = 'bindproj && pngconv.exe'
				args = <args>
			}
			LocalCallback = RequestImagePreview_FileConverted
			CallbackParams = {FileName = <FileName>}
		}
	else
		Printf \{"No file selected!"}
	endif
endscript

script RequestImagePreview_FileConverted 
	if GetRelativePath path = (<CallbackParams>.FileName) Dir = 'images' discard_extension
		GetFileNameFromPath path = <RelativePath>
	else
		message = 'Sprite needs to be located in ' [proj_root] / data / images ' or subdirectory thereof !!!!'
		Printf <message>
		RunRemoteScript scriptname = Printf Params = {<message>}
		return
	endif
	AddImageToGame <...>
endscript

script AddImageToGame 
	formatText Checksumname = texture_checksum <FileName>
	formatText Checksumname = sprite_id 'debugger_preview_sprite_%s' S = <FileName>
	if ScreenelementExists Id = <sprite_id>
		ClearSpritePreview_KillPreviewElement Id = <sprite_id>
	endif
	if NOT IsTextureInDictionary dictionary = sprite texture = <texture_checksum>
		LoadTexture <RelativePath>
		need_unload = 1
	endif
	element_z = 20000
	if NOT ScreenelementExists \{Id = debugger_sprite_preview_anchor}
		SetScreenElementLock \{Id = root_window OFF}
		createScreenElement {
			Type = containerElement
			PARENT = root_window
			Id = debugger_sprite_preview_anchor
			z_priority = <element_z>
		}
	else
		debugger_sprite_preview_anchor :GetSingleTag \{element_z}
	endif
	element_z = (<element_z> + 1)
	SetScreenElementLock \{Id = debugger_sprite_preview_anchor OFF}
	createScreenElement {
		Type = spriteElement
		PARENT = debugger_sprite_preview_anchor
		Id = <sprite_id>
		texture = <texture_checksum>
		pos = (200.0, 200.0)
		scale = 1
		rgba = [128 128 128 128]
		z_priority = <element_z>
	}
	<sprite_id> :SetTags debugger_display_name = <FileName>
	debugger_sprite_preview_anchor :SetTags element_z = <element_z>
	if gotParam \{need_unload}
		<sprite_id> :SetTags need_sprite_unload = <RelativePath>
	endif
endscript

script ClearSpritePreview 
	if ScreenelementExists \{Id = debugger_sprite_preview_anchor}
		getScreenElementChildren \{Id = debugger_sprite_preview_anchor}
		if gotParam \{children}
			I = 0
			getArraySize <children>
			begin
			ClearSpritePreview_KillPreviewElement Id = (<children> [<I>])
			I = (<I> + 1)
			repeat <array_Size>
		endif
		DestroyScreenelement \{Id = debugger_sprite_preview_anchor}
	endif
endscript

script ClearSpritePreview_KillPreviewElement 
	if <Id> :GetSingleTag need_sprite_unload
		Printf \{"destroying element with sprite unload"}
		DestroyScreenelement Id = <Id>
		UnloadTexture <need_sprite_unload>
	else
		Printf \{"destroying element with no sprite unload"}
		DestroyScreenelement Id = <Id>
	endif
endscript
