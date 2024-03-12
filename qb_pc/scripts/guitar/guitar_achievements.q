gStar_Power_Triggered = 0
Achievement_Atoms = [
	{
		name = perfectionist
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_PERFECTIONIST
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
		name = who_needs_the_power
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_WhoNeedsThePower
			}
		]
	}
	{
		name = tone_deaf
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_TONE_DEAF
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
		name = star_mania
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_STAR_MANIA
			}
		]
	}
	{
		name = life_of_the_party
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_LIFE_OF_THE_PARTY
			}
		]
	}
	{
		name = search_and_destroy
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_SEARCH_AND_DESTROY
			}
		]
	}
	{
		name = button_masher
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_BUTTON_MASHER
			}
		]
	}
	{
		name = big_ol_pile_of_wins
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_BIG_OL_PILE_OF_WINS
			}
		]
	}
	{
		name = half_mill_club
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_HALF_MILL_CLUB
			}
		]
	}
	{
		name = millionaire_club
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_MILLIONAIRE_CLUB
			}
		]
	}
	{
		name = higher_than_most
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_HIGHER_THAN_MOST
			}
		]
	}
	{
		name = leaders_of_the_pack
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_LEADERS_OF_THE_PACK
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
		name = enlightened_guitarist
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_ENLIGHTENED_GUITARIST
			}
		]
	}
	{
		name = thats_what_friends_are_for
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
					game_mode = p2_career
					difficulty = any
				}
			}
		]
	}
	{
		name = easy_rider
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
		name = medium_rare
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
					difficulty = medium
				}
			}
		]
	}
	{
		name = always_hard
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
					difficulty = hard
				}
			}
		]
	}
	{
		name = right_hand_of_god
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
					difficulty = expert
				}
			}
		]
	}
	{
		name = solo_career
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
					difficulty = all
				}
			}
		]
	}
	{
		name = axe_grinder
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = easy
					mode = p1_career
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		name = rock_guru
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = medium
					mode = p1_career
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		name = shredder
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = hard
					mode = p1_career
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		name = guitar_hero
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = expert
					mode = p1_career
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		name = easy_duo
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = easy
					mode = p2_career
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		name = medium_duo
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = medium
					mode = p2_career
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		name = hard_duo
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = hard
					mode = p2_career
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		name = living_legends
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = expert
					mode = p2_career
				}
				permanent = FALSE
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		name = SMOKIN_ACES
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_SMOKIN_ACES
			}
		]
	}
	{
		name = first_big_score
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_FIRST_BIG_SCORE
			}
		]
	}
	{
		name = half_a_mill
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_HALF_A_MILL
			}
		]
	}
	{
		name = first_mill
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_FIRST_MILL
			}
		]
	}
	{
		name = guitar_wizard
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
		name = back_up_hero
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
	{
		name = welcome_to_hell
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_WELCOME_TO_HELL
			}
		]
	}
	{
		name = hendrix_reborn
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_HENDRIX_REBORN
			}
		]
	}
	{
		name = whammy_mania
		type = scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = Achievements_WHAMMY_MANIA
				permanent = FALSE
			}
			{
				type = scr
				scr = Achievements_IsSongWon
				permanent = FALSE
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
	if ($game_mode = p2_career)
		if ($player1_status.controller = ($primary_controller))
			if ($player1_status.part = rhythm)
				SetGlobalTags ($current_song) params = {beaten_coop_as_rhythm = 1}
			else
				SetGlobalTags ($current_song) params = {beaten_coop_as_lead = 1}
			endif
			elseif ($player2_status.controller = ($primary_controller))
			if ($player2_status.part = rhythm)
				SetGlobalTags ($current_song) params = {beaten_coop_as_rhythm = 1}
			else
				SetGlobalTags ($current_song) params = {beaten_coop_as_lead = 1}
			endif
		endif
	endif
	if ($game_mode = p2_coop)
		if ($player1_status.part = rhythm)
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
		if ($current_song = thrufireandflames && $current_difficulty = expert && $boss_battle = 0 && $end_credits = 0)
			WriteAchievements \{achievement = only_the_l33t}
		endif
	endif
endscript

script Achievements_PERFECTIONIST 
	printf \{"Achievements_PERFECTIONIST"}
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
	if ($game_mode = p2_coop ||
			$game_mode = p2_career)
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
		if ($current_song = thrufireandflames && $current_difficulty = expert)
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

script Achievements_HALF_MILL_CLUB 
	printf \{"Achievements_HALF_MILL_CLUB"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.Score + $player2_status.Score) > 499999)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_MILLIONAIRE_CLUB 
	printf \{"Achievements_MILLIONAIRE_CLUB"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.Score + $player2_status.Score) > 999999)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HIGHER_THAN_MOST 
	printf \{"Achievements_HIGHER_THAN_MOST"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.Score + $player2_status.Score) > 699999)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_LEADERS_OF_THE_PACK 
	printf \{"Achievements_LEADERS_OF_THE_PACK"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ($player1_status.total_notes = $player1_status.notes_hit)
			if NOT ($player1_status.total_notes = 0)
				return \{TRUE}
			endif
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
	FormatText checksumname = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
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

script Achievement_AXE_COLLECTOR 
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
	guitar_array = ($Secret_Guitars)
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
	guitar_array = ($Secret_Basses)
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
	guitar_array = ($Bonus_Guitar_Finishes)
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
	guitar_array = ($Bonus_Bass_Finishes)
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

script Achievement_TRACK_MASTER 
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

script Achievement_GOT_EM_ALL 
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
	if NOT Achievement_TRACK_MASTER
		return \{FALSE}
	endif
	if NOT Achievement_AXE_COLLECTOR
		return \{FALSE}
	endif
	if NOT Achievement_GOT_EM_ALL
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
	if Achievement_AXE_COLLECTOR
		WriteAchievements \{achievement = axe_collector}
	endif
	if Achievement_TRACK_MASTER
		WriteAchievements \{achievement = track_master}
	endif
	if Achievement_GOT_EM_ALL
		WriteAchievements \{achievement = got_em_all}
	endif
	if Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		WriteAchievements \{achievement = burning_a_hole_in_your_pocket}
	endif
	if Achievements_WELCOME_TO_HELL
		WriteAchievements \{achievement = welcome_to_hell}
	endif
endscript

script Achievements_IsGameFinished 
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
	get_progression_globals game_mode = <game_mode>
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

script Achievements_SMOKIN_ACES 
	printf \{"Achievements_SMOKIN_ACES"}
	if ($game_mode = p2_career)
		if ($player1_status.Score > 1000000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_FIRST_BIG_SCORE 
	printf \{"Achievements_FIRST_BIG_SCORE"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.Score > 250000)
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
	get_progression_globals \{game_mode = p2_coop}
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
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if NOT ($boss_battle = 1)
			if (<completion> > 89)
				WriteAchievements \{achievement = almost_got_it}
			endif
		endif
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($current_song)
		FormatText checksumname = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
		GetGlobalTags <songname> param = failedtimes
		failedtimes = (<failedtimes> + 1)
		SetGlobalTags <songname> params = {failedtimes = <failedtimes>}
		GetArraySize \{$difficulty_list}
		array_count = 0
		total_failedtimes = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
		get_song_prefix song = ($current_song)
		FormatText checksumname = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
		GetGlobalTags <songname> param = failedtimes
		total_failedtimes = (<total_failedtimes> + <failedtimes>)
		printstruct <...>
		array_count = (<array_count> + 1)
		repeat <array_size>
		if (<total_failedtimes> > 9)
			WriteAchievements \{achievement = blowin_it}
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
