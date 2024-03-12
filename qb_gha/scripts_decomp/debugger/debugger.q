
script RunRemoteScript_ExecuteAndReturnResult \{LocalCallback = null}
	if NOT GotParam \{ScriptName}
		script_assert \{"Expected a ScriptName!"}
		return
	endif
	if GotParam \{ObjID}
		printf \{"Running game script requested by debugger on object..."}
		<ObjID> :<ScriptName> <params>
	else
		printf \{"Running game script requested by debugger ..."}
		<ScriptName> <params>
	endif
	if NOT ChecksumEquals a = <LocalCallback> b = null
		printf \{"Debugger requested a callback, sending..."}
		RemoveParameter \{params}
		RemoveParameter \{ObjID}
		RemoveParameter \{ScriptName}
		RunRemoteScript ScriptName = <LocalCallback> params = {<...> LocalCallback = null}
	endif
endscript

script CopyCameraLocationToClipboard 
	GetCamOffset
	SendToClipboard <...>
endscript

script SendToClipboard 
	RunRemoteScript ScriptName = printstruct params = {<...> SendToClipboard}
endscript

script SendToWindow 
	RunRemoteScript ScriptName = printstruct params = {<...> SendToWindow}
endscript
