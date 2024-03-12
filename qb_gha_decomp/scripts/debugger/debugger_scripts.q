
script OnDebuggerStartup 
	printf \{"Starting up debugger scripts..."}
	SendScriptFunctionsToDebugger
	DebuggerSendModeText
endscript

script OnDebuggerQuit 
	ClearSpritePreview
endscript

script DebuggerSendModeText 
	DebuggerGetModeText
	RunRemoteScript {
		ObjID = mouse_window
		ScriptName = SetTitle
		params = {
			('Mouse window: ' + <mode_text>)
		}
	}
endscript

script GetGameScriptFunctionList 
	ScriptFunctions = [
		{text = 'Toggle Mouse Select Mode' , ScriptName = DebuggerCycleSelectMode}
		{text = 'Preview Image' , ScriptName = RequestImagePreview}
		{text = 'Clear Previewed Images' , ScriptName = ClearSpritePreview}
		{text = 'Send Camera to Clipboard' , ScriptName = CopyCameraLocationToClipboard}
	]
	return <...>
endscript

script GetAndCombineScriptFunctionLists 
	GetGameScriptFunctionList
	if ScriptExists \{GetUserScriptFunctionList}
		GetUserScriptFunctionList
		if GotParam \{UserScriptFunctions}
			return {
				FunctionSets = [
					{SetName = 'User Scripts' Functions = <UserScriptFunctions>}
					{SetName = 'Game Scripts' Functions = <ScriptFunctions>}
				]
				Title = 'Script Function List'
				id = scriptfuncs
				ButtonScript = RunRemoteScript
			}
		endif
	endif
	return {
		FunctionSets = [
			{SetName = 'Game Scripts' Functions = <ScriptFunctions>}
		]
		Title = 'Script Function List'
		id = scriptfuncs
		ButtonScript = RunRemoteScript
	}
endscript

script SendScriptFunctionsToDebugger 
	GetAndCombineScriptFunctionLists
	RunRemoteScript ScriptName = CreateFunctionListWindow params = <...>
endscript

script DoSpriteHighlightEffect 
	SetScreenElementLock \{id = root_window Off}
	CreateScreenElement \{parent = root_window
		id = debugger_sprite_highlight
		type = ContainerElement
		tags = {
			hide_from_debugger
		}
		just = [
			left
			top
		]
		z_priority = 3000000}
	box_border_width = 3
	box_color = [128 30 128 128]
	resize_color = [128 80 0 128]
	CreateScreenElement {
		parent = debugger_sprite_highlight
		type = SpriteElement
		Pos = (<x> * (1.0, 0.0) + <y> * (0.0, 1.0))
		dims = (<w> * (1.0, 0.0) + <box_border_width> * (0.0, 1.0))
		rgba = <box_color>
		just = [left top]
	}
	CreateScreenElement {
		parent = debugger_sprite_highlight
		type = SpriteElement
		Pos = (<x> * (1.0, 0.0) + <y> * (0.0, 1.0) + <h> * (0.0, 1.0))
		dims = (<w> * (1.0, 0.0) + <box_border_width> * (0.0, 1.0))
		rgba = <box_color>
		just = [left bottom]
	}
	CreateScreenElement {
		parent = debugger_sprite_highlight
		type = SpriteElement
		Pos = (<x> * (1.0, 0.0) + <y> * (0.0, 1.0))
		dims = (<box_border_width> * (1.0, 0.0) + <h> * (0.0, 1.0))
		rgba = <box_color>
		just = [left top]
	}
	CreateScreenElement {
		parent = debugger_sprite_highlight
		type = SpriteElement
		Pos = (<x> * (1.0, 0.0) + <w> * (1.0, 0.0) + <y> * (0.0, 1.0))
		dims = (<box_border_width> * (1.0, 0.0) + <h> * (0.0, 1.0))
		rgba = <box_color>
		just = [RIGHT top]
	}
	resize_handle_x = 10
	resize_handle_y = 10
	if (<w> < <resize_handle_x>)
		resize_handle_x = <w>
	endif
	if (<h> < <resize_handle_y>)
		resize_handle_y = <h>
	endif
	CreateScreenElement {
		parent = debugger_sprite_highlight
		type = SpriteElement
		Pos = (<x> * (1.0, 0.0) + <w> * (1.0, 0.0) + <y> * (0.0, 1.0) + <h> * (0.0, 1.0))
		dims = (<resize_handle_x> * (1.0, 0.0) + <resize_handle_y> * (0.0, 1.0))
		rgba = <resize_color>
		just = [RIGHT bottom]
	}
	RunScriptOnScreenElement \{id = debugger_sprite_highlight debugger_sprite_highlight_flash}
endscript

script debugger_sprite_highlight_flash 
	begin
	DoMorph \{alpha = 0.5 time = 1}
	DoMorph \{alpha = 1 time = 1}
	repeat
endscript

script KillSpriteHighlightEffect 
	if ScreenElementExists \{id = debugger_sprite_highlight}
		DestroyScreenElement \{id = debugger_sprite_highlight}
	endif
endscript

script RequestImagePreview 
	RunRemoteScript \{ScriptName = GetOpenFileName
		DisableTimeout
		params = {
			typename = 'PNG Images'
			typefilter = '*.png'
		}
		LocalCallback = RequestImagePreview_GotFile}
endscript

script RequestImagePreview_GotFile 
	if GotParam \{filename}
		FormatText textname = args '-pp -f%a' a = <filename>
		RunRemoteScript {
			ScriptName = RunShellCommand
			DisableTimeout
			params = {
				command = 'bindproj && pngconv.exe'
				args = <args>
			}
			LocalCallback = RequestImagePreview_FileConverted
			callbackparams = {filename = <filename>}
		}
	else
		printf \{"No file selected!"}
	endif
endscript

script RequestImagePreview_FileConverted 
	if GetRelativePath path = (<callbackparams>.filename) dir = 'images' discard_extension
		GetFileNameFromPath path = <relativepath>
	else
		message = 'Sprite needs to be located in ' [proj_root] / Data / images ' or subdirectory thereof !!!!'
		printf <message>
		RunRemoteScript ScriptName = printf params = {<message>}
		return
	endif
	AddImageToGame <...>
endscript

script AddImageToGame 
	FormatText checksumname = texture_checksum <filename>
	FormatText checksumname = sprite_id 'debugger_preview_sprite_%s' s = <filename>
	if ScreenElementExists id = <sprite_id>
		ClearSpritePreview_KillPreviewElement id = <sprite_id>
	endif
	if NOT IsTextureInDictionary dictionary = sprite texture = <texture_checksum>
		LoadTexture <relativepath>
		need_unload = 1
	endif
	element_z = 20000
	if NOT ScreenElementExists \{id = debugger_sprite_preview_anchor}
		SetScreenElementLock \{id = root_window Off}
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = debugger_sprite_preview_anchor
			z_priority = <element_z>
		}
	else
		debugger_sprite_preview_anchor :getsingletag \{element_z}
	endif
	element_z = (<element_z> + 1)
	SetScreenElementLock \{id = debugger_sprite_preview_anchor Off}
	CreateScreenElement {
		type = SpriteElement
		parent = debugger_sprite_preview_anchor
		id = <sprite_id>
		texture = <texture_checksum>
		Pos = (200.0, 200.0)
		Scale = 1
		rgba = [128 128 128 128]
		z_priority = <element_z>
	}
	<sprite_id> :settags debugger_display_name = <filename>
	debugger_sprite_preview_anchor :settags element_z = <element_z>
	if GotParam \{need_unload}
		<sprite_id> :settags need_sprite_unload = <relativepath>
	endif
endscript

script ClearSpritePreview 
	if ScreenElementExists \{id = debugger_sprite_preview_anchor}
		GetScreenElementChildren \{id = debugger_sprite_preview_anchor}
		if GotParam \{children}
			i = 0
			GetArraySize <children>
			begin
			ClearSpritePreview_KillPreviewElement id = (<children> [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
		DestroyScreenElement \{id = debugger_sprite_preview_anchor}
	endif
endscript

script ClearSpritePreview_KillPreviewElement 
	if <id> :getsingletag need_sprite_unload
		printf \{"destroying element with sprite unload"}
		DestroyScreenElement id = <id>
		UnloadTexture <need_sprite_unload>
	else
		printf \{"destroying element with no sprite unload"}
		DestroyScreenElement id = <id>
	endif
endscript
