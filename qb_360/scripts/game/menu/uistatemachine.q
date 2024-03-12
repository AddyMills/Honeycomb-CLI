
script UI_Initialize 
	if ObjectExists \{id = ui}
		return
	endif
	<com_disabled> = 0
	if NOT IsCompositeObjectManagerEnabled
		<com_disabled> = 1
		CompositeObjectManagerSetEnable \{on}
	endif
	CreateCompositeObject \{params = {name = ui permanent} Components = [{Component = eventcache}{Component = statemachinemanager}] heap = frontend}
	if (<com_disabled> = 1)
		CompositeObjectManagerSetEnable \{Off}
	endif
endscript
