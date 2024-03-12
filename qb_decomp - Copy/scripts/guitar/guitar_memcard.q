max_memcard_filename_length = 15
SavingOrLoading = Saving
memcard_using_new_save_system = 1
memcard_default_title = 'Guitar Hero III: Legends of Rock'
memcard_content_name = "Progress"
memcard_file_name = "GH3Progress"
memcard_file_types = [
	{
		Name = Progress
		version = 48
		fixed_size = 262144
		menu_text = "GAME PROGRESS"
		menu_icon = logo_cas
		use_temp_pools = TRUE
		is_binary_file = FALSE
		num_bytes_per_frame = 102400
	}
]
memcard_folder_desc = {
	GuitarContent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				Name = Progress
				slots_reserve = 1
			}
		]
	}
}
WriteToBuffer_CompressionLookupTable_8 = [
]
WriteToBuffer_CompressionLookupTable_16 = [
]
MemcardDoneScript = nullScript
MemcardRetryScript = nullScript
MemcardSavingOrLoading = Saving
MemcardSuccess = FALSE

script memcard_choose_storage_device \{StorageSelectorForce = 0}
	printScriptInfo \{"==> memcard_choose_storage_device"}
	if ($memcard_using_new_save_system = 0)
		if NOT isxenon
			return
		endif
	endif
	if ($paused_for_hardware = 1)
		return
	endif
	create_checking_memory_card_screen
	Wait \{3 GameFrame}
	if ($memcard_using_new_save_system = 0)
		ShowStorageSelector Force = <Force> filetype = Progress
		begin
		if StorageSelectorFinished
			break
		else
			Wait \{1 GameFrame}
		endif
		repeat
	else
		NewShowStorageSelector Force = <StorageSelectorForce> filetype = Progress
	endif
endscript

script memcard_check_for_previously_used_folder 
	MC_WaitAsyncOpsFinished
	memcard_check_for_card
	if MC_HasActiveFolder
		Printf \{"Card didn't change, re-using old data!"}
		return \{found = 1 Corrupt = 0}
	else
		memcard_enum_folders
		MC_LoadTOCInActiveFolder \{validateprev}
		if (<Result> = TRUE)
			if MemCardFileExists \{FileName = $memcard_file_name filetype = Progress}
				Printf \{"Card re-inserted, re-using old data!"}
				return \{found = 1 Corrupt = 0}
			else
				return \{found = 1 Corrupt = 1}
			endif
		else
			if (<ErrorCode> = InvalidTOC)
				return \{found = 0 Corrupt = 0}
			else
				if MC_FolderExists \{FolderName = $memcard_content_name}
					return \{found = 1 Corrupt = 1}
				else
					return \{found = 0 Corrupt = 0}
				endif
			endif
		endif
	endif
endscript

script memcard_enum_folders 
	MC_EnumerateFolders
	if (<Result> = FALSE)
		memcard_error \{error = create_storagedevice_warning_menu}
	endif
endscript

script memcard_check_for_existing_save 
	if ($memcard_using_new_save_system = 0)
		if ISPS3
			return \{found = 0}
		endif
		memcard_choose_storage_device
		GetMemCardDirectoryListing \{filetype = Progress}
		if (<totalthps4filesoncard> = 1)
			Printf \{"Found save file"}
			return \{found = 1 Corrupt = 0}
		endif
	else
		memcard_enum_folders
		MC_WaitAsyncOpsFinished
		memcard_check_for_card
		if MC_FolderExists \{FolderName = $memcard_content_name}
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			MC_LoadTOCInActiveFolder
			if (<Result> = FALSE)
				return \{found = 1 Corrupt = 1}
			endif
			if MemCardFileExists \{FileName = $memcard_file_name filetype = Progress}
				return \{found = 1 Corrupt = 0}
			else
				return \{found = 1 Corrupt = 1}
			endif
		endif
	endif
	return \{found = 0 Corrupt = 0}
endscript

script memcard_wait_for_timer \{Time = 3.0}
	begin
	if TimeGreaterThan <Time>
		break
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script memcard_save_file \{overwriteconfirmed = 0}
	Printf \{"==> memcard_save_file"}
	Change \{MemcardSavingOrLoading = Saving}
	if ($memcard_using_new_save_system = 0)
		if ISPS3
			return
		endif
		SetSaveFileName \{filetype = Progress Name = "GH3Progress"}
		if NOT SaveToMemoryCard \{filetype = Progress}
			printStruct <...>
			return \{failed = 1}
		endif
	else
		memcard_check_for_card
		ResetTimer
		<Overwrite> = 0
		if MC_FolderExists \{FolderName = $memcard_content_name}
			if (<overwriteconfirmed> = 1)
				<Overwrite> = 1
				create_overwrite_menu
				MC_SetActiveFolder \{FolderName = $memcard_content_name}
			else
				Goto \{create_confirm_overwrite_menu}
			endif
		else
			if ISPS3
				if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
					memcard_error \{error = create_out_of_space_menu}
				endif
			endif
			create_save_menu
			MC_CreateFolder \{Name = $memcard_content_name desc = GuitarContent}
			if (<Result> = FALSE)
				if (<ErrorCode> = OutOfSpace)
					memcard_error \{error = create_out_of_space_menu}
				else
					memcard_error \{error = create_save_failed_menu}
				endif
			endif
		endif
		memcard_pre_save_progress
		SaveToMemoryCard \{FileName = $memcard_file_name filetype = Progress usepaddingslot = Always}
		if (<Result> = FALSE)
			if (<ErrorCode> = OutOfSpace)
				memcard_error \{error = create_out_of_space_menu}
			else
				if (<Overwrite> = 1)
					memcard_error \{error = create_overwrite_failed_menu}
				else
					memcard_error \{error = create_save_failed_menu}
				endif
			endif
		endif
		Change \{MemcardSuccess = TRUE}
		memcard_wait_for_timer
		if (<Overwrite> = 1)
			create_overwrite_success_menu
		else
			create_save_success_menu
		endif
		Wait \{1 Seconds}
	endif
	memcard_sequence_quit
endscript

script memcard_delete_file 
	Printf \{"==> memcard_delete_file"}
	if ($memcard_using_new_save_system = 0)
		if NOT DeleteMemCardFile \{filetype = Progress}
			destroy_popup_warning_menu
			create_delete_failed_menu
		else
			destroy_popup_warning_menu
			create_delete_success_menu
		endif
	else
		create_delete_file_menu
		MC_WaitAsyncOpsFinished
		if ISPS3
			fade_overlay_on
			MC_StartPS3ForceDelete
			begin
			if MC_IsPS3ForceDeleteFinished
				break
			endif
			Wait \{1 gameframes}
			repeat
			fade_overlay_off
		else
			ResetTimer
			MC_DeleteFolder \{FolderName = $memcard_content_name}
			if (<Result> = FALSE)
				memcard_error \{error = create_delete_failed_menu}
			endif
			memcard_wait_for_timer
			create_delete_success_menu
			Wait \{1 Seconds}
		endif
	endif
	memcard_check_for_card
	memcard_sequence_retry
endscript

script memcard_load_file \{LoadConfirmed = 0}
	Printf \{"==> memcard_load_file"}
	Change \{MemcardSavingOrLoading = LOADING}
	if ($memcard_using_new_save_system = 0)
		if ISPS3
			return
		endif
		SetSaveFileName \{filetype = Progress Name = "GH3Progress"}
		getglobaltags \{globaltag_checksum Params = globaltag_checksum}
		oldglobaltag_checksum = <globaltag_checksum>
		if NOT LoadFromMemoryCard \{filetype = Progress}
			printStruct <...>
			if gotParam \{CorruptedData}
				return \{CorruptedData = 1}
			else
				printStruct <...>
				return \{failed = 1}
			endif
		endif
	else
		MC_WaitAsyncOpsFinished
		memcard_check_for_card
		ResetTimer
		if MC_FolderExists \{FolderName = $memcard_content_name}
			if (<LoadConfirmed> = 1)
				MC_SetActiveFolder \{FolderName = $memcard_content_name}
			else
				Goto \{create_confirm_load_menu}
			endif
		else
			memcard_error \{error = create_no_save_found_menu}
		endif
		MC_SetActiveFolder \{FolderName = $memcard_content_name}
		create_load_file_menu
		LoadFromMemoryCard \{FileName = $memcard_file_name filetype = Progress}
		if (<Result> = FALSE)
			if (<ErrorCode> = Corrupt)
				memcard_error \{error = create_corrupted_data_menu}
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
		Change \{MemcardSuccess = TRUE}
		memcard_wait_for_timer
		create_load_success_menu
		memcard_post_load_progress
	endif
	Wait \{1 Seconds}
	memcard_sequence_quit
endscript

script memcard_pre_save_progress 
	<do_update> = 0
	if ($game_mode = p1_career)
		<do_update> = 1
		elseif ($game_mode = p2_career)
		<do_update> = 1
	endif
	if (<do_update> = 1)
		if ($progression_pop_count = 1)
			progression_push_current
			progression_pop_current
		endif
	endif
endscript

script memcard_post_load_progress 
	restore_options_from_global_tags
	scan_globaltag_downloads
endscript

script memcard_cleanup_messages 
	destroy_popup_warning_menu
endscript

script memcard_sequence_generic_done 
	if ($MemcardSavingOrLoading = Saving)
		if ($MemcardSuccess = TRUE)
			Printf \{"==> Memcard sequence finished (save success)"}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_save_success play_sound = 0}
		else
			Printf \{"==> Memcard sequence finished (save failed)"}
			MC_SetActiveFolder \{FolderIndex = -1}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_save_failed}
		endif
	else
		if ($MemcardSuccess = TRUE)
			Printf \{"==> Memcard sequence finished (load success)"}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_load_success play_sound = 0}
		else
			Printf \{"==> Memcard sequence finished (load failed)"}
			MC_SetActiveFolder \{FolderIndex = -1}
			ui_flow_manager_respond_to_action \{action = memcard_sequence_load_failed}
		endif
	endif
endscript

script memcard_sequence_retry 
	Printf \{"memcard_sequence_retry"}
	Goto MemcardRetryScript Params = <...>
endscript

script memcard_disable_saves_and_quit 
	setGlobalTags \{user_options Params = {autosave = 0}}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 
	Printf \{"memcard_sequence_quit"}
	mark_safe_for_shutdown
	Goto MemcardDoneScript Params = <...>
endscript

script memcard_check_for_card 
	if NOT CardIsInSlot
		Goto \{create_storagedevice_warning_menu}
	endif
endscript

script memcard_error 
	Printf \{"memcard_error"}
	Requireparams \{[error] All}
	memcard_check_for_card
	Goto <error> Params = <Params>
endscript

script memcard_sequence_cleanup_generic 
	MC_WaitAsyncOpsFinished
	memcard_cleanup_messages
	Change \{MemcardDoneScript = nullScript}
	Change \{MemcardRetryScript = nullScript}
endscript

script memcard_validate_card_data \{StorageSelectorForce = 0 validateprev = 0}
	memcard_choose_storage_device StorageSelectorForce = <StorageSelectorForce>
	memcard_check_for_card
	if (<validateprev> = 1)
		memcard_check_for_previously_used_folder
	else
		memcard_check_for_existing_save
	endif
	Requireparams \{[found Corrupt] All}
	if (<Corrupt> = 1)
		memcard_error \{error = create_corrupted_data_menu}
	endif
	return found = <found>
endscript

script memcard_sequence_begin_bootup 
	SpawnScriptNOw memcard_sequence_begin_bootup_logic Params = <...>
endscript

script memcard_sequence_begin_save 
	SpawnScriptNOw memcard_sequence_begin_save_logic Params = <...>
endscript

script memcard_sequence_begin_autosave 
	SpawnScriptNOw memcard_sequence_begin_autosave_logic Params = <...>
endscript

script memcard_sequence_begin_load 
	SpawnScriptNOw memcard_sequence_begin_load_logic Params = <...>
endscript

script memcard_sequence_begin_bootup_logic 
	Printf \{"memcard_sequence_begin_bootup"}
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	Change \{MemcardSavingOrLoading = Saving}
	Change \{MemcardSuccess = FALSE}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> validateprev = 0
	if (<found> = 1)
		Goto \{memcard_load_file Params = {LoadConfirmed = 1}}
	else
		Goto \{memcard_save_file}
	endif
endscript

script memcard_sequence_begin_save_logic \{StorageSelectorForce = 1}
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = Saving}
	Change \{MemcardSuccess = FALSE}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> validateprev = 0
	Goto \{memcard_save_file}
endscript

script memcard_sequence_begin_autosave_logic 
	disable_pause
	mark_unsafe_for_shutdown
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	Change \{MemcardSavingOrLoading = Saving}
	Change \{MemcardSuccess = FALSE}
	getglobaltags \{user_options}
	if (<autosave> = 0)
		Printf \{"Aborting autosave due to option being off"}
		Goto \{memcard_sequence_quit}
	endif
	if NOT CardIsInSlot
		Goto \{create_storagedevice_warning_menu}
	endif
	memcard_validate_card_data \{StorageSelectorForce = 0 validateprev = 1}
	if (<found> = 1)
		Goto \{memcard_save_file Params = {overwriteconfirmed = 1}}
	else
		memcard_sequence_retry
	endif
endscript

script memcard_sequence_begin_load_logic \{StorageSelectorForce = 1}
	Change \{MemcardDoneScript = memcard_sequence_generic_done}
	Change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	Change \{MemcardSavingOrLoading = LOADING}
	Change \{MemcardSuccess = FALSE}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> validateprev = 0
	Goto \{memcard_load_file}
endscript
