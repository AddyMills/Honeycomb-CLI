gStar_Power_Triggered = 0
Achievement_Atoms = [
	{
		Name = PERFECTIONIST
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_PERFECTIONIST
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = WHO_NEEDS_THE_POWER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_WhoNeedsThePower
			}
		]
	}
	{
		Name = TONE_DEAF
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_TONE_DEAF
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = STAR_MANIA
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_STAR_MANIA
			}
		]
	}
	{
		Name = LIFE_OF_THE_PARTY
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_LIFE_OF_THE_PARTY
			}
		]
	}
	{
		Name = SEARCH_AND_DESTROY
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_SEARCH_AND_DESTROY
			}
		]
	}
	{
		Name = BUTTON_MASHER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_BUTTON_MASHER
			}
		]
	}
	{
		Name = BIG_OL_PILE_OF_WINS
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_BIG_OL_PILE_OF_WINS
			}
		]
	}
	{
		Name = HALF_MILL_CLUB
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_HALF_MILL_CLUB
			}
		]
	}
	{
		Name = MILLIONAIRE_CLUB
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_MILLIONAIRE_CLUB
			}
		]
	}
	{
		Name = HIGHER_THAN_MOST
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_HIGHER_THAN_MOST
			}
		]
	}
	{
		Name = LEADERS_OF_THE_PACK
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_LEADERS_OF_THE_PACK
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = ENLIGHTENED_GUITARIST
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_ENLIGHTENED_GUITARIST
			}
		]
	}
	{
		Name = THATS_WHAT_FRIENDS_ARE_FOR
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p2_career
					DIFFICULTY = Any
				}
			}
		]
	}
	{
		Name = EASY_RIDER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = EASY
				}
			}
		]
	}
	{
		Name = MEDIUM_RARE
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = MEDIUM
				}
			}
		]
	}
	{
		Name = ALWAYS_HARD
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = HARD
				}
			}
		]
	}
	{
		Name = RIGHT_HAND_OF_GOD
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = EXPERT
				}
			}
		]
	}
	{
		Name = SOLO_CAREER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = All
				}
			}
		]
	}
	{
		Name = AXE_GRINDER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EASY
					mode = p1_career
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = ROCK_GURU
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = MEDIUM
					mode = p1_career
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = SHREDDER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = HARD
					mode = p1_career
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = GUITAR_HERO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EXPERT
					mode = p1_career
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = EASY_DUO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EASY
					mode = p2_career
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = MEDIUM_DUO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = MEDIUM
					mode = p2_career
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = HARD_DUO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = HARD
					mode = p2_career
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = LIVING_LEGENDS
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EXPERT
					mode = p2_career
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = SMOKIN_ACES
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_SMOKIN_ACES
			}
		]
	}
	{
		Name = FIRST_BIG_SCORE
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_FIRST_BIG_SCORE
			}
		]
	}
	{
		Name = HALF_A_MILL
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_HALF_A_MILL
			}
		]
	}
	{
		Name = FIRST_MILL
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_FIRST_MILL
			}
		]
	}
	{
		Name = GUITAR_WIZARD
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_CoopBeatenPart
				Params = {
					part = GUITAR
				}
			}
		]
	}
	{
		Name = BACK_UP_HERO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_CoopBeatenPart
				Params = {
					part = RHYTHM
				}
			}
		]
	}
	{
		Name = WELCOME_TO_HELL
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_WELCOME_TO_HELL
			}
		]
	}
	{
		Name = HENDRIX_REBORN
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_HENDRIX_REBORN
			}
		]
	}
	{
		Name = WHAMMY_MANIA
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_WHAMMY_MANIA
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
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
		getglobaltags \{achievement_info}
		total_cash_in_career_mode = (<total_cash_in_career_mode> + <additional_cash>)
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.NOTES_HIT)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.score)
		setGlobalTags achievement_info Params = {total_cash_in_career_mode = <total_cash_in_career_mode>
			total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		if ($current_difficulty = EASY)
			total_points_in_career_mode_easy = (<total_points_in_career_mode_easy> + $player1_status.score)
			setGlobalTags achievement_info Params = {total_points_in_career_mode_easy = <total_points_in_career_mode_easy>}
		endif
		if ($current_difficulty = MEDIUM)
			total_points_in_career_mode_medium = (<total_points_in_career_mode_medium> + $player1_status.score)
			setGlobalTags achievement_info Params = {total_points_in_career_mode_medium = <total_points_in_career_mode_medium>}
		endif
		if ($current_difficulty = HARD)
			total_points_in_career_mode_hard = (<total_points_in_career_mode_hard> + $player1_status.score)
			setGlobalTags achievement_info Params = {total_points_in_career_mode_hard = <total_points_in_career_mode_hard>}
		endif
		if ($current_difficulty = EXPERT)
			total_points_in_career_mode_expert = (<total_points_in_career_mode_expert> + $player1_status.score)
			setGlobalTags achievement_info Params = {total_points_in_career_mode_expert = <total_points_in_career_mode_expert>}
		endif
		Achievements_CheckCareerTotals
	endif
	if ($game_mode = p2_career)
		if ($player1_status.controller = ($primary_controller))
			if ($player1_status.part = RHYTHM)
				setGlobalTags ($current_song) Params = {beaten_coop_as_rhythm = 1}
			else
				setGlobalTags ($current_song) Params = {beaten_coop_as_lead = 1}
			endif
			elseif ($player2_status.controller = ($primary_controller))
			if ($player2_status.part = RHYTHM)
				setGlobalTags ($current_song) Params = {beaten_coop_as_rhythm = 1}
			else
				setGlobalTags ($current_song) Params = {beaten_coop_as_lead = 1}
			endif
		endif
	endif
	if ($game_mode = p2_coop)
		if ($player1_status.part = RHYTHM)
			setGlobalTags ($current_song) Params = {beaten_coop_as_rhythm = 1}
		else
			setGlobalTags ($current_song) Params = {beaten_coop_as_lead = 1}
		endif
	endif
	if ($game_mode = p1_career)
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		formatText Checksumname = bandname_id 'band%i_info_%g' I = ($current_band) G = 'p1_career'
		formatText Checksumname = hendrix_checksum 'hendrix_achievement_%s' S = <difficulty_text_nl>
		getglobaltags <bandname_id> param = <hendrix_checksum>
		getglobaltags \{user_options Params = lefty_flip_p1}
		if ((<...>.<hendrix_checksum>) = 2)
			elseif ((<...>.<hendrix_checksum>) = -1)
			Addparam Name = <hendrix_checksum> structure_name = new_params Value = <lefty_flip_p1>
			setGlobalTags <bandname_id> Params = <new_params>
			elseif NOT ((<...>.<hendrix_checksum>) = <lefty_flip_p1>)
			Addparam Name = <hendrix_checksum> structure_name = new_params Value = 2
			setGlobalTags <bandname_id> Params = <new_params>
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if ($current_song = thrufireandflames && $current_difficulty = EXPERT && $boss_battle = 0 && $end_credits = 0)
			WriteAchievements \{Achievement = ONLY_THE_L33T}
		endif
	endif
endscript

script Achievements_PERFECTIONIST 
	Printf \{"Achievements_PERFECTIONIST"}
	if ($is_attract_mode = 0 &&
			($game_mode = p1_career ||
				$game_mode = p1_quickplay))
		if ($player1_status.NOTES_HIT = $player1_status.max_notes &&
				$player1_status.max_notes > 0)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_WhoNeedsThePower 
	Printf \{"Achievements_WhoNeedsThePower"}
	if ($game_mode = training ||
			$game_mode = PRACTICE ||
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
	Printf \{"star power trigged  = %d" D = $gStar_Power_Triggered}
	if ($player1_status.score > 199999 &&
			$gStar_Power_Triggered = 0 &&
			$current_song = CultOfPersonality)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_TONE_DEAF 
	Printf \{"Achievements_TONE_DEAF"}
	if ($game_mode = p1_quickplay ||
			($game_mode = p1_career && $boss_battle = 0))
		getglobaltags \{user_options}
		if ($current_difficulty = EXPERT)
			if (<guitar_volume> = 0)
				return \{TRUE}
			endif
		endif
	endif
	return \{FALSE}
endscript

script Achievements_STAR_MANIA 
	Printf \{"Achievements_STAR_MANIA"}
	if ($game_mode = training ||
			$game_mode = PRACTICE ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if NOT ($game_mode = p1_quickplay)
		return \{FALSE}
	endif
	Printf \{"star power trigged  = %d" D = $gStar_Power_Triggered}
	if ($gStar_Power_Triggered > 2)
		if ($current_song = thrufireandflames && $current_difficulty = EXPERT)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_LIFE_OF_THE_PARTY 
	Printf \{"Achievements_LIFE_OF_THE_PARTY"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_consecutive_won_as_host> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SEARCH_AND_DESTROY 
	Printf \{"Achievements_SEARCH_AND_DESTROY"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_consecutive_won_as_client> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BUTTON_MASHER 
	Printf \{"Achievements_BUTTON_MASHER"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_matches_won_with_standard_controller> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BIG_OL_PILE_OF_WINS 
	Printf \{"Achievements_BIG_OL_PILE_OF_WINS"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_matches_won> > 499)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HALF_MILL_CLUB 
	Printf \{"Achievements_HALF_MILL_CLUB"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.score + $player2_status.score) > 499999)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_MILLIONAIRE_CLUB 
	Printf \{"Achievements_MILLIONAIRE_CLUB"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.score + $player2_status.score) > 999999)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HIGHER_THAN_MOST 
	Printf \{"Achievements_HIGHER_THAN_MOST"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.score + $player2_status.score) > 699999)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_LEADERS_OF_THE_PACK 
	Printf \{"Achievements_LEADERS_OF_THE_PACK"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ($player1_status.total_notes = $player1_status.NOTES_HIT)
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
	get_songlist_checksum Index = <array_entry>
	get_difficulty_text_nl \{DIFFICULTY = EXPERT}
	get_song_prefix Song = <song_checksum>
	formatText Checksumname = songname '%s_%d' S = <song_prefix> D = <difficulty_text_nl>
	getglobaltags <songname>
	if (<achievement_gold_star> = 1)
		num_gold_star_games = (<num_gold_star_games> + 1)
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	if (<num_gold_star_games> > 19)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievement_AXE_COLLECTOR 
	guitar_array = ($Bonus_Guitars)
	getArraySize <guitar_array>
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	guitar_array = ($Secret_Guitars)
	getArraySize <guitar_array>
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	guitar_array = ($Bonus_Basses)
	getArraySize <guitar_array>
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	guitar_array = ($Secret_Basses)
	getArraySize <guitar_array>
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	guitar_array = ($Bonus_Guitar_Finishes)
	getArraySize <guitar_array>
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	guitar_array = ($Bonus_Bass_Finishes)
	getArraySize <guitar_array>
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	getglobaltags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{TRUE}
endscript

script Achievement_TRACK_MASTER 
	getArraySize ($Bonus_Songs_Info)
	Index = 0
	begin
	getglobaltags ($Bonus_Songs_Info [<Index>].item)
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{TRUE}
endscript

script Achievement_GOT_EM_ALL 
	character_array = ($Secret_Characters)
	getArraySize <character_array>
	Index = 0
	begin
	character_id = (<character_array> [<Index>].Id)
	getglobaltags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{TRUE}
endscript

script Achievement_BURNING_A_HOLE_IN_YOUR_POCKET 
	getArraySize ($Bonus_videos)
	Index = 0
	begin
	video_checksum = ($Bonus_videos [<Index>].Id)
	getglobaltags <video_checksum>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
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
	getArraySize <character_array>
	Index = 0
	begin
	character_id = (<character_array> [<Index>].Id)
	getglobaltags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	character_array = ($Bonus_Styles)
	getArraySize <character_array>
	Index = 0
	begin
	character_id = (<character_array> [<Index>].Id)
	getglobaltags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{TRUE}
endscript

script Achievement_CheckBuyAchievements 
	if Achievement_AXE_COLLECTOR
		WriteAchievements \{Achievement = AXE_COLLECTOR}
	endif
	if Achievement_TRACK_MASTER
		WriteAchievements \{Achievement = TRACK_MASTER}
	endif
	if Achievement_GOT_EM_ALL
		WriteAchievements \{Achievement = GOT_EM_ALL}
	endif
	if Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		WriteAchievements \{Achievement = BURNING_A_HOLE_IN_YOUR_POCKET}
	endif
	if Achievements_WELCOME_TO_HELL
		WriteAchievements \{Achievement = WELCOME_TO_HELL}
	endif
endscript

script Achievements_IsGameFinished 
	if NOT gotParam \{DIFFICULTY}
		Scriptassert \{"No difficulty"}
	endif
	if NOT gotParam \{game_mode}
		Scriptassert \{"No game mode"}
	endif
	getArraySize ($difficulty_list)
	array_count = 0
	begin
	get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
	get_progression_globals game_mode = <game_mode>
	setlist_prefix = ($<tier_global>.Prefix)
	formatText Checksumname = gametype_checksum '%p_%s' P = <setlist_prefix> S = <difficulty_text_nl>
	getglobaltags <gametype_checksum>
	if (<DIFFICULTY> = Any)
		if (<Complete> = 1)
			return \{TRUE}
		endif
	endif
	if (<DIFFICULTY> = All)
		if (<Complete> = 0)
			return \{FALSE}
		endif
	endif
	if (<DIFFICULTY> = ($difficulty_list [<array_count>]))
		if (<Complete> = 1)
			return \{TRUE}
		else
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if (<DIFFICULTY> = Any)
		return \{FALSE}
	else
		return \{TRUE}
	endif
endscript

script Achievements_SMOKIN_ACES 
	Printf \{"Achievements_SMOKIN_ACES"}
	if ($game_mode = p2_career)
		if ($player1_status.score > 1000000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_FIRST_BIG_SCORE 
	Printf \{"Achievements_FIRST_BIG_SCORE"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 250000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HALF_A_MILL 
	Printf \{"Achievements_HALF_A_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 500000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_FIRST_MILL 
	Printf \{"Achievements_FIRST_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 750000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_CheckCareerTotals 
	getglobaltags \{achievement_info}
	if (<total_cash_in_career_mode> > 350000)
		WriteAchievements \{Achievement = NEVER_GONNA_SPEND_IT_ALL}
	endif
	if (<total_notes_in_career_mode> > 250000)
		WriteAchievements \{Achievement = NOTES_FROM_HELL}
	endif
	if (<total_points_in_career_mode> > 100000000)
		WriteAchievements \{Achievement = BILLION_GULP}
	endif
endscript

script Achievements_CoopBeatenPart 
	get_progression_globals \{game_mode = p2_coop}
	setlist_prefix = ($<tier_global>.Prefix)
	Tier = 1
	begin
	formatText Checksumname = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	formatText Checksumname = tier_checksum 'tier%s' S = <Tier>
	getArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	getglobaltags ($<tier_global>.<tier_checksum>.songs [<array_count>])
	if (<part> = RHYTHM)
		if (<beaten_coop_as_rhythm> = 0)
			return \{FALSE}
		endif
	else
		if (<beaten_coop_as_lead> = 0)
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
	return \{TRUE}
endscript

script Achievements_WELCOME_TO_HELL 
	getglobaltags \{achievement_info param = ranked_matches_played}
	if (<ranked_matches_played> < 100)
		return \{FALSE}
	endif
	if NOT Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		return \{FALSE}
	endif
	if NOT Achievements_IsGameFinished \{game_mode = p1_career DIFFICULTY = All}
		return \{FALSE}
	endif
	return \{TRUE}
endscript

script Achievements_HENDRIX_REBORN 
	getglobaltags \{achievement_info}
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
	get_song_end_time Song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
	endif
	castToInteger \{completion}
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if NOT ($boss_battle = 1)
			if (<completion> > 89)
				WriteAchievements \{Achievement = ALMOST_GOT_IT}
			endif
		endif
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		get_song_prefix Song = ($current_song)
		formatText Checksumname = songname '%s_%d' S = <song_prefix> D = <difficulty_text_nl>
		getglobaltags <songname> param = failedtimes
		failedtimes = (<failedtimes> + 1)
		setGlobalTags <songname> Params = {failedtimes = <failedtimes>}
		getArraySize \{$difficulty_list}
		array_count = 0
		total_failedtimes = 0
		begin
		get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
		get_song_prefix Song = ($current_song)
		formatText Checksumname = songname '%s_%d' S = <song_prefix> D = <difficulty_text_nl>
		getglobaltags <songname> param = failedtimes
		total_failedtimes = (<total_failedtimes> + <failedtimes>)
		printStruct <...>
		array_count = (<array_count> + 1)
		repeat <array_Size>
		if (<total_failedtimes> > 9)
			WriteAchievements \{Achievement = BLOWIN_IT}
		endif
	endif
	if ($game_mode = p1_career)
		getglobaltags \{achievement_info}
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.NOTES_HIT)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.score)
		setGlobalTags achievement_info Params = {total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		Achievements_CheckCareerTotals
	endif
endscript
