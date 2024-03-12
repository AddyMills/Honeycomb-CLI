g_flash_red_going_p1 = 0
g_flash_red_going_p2 = 0
g_hud_2d_struct_used = career_hud_2d_elements

script create_2d_hud_elements \{player_Text = 'p1'}
	Change \{g_flash_red_going_p1 = 0}
	Change \{g_flash_red_going_p2 = 0}
	Change \{old_animate_bulbs_star_power_p1 = 0.0}
	Change \{old_animate_bulbs_star_power_p2 = 0.0}
	getArraySize (($g_hud_2d_struct_used).Elements)
	parent_scale = (($g_hud_2d_struct_used).scale)
	old_parent = <PARENT>
	parent_z = (($g_hud_2d_struct_used).Z)
	I = 0
	begin
	just = [Left top]
	myscale = 1.0
	zoff = 0.0
	rot = 0.0
	Alpha = 1
	pos_off = (0.0, 0.0)
	addparams (($g_hud_2d_struct_used).Elements [<I>])
	element_struct = (($g_hud_2d_struct_used).Elements [<I>])
	if structureContains Structure = <element_struct> parent_container
		if structureContains Structure = <element_struct> element_parent
			ExtendCrc <element_parent> <player_Text> out = container_parent
			if NOT ScreenelementExists Id = <container_parent>
				ExtendCrc <element_parent> 'p1' out = container_parent
			endif
		else
			container_parent = <old_parent>
		endif
		Container_pos = (0.0, 0.0)
		if structureContains Structure = <element_struct> pos_type
			<Container_pos> = (($g_hud_2d_struct_used).<pos_type>)
			if (<player_Text> = 'p2')
				ExtendCrc <pos_type> '_p2' out = new_pos_type
				<Container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
			else
				if ($current_num_players = 2)
					ExtendCrc <pos_type> '_p1' out = new_pos_type
					<Container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
				endif
			endif
		endif
		if structureContains Structure = <element_struct> note_streak_bar
			if structureContains Structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
				<Container_pos> = (<Container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off))
			else
				if (<player_Text> = 'p1')
					<Container_pos> = (<Container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p1))
				else
					<Container_pos> = (<Container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p2))
				endif
			endif
		endif
		<Container_pos> = (<Container_pos> + <pos_off>)
		ExtendCrc <element_id> <player_Text> out = new_id
		<create_it> = 1
		if structureContains Structure = <element_struct> create_once
			ExtendCrc <element_id> 'p1' out = p1_id
			if ScreenelementExists Id = <p1_id>
				<create_it> = 0
			endif
		endif
		if ((structureContains Structure = <element_struct> rot_p2) && (<player_Text> = 'p2'))
			<rot> = <rot_p2>
		endif
		if (<create_it>)
			createScreenElement {
				Type = containerElement
				PARENT = <container_parent>
				Id = <new_id>
				pos = <Container_pos>
				Rot_Angle = <rot>
				z_priority = <z_off>
			}
		endif
		PARENT = <new_id>
	endif
	if structureContains Structure = <element_struct> Container
		if NOT structureContains Structure = <element_struct> parent_container
			ExtendCrc <element_id> <player_Text> out = new_id
			ExtendCrc <element_parent> <player_Text> out = myparent
			if structureContains Structure = <element_struct> small_bulb
				scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).small_bulb_scale))
			else
				scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).big_bulb_scale))
			endif
			if ((structureContains Structure = <element_struct> pos_off_p2) && (<player_Text> = 'p2'))
				<pos_off> = <pos_off_p2>
			endif
			<create_it> = 1
			if structureContains Structure = <element_struct> create_once
				ExtendCrc <element_id> 'p1' out = p1_id
				if ScreenelementExists Id = <p1_id>
					<create_it> = 0
				endif
			endif
			if (<create_it>)
				createScreenElement {
					Type = spriteElement
					PARENT = <myparent>
					Id = <new_id>
					texture = <texture>
					pos = <pos_off>
					just = <just>
					rgba = [255 255 255 255]
					Rot_Angle = <rot>
					z_priority = <zoff>
					Alpha = <Alpha>
					Dims = <scaled_dims>
				}
				<new_id> :SetTags morph = 0
				<new_id> :SetTags Index = <I>
				<PARENT> = <Id>
				<rot> = 0.0
				<pos> = (0.0, 0.0)
				if structureContains Structure = <element_struct> initial_pos
					if ((structureContains Structure = <element_struct> initial_pos_p2) && (<player_Text> = 'p2'))
						setScreenElementProps Id = <new_id> pos = <initial_pos_p2>
						<new_id> :SetTags final_pos = <pos_off_p2>
						<new_id> :SetTags initial_pos = <initial_pos_p2>
						<new_id> :SetTags morph = 1
					else
						setScreenElementProps Id = <new_id> pos = <initial_pos>
						<new_id> :SetTags final_pos = <pos_off>
						<new_id> :SetTags initial_pos = <initial_pos>
						<new_id> :SetTags morph = 1
					endif
				endif
			endif
		endif
	else
		if NOT structureContains Structure = <element_struct> parent_container
			ExtendCrc <element_id> <player_Text> out = new_id
			if structureContains Structure = <element_struct> initial_pos
				<pos_off> = <initial_pos>
			endif
			if structureContains Structure = <element_struct> battle_pos
				if (<player_Text> = 'p2')
					<Container_pos> = (($g_hud_2d_struct_used).rock_pos_p2)
					ExtendCrc <pos_type> '_p2' out = new_pos_type
					<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
				else
					<Container_pos> = (($g_hud_2d_struct_used).rock_pos_p1)
					ExtendCrc <pos_type> '_p1' out = new_pos_type
					<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
				endif
			endif
			ExtendCrc <element_parent> <player_Text> out = myparent
			flags = {}
			if structureContains Structure = <element_struct> flags
				if structureContains Structure = (<element_struct>.flags) flip_v
					if structureContains Structure = (<element_struct>.flags) P1
						if (<player_Text> = 'p1')
							<flags> = flip_v
						endif
					endif
				endif
				if structureContains Structure = (<element_struct>.flags) flip_h
					if structureContains Structure = (<element_struct>.flags) P1
						if (<player_Text> = 'p1')
							<flags> = flip_h
						endif
					endif
					if structureContains Structure = (<element_struct>.flags) P2
						if (<player_Text> = 'p2')
							<flags> = flip_h
						endif
					endif
				endif
			endif
			mydims = {}
			if structureContains Structure = <element_struct> Dims
				<mydims> = <Dims>
			endif
			<create_it> = 1
			if structureContains Structure = <element_struct> create_once
				ExtendCrc <element_id> 'p1' out = p1_id
				if ScreenelementExists Id = <p1_id>
					<create_it> = 0
				endif
			endif
			if ((structureContains Structure = <element_struct> initial_pos_p2) && (<player_Text> = 'p2'))
				<pos_off> = <initial_pos_p2>
				elseif ((structureContains Structure = <element_struct> pos_off_p2) && (<player_Text> = 'p2'))
				<pos_off> = <pos_off_p2>
			endif
			my_rgba = [255 255 255 255]
			if (structureContains Structure = <element_struct> rgba)
				<my_rgba> = <rgba>
			endif
			if (<create_it>)
				createScreenElement {
					Type = spriteElement
					PARENT = <myparent>
					Id = <new_id>
					texture = <texture>
					pos = <pos_off>
					rgba = <my_rgba>
					just = <just>
					z_priority = <zoff>
					Alpha = <Alpha>
					<flags>
					Rot_Angle = <rot>
					Dims = <mydims>
				}
			endif
			if structureContains Structure = <element_struct> scale
				if (<create_it>)
					getScreenElementDims Id = <new_id>
					new_width = (<width> * <scale>)
					new_height = (<Height> * <scale>)
					setScreenElementProps Id = <new_id> Dims = (((1.0, 0.0) * <new_width>) + ((0.0, 1.0) * <new_height>))
				endif
			endif
		endif
	endif
	if structureContains Structure = <element_struct> tube
		ExtendCrc <new_id> 'tube' out = new_child_id
		<zoff> = (<tube>.zoff)
		<Alpha> = (<tube>.Alpha)
		ExtendCrc <element_parent> <player_Text> out = myparent
		if structureContains Structure = <element_struct> small_bulb
			scaled_dims = (<tube>.element_dims * (($g_hud_2d_struct_used).small_bulb_scale))
		else
			scaled_dims = (<tube>.element_dims * (($g_hud_2d_struct_used).big_bulb_scale))
		endif
		if ScreenelementExists Id = <myparent>
			createScreenElement {
				Type = spriteElement
				PARENT = <myparent>
				Id = <new_child_id>
				texture = (<tube>.texture)
				pos = (<pos_off> + (<tube>.pos_off))
				rgba = [255 255 255 255]
				Dims = <scaled_dims>
				just = [Center Bottom]
				z_priority = <zoff>
				Alpha = <Alpha>
			}
			<PARENT> = <Id>
			<new_child_id> :SetTags morph = 0
			<new_child_id> :SetTags old_dims = <element_dims>
			if structureContains Structure = <element_struct> initial_pos
				setScreenElementProps Id = <new_child_id> pos = (<initial_pos> + (<tube>.pos_off))
				<new_child_id> :SetTags {
					final_pos = (<pos_off> + (<tube>.pos_off))
					initial_pos = (<initial_pos> + (<tube>.pos_off))
					morph = 1
				}
			endif
		endif
	endif
	if structureContains Structure = <element_struct> full
		ExtendCrc <new_id> 'full' out = new_child_id
		<zoff> = (<full>.zoff)
		<Alpha> = (<full>.Alpha)
		ExtendCrc <element_parent> <player_Text> out = myparent
		if structureContains Structure = <element_struct> small_bulb
			scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).small_bulb_scale))
		else
			scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).big_bulb_scale))
		endif
		if ScreenelementExists Id = <myparent>
			createScreenElement {
				Type = spriteElement
				PARENT = <myparent>
				Id = <new_child_id>
				texture = (<full>.texture)
				pos = <pos_off>
				rgba = [255 255 255 255]
				Dims = <scaled_dims>
				just = <just>
				z_priority = <zoff>
				Alpha = <Alpha>
			}
			<new_child_id> :SetTags morph = 0
			if structureContains Structure = <element_struct> initial_pos
				setScreenElementProps Id = <new_child_id> pos = <initial_pos>
				<new_child_id> :SetTags final_pos = <pos_off>
				<new_child_id> :SetTags initial_pos = <initial_pos>
				<new_child_id> :SetTags morph = 1
			endif
		endif
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	if NOT ($game_mode = p2_battle || $boss_battle = 1)
		ExtendCrc HUD2D_Score_Text <player_Text> out = new_id
		ExtendCrc HUD2D_score_container <player_Text> out = new_score_container
		score_text_pos = (222.0, 70.0)
		if ($game_mode = p2_career || $game_mode = p2_coop)
			<score_text_pos> = (226.0, 85.0)
		endif
		if ScreenelementExists Id = <new_score_container>
			displayText {
				PARENT = <new_score_container>
				Id = <new_id>
				font = num_a9
				pos = <score_text_pos>
				Z = 20
				scale = (1.1, 1.1)
				just = [Right Right]
				rgba = [255 255 255 255]
			}
			setScreenElementProps Id = <Id> font_spacing = 5
		endif
		I = 1
		begin
		formatText Checksumname = note_streak_text_id 'HUD2D_Note_Streak_Text_%d' D = <I>
		ExtendCrc <note_streak_text_id> <player_Text> out = new_id
		ExtendCrc HUD2D_note_container <player_Text> out = new_note_container
		if ScreenelementExists Id = <new_note_container>
			if (<I> = 1)
				rgba = [15 15 70 200]
			else
				rgba = [230 230 230 200]
			endif
			displayText {
				PARENT = <new_note_container>
				Id = <new_id>
				font = num_a7
				Text = "0"
				pos = ((222.0, 78.0) + (<I> * (-37.0, 0.0)))
				Z = 25
				just = [Center Center]
				rgba = <rgba>
				noshadow
			}
			<Id> :SetTags intial_pos = ((222.0, 78.0) + (<I> * (-37.0, 0.0)))
		endif
		<I> = (<I> + 1)
		repeat 4
	endif
endscript

script rock_meter_star_power_on 
	if ($game_mode = p2_career)
		<player_status> = player1_status
	endif
	formatText Textname = player_Text 'p%d' D = ($<player_status>.Player)
	SpawnScriptNOw rock_back_and_forth_star_meter Params = {player_status = <player_status> player_Text = <player_Text>}
	formatText Checksumname = player_spawned_scriptid 'player_spawned_scriptid_p%d' D = ($<player_status>.Player)
	SpawnScriptNOw {
		pulsate_all_star_power_bulbs Params = {Player = ($<player_status>.Player) player_status = <player_status> player_Text = <player_Text>}
		Id = <player_spawned_scriptid>
	}
	I = 1
	begin
	formatText Checksumname = Id 'HUD2D_rock_tube_%d' D = <I>
	ExtendCrc <Id> <player_Text> out = parent_id
	if ScreenelementExists Id = <parent_id>
		<parent_id> :getTags
		if (<morph> = 1)
			DoScreenElementMorph Id = <parent_id> pos = <final_pos> Time = 0.4
		endif
		ExtendCrc <parent_id> 'tube' out = child_id
		<child_id> :getTags
		setScreenElementProps Id = <child_id> texture = (($g_hud_2d_struct_used).Elements [<Index>].tube.star_texture)
		if (<morph> = 1)
			DoScreenElementMorph Id = <child_id> pos = <final_pos> Time = 0.4
		endif
		ExtendCrc <parent_id> 'full' out = child_id
		<child_id> :getTags
		setScreenElementProps Id = <child_id> texture = (($g_hud_2d_struct_used).Elements [<Index>].full.star_texture)
		if (<morph> = 1)
			DoScreenElementMorph Id = <child_id> pos = <final_pos> Time = 0.4
			Wait \{0.2 Seconds}
		endif
	endif
	<I> = (<I> + 1)
	repeat 6
endscript

script kill_pulsate_star_power_bulbs 
	formatText Checksumname = player_spawned_scriptid 'player_spawned_scriptid_p%d' D = <Player>
	killspawnedScript Id = <player_spawned_scriptid>
	KillPulsateStarPowerBulbs Player = <Player>
endscript

script pulsate_star_power_bulb 
	begin
	alpha_time = Random (@ 0.1 @*2 0.5 )
	if ScreenelementExists Id = <bulb_checksum>
		ExtendCrc <bulb_checksum> 'tube' out = child_id
		DoScreenElementMorph Id = <child_id> Alpha = 0.3 Time = <alpha_time> Motion = ease_in
		ExtendCrc <bulb_checksum> 'full' out = child_id
		DoScreenElementMorph Id = <child_id> Alpha = 0.3 Time = <alpha_time> Motion = ease_in
	endif
	Wait <alpha_time> Seconds
	alpha_time = Random (@ 0.1 @*2 0.5 )
	if ScreenelementExists Id = <bulb_checksum>
		ExtendCrc <bulb_checksum> 'tube' out = child_id
		<child_id> :getTags
		DoScreenElementMorph Id = <child_id> Alpha = <old_alpha> Time = <alpha_time> Motion = ease_out
		ExtendCrc <bulb_checksum> 'full' out = child_id
		<child_id> :getTags
		DoScreenElementMorph Id = <child_id> Alpha = <old_alpha> Time = <alpha_time> Motion = ease_out
	endif
	Wait <alpha_time> Seconds
	repeat
endscript

script pulsate_big_glow 
	ExtendCrc HUD2D_rock_glow <player_Text> out = parent_id
	if NOT ScreenelementExists Id = <parent_id>
		return
	endif
	begin
	if NOT ScreenelementExists Id = <parent_id>
		return
	endif
	<parent_id> :doMorph Alpha = 0 rgba = [95 205 255 255] Time = 1 Motion = ease_in
	if NOT ScreenelementExists Id = <parent_id>
		return
	endif
	<parent_id> :doMorph Alpha = 1 rgba = [255 255 255 255] Time = 1 Motion = ease_out
	repeat
endscript

script pulsate_all_star_power_bulbs 
	<I> = 1
	begin
	formatText Checksumname = Id 'HUD2D_rock_tube_%d' D = <I>
	ExtendCrc <Id> <player_Text> out = parent_id
	if ScreenelementExists Id = <parent_id>
		formatText Checksumname = player_spawned_scriptid 'player_spawned_scriptid_p%d' D = <Player>
		SpawnScriptNOw {
			pulsate_star_power_bulb Params = {bulb_checksum = <parent_id>}
			Id = <player_spawned_scriptid>
		}
	endif
	<I> = (<I> + 1)
	repeat 6
	ExtendCrc HUD2D_rock_glow <player_Text> out = parent_id
	if ScreenelementExists Id = <parent_id>
		formatText Checksumname = player_spawned_scriptid 'player_spawned_scriptid_p%d' D = <Player>
		SpawnScriptNOw {
			pulsate_big_glow Params = {<...>}
			Id = <player_spawned_scriptid>
		}
	endif
endscript

script rock_back_and_forth_star_meter 
	move_up_and_down = 1
	if ($game_mode = p1_career || $game_mode = p1_quickplay || $game_mode = p2_career || $game_mode = p2_coop)
		ExtendCrc HUD2D_rock_container <player_Text> out = shake_container
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		ExtendCrc HUD2D_score_container <player_Text> out = shake_container
		<move_up_and_down> = 0
	endif
	if ScreenelementExists Id = <shake_container>
		getScreenElementProps Id = <shake_container>
		time_to_shake = 0.15
		if (<move_up_and_down> = 1)
			if ScreenelementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> pos = (<pos> - (0.0, 50.0)) scale = 1.5 Rot_Angle = 10 Time = <time_to_shake> Motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenelementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> pos = (<pos> + (0.0, 75.0)) scale = 0.5 Rot_Angle = -15 Time = <time_to_shake> Motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenelementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> pos = (<pos>) scale = 1.0 Rot_Angle = 0 Time = <time_to_shake>
			endif
		else
			if ScreenelementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> pos = (<pos> - (50.0, 0.0)) scale = 1.5 Rot_Angle = 10 Time = <time_to_shake> Motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenelementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> pos = (<pos> + (75.0, 0.0)) scale = 0.5 Rot_Angle = -15 Time = <time_to_shake> Motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenelementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> pos = (<pos>) scale = 1.0 Rot_Angle = 0 Time = <time_to_shake> Motion = ease_out
			endif
		endif
	endif
endscript

script rock_meter_star_power_off \{player_Text = 'p1'}
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	J = 6
	begin
	formatText Checksumname = Id 'HUD2D_rock_tube_%d' D = <J>
	ExtendCrc <Id> <player_Text> out = parent_id
	if ScreenelementExists Id = <parent_id>
		<parent_id> :getTags
		if (<morph> = 1)
			if ScreenelementExists Id = <parent_id>
				DoScreenElementMorph Id = <parent_id> pos = (<final_pos> + <final_pos> * 0.1) Time = 0.1
			endif
			Wait \{0.1 Seconds}
			if ScreenelementExists Id = <parent_id>
				DoScreenElementMorph Id = <parent_id> pos = <initial_pos> Time = 0.4
			endif
			Wait \{0.1 Seconds}
		endif
		ExtendCrc <parent_id> 'tube' out = child_id
		if ScreenelementExists Id = <child_id>
			<child_id> :getTags
			setScreenElementProps Id = <child_id> texture = (($g_hud_2d_struct_used).Elements [<Index>].tube.texture)
			if (<morph>)
				setScreenElementProps Id = <child_id> pos = <initial_pos>
			endif
		endif
		ExtendCrc <parent_id> 'full' out = child_id
		if ScreenelementExists Id = <child_id>
			<child_id> :getTags
			setScreenElementProps Id = <child_id> texture = (($g_hud_2d_struct_used).Elements [<Index>].full.texture)
			if (<morph>)
				setScreenElementProps Id = <child_id> pos = <initial_pos>
			endif
		endif
	endif
	<J> = (<J> -1)
	repeat 6
endscript

script hud_activated_star_power \{Player = 1 Time = 0.2}
	SpawnScriptNOw hud_activated_star_power_spawned Params = {<...>}
endscript

script hud_activated_star_power_spawned 
	Wait \{1 GameFrame}
	if (<Player> = 1)
		player_Text = 'p1'
		elseif (<Player> = 2)
		player_Text = 'p2'
	else
		return
	endif
	SpawnScriptNOw kill_pulsate_star_power_bulbs Params = {Player = <Player>}
	ExtendCrc HUD2D_score_flash <player_Text> out = new_flash
	if ScreenelementExists Id = <new_flash>
		DoScreenElementMorph Id = <new_flash> Alpha = 1 scale = 5 Time = <Time>
		Wait <Time> Seconds
		if ScreenelementExists Id = <new_flash>
			DoScreenElementMorph Id = <new_flash> Alpha = 0 scale = 1 Time = (<Time> / 2.0)
		endif
		UpdateNixie Player = <Player>
	endif
endscript

script hud_move_note_scorebar \{Player = 1 Time = 0.5 In = 1}
	if ($game_mode = p2_battle || $boss_battle = 1 || $end_credits = 1 || $Cheat_PerformanceMode = 1)
		return
	endif
	if (($game_mode = p2_career || $game_mode = p2_coop) && (<Player> = 2))
		return
	endif
	if NOT structureContains Structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
		if NOT structureContains Structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off_p1
			return
		endif
	endif
	morph_miss_off = (0.0, 60.0)
	ease_off = (0.0, 10.0)
	count_off = offscreen_note_streak_bar_off
	if (<Player> = 1)
		player_Text = 'p1'
		if ($game_mode = p2_career || $game_mode = p2_coop)
			count_pos = counter_pos
		else
			if ($current_num_players = 2)
				count_pos = counter_pos_p1
				morph_miss_off = (60.0, 0.0)
				ease_off = (10.0, 0.0)
				count_off = offscreen_note_streak_bar_off_p1
			else
				count_pos = counter_pos
			endif
		endif
		elseif (<Player> = 2)
		player_Text = 'p2'
		count_pos = counter_pos_p2
		morph_miss_off = (-60.0, 0.0)
		ease_off = (-10.0, 0.0)
		count_off = offscreen_note_streak_bar_off_p2
	else
		return
	endif
	if (<In> = 1)
		ExtendCrc HUD2D_note_container <player_Text> out = new_container
		if ScreenelementExists Id = <new_container>
			DoScreenElementMorph Id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) - <morph_miss_off>) Time = <Time> Motion = ease_out
			Wait <Time> Seconds
			if ScreenelementExists Id = <new_container>
				DoScreenElementMorph Id = <new_container> pos = (($g_hud_2d_struct_used).<count_pos>) Time = (<Time> / 3) Motion = ease_in
				<new_container> :doMorph pos = {<ease_off> Relative} Time = 0.1 Motion = ease_out
				<new_container> :doMorph pos = {(<ease_off> * -1) Relative} Time = 0.1 Motion = ease_in
			endif
		endif
	else
		ExtendCrc HUD2D_note_container <player_Text> out = new_container
		if ScreenelementExists Id = <new_container>
			if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || $game_mode = p2_coop)
				DoScreenElementMorph Id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) - <morph_miss_off>) Time = (<Time> / 2.0) Motion = ease_out
			else
				DoScreenElementMorph Id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) + <morph_miss_off>) Time = (<Time> / 2.0) Motion = ease_in
			endif
			Wait <Time> Seconds
			if ScreenelementExists Id = <new_container>
				DoScreenElementMorph Id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) + (($g_hud_2d_struct_used).<count_off>)) Time = <Time>
			endif
		endif
	endif
endscript
old_animate_bulbs_star_power_p1 = 0.0
old_animate_bulbs_star_power_p2 = 0.0

script hud_flash_red_bg_p1 \{Time = 0.2}
	if ($g_flash_red_going_p1 = 1)
		return
	else
		Change \{g_flash_red_going_p1 = 1}
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		ExtendCrc \{hud2d_rock_lights_red 'p1' out = new_bg}
		<Time> = 0.15
	else
		ExtendCrc \{hud2d_rock_bg_red 'p1' out = new_bg}
	endif
	begin
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ScreenelementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
			Wait <Time> Seconds
		endif
		if ScreenelementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
		endif
		Wait <Time> Seconds
	else
		if ScreenelementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
			Wait <Time> Seconds
		endif
		if ScreenelementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
			Wait <Time> Seconds
		endif
		if ScreenelementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
			Wait <Time> Seconds
		endif
		if ScreenelementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
		endif
		Wait (<Time> * 2.5) Seconds
	endif
	repeat
endscript

script hud_flash_red_bg_p2 \{Time = 0.2}
	if ($g_flash_red_going_p2 = 1)
		return
	else
		Change \{g_flash_red_going_p2 = 1}
	endif
	ExtendCrc \{hud2d_rock_bg_red 'p2' out = new_bg}
	begin
	if ScreenelementExists Id = <new_bg>
		DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
		Wait <Time> Seconds
	endif
	if ScreenelementExists Id = <new_bg>
		DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
		Wait <Time> Seconds
	endif
	if ScreenelementExists Id = <new_bg>
		DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
		Wait <Time> Seconds
	endif
	if ScreenelementExists Id = <new_bg>
		DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
	endif
	Wait (<Time> * 2.5) Seconds
	repeat
endscript

script hud_flash_red_bg_kill \{Player = 1}
	if (<Player> = 1)
		if ($g_flash_red_going_p1 = 0)
			return
		endif
		player_Text = 'p1'
		elseif (<Player> = 2)
		if ($g_flash_red_going_p2 = 0)
			return
		endif
		player_Text = 'p2'
	else
		return
	endif
	ExtendCrc hud2d_rock_bg_red <player_Text> out = new_bg
	if ScreenelementExists Id = <new_bg>
		setScreenElementProps Id = <new_bg> rgba = [225 225 225 255]
		if (<Player> = 1)
			killspawnedScript \{Name = hud_flash_red_bg_p1}
		else
			killspawnedScript \{Name = hud_flash_red_bg_p2}
		endif
	endif
	if (<Player> = 1)
		Change \{g_flash_red_going_p1 = 0}
	else
		Change \{g_flash_red_going_p2 = 0}
	endif
endscript

script two_message_test 
	SpawnScriptNOw \{hud_show_note_streak_combo Params = {Player = 1}}
	SpawnScriptNOw \{show_star_power_ready Params = {player_status = player1_status}}
	SpawnScriptNOw \{hud_show_note_streak_combo Params = {Player = 2}}
	SpawnScriptNOw \{show_star_power_ready Params = {player_status = player2_status}}
endscript

script hud_show_note_streak_combo \{Player = 1 Combo = 0}
	if ($end_credits = 1 || $Cheat_PerformanceMode = 1)
		return
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		<Player> = 1
	endif
	begin
	if (<Player> = 1)
		if ($star_power_ready_on_p1 = 0)
			break
		endif
	else
		if ($star_power_ready_on_p2 = 0)
			break
		endif
	endif
	Wait \{1 GameFrame}
	repeat
	formatText Checksumname = player_container 'HUD_Note_Streak_Combo%d' D = <Player>
	if ScreenelementExists Id = <player_container>
		return
	endif
	if (<Player> = 1)
		player_status = player1_status
	else
		player_status = player2_status
	endif
	ExtendCrc hud_destroygroup_window ($<player_status>.Text) out = hud_destroygroup
	createScreenElement {
		Type = containerElement
		PARENT = <hud_destroygroup>
		Id = <player_container>
	}
	base_scale = 0.8
	S = 0.8
	if (<Player> = 1)
		if IsSinglePlayerGame
			pos = (640.0, 211.0)
			<base_scale> = 1.0
			SpawnScriptNOw GH_SFX_Note_Streak_SinglePlayer Params = {Combo = <Combo>}
			elseif ($game_mode = p2_career)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNOw GH_SFX_Note_Streak_P1 Params = {Combo = <Combo>}
			elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNOw GH_SFX_Note_Streak_P1 Params = {Combo = <Combo>}
		else
			<S> = 0.35000002
			pos = (415.0, 170.0)
			SpawnScriptNOw GH_SFX_Note_Streak_P1 Params = {Combo = <Combo>}
		endif
	else
		if ($game_mode = p2_career)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNOw GH_SFX_Note_Streak_P2 Params = {Combo = <Combo>}
			elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNOw GH_SFX_Note_Streak_P2 Params = {Combo = <Combo>}
		else
			<S> = 0.35000002
			pos = (865.0, 170.0)
			SpawnScriptNOw GH_SFX_Note_Streak_P2 Params = {Combo = <Combo>}
		endif
	endif
	formatText Textname = Text "%d Note Streak!" D = <Combo>
	formatText Checksumname = note_streak_alert 'note_streak_alert_%d' D = <Player>
	createScreenElement {
		Type = textElement
		Id = <note_streak_alert>
		PARENT = <player_container>
		font = text_a6
		Text = <Text>
		rgba = [223 223 223 255]
		pos = <pos>
		scale = (<base_scale> * 3)
		just = [Center top]
		z_priority = 50
		Alpha = 0
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	<Id> :doMorph scale = <base_scale> Time = 0.2 Alpha = 1 Motion = ease_in
	if NOT ScreenelementExists Id = <Id>
		destroy_menu menu_id = <player_container>
		return
	endif
	SpawnScriptNOw hud_glowburst_alert Params = {player_status = <player_status>}
	color0 = [245 255 120 255]
	color1 = [245 255 160 255]
	if ScreenelementExists Id = <Id>
		<Id> :doMorph scale = (<base_scale> + <S>) Time = 0.4 rgba = <color1> Rot_Angle = 3 Motion = ease_out
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph scale = <base_scale> Time = 0.4 rgba = <color0> Rot_Angle = 2 Motion = ease_in
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph scale = (<base_scale> + (<S> / 1.5)) Time = 0.3 rgba = <color1> Rot_Angle = -2 Motion = ease_out
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph scale = <base_scale> Time = 0.3 rgba = <color0> Rot_Angle = -1 Motion = ease_in
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph scale = (<base_scale> + (<S> / 2.0)) Time = 0.2 rgba = <color1> Rot_Angle = 2 Motion = ease_out
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph scale = <base_scale> Time = 0.2 rgba = <color0> Rot_Angle = 1 Motion = ease_in
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph scale = (<base_scale> + (<S> / 2.5)) Time = 0.1 rgba = <color1> Rot_Angle = -1 Motion = ease_out
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph scale = <base_scale> Time = 0.1 rgba = <color0> Rot_Angle = 1 Motion = ease_in
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph Rot_Angle = 0 scale = <base_scale> Motion = gentle
	endif
	if ScreenelementExists Id = <Id>
		<Id> :doMorph pos = (<pos> - (0.0, 230.0)) scale = (<base_scale> * 0.8) Time = 0.35000002 Motion = ease_in
	endif
	destroy_menu menu_id = <player_container>
endscript

script hud_lightning_alert 
	if NOT ScreenelementExists Id = <alert_id>
		return
	endif
	formatText Checksumname = HUD_lightning_01 'HUD_lightning_01_%d' D = <Player>
	formatText Checksumname = HUD_lightning_03 'HUD_lightning_03_%d' D = <Player>
	formatText Checksumname = HUD_lightning_05 'HUD_lightning_05_%d' D = <Player>
	formatText Checksumname = HUD_lightning_07 'HUD_lightning_07_%d' D = <Player>
	getScreenElementProps Id = <alert_id>
	lightning_pos = (<pos> - (0.0, 20.0))
	lightning_dims = (800.0, 100.0)
	lightning_time = 0.2
	if ScreenelementExists Id = <HUD_lightning_01>
		DestroyScreenelement Id = <HUD_lightning_01>
	endif
	createScreenElement {
		Type = spriteElement
		Id = <HUD_lightning_01>
		texture = HUD_lightning_01
		PARENT = <player_container>
		pos = <lightning_pos>
		Dims = <lightning_dims>
		just = [Center top]
		z_priority = 45
		Alpha = 0
	}
	if ScreenelementExists Id = <HUD_lightning_03>
		DestroyScreenelement Id = <HUD_lightning_03>
	endif
	createScreenElement {
		Type = spriteElement
		Id = <HUD_lightning_03>
		texture = HUD_lightning_03
		PARENT = <player_container>
		pos = <lightning_pos>
		Dims = <lightning_dims>
		just = [Center top]
		z_priority = 45
		Alpha = 0
	}
	if ScreenelementExists Id = <HUD_lightning_05>
		DestroyScreenelement Id = <HUD_lightning_05>
	endif
	createScreenElement {
		Type = spriteElement
		Id = <HUD_lightning_05>
		texture = HUD_lightning_05
		PARENT = <player_container>
		pos = <lightning_pos>
		Dims = <lightning_dims>
		just = [Center top]
		z_priority = 45
		Alpha = 0
	}
	if ScreenelementExists Id = <HUD_lightning_07>
		DestroyScreenelement Id = <HUD_lightning_07>
	endif
	createScreenElement {
		Type = spriteElement
		Id = <HUD_lightning_07>
		texture = HUD_lightning_07
		PARENT = <player_container>
		pos = <lightning_pos>
		Dims = <lightning_dims>
		just = [Center top]
		z_priority = 45
		Alpha = 0
	}
	if ScreenelementExists Id = <HUD_lightning_01>
		DoScreenElementMorph Id = <HUD_lightning_01> Alpha = 1 Time = <lightning_time>
		Wait <lightning_time> Seconds
	endif
	if ScreenelementExists Id = <HUD_lightning_01>
		DoScreenElementMorph Id = <HUD_lightning_01> Alpha = 0 Time = <lightning_time>
		if ScreenelementExists Id = <HUD_lightning_03>
			DoScreenElementMorph Id = <HUD_lightning_03> Alpha = 1 Time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenelementExists Id = <HUD_lightning_03>
		DoScreenElementMorph Id = <HUD_lightning_03> Alpha = 0 Time = <lightning_time>
		if ScreenelementExists Id = <HUD_lightning_05>
			DoScreenElementMorph Id = <HUD_lightning_05> Alpha = 1 Time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenelementExists Id = <HUD_lightning_05>
		DoScreenElementMorph Id = <HUD_lightning_05> Alpha = 0 Time = <lightning_time>
		if ScreenelementExists Id = <HUD_lightning_07>
			DoScreenElementMorph Id = <HUD_lightning_07> Alpha = 1 Time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenelementExists Id = <HUD_lightning_07>
		DoScreenElementMorph Id = <HUD_lightning_07> Alpha = 0 Time = <lightning_time>
		Wait <lightning_time> Seconds
	endif
	if ScreenelementExists Id = <HUD_lightning_01>
		DestroyScreenelement Id = <HUD_lightning_01>
	endif
	if ScreenelementExists Id = <HUD_lightning_03>
		DestroyScreenelement Id = <HUD_lightning_03>
	endif
	if ScreenelementExists Id = <HUD_lightning_05>
		DestroyScreenelement Id = <HUD_lightning_05>
	endif
	if ScreenelementExists Id = <HUD_lightning_07>
		DestroyScreenelement Id = <HUD_lightning_07>
	endif
endscript

script hud_glowburst_alert \{player_status = player1_status}
	formatText Checksumname = star_power_ready_glow 'star_power_ready_glow_%d' D = ($<player_status>.Player)
	ExtendCrc hud_destroygroup_window ($<player_status>.Text) out = hud_destroygroup
	if ScreenelementExists Id = <star_power_ready_glow>
		DestroyScreenelement Id = <star_power_ready_glow>
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		if (($<player_status>.Player) = 1)
			original_pos = (($hud_screen_elements [0].pos) - (225.0, 37.0))
		else
			original_pos = (($hud_screen_elements [0].pos) + (225.0, -37.0))
		endif
		base_scale = (7.5, 0.5)
		Scale2 = (10.0, 2.5)
		scale3 = (7.5, 0.25)
		scale4 = (40.0, 0.0)
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			original_pos = (($hud_screen_elements [0].pos) - (0.0, 36.0))
		else
			original_pos = (($hud_screen_elements [0].pos) + (0.0, 7.0))
		endif
		base_scale = (15.0, 1.0)
		Scale2 = (20.0, 5.0)
		scale3 = (15.0, 0.5)
		scale4 = (80.0, 0.0)
	endif
	if ScreenelementExists Id = <hud_destroygroup>
		createScreenElement {
			Type = spriteElement
			Id = <star_power_ready_glow>
			PARENT = <hud_destroygroup>
			texture = char_select_hilite1
			just = [Center Center]
			pos = <original_pos>
			rgba = [245 255 200 255]
			scale = <base_scale>
			Alpha = 1
			z_priority = 50
		}
	endif
	if ScreenelementExists Id = <star_power_ready_glow>
		<star_power_ready_glow> :doMorph scale = <Scale2> Alpha = 0.5 Motion = ease_out Time = 0.1
	endif
	if ScreenelementExists Id = <star_power_ready_glow>
		<star_power_ready_glow> :doMorph scale = <scale3> Alpha = 0.5 rgba = [245 255 160 255] Motion = ease_out Time = 0.1
	endif
	if ScreenelementExists Id = <star_power_ready_glow>
		<star_power_ready_glow> :doMorph scale = <scale4> Alpha = 0 Motion = ease_in Time = 0.8
	endif
	if ScreenelementExists Id = <star_power_ready_glow>
		DestroyScreenelement Id = <star_power_ready_glow>
	endif
endscript

script hud_flip_note_streak_num 
	formatText Checksumname = Id 'HUD2D_Note_Streak_Text_%dp%i' D = <dial_num> I = <Player>
	if NOT ScreenelementExists Id = <Id>
		return
	endif
	<Id> :getTags
	getScreenElementProps Id = <Id>
	basePos = <pos>
	DoScreenElementMorph Id = <Id> pos = (<basePos> + (0.0, 10.0)) Alpha = 0
	DoScreenElementMorph Id = <Id> pos = <intial_pos> Alpha = 1 Time = 0.1
endscript
