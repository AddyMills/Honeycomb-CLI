
script create_online_song_select_menu version = gh3 {
		menu_id = online_song_select_menu
		vmenu_id = online_song_select_vmenu
		pad_back_script = check_back_action_song_select
		pos = (($Menu_pos) - (200.0, 0.0))
	}
	online_song_select_event_handlers = [
		{pad_back <pad_back_script>}
	]
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) Menu_pos = <pos> event_handlers = <online_song_select_event_handlers>
	array_entry = 0
	get_songlist_size
	begin
	get_songlist_checksum Index = <array_entry>
	get_song_struct Song = <song_checksum>
	if ((<song_struct>.version) = <version>)
		formatText Checksumname = temp_id 'song_number_%n' N = <array_entry>
		get_song_title Song = <song_checksum>
		title = <Song_Title>
		createScreenElement {
			Type = textElement
			PARENT = <vmenu_id>
			Id = <temp_id>
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = <title>
			just = [Left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose local_player_song_selection Params = {selection_value = <array_entry>}}
			]
		}
		check_for_flagged_songs {
			Id = <temp_id>
			entry = <array_entry>
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	launchevent Type = focus Target = <vmenu_id>
	get_number_of_song_selections
	if (<song_selections> = 0)
		Change \{ChooseTieBreaker = 1}
	endif
endscript

script destroy_online_song_select_menu 
	destroy_menu \{menu_id = online_song_select_menu}
	destroy_menu_backdrop
endscript

script check_forward_action_song_select 
	if (($LocalPlayerSetlistFinalized) = 1)
		ui_flow_manager_respond_to_action \{action = selected_all_songs}
	else
		local_player_song_selection <...>
	endif
endscript

script check_back_action_song_select 
	if (($LocalPlayerSongSelections) = 0)
		check_for_final_song_selection
		check_tie_breaker_is_selected
		if ((<can_select_final_song> = TRUE) && (<tie_breaker_selected> = TRUE))
			local_player_song_deselection
		else
			SendNetMessage \{Type = song_selection song_index = -1 selection_value = 0 final_selection = -1 tie_breaker_selection = -1 menu_jump = -1}
			clear_setlists
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
	else
		local_player_song_deselection
	endif
endscript

script network_player_back_to_guitar_select 
	clear_setlists
	ui_flow_manager_respond_to_action \{action = go_back_to_guitar_select}
endscript

script local_player_song_selection 
	if (($ChooseTieBreaker) = 1)
		check_tie_breaker_is_selected
		if (<tie_breaker_selected> = FALSE)
			setarrayelement Arrayname = FinalSongList globalArray Index = (($NumberOfSongsInfo [($NumberOfSongs [($MenuControl)].Value)].Value) - 1) NewValue = <selection_value>
			tie_breaker = 1
			Final = 1
			Change \{LocalPlayerSetlistFinalized = 1}
		endif
		check_final_setlist_ready
		ui_flow_manager_respond_to_action \{action = selected_all_songs}
	else
		if isHost
			setarrayelement Arrayname = FinalSongList globalArray Index = ($LocalPlayerSongSelections * 2) NewValue = <selection_value>
		else
			setarrayelement Arrayname = FinalSongList globalArray Index = (($LocalPlayerSongSelections * 2) + 1) NewValue = <selection_value>
		endif
		setarrayelement Arrayname = LocalPlayerSongList globalArray Index = ($LocalPlayerSongSelections) NewValue = <selection_value>
		tie_breaker = 0
		Change LocalPlayerSongSelections = ($LocalPlayerSongSelections + 1)
		get_number_of_song_selections
		if (<song_selections> = ($LocalPlayerSongSelections))
			check_for_final_song_selection
			if (<can_select_final_song> = TRUE)
				Change \{ChooseTieBreaker = 1}
				Final = 0
			else
				Change \{LocalPlayerSetlistFinalized = 1}
				Final = 1
				check_final_setlist_ready
				ui_flow_manager_respond_to_action \{action = selected_all_songs}
			endif
		else
			Final = 0
		endif
	endif
	SendNetMessage {
		Type = song_selection
		song_index = <selection_value>
		selection_value = 1
		final_selection = <Final>
		tie_breaker_selection = <tie_breaker>
		menu_jump = 0
	}
	local_player_flag_selected_song <...>
endscript

script local_player_song_deselection 
	if (($LocalPlayerSetlistFinalized) = 1)
		Change \{LocalPlayerSetlistFinalized = 0}
	endif
	check_tie_breaker_is_selected
	if ((($ChooseTieBreaker) = 1) && (<tie_breaker_selected> = TRUE))
		tie_breaker = 1
		Index = ($FinalSongList [(($NumberOfSongsInfo [($NumberOfSongs [($MenuControl)].Value)].Value) -1)])
		setarrayelement Arrayname = FinalSongList globalArray Index = (($NumberOfSongsInfo [($NumberOfSongs [($MenuControl)].Value)].Value) -1) NewValue = -1
	else
		Printf \{"deselecting song"}
		if ((<tie_breaker_selected> = FALSE) && (($ChooseTieBreaker) = 1))
			Change \{ChooseTieBreaker = 0}
		endif
		tie_breaker = 0
		Change LocalPlayerSongSelections = ($LocalPlayerSongSelections - 1)
		if isHost
			setarrayelement Arrayname = FinalSongList globalArray Index = ($LocalPlayerSongSelections * 2) NewValue = -1
		else
			setarrayelement Arrayname = FinalSongList globalArray Index = (($LocalPlayerSongSelections * 2) + 1) NewValue = -1
		endif
		song_index = ($LocalPlayerSongList [($LocalPlayerSongSelections)])
		setarrayelement Arrayname = LocalPlayerSongList globalArray Index = ($LocalPlayerSongSelections) NewValue = -1
		Index = <song_index>
	endif
	SendNetMessage {
		Type = song_selection
		song_index = -1
		selection_value = -1
		final_selection = 0
		tie_breaker_selection = <tie_breaker>
		menu_jump = 0
	}
	local_player_unflag_selected_song selection_value = <Index>
endscript

script network_player_song_selection 
	if (<tie_breaker_selection> = 1)
		setarrayelement Arrayname = FinalSongList globalArray Index = (($NumberOfSongsInfo [($NumberOfSongs [($MenuControl)].Value)].Value) -1) NewValue = <song_index>
		tie_breaker = TRUE
	else
		if isHost
			setarrayelement Arrayname = FinalSongList globalArray Index = (($RemotePlayerSongSelections * 2) + 1) NewValue = <song_index>
		else
			setarrayelement Arrayname = FinalSongList globalArray Index = ($RemotePlayerSongSelections * 2) NewValue = <song_index>
		endif
		setarrayelement Arrayname = RemotePlayerSongList globalArray Index = ($RemotePlayerSongSelections) NewValue = <song_index>
		tie_breaker = FALSE
	endif
	if (<final_selection> = 1)
		Change \{RemotePlayerSetlistFinalized = 1}
		check_final_setlist_ready
	endif
	if (($ui_flow_manager_state [0]) = final_set_list_fs)
		network_player_change_final_setlist Type = Select tie_breaker_song = <tie_breaker>
	else
		network_player_flag_selected_song <...>
	endif
	if NOT (<tie_breaker> = TRUE)
		Change RemotePlayerSongSelections = ($RemotePlayerSongSelections + 1)
	endif
endscript

script network_player_song_deselection 
	if (($RemotePlayerSetlistFinalized) = 1)
		Change \{RemotePlayerSetlistFinalized = 0}
	endif
	if (<tie_breaker_selection> = 1)
		Index = ($FinalSongList [(($NumberOfSongsInfo [($NumberOfSongs [($MenuControl)].Value)].Value) -1)])
		setarrayelement Arrayname = FinalSongList globalArray Index = (($NumberOfSongsInfo [($NumberOfSongs [($MenuControl)].Value)].Value) -1) NewValue = -1
		tie_breaker = TRUE
	else
		Change RemotePlayerSongSelections = ($RemotePlayerSongSelections - 1)
		if isHost
			setarrayelement Arrayname = FinalSongList globalArray Index = (($RemotePlayerSongSelections * 2) + 1) NewValue = -1
		else
			setarrayelement Arrayname = FinalSongList globalArray Index = ($RemotePlayerSongSelections * 2) NewValue = -1
		endif
		Index = ($RemotePlayerSongList [($RemotePlayerSongSelections)])
		setarrayelement Arrayname = RemotePlayerSongList globalArray Index = ($RemotePlayerSongSelections) NewValue = -1
		tie_breaker = FALSE
	endif
	if (($ui_flow_manager_state [0]) = final_set_list_fs)
		network_player_change_final_setlist Type = unselect tie_breaker_song = <tie_breaker>
	else
		network_player_unflag_selected_song song_index = <Index>
	endif
endscript

script network_player_update_song_select 
	if (<menu_jump> = 1)
		if (($ui_flow_manager_state [0]) = online_song_select_fs)
			ui_flow_manager_respond_to_action \{action = selected_all_songs}
		endif
	endif
	if (<menu_jump> = -1)
		network_player_back_to_guitar_select
	endif
endscript

script check_for_matching_song 
	if (<local> = TRUE)
		getArraySize \{$RemotePlayerSongList}
		array_count = 0
		begin
		if (($RemotePlayerSongList [<array_count>]) = <Index>)
			return \{found_match = TRUE}
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
	else
		getArraySize \{$LocalPlayerSongList}
		array_count = 0
		begin
		if (($LocalPlayerSongList [<array_count>]) = <Index>)
			return \{found_match = TRUE}
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
	endif
endscript

script check_songlist_for_song 
	<array_count> = 0
	getArraySize $<global_array>
	begin
	if (($<global_array> [<array_count>]) = <song_index>)
		found = TRUE
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	return found_song = <found>
endscript

script check_for_flagged_songs 
	found_local = FALSE
	found_remote = FALSE
	found_final = FALSE
	check_songlist_for_song song_index = <entry> global_array = FinalSongList
	<found_final> = <found_song>
	if (<found_final> = TRUE)
		formatText Checksumname = song_number 'song_number_%n' N = <entry>
		get_songlist_checksum Index = <entry>
		get_song_title Song = <song_checksum>
		title = <Song_Title>
		check_songlist_for_song song_index = <entry> global_array = LocalPlayerSongList
		<found_local> = <found_song>
		check_songlist_for_song song_index = <entry> global_array = RemotePlayerSongList
		<found_remote> = <found_song>
		printStruct <...>
		if ((<found_local> = FALSE) && (<found_remote> = FALSE))
			formatText Textname = new_song_text "*** %s ***" S = <title>
			elseif ((<found_local> = TRUE) && (<found_remote> = FALSE))
			formatText Textname = new_song_text "*** %s" S = <title>
			elseif ((<found_local> = FALSE) && (<found_remote> = TRUE))
			formatText Textname = new_song_text "%s ***" S = <title>
			elseif ((<found_local> = TRUE) && (<found_remote> = TRUE))
			formatText Textname = new_song_text "*** %s ***" S = <title>
		endif
		<Id> :SetProps Text = <new_song_text>
	endif
endscript

script local_player_flag_selected_song 
	if ScreenelementExists \{Id = online_song_select_vmenu}
		check_for_matching_song Index = <selection_value> local = TRUE
		found = <found_match>
		formatText Checksumname = song_number 'song_number_%n' N = <selection_value>
		get_songlist_checksum Index = <selection_value>
		get_song_title Song = <song_checksum>
		title = <Song_Title>
		if (found = TRUE)
			formatText Textname = new_song_text "*** %s ***" S = <title>
		else
			formatText Textname = new_song_text "*** %s" S = <title>
		endif
		<song_number> :SetProps Text = <new_song_text>
	endif
endscript

script local_player_unflag_selected_song 
	if ScreenelementExists \{Id = online_song_select_vmenu}
		check_for_matching_song Index = <selection_value> local = TRUE
		found = <found_match>
		formatText Checksumname = song_number 'song_number_%n' N = <selection_value>
		get_songlist_checksum Index = <selection_value>
		get_song_title Song = <song_checksum>
		title = <Song_Title>
		if (found = TRUE)
			formatText Textname = new_song_text "%s ***" S = <title>
		else
			formatText Textname = new_song_text "%s" S = <title>
		endif
		<song_number> :SetProps Text = <new_song_text>
	endif
endscript

script network_player_flag_selected_song 
	check_for_matching_song Index = <song_index> local = FALSE
	found = <found_match>
	formatText Checksumname = song_number 'song_number_%n' N = <song_index>
	get_songlist_checksum Index = <song_index>
	get_song_title Song = <song_checksum>
	title = <Song_Title>
	if (found = TRUE)
		formatText Textname = new_song_text "*** %s ***" S = <title>
	else
		formatText Textname = new_song_text "%s ***" S = <title>
	endif
	<song_number> :SetProps Text = <new_song_text>
endscript

script network_player_unflag_selected_song 
	check_for_matching_song Index = <song_index> local = FALSE
	found = <found_match>
	formatText Checksumname = song_number 'song_number_%n' N = <song_index>
	get_songlist_checksum Index = <song_index>
	get_song_title Song = <song_checksum>
	title = <Song_Title>
	if (found = TRUE)
		formatText Textname = new_song_text "*** %s" S = <title>
	else
		formatText Textname = new_song_text "%s" S = <title>
	endif
	<song_number> :SetProps Text = <new_song_text>
endscript

script check_tie_breaker_is_selected 
	if (($FinalSongList [(($NumberOfSongsInfo [($NumberOfSongs [($MenuControl)].Value)].Value) -1)]) > -1)
		return \{tie_breaker_selected = TRUE}
	else
		return \{tie_breaker_selected = FALSE}
	endif
endscript
