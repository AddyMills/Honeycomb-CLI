loaded_body_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]
loaded_body_paks = [
	NONE
	NONE
	NONE
	NONE
]
loaded_body_paks_ref_counts = [
	0
	0
	0
	0
]
loaded_anim_heaps = [
	heap_musician1_anim
	heap_musician2_anim
	heap_musician3_anim
	heap_musician4_anim
]
loaded_anim_paks = [
	NONE
	NONE
	NONE
	NONE
]
loaded_anim_paks_ref_counts = [
	0
	0
	0
	0
]
loaded_instrument_heaps = [
	heap_instrument1
	heap_instrument2
	heap_instrument3
	heap_instrument4
]
loaded_instrument_paks = [
	NONE
	NONE
	NONE
	NONE
]
loaded_instrument_paks_ref_counts = [
	0
	0
	0
	0
]
guitarist_body_pak_file = no_pak_id
guitarist_anim_pak_file = no_pak_id
guitarist_instrument_pak_file = no_pak_id
bassist_body_pak_file = no_pak_id
bassist_anim_pak_file = no_pak_id
bassist_instrument_pak_file = no_pak_id
vocalist_body_pak_file = no_pak_id
vocalist_anim_pak_file = no_pak_id
vocalist_instrument_pak_file = no_pak_id
drummer_body_pak_file = no_pak_id
drummer_anim_pak_file = no_pak_id
drummer_instrument_pak_file = no_pak_id
character_pak_crc_to_text = {
	GUITARIST = 'guitarist'
	BASSIST = 'bassist'
	VOCALIST = 'vocalist'
	DRUMMER = 'drummer'
	body = 'body'
	Anim = 'anim'
	instrument = 'instrument'
}
musician_arrays = {
	body = {
		pak_type = musician_body
		size_func = get_musician_body_size
		access_func = get_musician_body_struct
		Element = pak
	}
	Anim = {
		pak_type = musician_body
		size_func = get_musician_body_size
		access_func = get_musician_body_struct
		Element = anims_pak
	}
	instrument = {
		pak_type = musician_instrument
		size_func = get_musician_instrument_size
		access_func = get_musician_instrument_struct
		Element = pak
	}
}

script get_num_free_character_pak_slots 
	pak_type = ($character_pak_crc_to_text.<Type>)
	formatText Checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' P = <pak_type>
	getArraySize $<loaded_paks_ref_counts>
	Index = 0
	freeslots = (<freeslots> + 1)
	begin
	ref_count = ($<loaded_paks_ref_counts> [<Index>])
	if (<ref_count> = 0)
		freeslots = (<freeslots> + 1)
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	return freeslots = <freeslots>
endscript

script get_pak_filename 
	addparams ($musician_arrays.<Type>)
	<size_func>
	found = 0
	Index = 0
	begin
	<access_func> Index = <Index>
	if ((<info_struct>.desc_id) = <desc_id>)
		if structureContains Structure = (<info_struct>) <Element>
			pak_name = (<info_struct>.<Element>)
			found = 1
		else
			return found = 0 pak_index = <Index>
		endif
		break
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	if (<found> = 0)
		if ($Cheat_AirGuitar = 1)
			return found = 0 pak_index = <Index>
		endif
		printStruct <...>
		Printf \{"Pak filename not found"}
	endif
	return found = <found> pak_index = <Index> pak_name = <pak_name>
endscript

script get_pak_filename_using_filename_crc 
	addparams ($musician_arrays.<Type>)
	<size_func>
	found = 0
	Index = 0
	begin
	<access_func> Index = <Index>
	formatText Checksumname = filename_crc '%s' S = (<info_struct>.<Element>)
	if (<filename_crc> = <pak_crc>)
		if structureContains Structure = (<info_struct>) <Element>
			pak_name = (<info_struct>.<Element>)
			found = 1
		else
			return found = 0 pak_index = <Index>
		endif
		break
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	return found = <found> pak_index = <Index> pak_name = <pak_name>
endscript

script unload_musician_pak_file 
	pak_type = ($character_pak_crc_to_text.<Type>)
	formatText Checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' P = <pak_type>
	if NOT (<desc_id> = no_pak_id)
		find_loaded_pak_file desc_id = <desc_id> Type = <Type>
		if (<found> = 1)
			ref_count = ($<loaded_paks_ref_counts> [<pak_index>])
			new_ref_count = (<ref_count> - 1)
			setarrayelement Arrayname = <loaded_paks_ref_counts> globalArray Index = <pak_index> NewValue = <new_ref_count>
		else
			formatText Checksumname = loaded_paks 'loaded_%p_paks' P = <pak_type>
			formatText Checksumname = loaded_heaps 'loaded_%p_heaps' P = <pak_type>
			printStruct <...>
			printStruct ($<loaded_heaps>)
			printStruct ($<loaded_paks>)
			printStruct ($<loaded_paks_ref_counts>)
			Scriptassert \{"Loaded Asset not found"}
		endif
	endif
endscript

script force_unload_all_character_paks \{async = 0}
	force_unload_all_character_paks_by_type <...> Type = body
	force_unload_all_character_paks_by_type <...> Type = Anim
	force_unload_all_character_paks_by_type <...> Type = instrument
endscript

script force_unload_all_character_paks_by_type 
	pak_type = ($character_pak_crc_to_text.<Type>)
	formatText Checksumname = loaded_paks 'loaded_%p_paks' P = <pak_type>
	formatText Checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' P = <pak_type>
	getArraySize $<loaded_paks>
	Index = 0
	begin
	next_pak = ($<loaded_paks> [<Index>])
	if NOT (<next_pak> = NONE)
		get_pak_filename_using_filename_crc pak_crc = <next_pak> Type = <Type>
		if (<found> = 1)
			UnloadPakAsync pak_name = <pak_name> Heap = BottomUpHeap async = <async>
		endif
		setarrayelement Arrayname = <loaded_paks_ref_counts> globalArray Index = <Index> NewValue = 0
		setarrayelement Arrayname = <loaded_paks> globalArray Index = <Index> NewValue = NONE
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
endscript

script load_musician_pak_file \{startslot = 0}
	if NOT (gotParam Profile)
		Scriptassert \{"Need profile of musician type"}
	endif
	pak_type = ($character_pak_crc_to_text.<Type>)
	formatText Checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' P = <pak_type>
	formatText Checksumname = loaded_paks 'loaded_%p_paks' P = <pak_type>
	formatText Checksumname = loaded_heaps 'loaded_%p_heaps' P = <pak_type>
	addparams ($musician_arrays.<Type>)
	desc_id = ((<Profile>.<pak_type>).desc_id)
	get_pak_filename desc_id = <desc_id> Type = <Type>
	if (<found> = 0)
		return \{filename_crc = no_pak_id Assetcontext = 0 TRUE}
	endif
	formatText Checksumname = filename_crc '%s' S = <pak_name> AddToStringLookup = TRUE
	if (<Type> = body)
		get_musician_body_struct Index = <pak_index>
		Assetcontext = (<info_struct>.asset_context)
		Printf Channel = Animinfo "loaded pak has asset context %a ................" A = <Assetcontext>
	else
		Assetcontext = 0
	endif
	find_loaded_pak_file desc_id = <filename_crc> Type = <Type>
	if (<found> = 1)
		ref_count = ($<loaded_paks_ref_counts> [<pak_index>])
		if (<ref_count> = 0)
		endif
		new_ref_count = (<ref_count> + 1)
		setarrayelement Arrayname = <loaded_paks_ref_counts> globalArray Index = <pak_index> NewValue = <new_ref_count>
	else
		getArraySize $<loaded_paks_ref_counts>
		Index = <startslot>
		begin
		ref_count = ($<loaded_paks_ref_counts> [<Index>])
		if (<ref_count> = 0)
			unused_pak = ($<loaded_paks> [<Index>])
			setarrayelement Arrayname = <loaded_paks_ref_counts> globalArray Index = <Index> NewValue = 0
			setarrayelement Arrayname = <loaded_paks> globalArray Index = <Index> NewValue = NONE
			if NOT (<unused_pak> = NONE)
				get_pak_filename_using_filename_crc pak_crc = <unused_pak> Type = <Type>
				if (<found> = 1)
					UnloadPakAsync pak_name = <pak_name> Heap = BottomUpHeap async = <async>
				endif
			else
				Printf \{"slot not yet assigned...."}
			endif
			break
		endif
		Index = (<Index> + 1)
		repeat <array_Size>
		if (<Index> = <array_Size>)
			Scriptassert \{"Spare slot not found"}
		endif
		get_pak_filename desc_id = <desc_id> Type = <Type>
		if (<found> = 1)
			if NOT LoadPakAsync pak_name = <pak_name> Heap = ($<loaded_heaps> [<Index>]) async = <async>
				return \{FALSE}
			else
				setarrayelement Arrayname = <loaded_paks_ref_counts> globalArray Index = <Index> NewValue = 1
				setarrayelement Arrayname = <loaded_paks> globalArray Index = <Index> NewValue = <filename_crc>
			endif
		endif
	endif
	return filename_crc = <filename_crc> Assetcontext = <Assetcontext> TRUE
endscript

script find_loaded_pak_file 
	pak_type = ($character_pak_crc_to_text.<Type>)
	formatText Checksumname = loaded_paks 'loaded_%p_paks' P = <pak_type>
	getArraySize $<loaded_paks>
	found = 0
	Index = 0
	begin
	if (($<loaded_paks> [<Index>]) = <desc_id>)
		found = 1
		break
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	return found = <found> pak_index = <Index>
endscript

script dump_pak_info 
	dump_pak_info_by_type \{Type = body}
	dump_pak_info_by_type \{Type = Anim}
	dump_pak_info_by_type \{Type = instrument}
endscript

script dump_pak_info_by_type 
	pak_type = ($character_pak_crc_to_text.<Type>)
	Printf \{"------------------------------------------------------------"}
	Printf "dumping %t pak information" T = <pak_type>
	Printf \{" "}
	formatText Checksumname = loaded_paks_ref_counts 'loaded_%p_paks_ref_counts' P = <pak_type>
	formatText Checksumname = loaded_paks 'loaded_%p_paks' P = <pak_type>
	formatText Checksumname = loaded_heaps 'loaded_%p_heaps' P = <pak_type>
	Index = 0
	begin
	body_pak = ($<loaded_paks> [<Index>])
	ref_count = ($<loaded_paks_ref_counts> [<Index>])
	Printf "loaded_%t_paks[%a] = %b (%c) ...." A = <Index> B = <body_pak> C = <ref_count> T = <pak_type>
	Index = (<Index> + 1)
	repeat 4
endscript

script UnloadPakAsync 
	Printf "UnloadPakAsync : %s on heap %a async=%i" S = <pak_name> A = <Heap> I = <async>
	unloadpak <pak_name> Heap = <Heap>
	if (<async> = 1)
		begin
		if WaitUnloadPak <pak_name> noblock
			break
		endif
		Wait \{1 GameFrame}
		repeat
	else
		WaitUnloadPak <pak_name> block
	endif
endscript
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script LoadPakAsync 
	Printf "LoadPakAsync : %s on heap %a async=%i" S = <pak_name> A = <Heap> I = <async>
	begin
	if ($character_pak_loadpak_lock = 0)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	Change \{character_pak_loadpak_lock = 1}
	Change \{character_pak_loadpak_done = 0}
	Change \{character_pak_loadpak_failed = 0}
	GetContentFolderIndexFromFile <pak_name>
	if (<device> = Content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			Printf \{"Downloads_OpenContentFolder FAILED"}
			Change \{character_pak_loadpak_lock = 0}
			Change \{character_pak_loadpak_done = 0}
			return \{FALSE}
		endif
	endif
	if (<async> = 0)
		if (gotParam no_vram)
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device> no_vram
				Change \{character_pak_loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> Heap = <Heap> device = <device>
				Change \{character_pak_loadpak_failed = 1}
			endif
		endif
		Change \{character_pak_loadpak_done = 1}
	else
		if (gotParam no_vram)
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = NONE device = <device> no_vram
		else
			LoadPak <pak_name> Heap = <Heap> load_callback = LoadPakAsync_callback callback_data = NONE device = <device>
		endif
	endif
	begin
	if ($character_pak_loadpak_done = 1)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if (<device> = Content)
		downloads_closecontentfolder content_index = <content_index>
		if ($character_pak_loadpak_failed = 1)
			Change \{character_pak_loadpak_lock = 0}
			Change \{character_pak_loadpak_done = 0}
			return \{FALSE}
		endif
	endif
	Change \{character_pak_loadpak_lock = 0}
	Change \{character_pak_loadpak_done = 0}
	return \{TRUE}
endscript

script LoadPakAsync_callback 
	Printf \{"LoadPakAsync_callback"}
	printStruct <...>
	if NOT (<Result> = 0)
		Change \{character_pak_loadpak_done = 1}
		Change \{character_pak_loadpak_failed = 1}
	endif
	if gotParam \{End}
		Change \{character_pak_loadpak_done = 1}
	endif
endscript
