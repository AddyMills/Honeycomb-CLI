GH3_CoopCareer_Songs = {
	prefix = 'coopcareer'
	num_tiers = 7
	initial_movie = 'coop_01'
	tier1 = {
		Title = "1. Getting a band together"
		songs = [
			barracuda
			whenyouwereyoung
			bullsonparade
			slowride
			sabotage
		]
		encorep2
		level = load_z_dive
		defaultunlocked = 4
		completion_movie = 'coop_02'
		setlist_icon = setlist_icon_BAR
	}
	tier2 = {
		Title = "2. We just wanna be famous"
		songs = [
			schoolsout
			koolthing
			missmurder
			theseeker
			reptilia
		]
		encorep2
		level = load_z_video
		completion_movie = 'coop_03'
		setlist_icon = setlist_icon_VIDEOSHOOT
	}
	tier3 = {
		Title = "3. Overnight success"
		songs = [
			paranoid
			welcometothejungle
			anarchyintheuk
			laydown
			suckmykiss
		]
		encorep2
		level = load_z_budokan
		completion_movie = 'coop_04'
		setlist_icon = setlist_icon_MEGADOME
	}
	tier4 = {
		Title = "4. Getting the band back together"
		songs = [
			holidayincambodia
			blackmagicwoman
			sameoldsonganddance
			cherubrock
			citiesonflame
		]
		encorep2
		level = load_z_party
		completion_movie = 'coop_05'
		setlist_icon = setlist_icon_BACKYARD
	}
	tier5 = {
		Title = "5. Jailhouse rock"
		songs = [
			mynameisjonas
			blacksunshine
			threesandsevens
			themetal
			helicopter
		]
		encorep2
		level = load_z_prison
		completion_movie = 'coop_06'
		setlist_icon = setlist_icon_PRISON
	}
	tier6 = {
		Title = "6. Battle for your souls"
		songs = [
			knightsofcydonia
			one
			numberofthebeast
			cultofpersonality
			monsters
		]
		encorep2
		level = load_z_hell
		completion_movie = 'singleplayer_end'
		setlist_icon = setlist_icon_HELL
	}
	tier7 = {
		Title = "Unlocked Songs"
		songs = [
			talkdirtytome
			hitmewithyourbestshot
			mississippiqueen
			rocknrollallnite
			storyofmylife
			sunshineofyourlove
			evenflow
			rockulikeahurricane
			lagrange
			stricken
			pridenjoy
			beforeiforget
			rainingblood
			cliffsofdover
		]
		level = load_z_artdeco
		level2 = load_z_wikka
		nocash
	}
}
GH3_COOPCareer_NumSongToProgress = {
	easy = 3
	medium = 3
	hard = 4
	expert = 4
}
GH3_CoopCareer_Progression = [
	{
		name = set_initial_states
		type = scr
		atom_script = Progression_Init
		atom_params = {
		}
	}
	{
		name = career_tier1_songscomplete
		type = scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckSongComplete
				params = {
					tier = 1
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		name = career_tier1_encoreunlock
		type = scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = atom
				atom = career_tier1_songscomplete
			}
			{
				type = scr
				scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		name = career_tier1_encorecomplete
		type = scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = atom
				atom = career_tier1_encoreunlock
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 1
				}
			}
		]
	}
	{
		name = career_tier1_complete
		type = scr
		atom_script = Progression_TierComplete
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = atom
				atom = career_tier1_songscomplete
			}
			{
				type = atom
				atom = career_tier1_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		name = career_tier2_songscomplete
		type = scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = atom
				atom = career_tier1_complete
			}
			{
				type = scr
				scr = Progression_CheckSongComplete
				params = {
					tier = 2
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		name = career_tier2_encoreunlock
		type = scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = atom
				atom = career_tier2_songscomplete
			}
			{
				type = scr
				scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		name = career_tier2_encorecomplete
		type = scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = atom
				atom = career_tier2_encoreunlock
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 2
				}
			}
		]
	}
	{
		name = career_tier2_complete
		type = scr
		atom_script = Progression_TierComplete
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = atom
				atom = career_tier2_songscomplete
			}
			{
				type = atom
				atom = career_tier2_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		name = career_tier3_songscomplete
		type = scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = atom
				atom = career_tier2_complete
			}
			{
				type = scr
				scr = Progression_CheckSongComplete
				params = {
					tier = 3
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		name = career_tier3_encoreunlock
		type = scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = atom
				atom = career_tier3_songscomplete
			}
			{
				type = scr
				scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		name = career_tier3_encorecomplete
		type = scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = atom
				atom = career_tier3_encoreunlock
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 3
				}
			}
		]
	}
	{
		name = career_tier3_complete
		type = scr
		atom_script = Progression_TierComplete
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = atom
				atom = career_tier3_songscomplete
			}
			{
				type = atom
				atom = career_tier3_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		name = career_tier4_songscomplete
		type = scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = atom
				atom = career_tier3_complete
			}
			{
				type = scr
				scr = Progression_CheckSongComplete
				params = {
					tier = 4
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		name = career_tier4_encoreunlock
		type = scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = atom
				atom = career_tier4_songscomplete
			}
			{
				type = scr
				scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		name = career_tier4_encorecomplete
		type = scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = atom
				atom = career_tier4_encoreunlock
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 4
				}
			}
		]
	}
	{
		name = career_tier4_complete
		type = scr
		atom_script = Progression_TierComplete
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = atom
				atom = career_tier4_songscomplete
			}
			{
				type = atom
				atom = career_tier4_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		name = career_tier5_songscomplete
		type = scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = atom
				atom = career_tier4_complete
			}
			{
				type = scr
				scr = Progression_CheckSongComplete
				params = {
					tier = 5
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		name = career_tier5_encoreunlock
		type = scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = atom
				atom = career_tier5_songscomplete
			}
			{
				type = scr
				scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		name = career_tier5_encorecomplete
		type = scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = atom
				atom = career_tier5_encoreunlock
			}
			{
				type = scr
				scr = Progression_CheckEncoreComplete
				params = {
					tier = 5
				}
			}
		]
	}
	{
		name = career_tier5_complete
		type = scr
		atom_script = Progression_TierComplete
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = atom
				atom = career_tier5_songscomplete
			}
			{
				type = atom
				atom = career_tier5_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		name = career_tier6_songscomplete
		type = scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = atom
				atom = career_tier5_complete
			}
			{
				type = scr
				scr = Progression_CheckSongComplete
				params = {
					tier = 6
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		name = career_tier6_encoreunlock
		type = scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_songscomplete
			}
			{
				type = scr
				scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		name = career_tier6_encorecomplete
		type = scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_encoreunlock
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
		name = career_tier6_complete
		type = scr
		atom_script = Progression_TierComplete
		atom_params = {
			tier = 6
			finished_game
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_songscomplete
			}
			{
				type = atom
				atom = career_tier6_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		name = career_unlock_unlockedsongs
		type = scr
		atom_script = Progression_UnlockTier
		atom_params = {
			tier = 7
			complete
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
		]
	}
	{
		name = unlock_bass1
		type = scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			Bass = 1
			for_difficulty
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = easy
					mode = p2_career
				}
			}
		]
	}
	{
		name = unlock_bass2
		type = scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			Bass = 2
			for_stars
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = easy
					mode = p2_career
				}
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		name = unlock_bass3
		type = scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			Bass = 3
			for_difficulty
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = medium
					mode = p2_career
				}
			}
		]
	}
	{
		name = unlock_bass4
		type = scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			Bass = 4
			for_stars
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = medium
					mode = p2_career
				}
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		name = unlock_bass5
		type = scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			Bass = 5
			for_difficulty
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = hard
					mode = p2_career
				}
			}
		]
	}
	{
		name = unlock_bass6
		type = scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			Bass = 6
			for_stars
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = hard
					mode = p2_career
				}
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		name = unlock_bass7
		type = scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			Bass = 7
			for_difficulty
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = expert
					mode = p2_career
				}
			}
		]
	}
	{
		name = unlock_bass8
		type = scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			Bass = 8
			for_stars
		}
		depends_on = [
			{
				type = scr
				scr = Progression_CheckDiff
				params = {
					diff = expert
					mode = p2_career
				}
			}
			{
				type = scr
				scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = Progression_EndOfFirstUpdate
		atom_params = {
		}
	}
]
