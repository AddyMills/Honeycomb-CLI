null_flow_state = {
	is_null
	actions = [
		{
			action = null_action
			flow_state = null_flow_state
		}
	]
}
ui_flow_manager_state = [
	main_menu_fs
	null_flow_state
]
previous_flow_manager_state = [
	null_flow_state
	null_flow_state
]
ui_flow_manager_under = [
	null_flow_state
	null_flow_state
]
menu_flow_locked = 0
menu_flow_play_sound = 1

script ui_flow_manager_respond_to_action \{device_num = 0 player = 1 create_params = {} destroy_params = {} func_params = {} flow_state_func_params = {} play_sound = 1}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if NOT ((<player> = 1) || (<player> = 2))
		scriptassert \{"Player must be equal to 1 or 2"}
	endif
	player_index = (<player> - 1)
	current_flow_state_name = ($ui_flow_manager_state [<player_index>])
	current_flow_state = (<current_flow_state_name>)
	new_state_name = <current_flow_state_name>
	previous_flow_state_name = ($previous_flow_manager_state [<player_index>])
	previous_flow_state = (<previous_flow_state_name>)
	under_flow_state_name = ($ui_flow_manager_under [<player_index>])
	under_flow_state = (<under_flow_state_name>)
	null_flow_state_name = null_flow_state
	found_action = 0
	if GotParam \{action}
		GetArraySize (<current_flow_state>.actions)
		action_array_size = <array_size>
		array_entry = 0
		begin
		if (<action> = <current_flow_state>.actions [(<array_entry>)].action)
			if ($menu_flow_play_sound = 1)
				if (<play_sound> = 1)
					if (<action> = go_back)
						SoundEvent \{event = Generic_menu_back_SFX}
					else
						SoundEvent \{event = ui_sfx_select}
					endif
				endif
			else
				change \{menu_flow_play_sound = 1}
			endif
			<found_action> = 1
			spawned_func = 0
			if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) func
				action_function = (<current_flow_state>.actions [<array_entry>].func)
				if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) func_params
					func_params = (<current_flow_state>.actions [<array_entry>].func_params)
				endif
				if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) spawned_func
					<spawned_func> = 1
				endif
			endif
			if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) use_last_flow_state
				<new_state_name> = <previous_flow_state_name>
			else
				if StructureContains structure = ((<current_flow_state>.actions [(<array_entry>)])) flow_state
					<new_state_name> = ((<current_flow_state>.actions [(<array_entry>)]).flow_state)
					elseif StructureContains structure = ((<current_flow_state>.actions [(<array_entry>)])) flow_state_func
					if StructureContains structure = ((<current_flow_state>.actions [(<array_entry>)])) flow_state_func_params
						<flow_state_func_params> = ((<current_flow_state>.actions [(<array_entry>)]).flow_state_func_params)
					endif
					change \{transitions_locked = 1}
					flow_state_func = ((<current_flow_state>.actions [(<array_entry>)]).flow_state_func)
					<flow_state_func> <flow_state_func_params>
					change \{transitions_locked = 0}
					if NOT GotParam \{flow_state}
						scriptassert \{"flow_state_func did not return flow_state"}
					endif
					<new_state_name> = <flow_state>
				else
					scriptassert \{"Action does not define flow_state, use_last_flow_state, or flow_state_func"}
				endif
			endif
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <action_array_size>
	endif
	if (<found_action>)
		new_state = (<new_state_name>)
		is_popup = (0)
		if StructureContains structure = (<new_state>) popup
			<is_popup> = (1)
		endif
		state_destroy_params = {}
		if StructureContains structure = (<new_state>) destroy_params
			state_destroy_params = (<new_state>.destroy_params)
		endif
		if ($playing_song = 0)
			if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) transition_screen
				transition_screen_struct = ((<current_flow_state>.actions [<array_entry>]).transition_screen)
				transition_create_func = (<transition_screen_struct>.Create)
				<transition_create_func>
			endif
		endif
		if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) transition_left
			menu_transition_out_left
			elseif StructureContains structure = (<current_flow_state>.actions [<array_entry>]) transition_right
			menu_transition_out_right
		endif
		if (<is_popup>)
			if NOT StructureContains structure = (<under_flow_state>) is_null
				if StructureContains structure = (<current_flow_state>) destroy
					destroy_func = (<current_flow_state>.destroy)
					<destroy_func> player = <player> <destroy_params> <state_destroy_params>
				endif
			endif
			SetArrayElement arrayName = ui_flow_manager_under globalarray index = (<player_index>) newValue = <current_flow_state_name> resolveglobals = 0
			LaunchEvent \{type = unfocus target = root_window}
		else
			if StructureContains structure = (<current_flow_state>) destroy
				destroy_func = (<current_flow_state>.destroy)
				<destroy_func> player = <player> <destroy_params> <state_destroy_params>
			endif
			if NOT StructureContains structure = (<under_flow_state>) is_null
				if StructureContains structure = (<under_flow_state>) destroy
					destroy_func = (<under_flow_state>.destroy)
					<destroy_func> player = <player> <destroy_params> <state_destroy_params>
				endif
				SetArrayElement arrayName = ui_flow_manager_under globalarray index = (<player_index>) newValue = <null_flow_state_name> resolveglobals = 0
				LaunchEvent \{type = focus target = root_window}
			endif
		endif
		SetArrayElement arrayName = previous_flow_manager_state globalarray index = (<player_index>) newValue = <current_flow_state_name> resolveglobals = 0
		SetArrayElement arrayName = ui_flow_manager_state globalarray index = (<player_index>) newValue = <new_state_name> resolveglobals = 0
		if GotParam \{action_function}
			if (<spawned_func> = 1)
				spawnscriptnow <action_function> params = {device_num = (<device_num>) <func_params>}
			else
				<action_function> device_num = (<device_num>) <func_params>
			endif
		endif
		if ($playing_song = 0)
			if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) transition_screen
				transition_screen_struct = ((<current_flow_state>.actions [<array_entry>]).transition_screen)
				transition_destroy_func = (<transition_screen_struct>.destroy)
				<transition_destroy_func>
			endif
		endif
		state_create_params = {}
		if StructureContains structure = (<new_state>) create_params
			state_create_params = (<new_state>.create_params)
		endif
		if StructureContains structure = (<new_state>) Create
			create_func = (<new_state>.Create)
			<create_func> player = <player> <create_params> <state_create_params>
		endif
		if StructureContains structure = (<current_flow_state>.actions [<array_entry>]) transition_left
			menu_transition_in_left
			elseif StructureContains structure = (<current_flow_state>.actions [<array_entry>]) transition_right
			menu_transition_in_right
		endif
	endif
endscript

script start_flow_manager \{flow_state = main_menu_fs player = 1 create_params = {}}
	if NOT ((<player> = 1) || (<player> = 2))
		scriptassert \{"Player must be equal to 1 or 2"}
	endif
	player_index = (<player> - 1)
	SetArrayElement arrayName = ui_flow_manager_state globalarray index = (<player_index>) newValue = <flow_state> resolveglobals = 0
	current_flow_state_name = ($ui_flow_manager_state [<player_index>])
	current_flow_state = (<current_flow_state_name>)
	if StructureContains structure = (<current_flow_state>) Create
		create_func = (<current_flow_state>.Create)
		<create_func> player = <player> <create_params>
	endif
endscript

script shut_down_flow_manager \{player = 1}
	if NOT ((<player> = 1) || (<player> = 2))
		scriptassert \{"Player must be equal to 1 or 2"}
	endif
	player_index = (<player> - 1)
	current_flow_state_name = ($ui_flow_manager_state [<player_index>])
	current_flow_state = (<current_flow_state_name>)
	if StructureContains structure = (<current_flow_state>) destroy
		destroy_func = (<current_flow_state>.destroy)
		<destroy_func> player = <player> <destroy_params>
	endif
	if GotParam \{resetstate}
		SetArrayElement arrayName = ui_flow_manager_state globalarray index = (<player_index>) newValue = null_flow_state resolveglobals = 0
	endif
endscript
