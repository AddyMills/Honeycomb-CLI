
script create_model_from_appearance 
	modelappearancemembfunc \{func = getchecksum params = {field = required_character_type}}
	if NOT GotParam \{editable_list}
		build_master_editable_list character_type = <required_character_type>
		editable_list = <master_editable_list>
	endif
	modelclearallgeoms
	if GotParam \{remove_assets}
		process_cas_command cas_command = modelremoveasset editable_list = <editable_list>
	endif
	debugprintappearance
	process_cas_command cas_command = modelrunscript editable_list = <editable_list> target = disqualify_script
	process_cas_command cas_command = modeladdgeom editable_list = <editable_list>
	process_cas_command cas_command = geomreplacetexture editable_list = <editable_list>
	if GotParam \{skater_heap}
		printf "Skater_Heap = %d" d = <skater_heap>
		FormatText checksumname = heap_name 'SkaterHeap%i' i = <skater_heap>
		MemPushContext <heap_name>
	endif
	if GotParam \{skater_heap}
		MemPopContext
	endif
	modelexpandboundingsphere
	modelfinalize
endscript

script create_ped_model_from_appearance 
	modelclearallgeoms
	ForEachInEditableList \{do = modeladdgeom}
	modelremovepolys
	ForEachInEditableList \{do = geommodulatecolor}
	modelfinalize
endscript

script process_cas_command 
	ForEachIn <editable_list> do = <cas_command> params = <...>
endscript
