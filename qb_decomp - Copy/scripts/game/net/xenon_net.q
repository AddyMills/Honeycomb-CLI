xboxlive_num_results = 0

script xboxlive_menu_optimatch_results_stop 
	NetSessionfunc \{Obj = match func = stop_server_list}
	if gotParam \{xboxlive_num_results}
		xboxlive_menu_optimatch_results_end xboxlive_num_results = <xboxlive_num_results>
	else
		xboxlive_menu_optimatch_results_end \{xboxlive_num_results = 0}
	endif
endscript

script xboxlive_menu_optimatch_results_end 
	destroy_server_list_searching_dialog
	if gotParam \{xboxlive_num_results}
		Change xboxlive_num_results = <xboxlive_num_results>
	endif
	Printf "xboxlive_menu_optimatch_results_end : %d" D = ($xboxlive_num_results)
	if (($xboxlive_num_results) = 0)
		if CheckForSignIn
			if ScreenelementExists \{Id = search_results_container}
				create_server_list_create_match_dialog
			else
				Printf \{"our serverlist doesn't exist any more"}
			endif
		endif
	else
		spawnscript \{xboxlive_menu_optimatch_results_wait_and_focus}
	endif
endscript

script xboxlive_menu_optimatch_results_wait_and_focus 
	Wait \{1 gameframes}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if ScreenelementExists \{Id = search_results_vmenu}
		launchevent \{Type = focus Target = search_results_vmenu}
		setScreenElementProps \{Id = search_results_vmenu enable_pad_handling}
	endif
	if ScreenelementExists \{Id = search_results_container}
		getScreenElementChildren \{Id = search_results_container}
		if gotParam \{children}
			getArraySize \{children}
			I = 0
			begin
			if ScreenelementExists Id = (<children> [<I>])
				(<children> [<I>]) :getTags
				if NOT gotParam \{Highlight}
					(<children> [<I>]) :SetProps preserve_flip Alpha = 1.0
				endif
				<I> = (<I> + 1)
			endif
			repeat <array_Size>
		endif
	endif
endscript

script xboxlive_menu_optimatch_results_item_add 
	Printf \{"--- xboxlive_menu_optimatch_results_item_add"}
	printStruct <...>
	if (<num_players> < 2)
		Change xboxlive_num_results = (($xboxlive_num_results) + 1)
		if NOT ScreenelementExists \{Id = search_results_vmenu}
			Printf \{"Warning! tried to add a server when results menu not up"}
			return
		endif
		translate_server_checksums_to_strings {
			game_mode_checksum = <game_mode>
			num_songs_checksum = <num_songs>
			difficulty_checksum = <DIFFICULTY>
		}
		if ($match_type = Ranked)
			<host_text> = "HOST"
		else
			<host_text> = <server_name>
		endif
		createScreenElement \{Type = containerElement PARENT = search_results_vmenu Dims = (210.0, 30.0) pos = (0.0, 0.0) just = [Left top]}
		<container_element> = <Id>
		<Id> :SetProps {
			event_handlers = [
				{focus serverlist_focus Params = {PARENT = <Id>}}
				{unfocus serverlist_unfocus Params = {PARENT = <Id>}}
				{pad_choose net_choose_server Params = {Id = <server_id>}}
			]
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = Highlight_Bar
			texture = White
			Dims = (625.0, 30.0)
			rgba = ($online_light_blue)
			pos = (-4.0, 0.0)
			just = [Left top]
			z_priority = 4
		}
		<Id> :SetTags Highlight = 1
		<Id> :SetProps Alpha = 0.0
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = bookend_left
			texture = character_hub_hilite_bookend
			Dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			pos = (-5.0, -3.0)
			just = [Center top]
			z_priority = 4
		}
		<Id> :SetTags Highlight = 1
		<Id> :SetProps Alpha = 0.0
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = bookend_right
			texture = character_hub_hilite_bookend
			Dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			pos = (632.0, -3.0)
			just = [Center top]
			z_priority = 4
		}
		<Id> :SetTags Highlight = 1
		<Id> :SetProps Alpha = 0.0
		createScreenElement {
			Type = textElement
			PARENT = <container_element>
			font = text_A5
			local_id = server_name
			scale = (0.75, 0.65000004)
			rgba = ($online_light_blue)
			Text = <host_text>
			just = [Left top]
			internal_just = [Left top]
			z_priority = 10.0
		}
		<server_entry_id> = <Id>
		fit_text_into_menu_item Id = <Id> max_width = 200
		createScreenElement {
			Type = textElement
			PARENT = <container_element>
			font = text_A5
			local_id = mode
			scale = (0.75, 0.65000004)
			rgba = ($online_light_blue)
			Text = <game_mode_value>
			pos = (220.0, 0.0)
			just = [Left top]
			internal_just = [Left top]
			z_priority = 10.0
		}
		fit_text_into_menu_item Id = <Id> max_width = 200
		createScreenElement {
			Type = textElement
			PARENT = <container_element>
			font = text_A5
			local_id = songs
			scale = (0.75, 0.65000004)
			rgba = ($online_light_blue)
			Text = <num_songs_value>
			pos = (460.0, 0.0)
			just = [Left top]
			internal_just = [Left top]
			z_priority = 10.0
		}
		get_qos_color qos = <qos>
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = signal_bar1
			texture = White
			pos = (552.0, 26.5)
			Dims = (7.5, 5.0)
			rgba = <Color>
			just = [Left Bottom]
			z_priority = 10.0
			Alpha = 1.0
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = signal_bar2
			texture = White
			pos = (566.0, 26.5)
			Dims = (7.5, 10.0)
			rgba = <Color>
			just = [Left Bottom]
			z_priority = 10.0
			Alpha = 0.0
		}
		if (<qos> > 2.0)
			<Id> :SetProps Alpha = 1.0
		endif
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = signal_bar3
			texture = White
			pos = (580.0, 26.5)
			Dims = (7.5, 15.0)
			rgba = <Color>
			just = [Left Bottom]
			z_priority = 10.0
			Alpha = 0.0
		}
		if (<qos> > 4.0)
			<Id> :SetProps Alpha = 1.0
		endif
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = signal_bar4
			texture = White
			pos = (594.0, 26.5)
			Dims = (7.5, 20.0)
			rgba = <Color>
			just = [Left Bottom]
			z_priority = 10.0
			Alpha = 0.0
		}
		if (<qos> > 6.0)
			<Id> :SetProps Alpha = 1.0
		endif
		createScreenElement {
			Type = spriteElement
			PARENT = <container_element>
			local_id = signal_bar5
			texture = White
			pos = (608.0, 26.5)
			Dims = (7.5, 25.0)
			rgba = <Color>
			just = [Left Bottom]
			z_priority = 10.0
			Alpha = 0.0
		}
		if (<qos> > 8)
			<Id> :SetProps Alpha = 1.0
		endif
	endif
endscript

script translate_server_checksums_to_strings 
	printStruct <...>
	if gotParam \{game_mode_checksum}
		switch (<game_mode_checksum>)
			case p2_battle
			<game_mode_value> = "BATTLE"
			case p2_faceoff
			<game_mode_value> = "FACE-OFF"
			case p2_pro_faceoff
			<game_mode_value> = "PRO FACE-OFF"
			if gotParam \{difficulty_checksum}
				switch (<difficulty_checksum>)
					case EASY
					<game_mode_value> = "PRO FACE-OFF EASY"
					case MEDIUM
					<game_mode_value> = "PRO FACE-OFF MED"
					case HARD
					<game_mode_value> = "PRO FACE-OFF HARD"
					case EXPERT
					<game_mode_value> = "PRO FACE-OFF EXP"
				endswitch
			endif
			case p2_coop
			<game_mode_value> = "CO-OP"
		endswitch
	endif
	if gotParam \{num_songs_checksum}
		switch (<num_songs_checksum>)
			case num_1
			<num_songs_value> = "1"
			case num_3
			<num_songs_value> = "3"
			case num_5
			<num_songs_value> = "5"
			case num_7
			<num_songs_value> = "7"
		endswitch
	endif
	return num_songs_value = <num_songs_value> game_mode_value = <game_mode_value>
endscript

script serverlist_focus 
	Obj_Getid
	DoScreenElementMorph Id = {<objId> child = server_name} rgba = ($online_dark_purple)
	DoScreenElementMorph Id = {<objId> child = mode} rgba = ($online_dark_purple)
	DoScreenElementMorph Id = {<objId> child = songs} rgba = ($online_dark_purple)
	DoScreenElementMorph Id = {<objId> child = Highlight_Bar} Alpha = 1.0
	DoScreenElementMorph Id = {<objId> child = bookend_left} Alpha = 1.0
	DoScreenElementMorph Id = {<objId> child = bookend_right} Alpha = 1.0
endscript

script serverlist_unfocus 
	Obj_Getid
	DoScreenElementMorph Id = {<objId> child = server_name} rgba = ($online_light_blue)
	DoScreenElementMorph Id = {<objId> child = mode} rgba = ($online_light_blue)
	DoScreenElementMorph Id = {<objId> child = songs} rgba = ($online_light_blue)
	DoScreenElementMorph Id = {<objId> child = Highlight_Bar} Alpha = 0.0
	DoScreenElementMorph Id = {<objId> child = bookend_left} Alpha = 0.0
	DoScreenElementMorph Id = {<objId> child = bookend_right} Alpha = 0.0
endscript

script get_qos_color 
	Color = ($online_red)
	if (<qos> > 3)
		Color = ($online_orange)
	endif
	if (<qos> > 5)
		Color = ($online_yellow)
	endif
	if (<qos> > 7)
		Color = ($online_green)
	endif
	return Color = <Color>
endscript
