gStar_Power_Triggered = 0
jailbait_achievement = 0
subway_achievement = 0
Achievement_Atoms = [
	{
		name = make_it
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = easy
				}
			}
		]
	}
	{
		name = movin_out
		type = scr
		atom_script = Achievements_Stack_Career
		atom_params = {
			difficulty = medium
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = medium
				}
			}
		]
	}
	{
		name = rock_in_a_hard_place
		type = scr
		atom_script = Achievements_Stack_Career
		atom_params = {
			difficulty = hard
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = hard
				}
			}
		]
	}
	{
		name = dream_on
		type = scr
		atom_script = Achievements_Stack_Career
		atom_params = {
			difficulty = expert
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = expert
				}
			}
		]
	}
	{
		name = aerosmith
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_AEROSMITH
			}
		]
	}
	{
		name = jailbait
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_Play_At_Venue
				params = {
					venue = load_z_Nipmuc
				}
			}
			{
				type = scr
				scr = Achievements_IsSongWon
			}
		]
	}
	{
		name = subway
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_Play_At_Venue
				params = {
					venue = load_z_MaxsKC
				}
			}
			{
				type = scr
				scr = Achievements_IsSongWon
			}
		]
	}
	{
		name = on_the_road_again
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_Unlocked_Venue
				params = {
					venue = load_z_Fenway
				}
			}
		]
	}
	{
		name = nine_lives
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_Unlocked_Venue
				params = {
					venue = load_z_nine_lives
				}
			}
		]
	}
	{
		name = critical_mass
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_Unlocked_Venue
				params = {
					venue = load_z_JPPlay
				}
			}
		]
	}
	{
		name = march_19th_2001
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_Unlocked_Venue
				params = {
					venue = load_z_hof
				}
			}
		]
	}
	{
		name = no_more_no_more
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 1
				}
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 2
				}
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 3
				}
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 4
				}
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 5
				}
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 6
				}
			}
		]
	}
	{
		name = same_old_song_and_dance
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = any
				}
			}
			{
				type = scr
				scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = any
					bonus
				}
			}
		]
	}
	{
		name = score_hero
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_SCORE_HERO
			}
			{
				type = scr
				scr = Achievements_IsSongWon
			}
		]
	}
	{
		name = get_it_up
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_Career_Score_Threshold
				params = {
					threshold = 1999999
				}
				permanent = FALSE
			}
		]
	}
	{
		name = eat_the_rich
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_Career_Cash_Threshold
				params = {
					threshold = 49999
				}
				permanent = FALSE
			}
		]
	}
	{
		name = i_dont_want_to_miss_a_thing
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievement_progression_difficulty_threshold
				params = {
					difficulty = medium
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_100percent_performance
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		name = gems
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_GEMS
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		name = sick_as_a_dog
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievement_progression_difficulty_threshold
				params = {
					difficulty = medium
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_5StarSong
				params = {
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		name = aint_that_a_b____h
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_100percent_performance
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		name = dude_looks_like_a_lady
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_DUDE_LOOKS_LIKE_A_LADY
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		name = woman_of_the_world
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_WOMAN_OF_THE_WORLD
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		name = spaced
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_SPACED
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		name = what_it_takes
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_WHAT_IT_TAKES
			}
		]
	}
	{
		name = deuces_are_wild
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_CoopBeatenPart
				params = {
					part = guitar
				}
			}
		]
	}
	{
		name = love_me_two_times
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_CoopBeatenPart
				params = {
					part = rhythm
				}
			}
		]
	}
]
Achievements_SongWonFlag = 0

script Achievements_IsSongWon 
	if ($Achievements_SongWonFlag = 1)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_DummyScript 
endscript

script Achievements_SongWon 
	if ($game_mode = p1_career)
		GetGlobalTags \{achievement_info}
		total_cash_in_career_mode = (<total_cash_in_career_mode> + <additional_cash>)
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.notes_hit)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.Score)
		SetGlobalTags achievement_info params = {total_cash_in_career_mode = <total_cash_in_career_mode>
			total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		if ($current_difficulty = easy)
			total_points_in_career_mode_easy = (<total_points_in_career_mode_easy> + $player1_status.Score)
			SetGlobalTags achievement_info params = {total_points_in_career_mode_easy = <total_points_in_career_mode_easy>}
		endif
		if ($current_difficulty = medium)
			total_points_in_career_mode_medium = (<total_points_in_career_mode_medium> + $player1_status.Score)
			SetGlobalTags achievement_info params = {total_points_in_career_mode_medium = <total_points_in_career_mode_medium>}
		endif
		if ($current_difficulty = hard)
			total_points_in_career_mode_hard = (<total_points_in_career_mode_hard> + $player1_status.Score)
			SetGlobalTags achievement_info params = {total_points_in_career_mode_hard = <total_points_in_career_mode_hard>}
		endif
		if ($current_difficulty = expert)
			total_points_in_career_mode_expert = (<total_points_in_career_mode_expert> + $player1_status.Score)
			SetGlobalTags achievement_info params = {total_points_in_career_mode_expert = <total_points_in_career_mode_expert>}
		endif
		Achievements_CheckCareerTotals
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		if ($gStar_Power_Triggered >= 3)
			WriteAchievements \{achievement = when_i_needed_you}
		endif
		if ($game_mode = p2_quickplay)
			if (($player1_status.total_notes = $player1_status.notes_hit) && ($player2_status.total_notes = $player2_status.notes_hit))
				if NOT (($player1_status.total_notes = 0) && ($player2_status.total_notes = 0))
					WriteAchievements \{achievement = let_the_music_do_the_talking}
				endif
			endif
		elseif ($game_mode = p2_coop)
			if ($player1_status.total_notes = $player1_status.notes_hit)
				if NOT ($player1_status.total_notes = 0)
					WriteAchievements \{achievement = let_the_music_do_the_talking}
				endif
			endif
		endif
		if (($player1_status.character_id = BradW) && ($player2_status.character_id = TomH))
			WriteAchievements \{achievement = back_in_the_saddle}
		elseif (($player1_status.character_id = TomH) && ($player2_status.character_id = BradW))
			WriteAchievements \{achievement = back_in_the_saddle}
		endif
		if (($primary_controller) = ($player1_status.controller))
			player_status = player1_status
		else
			player_status = player2_status
		endif
		if ($<player_status>.part = rhythm)
			SetGlobalTags ($current_song) params = {beaten_coop_as_rhythm = 1}
		else
			SetGlobalTags ($current_song) params = {beaten_coop_as_lead = 1}
		endif
	endif
	if ($game_mode = p1_career)
		get_difficulty_text_nl difficulty = ($current_difficulty)
		FormatText checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = 'p1_career'
		FormatText checksumname = hendrix_checksum 'hendrix_achievement_%s' s = <difficulty_text_nl>
		GetGlobalTags <bandname_id> param = <hendrix_checksum>
		GetGlobalTags \{user_options params = lefty_flip_p1}
		if ((<...>.<hendrix_checksum>) = 2)
		elseif ((<...>.<hendrix_checksum>) = -1)
			AddParam name = <hendrix_checksum> structure_name = new_params value = <lefty_flip_p1>
			SetGlobalTags <bandname_id> params = <new_params>
		elseif NOT ((<...>.<hendrix_checksum>) = <lefty_flip_p1>)
			AddParam name = <hendrix_checksum> structure_name = new_params value = 2
			SetGlobalTags <bandname_id> params = <new_params>
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if ($current_song = kingsandqueens && $current_difficulty = expert && $boss_battle = 0 && $end_credits = 0)
			WriteAchievements \{achievement = only_the_l33t}
		endif
	endif
endscript

script Achievements_100percent_performance 
	printf \{"Achievements_100percent_performance"}
	if ($is_attract_mode = 0 &&
			($game_mode = p1_career ||
				$game_mode = p1_quickplay))
		if ($player1_status.notes_hit = $player1_status.max_notes &&
				$player1_status.max_notes > 0)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_WhoNeedsThePower 
	printf \{"Achievements_WhoNeedsThePower"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if ($is_network_game = 0 &&
			($game_mode = p2_pro_faceoff ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_battle))
		return \{FALSE}
	endif
	printf \{"star power trigged  = %d" d = $gStar_Power_Triggered}
	if ($player1_status.Score > 199999 &&
			$gStar_Power_Triggered = 0 &&
			$current_song = cultofpersonality)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_TONE_DEAF 
	printf \{"Achievements_TONE_DEAF"}
	if ($game_mode = p1_quickplay ||
			($game_mode = p1_career && $boss_battle = 0))
		GetGlobalTags \{user_options}
		if ($current_difficulty = expert)
			if (<guitar_volume> = 0)
				return \{TRUE}
			endif
		endif
	endif
	return \{FALSE}
endscript

script Achievements_STAR_MANIA 
	printf \{"Achievements_STAR_MANIA"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if NOT ($game_mode = p1_quickplay)
		return \{FALSE}
	endif
	printf \{"star power trigged  = %d" d = $gStar_Power_Triggered}
	if ($gStar_Power_Triggered > 2)
		if ($current_song = kingsandqueens && $current_difficulty = expert)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_LIFE_OF_THE_PARTY 
	printf \{"Achievements_LIFE_OF_THE_PARTY"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_consecutive_won_as_host> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SEARCH_AND_DESTROY 
	printf \{"Achievements_SEARCH_AND_DESTROY"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_consecutive_won_as_client> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BUTTON_MASHER 
	printf \{"Achievements_BUTTON_MASHER"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_won_with_standard_controller> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BIG_OL_PILE_OF_WINS 
	printf \{"Achievements_BIG_OL_PILE_OF_WINS"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_won> > 499)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_ENLIGHTENED_GUITARIST 
	array_entry = 0
	get_songlist_size
	num_gold_star_games = 0
	begin
	get_songlist_checksum index = <array_entry>
	get_difficulty_text_nl \{difficulty = expert}
	get_song_prefix song = <song_checksum>
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	if (<achievement_gold_star> = 1)
		num_gold_star_games = (<num_gold_star_games> + 1)
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	if (<num_gold_star_games> > 19)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievement_TOYS_IN_THE_ATTIC 
	printf \{"Achievement_TOYS_IN_THE_ATTIC"}
	guitar_array = ($Bonus_Guitars)
	GetArraySize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	guitar_array = ($Bonus_Basses)
	GetArraySize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{TRUE}
endscript

script Achievement_BIG_TEN_INCH_RECORD 
	GetArraySize ($Bonus_Songs_Info)
	index = 0
	begin
	GetGlobalTags ($Bonus_Songs_Info [<index>].item)
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{TRUE}
endscript

script Achievement_KINGS_AND_QUEENS 
	character_array = ($Secret_Characters)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{TRUE}
endscript

script Achievement_WALK_THIS_WAY 
	character_array = ($Secret_Characters)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if ((<unlocked> = 1) && (<character_array> [<index>].info_name = DMC))
		return \{TRUE}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{FALSE}
endscript

script Achievement_BURNING_A_HOLE_IN_YOUR_POCKET 
	GetArraySize ($Bonus_Videos)
	index = 0
	begin
	video_checksum = ($Bonus_Videos [<index>].id)
	GetGlobalTags <video_checksum>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	if NOT Achievement_BIG_TEN_INCH_RECORD
		return \{FALSE}
	endif
	if NOT Achievement_TOYS_IN_THE_ATTIC
		return \{FALSE}
	endif
	if NOT Achievement_KINGS_AND_QUEENS
		return \{FALSE}
	endif
	character_array = ($Bonus_Outfits)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	character_array = ($Bonus_Styles)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{TRUE}
endscript

script Achievement_CheckBuyAchievements 
	if Achievement_TOYS_IN_THE_ATTIC
		WriteAchievements \{achievement = toys_in_the_attic}
	endif
	if Achievement_BIG_TEN_INCH_RECORD
		WriteAchievements \{achievement = big_ten_inch_record}
	endif
	if Achievement_KINGS_AND_QUEENS
		WriteAchievements \{achievement = kings_and_queens}
	endif
	if Achievement_WALK_THIS_WAY
		WriteAchievements \{achievement = walk_this_way}
	endif
	if Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		WriteAchievements \{achievement = burning_a_hole_in_your_pocket}
	endif
	if Achievements_WELCOME_TO_HELL
		WriteAchievements \{achievement = welcome_to_hell}
	endif
endscript

script Achievements_IsGameFinished 
	printf \{"Achievements_IsGameFinished"}
	if NOT GotParam \{difficulty}
		scriptassert \{"No difficulty"}
	endif
	if NOT GotParam \{game_mode}
		scriptassert \{"No game mode"}
	endif
	GetArraySize ($difficulty_list)
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	if GotParam \{bonus}
		get_progression_globals game_mode = <game_mode> bonus
	else
		get_progression_globals game_mode = <game_mode>
	endif
	setlist_prefix = ($<tier_global>.prefix)
	FormatText checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl>
	GetGlobalTags <gametype_checksum>
	if (<difficulty> = any)
		if (<complete> = 1)
			return \{TRUE}
		endif
	endif
	if (<difficulty> = all)
		if (<complete> = 0)
			return \{FALSE}
		endif
	endif
	if (<difficulty> = ($difficulty_list [<array_count>]))
		if (<complete> = 1)
			return \{TRUE}
		else
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	if (<difficulty> = any)
		return \{FALSE}
	else
		return \{TRUE}
	endif
endscript

script Achievements_SCORE_HERO 
	printf \{"Achievements_SCORE_HERO"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if (($player1_status.Score > 325000) && ($current_song = trainkeptarollin))
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HALF_A_MILL 
	printf \{"Achievements_HALF_A_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.Score > 500000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_FIRST_MILL 
	printf \{"Achievements_FIRST_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.Score > 750000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_CheckCareerTotals 
	GetGlobalTags \{achievement_info}
	if (<total_cash_in_career_mode> > 350000)
		WriteAchievements \{achievement = never_gonna_spend_it_all}
	endif
	if (<total_notes_in_career_mode> > 250000)
		WriteAchievements \{achievement = notes_from_hell}
	endif
	if (<total_points_in_career_mode> > 100000000)
		WriteAchievements \{achievement = billion_gulp}
	endif
endscript

script Achievements_CoopBeatenPart 
	printf \{"Achievements_CoopBeatenPart"}
	get_progression_globals \{game_mode = p2_quickplay}
	setlist_prefix = ($<tier_global>.prefix)
	tier = 1
	begin
	FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	FormatText checksumname = tier_checksum 'tier%s' s = <tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	GetGlobalTags ($<tier_global>.<tier_checksum>.songs [<array_count>])
	if (<part> = rhythm)
		if (<beaten_coop_as_rhythm> = 0)
			return \{FALSE}
		endif
	else
		if (<beaten_coop_as_lead> = 0)
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat ($<tier_global>.num_tiers)
	return \{TRUE}
endscript

script Achievements_WELCOME_TO_HELL 
	GetGlobalTags \{achievement_info param = ranked_matches_played}
	if (<ranked_matches_played> < 100)
		return \{FALSE}
	endif
	if NOT Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		return \{FALSE}
	endif
	if NOT Achievements_IsGameFinished \{game_mode = p1_career difficulty = all}
		return \{FALSE}
	endif
	return \{TRUE}
endscript

script Achievements_HENDRIX_REBORN 
	GetGlobalTags \{achievement_info}
	if (<hendrix_achievement_lefty_off> = 1 &&
			<hendrix_achievement_lefty_on> = 1)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_WHAMMY_MANIA 
	if ($current_song = numberofthebeast)
		if ($game_mode = p1_career || $game_mode = p1_quickplay)
			if ($whammy_mania_achievement_invalidated = 0)
				return \{TRUE}
			endif
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SongFailed 
	completion = 0
	get_song_end_time song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
	endif
	CastToInteger \{completion}
	if NOT ($current_song = bossjoe)
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($current_song)
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		if ($game_mode = p2_coop || $game_mode = p2_quickplay)
			GetGlobalTags <songname> param = coop_failedtimes
			coop_failedtimes = (<coop_failedtimes> + 1)
			SetGlobalTags <songname> params = {coop_failedtimes = <coop_failedtimes>}
		else
			GetGlobalTags <songname> param = failedtimes
			failedtimes = (<failedtimes> + 1)
			SetGlobalTags <songname> params = {failedtimes = <failedtimes>}
		endif
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		GetArraySize \{$gh3_songlist}
		total_songs = <array_size>
		GetArraySize \{$difficulty_list}
		total_diffs = <array_size>
		total_song_failures = 0
		song_count = 0
		begin
		diffs_count = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<diffs_count>])
		get_song_prefix song = ($gh3_songlist [<song_count>])
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		GetGlobalTags <songname> param = coop_failedtimes
		total_song_failures = (<total_song_failures> + <coop_failedtimes>)
		if (<total_song_failures> > 4)
			WriteAchievements \{achievement = nobodys_fault}
			break
		endif
		diffs_count = (<diffs_count> + 1)
		repeat <total_diffs>
		song_count = (<song_count> + 1)
		repeat <total_songs>
		if (<completion> > 94)
			WriteAchievements \{achievement = fallen_angels}
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		GetArraySize \{$difficulty_list}
		array_count = 0
		total_failedtimes = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
		get_song_prefix song = ($current_song)
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		GetGlobalTags <songname> param = failedtimes
		total_failedtimes = (<total_failedtimes> + <failedtimes>)
		array_count = (<array_count> + 1)
		repeat <array_size>
		if (<total_failedtimes> > 9)
			WriteAchievements \{achievement = night_in_the_ruts}
		endif
	endif
	if ($game_mode = p1_career)
		GetGlobalTags \{achievement_info}
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.notes_hit)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.Score)
		SetGlobalTags achievement_info params = {total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		Achievements_CheckCareerTotals
	endif
endscript

script Achievements_net_game_completed 
	if NOT GotParam \{outcome}
		return
	endif
	if ($is_network_game = 1 && (NetSessionFunc func = isranked obj = match))
		if (<outcome> = win)
			retrieve_player_net_id \{player = 2}
			CheckAndWriteMakerAchievement player_xuid = <net_id>
			if ($game_mode = p2_pro_faceoff)
				WriteAchievements \{achievement = my_fist_your_face}
				if ((($player1_status.Score) - ($player2_status.Score)) > 9999)
					WriteAchievements \{achievement = walkin_the_dog}
				endif
			elseif ($game_mode = p2_faceoff)
				WriteAchievements \{achievement = dont_get_mad_get_even}
			elseif ($game_mode = p2_battle)
				if (($player1_status.final_blow_powerup) = 7)
					WriteAchievements \{achievement = soul_saver}
				endif
			endif
		elseif (<outcome> = lose)
			if ($game_mode = p2_pro_faceoff)
				WriteAchievements \{achievement = you_see_me_crying}
			elseif ($game_mode = p2_faceoff)
				WriteAchievements \{achievement = falling_off}
			endif
		endif
	endif
endscript

script Achievements_WHAT_IT_TAKES 
	printf \{"Achievements_WHAT_IT_TAKES"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_played> > 19)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SPACED 
	printf \{"Achievements_SPACED"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($gStar_Power_Triggered = 0) && ($player1_status.star_power_amount >= 50.0))
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_WOMAN_OF_THE_WORLD 
	printf \{"Achievements_WOMAN_OF_THE_WORLD"}
	is_aerosmith_song song = ($current_song)
	is_joe_perry_song song = ($current_song)
	if ((<aerosmith_song> = 1 && $is_network_game = 0) ||
			(<joe_perry_song> = 1 && $is_network_game = 0) ||
			$game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($player1_status.character_id) = CASEY ||
			($player1_status.character_id) = JUDY ||
			($player1_status.character_id) = MIDORI)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_DUDE_LOOKS_LIKE_A_LADY 
	printf \{"Achievements_DUDE_LOOKS_LIKE_A_LADY"}
	is_aerosmith_song song = ($current_song)
	is_joe_perry_song song = ($current_song)
	if ((<aerosmith_song> = 1 && $is_network_game = 0) ||
			(<joe_perry_song> = 1 && $is_network_game = 0) ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1 ||
			$is_network_game = 1)
		return \{FALSE}
	endif
	if (($player1_status.character_id) = Izzy)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievement_progression_difficulty_threshold 
	printf \{"Achievement_progression_difficulty_threshold"}
	if NOT GotParam \{difficulty}
		return \{FALSE}
	endif
	switch <difficulty>
		case easy
		starting_index = 0
		case medium
		starting_index = 1
		case hard
		starting_index = 2
		case expert
		starting_index = 3
	endswitch
	GetArraySize \{$difficulty_list}
	index = <starting_index>
	begin
	if Progression_CheckDiff diff = ($difficulty_list [<index>])
		return \{TRUE}
	endif
	index = (<index> + 1)
	repeat (<array_size> - <starting_index>)
	return \{FALSE}
endscript

script Achievements_Career_Score_Threshold 
	printf \{"Achievements_Career_Score_Threshold"}
	if NOT GotParam \{threshold}
		return \{FALSE}
	endif
	get_progression_globals \{game_mode = p1_career}
	summation_career_score tier_global = <tier_global>
	if (<career_score> > <threshold>)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_Unlocked_Venue 
	printf \{"Achievements_Unlocked_Venue"}
	if NOT GotParam \{venue}
		return \{FALSE}
	endif
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.name)
	GetGlobalTags <venue_checksum> params = {unlocked}
	if ((<venue> = <level_checksum>) && (<unlocked> = 1))
		return \{TRUE}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	return \{FALSE}
endscript

script Achievements_AEROSMITH 
	printf \{"Achievements_AEROSMITH"}
	get_progression_globals \{game_mode = p1_career}
	if ($game_mode = p1_career)
		array_count = 0
		begin
		setlist_prefix = ($<tier_global>.prefix)
		FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
		GetGlobalTags <tiername> param = aerosmith_unlocked
		if (<aerosmith_unlocked> = 1)
			return \{TRUE}
		endif
		array_count = (<array_count> + 1)
		repeat ($<tier_global>.num_tiers)
	endif
	return \{FALSE}
endscript

script Achievements_GEMS 
	printf \{"Achievements_GEMS"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($player1_status.sp_phrases_hit) = ($player1_status.sp_phrases_total))
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_5StarSong 
	printf \{"Achievements_5StarSong"}
	if (($player1_status.stars) >= 5)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_Stack_Career 
	printf \{"Achievements_Stack_Career"}
	if NOT GotParam \{difficulty}
		return
	endif
	switch <difficulty>
		case medium
		WriteAchievements \{achievement = make_it}
		case hard
		WriteAchievements \{achievement = make_it}
		WriteAchievements \{achievement = movin_out}
		case expert
		WriteAchievements \{achievement = make_it}
		WriteAchievements \{achievement = movin_out}
		WriteAchievements \{achievement = rock_in_a_hard_place}
	endswitch
endscript

script Achievements_Play_At_Venue 
	printf \{"Achievements_Play_At_Venue"}
	if NOT GotParam \{venue}
		return \{FALSE}
	endif
	if ($jailbait_achievement = 1 && <venue> = load_z_Nipmuc)
		return \{TRUE}
	endif
	if ($subway_achievement = 1 && <venue> = load_z_MaxsKC)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_Career_Cash_Threshold 
	if NOT GotParam \{threshold}
		return \{FALSE}
	endif
	GetGlobalTags \{achievement_info}
	if (<total_cash_in_career_mode> > <threshold>)
		return \{TRUE}
	endif
	return \{FALSE}
endscript
