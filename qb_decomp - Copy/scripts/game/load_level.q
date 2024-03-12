fake_net = 0
AssertOnMissingScripts = 0
AssertOnMissingAssets = 1
AlwaysDump = 0
next_level_script = nullScript
ClassicModeNavMeshLoaded = 0
dont_call_zone_init_hack = 0
levels_initialize_goals = 1

script zone_init 
	Printf "zone_init: %s" S = <zone_string_name>
	if (<zone_string_name> = 'z_viewer')
		Printf \{"AssertOnMissingScripts = 0"}
		Change \{AssertOnMissingScripts = 0}
	endif
	MemPushContext \{TopDownHeap}
	formatText Textname = zone_editable_text Checksumname = zone_editable_list '%a%b' A = <zone_string_name> B = '_editable_list'
	if Globalexists Name = <zone_editable_list> Type = Array
		AddEditableList <zone_editable_list>
	endif
	MemPopContext
	MemPushContext \{BottomUpHeap}
	ParseNodeArray {
		queue
		zone_name = <zone_name>
		array_Name = <array_Name>
	}
	if gotParam \{sfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <sfx_zone_name>
			array_Name = <sfx_array_name>
		}
	endif
	if gotParam \{gfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <gfx_zone_name>
			array_Name = <gfx_array_name>
		}
	endif
	if gotParam \{lfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <lfx_zone_name>
			array_Name = <lfx_array_name>
		}
	endif
	if gotParam \{mfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <mfx_zone_name>
			array_Name = <mfx_array_name>
		}
	endif
	if NOT ($disable_global_pedestrians = 1)
		if NOT innetgame
			if IsCOIMInited
			endif
		endif
	endif
	MemPopContext
endscript

script zone_init_wait_run_setup 
	begin
	if NOT NodeArrayBusy
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if Scriptexists <zone_setup_script>
		<zone_setup_script>
	endif
endscript

script goal_pak_init 
	Printf "goal_pak_init: %s" S = <goal_pak_string_name>
	MemPushContext \{TopDownHeap}
	formatText Textname = goal_pak_editable_text Checksumname = goal_pak_editable_list '%a%b' A = <goal_pak_string_name> B = '_editable_list'
	if Globalexists Name = <goal_pak_editable_list> Type = Array
		AddEditableList <goal_pak_editable_list>
	endif
	MemPopContext
	MemPushContext <heap_name>
	ParseNodeArray {
		queue
		zone_name = <goal_pak_name>
		array_Name = <array_Name>
		Heap = <heap_name>
	}
	if gotParam \{sfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <sfx_goal_pak_name>
			array_Name = <sfx_array_name>
			Heap = <heap_name>
		}
	endif
	if gotParam \{gfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <gfx_goal_pak_name>
			array_Name = <gfx_array_name>
			Heap = <heap_name>
		}
	endif
	if gotParam \{lfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <lfx_goal_pak_name>
			array_Name = <lfx_array_name>
			Heap = <heap_name>
		}
	endif
	if gotParam \{mfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <mfx_goal_pak_name>
			array_Name = <mfx_array_name>
			Heap = <heap_name>
		}
	endif
	MemPopContext
endscript

script zone_deinit 
	Printf "zone_deinit: %s" S = <zone_string_name>
	ParseNodeArray abort array_Name = <array_Name>
	if gotParam \{sfx_array_name}
		ParseNodeArray abort array_Name = <sfx_array_name>
	endif
	if gotParam \{gfx_array_name}
		ParseNodeArray abort array_Name = <gfx_array_name>
	endif
	if gotParam \{lfx_array_name}
		ParseNodeArray abort array_Name = <lfx_array_name>
	endif
	if gotParam \{mfx_array_name}
		ParseNodeArray abort array_Name = <mfx_array_name>
	endif
	formatText Textname = zone_editable_text Checksumname = zone_editable_list '%a%b' A = <zone_string_name> B = '_editable_list'
	if Globalexists Name = <zone_editable_list> Type = Array
		RemoveEditableList <zone_editable_list>
	endif
endscript

script SetupCOIM 
	PushMemProfile \{'COIM'}
	InitCOIM {
		Size = <Size>
		BlockAlign = $Generic_COIM_BlockAlign
		COIM_Min_Scratch_Blocks
		$Generic_COIM_Params
	}
	PopMemProfile
endscript

script LOD_InLevelList 
	getArraySize <level_list>
	<Index> = 0
	begin
	formatText Checksumname = nameone '%s' S = <Name>
	formatText Checksumname = nametwo '%s' S = (<level_list> [<Index>])
	if (<nameone> = <nametwo>)
		Printf "Found %s in LOD list! So using lods..." S = <Name>
		return \{TRUE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script LoadLODPaks 
	MemPushContext \{BottomUpHeap}
	Printf "LoadLODPaks - %s" S = <Name>
	GetUppercaseString <Name>
	if LOD_InLevelList Name = <UppercaseString> level_list = <level_list>
		getArraySize <level_list>
		<Index> = 0
		begin
		Level = (<level_list> [<Index>])
		formatText Textname = lod_pak 'zones/%s_lod/%s_lod.pak' S = <Level>
		Printf "Loading - %s" S = <lod_pak>
		formatText Checksumname = lod_name '%s_lod' S = <Level>
		LoadPak <lod_pak>
		ParseNodeArray
		<Index> = (<Index> + 1)
		repeat <array_Size>
		Change LOD_LoadedPaks = <level_list>
	endif
	MemPopContext
endscript

script UnloadLODPaks 
	getArraySize \{$LOD_LoadedPaks}
	if NOT (<array_Size> = 0)
		<Index> = 0
		begin
		Level = ($LOD_LoadedPaks [<Index>])
		formatText Textname = lod_pak 'zones/%s_lod/%s_lod.pak' S = <Level>
		Printf "Unloading - %s" S = <lod_pak>
		unloadpak <lod_pak>
		<Index> = (<Index> + 1)
		repeat <array_Size>
		Change \{LOD_LoadedPaks = []}
	endif
endscript
