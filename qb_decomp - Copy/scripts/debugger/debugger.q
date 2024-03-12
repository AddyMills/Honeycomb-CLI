
script RunRemoteScript_ExecuteAndReturnResult \{LocalCallback = NULL}
	if NOT gotParam \{scriptname}
		Script_Assert \{"Expected a ScriptName!"}
		return
	endif
	if gotParam \{objId}
		Printf \{"Running game script requested by debugger on object..."}
		<objId> :<scriptname> <Params>
	else
		Printf \{"Running game script requested by debugger ..."}
		<scriptname> <Params>
	endif
	if NOT checksumequals A = <LocalCallback> B = NULL
		Printf \{"Debugger requested a callback, sending..."}
		removeParameter \{Params}
		removeParameter \{objId}
		removeParameter \{scriptname}
		RunRemoteScript scriptname = <LocalCallback> Params = {<...> LocalCallback = NULL}
	endif
endscript

script CopyCameraLocationToClipboard 
	GetCamOffset
	SendToClipboard <...>
endscript

script SendToClipboard 
	RunRemoteScript scriptname = printStruct Params = {<...> SendToClipboard}
endscript

script SendToWindow 
	RunRemoteScript scriptname = printStruct Params = {<...> SendToWindow}
endscript
