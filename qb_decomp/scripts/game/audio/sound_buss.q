BussTree = {
	master = {
		User_Sfx = {
			ui = {
				LeafNodes = [
					front_end
					Pause_Menu
					UI_Star_Power
					UI_Battle_Mode
					Wrong_Notes_Player1
					Wrong_Notes_Player2
				]
			}
			crowd = {
				Crowd_W_Reverb = {
					LeafNodes = [
						Crowd_Singalong
						Crowd_One_Shots
					]
				}
				LeafNodes = [
					Crowd_Beds
					Crowd_Cheers
					Crowd_Boos
					Crowd_Nuetral
					Crowd_Star_Power
					Crowd_PreEncore_Building
					Crowd_PreSong_Intro
					Crowd_Applause
					Crowd_Transitions
				]
			}
			LeafNodes = [
				`default`
				Test_Tones
				Encore_Events
				binkcutscenes
				Practice_Band_Playback
				Training_VO
			]
		}
		User_Band = {
			Band_Balance = {
				LeafNodes = [
					Band_Playback
					Single_Player_Rhythm_Playback
					Music_Frontend
					music_setlist
					Countoffs
				]
			}
		}
		User_Guitar = {
			Guitar_Balance = {
				Guitar_Balance_First_Player = {
					LeafNodes = [
						First_Player_Lead_Playback
					]
				}
				Guitar_Balance_Second_Player = {
					LeafNodes = [
						Second_Player_Lead_Playback
						Second_Player_Rhythm_Playback
					]
				}
			}
			LeafNodes = [
				Test_Tones_DSP
				Right_Notes_Player1
				Right_Notes_Player2
			]
		}
	}
}
Default_BussSet = {
	master = {
		priority = 5
		vol = -2.5
		pitch = 0
		instance_rule = ignore
		max_instances = 64
	}
	default = {
		priority = 5
		vol = -4
		pitch = 0
	}
	Test_Tones = {
		priority = 5
		vol = 0
		pitch = 0
	}
	User_Sfx = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = ignore
		max_instances = 500
	}
	ui = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_Band = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Band_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	User_Guitar = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Guitar_Balance = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Guitar_Balance_First_Player = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Guitar_Balance_Second_Player = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Right_Notes_Player1 = {
		priority = 1
		vol = -4
		pitch = 0
	}
	First_Player_Lead_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Second_Player_Lead_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Second_Player_Rhythm_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Single_Player_Rhythm_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Wrong_Notes_Player1 = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	Right_Notes_Player2 = {
		priority = 1
		vol = -4
		pitch = 0
	}
	Wrong_Notes_Player2 = {
		priority = 1
		vol = -3.5
		pitch = 0
	}
	Band_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Countoffs = {
		priority = 1
		vol = -7
		pitch = 0
	}
	Practice_Band_Playback = {
		priority = 1
		vol = -3.0
		pitch = 0
	}
	front_end = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Pause_Menu = {
		priority = 1
		vol = 0
		pitch = 0
	}
	UI_Star_Power = {
		priority = 1
		vol = -6
		pitch = 0
	}
	UI_Battle_Mode = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -1
		pitch = 0
	}
	Crowd_Beds = {
		priority = 1
		vol = -7
		pitch = 0
	}
	Crowd_Cheers = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Boos = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Nuetral = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Star_Power = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_PreEncore_Building = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_PreSong_Intro = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Crowd_Applause = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_Transitions = {
		priority = 1
		vol = -8
		pitch = 0
	}
	Crowd_Singalong = {
		priority = 1
		vol = -100
		pitch = 0
	}
	Crowd_W_Reverb = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Crowd_One_Shots = {
		priority = 1
		vol = -7.58
		pitch = 0
	}
	Music_Frontend = {
		priority = 1
		vol = -11
		pitch = 0
	}
	music_setlist = {
		priority = 1
		vol = -2
		pitch = 0
	}
	Test_Tones_DSP = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Encore_Events = {
		priority = 1
		vol = 0
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = -5
		pitch = 0
	}
	Training_VO = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
Star_Power_BussSet = {
	Right_Notes_Player1 = {
		priority = 1
		vol = -2.0
		pitch = 0
	}
	Right_Notes_Player2 = {
		priority = 1
		vol = -2.0
		pitch = 0
	}
}
BattleMode_Thin_BussSet = {
	Right_Notes_Player1 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	First_Player_Lead_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Second_Player_Lead_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Second_Player_Rhythm_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Single_Player_Rhythm_Playback = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
AutoWah_BussSet = {
	Right_Notes_Player1 = {
		priority = 1
		vol = -10
		pitch = 0
	}
}
CrowdSurgeBig_BussSet = {
	Crowd_Beds = {
		priority = 1
		vol = 3.0
		pitch = 0
	}
}
CrowdSurgeSmall_BussSet = {
	Crowd_Beds = {
		priority = 1
		vol = 1.0
		pitch = 0
	}
}
CrowdNormal_BussSet = {
	Crowd_Beds = {
		priority = 1
		vol = -6
		pitch = 0
	}
}
CrowdSingingVolUp_BussSet = {
	Crowd_Singalong = {
		priority = 1
		vol = -8
		pitch = 0
	}
}
CrowdSingingVolDown_BussSet = {
	Crowd_Singalong = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Failed_Song_Pitching_Down_BussSet = {
	Band_Balance = {
		priority = 1
		vol = -10
		pitch = -8
	}
	Guitar_Balance = {
		priority = 1
		vol = -10
		pitch = -8
	}
}
