drum_blend_time_from_stickdown = 0.2
drum_blend_time_from_transition = 0.120000005
drum_blend_time_same_note = 0.075
drum_blend_time_kick = 0.2
drum_blend_out_time = 0.3
cymbal_blend_time = 0.2
drum_blend_time = 0.2
drummer_twist_rate = 0.04
drummer_arm_blend_out_delay = 0.0025000002
drummer_clear_arm_twist_value_delay = 0.005
drum_anim_lead_time = 567
kickevent_lead_time = 185
kickanim_lead_time = 200
cymbal_anim_lead_time = 100
stick_tap_lead_time = 640
drum_med_hit_time = 367
drum_hard_hit_time = 567
use_delayed_drum_hits = TRUE
drum_soft_delay = 0.4
drum_med_delay = 0.2
drum_hard_delay = 0.0
drum_sets = {
	artdeco = drum_kit001
	wikker = drum_kit002
	budokan = drum_kit003
	default = drum_kit001
}
drummer_left_arm_twist_factors = {
	track_37 = 0.8
	track_38 = 0.7
	track_39 = 0.1
	track_40 = 0.0
	track_41 = 0.0
	track_42 = 0.0
	track_43 = 0.2
	track_44 = 0.1
	track_45 = 0.05
}
drummer_right_arm_twist_factors = {
	track_49 = 0.8
	track_50 = 0.0
	track_51 = 0.1
	track_52 = 0.0
	track_53 = 0.0
	track_54 = 0.0
	track_55 = 0.0
	track_56 = 0.1
	track_57 = 0.05
}
drummer_animations = {
	stance_a = {
		idle = {
			good = {
				fast = [
					GH3_Drummer_Fst_Idle_01
					GH3_Drummer_Fst_Idle_02
					GH3_Drummer_Fst_Idle_03
				]
				med = [
					GH3_Drummer_Med_Idle_01
					GH3_Drummer_Med_Idle_02
					GH3_Drummer_Med_Idle_03
				]
				slow = [
					GH3_Drummer_Slw_Idle_01
					GH3_Drummer_Slw_Idle_02
					GH3_Drummer_Slw_Idle_03
				]
			}
			normal = {
				fast = [
					GH3_Drummer_Fst_Idle_01
					GH3_Drummer_Fst_Idle_02
					GH3_Drummer_Fst_Idle_03
				]
				med = [
					GH3_Drummer_Med_Idle_01
					GH3_Drummer_Med_Idle_02
					GH3_Drummer_Med_Idle_03
				]
				slow = [
					GH3_Drummer_Slw_Idle_01
					GH3_Drummer_Slw_Idle_02
					GH3_Drummer_Slw_Idle_03
				]
			}
			bad = {
				fast = [
					GH3_Drummer_Fst_Idle_01
					GH3_Drummer_Fst_Idle_02
					GH3_Drummer_Fst_Idle_03
				]
				med = [
					GH3_Drummer_Med_Idle_01
					GH3_Drummer_Med_Idle_02
					GH3_Drummer_Med_Idle_03
				]
				slow = [
					GH3_Drummer_Slw_Idle_01
					GH3_Drummer_Slw_Idle_02
					GH3_Drummer_Slw_Idle_03
				]
			}
		}
		transitions = {
		}
	}
	intro = {
		idle = {
			good = {
				fast = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
				med = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
				slow = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
			}
			normal = {
				fast = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
				med = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
				slow = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
			}
			bad = {
				fast = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
				med = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
				slow = [
					Gh3_Drum_Intro01
					Gh3_Drum_Intro02
					Gh3_Drum_Intro03
				]
			}
		}
		transitions = {
		}
	}
	win = {
		idle = {
			good = {
				fast = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
				med = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
				slow = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
			}
			normal = {
				fast = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
				med = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
				slow = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
			}
			bad = {
				fast = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
				med = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
				slow = [
					Gh3_Drum_Win01
					Gh3_Drum_Win02
				]
			}
		}
		transitions = {
		}
	}
	lose = {
		idle = {
			good = {
				fast = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
				med = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
				slow = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
			}
			normal = {
				fast = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
				med = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
				slow = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
			}
			bad = {
				fast = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
				med = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
				slow = [
					gh3_drum_lose01
					Gh3_Drum_Lose02
				]
			}
		}
		transitions = {
		}
	}
	BodyTwist = GH3_Drummer_BodyTwist_D
}
cymbal_anims = [
	GH3_Drum_Cymbal_1
	GH3_Drum_Cymbal_2
	GH3_Drum_Cymbal_3
	GH3_Drum_Cymbal_HH
]
drummer_anims = {
	track_36 = GH3_Drum_Kick
	track_37 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_SFTLP
			track_38 = Gh3_Drum_LH_Tom02_2_FlrTom
			track_39 = Gh3_Drum_LH_Tom01_2_FlrTm
			track_40 = Gh3_Drum_LH_Snare_2_FlrTm
			track_41 = Gh3_Drum_LH_HH_2_FlrTm
			track_42 = Gh3_Drum_LH_HH_2_FlrTm
			track_43 = Gh3_Drum_LH_Ride_2_FlrTm
			track_44 = Gh3_Drum_LH_Crash01_2_FlrTm
			track_45 = Gh3_Drum_LH_Crash02_2_FlrTm
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_MEDLP
			track_38 = Gh3_Drum_LH_Tom02_2_FlrTom
			track_39 = Gh3_Drum_LH_Tom01_2_FlrTm
			track_40 = Gh3_Drum_LH_Snare_2_FlrTm
			track_41 = Gh3_Drum_LH_HH_2_FlrTm
			track_42 = Gh3_Drum_LH_HH_2_FlrTm
			track_43 = Gh3_Drum_LH_Ride_2_FlrTm
			track_44 = Gh3_Drum_LH_Crash01_2_FlrTm
			track_45 = Gh3_Drum_LH_Crash02_2_FlrTm
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_HRDLP
			track_38 = Gh3_Drum_LH_Tom02_2_FlrTom
			track_39 = Gh3_Drum_LH_Tom01_2_FlrTm
			track_40 = Gh3_Drum_LH_Snare_2_FlrTm
			track_41 = Gh3_Drum_LH_HH_2_FlrTm
			track_42 = Gh3_Drum_LH_HH_2_FlrTm
			track_43 = Gh3_Drum_LH_Ride_2_FlrTm
			track_44 = Gh3_Drum_LH_Crash01_2_FlrTm
			track_45 = Gh3_Drum_LH_Crash02_2_FlrTm
		}
	}
	track_38 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Tom02
			track_38 = Gh3_Drum_LH_Tom02_SFTLP
			track_39 = Gh3_Drum_LH_Tom01_2_Tom02
			track_40 = Gh3_Drum_LH_Snare_2_Tom02
			track_41 = Gh3_Drum_LH_HH_2_Tom02
			track_42 = Gh3_Drum_LH_HH_2_Tom02
			track_43 = Gh3_Drum_LH_Ride_2_Tom02
			track_44 = Gh3_Drum_LH_Crash01_2_Tom02
			track_45 = Gh3_Drum_LH_Crash02_2_Tom02
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Tom02
			track_38 = Gh3_Drum_LH_Tom02_MEDLP
			track_39 = Gh3_Drum_LH_Tom01_2_Tom02
			track_40 = Gh3_Drum_LH_Snare_2_Tom02
			track_41 = Gh3_Drum_LH_HH_2_Tom02
			track_42 = Gh3_Drum_LH_HH_2_Tom02
			track_43 = Gh3_Drum_LH_Ride_2_Tom02
			track_44 = Gh3_Drum_LH_Crash01_2_Tom02
			track_45 = Gh3_Drum_LH_Crash02_2_Tom02
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Tom02
			track_38 = Gh3_Drum_LH_Tom02_HRDLP
			track_39 = Gh3_Drum_LH_Tom01_2_Tom02
			track_40 = Gh3_Drum_LH_Snare_2_Tom02
			track_41 = Gh3_Drum_LH_HH_2_Tom02
			track_42 = Gh3_Drum_LH_HH_2_Tom02
			track_43 = Gh3_Drum_LH_Ride_2_Tom02
			track_44 = Gh3_Drum_LH_Crash01_2_Tom02
			track_45 = Gh3_Drum_LH_Crash02_2_Tom02
		}
	}
	track_39 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Tom01
			track_38 = Gh3_Drum_LH_Tom02_2_Tom01
			track_39 = Gh3_Drum_LH_Tom01_SFTLP
			track_40 = Gh3_Drum_LH_Snare_2_Tom01
			track_41 = Gh3_Drum_LH_HH_2_Tom01
			track_42 = Gh3_Drum_LH_HH_2_Tom01
			track_43 = Gh3_Drum_LH_Ride_2_Tom01
			track_44 = Gh3_Drum_LH_Crash01_2_Tom01
			track_45 = Gh3_Drum_LH_Crash02_2_Tom01
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Tom01
			track_38 = Gh3_Drum_LH_Tom02_2_Tom01
			track_39 = Gh3_Drum_LH_Tom01_MEDLP
			track_40 = Gh3_Drum_LH_Snare_2_Tom01
			track_41 = Gh3_Drum_LH_HH_2_Tom01
			track_42 = Gh3_Drum_LH_HH_2_Tom01
			track_43 = Gh3_Drum_LH_Ride_2_Tom01
			track_44 = Gh3_Drum_LH_Crash01_2_Tom01
			track_45 = Gh3_Drum_LH_Crash02_2_Tom01
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Tom01
			track_38 = Gh3_Drum_LH_Tom02_2_Tom01
			track_39 = Gh3_Drum_LH_Tom01_HRDLP
			track_40 = Gh3_Drum_LH_Snare_2_Tom01
			track_41 = Gh3_Drum_LH_HH_2_Tom01
			track_42 = Gh3_Drum_LH_HH_2_Tom01
			track_43 = Gh3_Drum_LH_Ride_2_Tom01
			track_44 = Gh3_Drum_LH_Crash01_2_Tom01
			track_45 = Gh3_Drum_LH_Crash02_2_Tom01
		}
	}
	track_40 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Snr
			track_38 = Gh3_Drum_LH_Tom02_2_Snr
			track_39 = Gh3_Drum_LH_Tom01_2_Snr
			track_40 = Gh3_Drum_LH_Snare_SFTLP
			track_41 = Gh3_Drum_LH_HH_2_Snr
			track_42 = Gh3_Drum_LH_HH_2_Snr
			track_43 = Gh3_Drum_LH_Ride_2_Snr
			track_44 = Gh3_Drum_LH_Crash01_2_Snr
			track_45 = Gh3_Drum_LH_Crash02_2_Snr
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Snr
			track_38 = Gh3_Drum_LH_Tom02_2_Snr
			track_39 = Gh3_Drum_LH_Tom01_2_Snr
			track_40 = Gh3_Drum_LH_Snare_MEDLP
			track_41 = Gh3_Drum_LH_HH_2_Snr
			track_42 = Gh3_Drum_LH_HH_2_Snr
			track_43 = Gh3_Drum_LH_Ride_2_Snr
			track_44 = Gh3_Drum_LH_Crash01_2_Snr
			track_45 = Gh3_Drum_LH_Crash02_2_Snr
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Snr
			track_38 = Gh3_Drum_LH_Tom02_2_Snr
			track_39 = Gh3_Drum_LH_Tom01_2_Snr
			track_40 = Gh3_Drum_LH_Snare_HRDLP
			track_41 = Gh3_Drum_LH_HH_2_Snr
			track_42 = Gh3_Drum_LH_HH_2_Snr
			track_43 = Gh3_Drum_LH_Ride_2_Snr
			track_44 = Gh3_Drum_LH_Crash01_2_Snr
			track_45 = Gh3_Drum_LH_Crash02_2_Snr
		}
	}
	track_41 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_LH_Tom02_2_HH
			track_39 = Gh3_Drum_LH_Tom01_2_HH
			track_40 = Gh3_Drum_LH_Snare_2_HH
			track_41 = Gh3_Drum_LH_HH_SFTLP
			track_42 = Gh3_Drum_LH_HH_SFTLP
			track_43 = Gh3_Drum_LH_Ride_2_HH
			track_44 = Gh3_Drum_LH_Crash01_2_HH
			track_45 = Gh3_Drum_LH_Crash02_2_HH
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_LH_Tom02_2_HH
			track_39 = Gh3_Drum_LH_Tom01_2_HH
			track_40 = Gh3_Drum_LH_Snare_2_HH
			track_41 = Gh3_Drum_LH_HH_MEDLP
			track_42 = Gh3_Drum_LH_HH_MEDLP
			track_43 = Gh3_Drum_LH_Ride_2_HH
			track_44 = Gh3_Drum_LH_Crash01_2_HH
			track_45 = Gh3_Drum_LH_Crash02_2_HH
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_LH_Tom02_2_HH
			track_39 = Gh3_Drum_LH_Tom01_2_HH
			track_40 = Gh3_Drum_LH_Snare_2_HH
			track_41 = Gh3_Drum_LH_HH_HRDLP
			track_42 = Gh3_Drum_LH_HH_HRDLP
			track_43 = Gh3_Drum_LH_Ride_2_HH
			track_44 = Gh3_Drum_LH_Crash01_2_HH
			track_45 = Gh3_Drum_LH_Crash02_2_HH
		}
	}
	track_42 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_LH_Tom02_2_HH
			track_39 = Gh3_Drum_LH_Tom01_2_HH
			track_40 = Gh3_Drum_LH_Snare_2_HH
			track_41 = Gh3_Drum_LH_HH_SFTLP
			track_42 = Gh3_Drum_LH_HH_SFTLP
			track_43 = Gh3_Drum_LH_Ride_2_HH
			track_44 = Gh3_Drum_LH_Crash01_2_HH
			track_45 = Gh3_Drum_LH_Crash02_2_HH
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_LH_Tom02_2_HH
			track_39 = Gh3_Drum_LH_Tom01_2_HH
			track_40 = Gh3_Drum_LH_Snare_2_HH
			track_41 = Gh3_Drum_LH_HH_MEDLP
			track_42 = Gh3_Drum_LH_HH_MEDLP
			track_43 = Gh3_Drum_LH_Ride_2_HH
			track_44 = Gh3_Drum_LH_Crash01_2_HH
			track_45 = Gh3_Drum_LH_Crash02_2_HH
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_LH_Tom02_2_HH
			track_39 = Gh3_Drum_LH_Tom01_2_HH
			track_40 = Gh3_Drum_LH_Snare_2_HH
			track_41 = Gh3_Drum_LH_HH_HRDLP
			track_42 = Gh3_Drum_LH_HH_HRDLP
			track_43 = Gh3_Drum_LH_Ride_2_HH
			track_44 = Gh3_Drum_LH_Crash01_2_HH
			track_45 = Gh3_Drum_LH_Crash02_2_HH
		}
	}
	track_43 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Ride
			track_38 = Gh3_Drum_LH_Tom02_2_Ride
			track_39 = Gh3_Drum_LH_Tom01_2_Ride
			track_40 = Gh3_Drum_LH_Snare_2_Ride
			track_41 = Gh3_Drum_LH_HH_2_Ride
			track_42 = Gh3_Drum_LH_HH_2_Ride
			track_43 = Gh3_Drum_LH_Ride_SFTLP
			track_44 = Gh3_Drum_LH_Crash01_2_Ride
			track_45 = Gh3_Drum_LH_Crash02_2_Ride
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Ride
			track_38 = Gh3_Drum_LH_Tom02_2_Ride
			track_39 = Gh3_Drum_LH_Tom01_2_Ride
			track_40 = Gh3_Drum_LH_Snare_2_Ride
			track_41 = Gh3_Drum_LH_HH_2_Ride
			track_42 = Gh3_Drum_LH_HH_2_Ride
			track_43 = Gh3_Drum_LH_Ride_MEDLP
			track_44 = Gh3_Drum_LH_Crash01_2_Ride
			track_45 = Gh3_Drum_LH_Crash02_2_Ride
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Ride
			track_38 = Gh3_Drum_LH_Tom02_2_Ride
			track_39 = Gh3_Drum_LH_Tom01_2_Ride
			track_40 = Gh3_Drum_LH_Snare_2_Ride
			track_41 = Gh3_Drum_LH_HH_2_Ride
			track_42 = Gh3_Drum_LH_HH_2_Ride
			track_43 = Gh3_Drum_LH_Ride_HRDLP
			track_44 = Gh3_Drum_LH_Crash01_2_Ride
			track_45 = Gh3_Drum_LH_Crash02_2_Ride
		}
	}
	track_44 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Crash01
			track_38 = Gh3_Drum_LH_Tom02_2_Crash01
			track_39 = Gh3_Drum_LH_Tom01_2_Crash01
			track_40 = Gh3_Drum_LH_Snare_2_Crash01
			track_41 = Gh3_Drum_LH_HH_2_Crash01
			track_42 = Gh3_Drum_LH_HH_2_Crash01
			track_43 = Gh3_Drum_LH_Ride_2_Crash01
			track_44 = Gh3_Drum_LH_Crash01_SFTLP
			track_45 = Gh3_Drum_LH_Crash02_2_Crsh01
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Crash01
			track_38 = Gh3_Drum_LH_Tom02_2_Crash01
			track_39 = Gh3_Drum_LH_Tom01_2_Crash01
			track_40 = Gh3_Drum_LH_Snare_2_Crash01
			track_41 = Gh3_Drum_LH_HH_2_Crash01
			track_42 = Gh3_Drum_LH_HH_2_Crash01
			track_43 = Gh3_Drum_LH_Ride_2_Crash01
			track_44 = Gh3_Drum_LH_Crash01_MEDLP
			track_45 = Gh3_Drum_LH_Crash02_2_Crsh01
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Crash01
			track_38 = Gh3_Drum_LH_Tom02_2_Crash01
			track_39 = Gh3_Drum_LH_Tom01_2_Crash01
			track_40 = Gh3_Drum_LH_Snare_2_Crash01
			track_41 = Gh3_Drum_LH_HH_2_Crash01
			track_42 = Gh3_Drum_LH_HH_2_Crash01
			track_43 = Gh3_Drum_LH_Ride_2_Crash01
			track_44 = Gh3_Drum_LH_Crash01_HRDLP
			track_45 = Gh3_Drum_LH_Crash02_2_Crsh01
		}
	}
	track_45 = {
		soft = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Crash02
			track_38 = Gh3_Drum_LH_Tom02_2_Crash02
			track_39 = Gh3_Drum_LH_Tom01_2_Crash02
			track_40 = Gh3_Drum_LH_Snare_2_Crash02
			track_41 = Gh3_Drum_LH_HH_2_Crash02
			track_42 = Gh3_Drum_LH_HH_2_Crash02
			track_43 = Gh3_Drum_LH_Ride_2_Crash02
			track_44 = Gh3_Drum_LH_Crash01_2_Crsh02
			track_45 = Gh3_Drum_LH_Crash02_SFTLP
		}
		med = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Crash02
			track_38 = Gh3_Drum_LH_Tom02_2_Crash02
			track_39 = Gh3_Drum_LH_Tom01_2_Crash02
			track_40 = Gh3_Drum_LH_Snare_2_Crash02
			track_41 = Gh3_Drum_LH_HH_2_Crash02
			track_42 = Gh3_Drum_LH_HH_2_Crash02
			track_43 = Gh3_Drum_LH_Ride_2_Crash02
			track_44 = Gh3_Drum_LH_Crash01_2_Crsh02
			track_45 = Gh3_Drum_LH_Crash02_MEDLP
		}
		hard = {
			track_37 = Gh3_Drum_LH_FlrTom_2_Crash02
			track_38 = Gh3_Drum_LH_Tom02_2_Crash02
			track_39 = Gh3_Drum_LH_Tom01_2_Crash02
			track_40 = Gh3_Drum_LH_Snare_2_Crash02
			track_41 = Gh3_Drum_LH_HH_2_Crash02
			track_42 = Gh3_Drum_LH_HH_2_Crash02
			track_43 = Gh3_Drum_LH_Ride_2_Crash02
			track_44 = Gh3_Drum_LH_Crash01_2_Crsh02
			track_45 = Gh3_Drum_LH_Crash02_HRDLP
		}
	}
	track_48 = GH3_Drum_Kick
	track_49 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_SFTLP
			track_50 = Gh3_Drum_RH_Tom02_2_FlrTom
			track_51 = Gh3_Drum_RH_Tom01_2_FlrTm
			track_52 = Gh3_Drum_RH_Snare_2_FlrTm
			track_53 = Gh3_Drum_RH_HH_2_FlrTm
			track_54 = Gh3_Drum_RH_HH_2_FlrTm
			track_55 = Gh3_Drum_RH_Ride_2_FlrTm
			track_56 = Gh3_Drum_RH_Crash01_2_FlrTm
			track_57 = Gh3_Drum_RH_Crash02_2_FlrTm
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_MEDLP
			track_50 = Gh3_Drum_RH_Tom02_2_FlrTom
			track_51 = Gh3_Drum_RH_Tom01_2_FlrTm
			track_52 = Gh3_Drum_RH_Snare_2_FlrTm
			track_53 = Gh3_Drum_RH_HH_2_FlrTm
			track_54 = Gh3_Drum_RH_HH_2_FlrTm
			track_55 = Gh3_Drum_RH_Ride_2_FlrTm
			track_56 = Gh3_Drum_RH_Crash01_2_FlrTm
			track_57 = Gh3_Drum_RH_Crash02_2_FlrTm
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_HRDLP
			track_50 = Gh3_Drum_RH_Tom02_2_FlrTom
			track_51 = Gh3_Drum_RH_Tom01_2_FlrTm
			track_52 = Gh3_Drum_RH_Snare_2_FlrTm
			track_53 = Gh3_Drum_RH_HH_2_FlrTm
			track_54 = Gh3_Drum_RH_HH_2_FlrTm
			track_55 = Gh3_Drum_RH_Ride_2_FlrTm
			track_56 = Gh3_Drum_RH_Crash01_2_FlrTm
			track_57 = Gh3_Drum_RH_Crash02_2_FlrTm
		}
	}
	track_50 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Tom02
			track_50 = Gh3_Drum_RH_Tom02_SFTLP
			track_51 = Gh3_Drum_RH_Tom01_2_Tom02
			track_52 = Gh3_Drum_RH_Snare_2_Tom02
			track_53 = Gh3_Drum_RH_HH_2_Tom02
			track_54 = Gh3_Drum_RH_HH_2_Tom02
			track_55 = Gh3_Drum_RH_Ride_2_Tom02
			track_56 = Gh3_Drum_RH_Crash01_2_Tom02
			track_57 = Gh3_Drum_RH_Crash02_2_Tom02
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Tom02
			track_50 = Gh3_Drum_RH_Tom02_MEDLP
			track_51 = Gh3_Drum_RH_Tom01_2_Tom02
			track_52 = Gh3_Drum_RH_Snare_2_Tom02
			track_53 = Gh3_Drum_RH_HH_2_Tom02
			track_54 = Gh3_Drum_RH_HH_2_Tom02
			track_55 = Gh3_Drum_RH_Ride_2_Tom02
			track_56 = Gh3_Drum_RH_Crash01_2_Tom02
			track_57 = Gh3_Drum_RH_Crash02_2_Tom02
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Tom02
			track_50 = Gh3_Drum_RH_Tom02_HRDLP
			track_51 = Gh3_Drum_RH_Tom01_2_Tom02
			track_52 = Gh3_Drum_RH_Snare_2_Tom02
			track_53 = Gh3_Drum_RH_HH_2_Tom02
			track_54 = Gh3_Drum_RH_HH_2_Tom02
			track_55 = Gh3_Drum_RH_Ride_2_Tom02
			track_56 = Gh3_Drum_RH_Crash01_2_Tom02
			track_57 = Gh3_Drum_RH_Crash02_2_Tom02
		}
	}
	track_51 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Tom01
			track_50 = Gh3_Drum_RH_Tom02_2_Tom01
			track_51 = Gh3_Drum_RH_Tom01_SFTLP
			track_52 = Gh3_Drum_RH_Snare_2_Tom01
			track_53 = Gh3_Drum_RH_HH_2_Tom01
			track_54 = Gh3_Drum_RH_HH_2_Tom01
			track_55 = Gh3_Drum_RH_Ride_2_Tom01
			track_56 = Gh3_Drum_RH_Crash01_2_Tom01
			track_57 = Gh3_Drum_RH_Crash02_2_Tom01
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Tom01
			track_50 = Gh3_Drum_RH_Tom02_2_Tom01
			track_51 = Gh3_Drum_RH_Tom01_MEDLP
			track_52 = Gh3_Drum_RH_Snare_2_Tom01
			track_53 = Gh3_Drum_RH_HH_2_Tom01
			track_54 = Gh3_Drum_RH_HH_2_Tom01
			track_55 = Gh3_Drum_RH_Ride_2_Tom01
			track_56 = Gh3_Drum_RH_Crash01_2_Tom01
			track_57 = Gh3_Drum_RH_Crash02_2_Tom01
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Tom01
			track_50 = Gh3_Drum_RH_Tom02_2_Tom01
			track_51 = Gh3_Drum_RH_Tom01_HRDLP
			track_52 = Gh3_Drum_RH_Snare_2_Tom01
			track_53 = Gh3_Drum_RH_HH_2_Tom01
			track_54 = Gh3_Drum_RH_HH_2_Tom01
			track_55 = Gh3_Drum_RH_Ride_2_Tom01
			track_56 = Gh3_Drum_RH_Crash01_2_Tom01
			track_57 = Gh3_Drum_RH_Crash02_2_Tom01
		}
	}
	track_52 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Snr
			track_50 = Gh3_Drum_RH_Tom02_2_Snr
			track_51 = Gh3_Drum_RH_Tom01_2_Snr
			track_52 = Gh3_Drum_RH_Snare_SFTLP
			track_53 = Gh3_Drum_RH_HH_2_Snr
			track_54 = Gh3_Drum_RH_HH_2_Snr
			track_55 = Gh3_Drum_RH_Ride_2_Snr
			track_56 = Gh3_Drum_RH_Crash01_2_Snr
			track_57 = Gh3_Drum_RH_Crash02_2_Snr
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Snr
			track_50 = Gh3_Drum_RH_Tom02_2_Snr
			track_51 = Gh3_Drum_RH_Tom01_2_Snr
			track_52 = Gh3_Drum_RH_Snare_MEDLP
			track_53 = Gh3_Drum_RH_HH_2_Snr
			track_54 = Gh3_Drum_RH_HH_2_Snr
			track_55 = Gh3_Drum_RH_Ride_2_Snr
			track_56 = Gh3_Drum_RH_Crash01_2_Snr
			track_57 = Gh3_Drum_RH_Crash02_2_Snr
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Snr
			track_50 = Gh3_Drum_RH_Tom02_2_Snr
			track_51 = Gh3_Drum_RH_Tom01_2_Snr
			track_52 = Gh3_Drum_RH_Snare_HRDLP
			track_53 = Gh3_Drum_RH_HH_2_Snr
			track_54 = Gh3_Drum_RH_HH_2_Snr
			track_55 = Gh3_Drum_RH_Ride_2_Snr
			track_56 = Gh3_Drum_RH_Crash01_2_Snr
			track_57 = Gh3_Drum_RH_Crash02_2_Snr
		}
	}
	track_53 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_RH_Tom02_2_HH
			track_51 = Gh3_Drum_RH_Tom01_2_HH
			track_52 = Gh3_Drum_RH_Snare_2_HH
			track_53 = Gh3_Drum_RH_HH_SFTLP
			track_54 = Gh3_Drum_RH_HH_SFTLP
			track_55 = Gh3_Drum_RH_Ride_2_HH
			track_56 = Gh3_Drum_RH_Crash01_2_HH
			track_57 = Gh3_Drum_RH_Crash02_2_HH
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_RH_Tom02_2_HH
			track_51 = Gh3_Drum_RH_Tom01_2_HH
			track_52 = Gh3_Drum_RH_Snare_2_HH
			track_53 = Gh3_Drum_RH_HH_MEDLP
			track_54 = Gh3_Drum_RH_HH_MEDLP
			track_55 = Gh3_Drum_RH_Ride_2_HH
			track_56 = Gh3_Drum_RH_Crash01_2_HH
			track_57 = Gh3_Drum_RH_Crash02_2_HH
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_RH_Tom02_2_HH
			track_51 = Gh3_Drum_RH_Tom01_2_HH
			track_52 = Gh3_Drum_RH_Snare_2_HH
			track_53 = Gh3_Drum_RH_HH_HRDLP
			track_54 = Gh3_Drum_RH_HH_HRDLP
			track_55 = Gh3_Drum_RH_Ride_2_HH
			track_56 = Gh3_Drum_RH_Crash01_2_HH
			track_57 = Gh3_Drum_RH_Crash02_2_HH
		}
	}
	track_54 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_RH_Tom02_2_HH
			track_51 = Gh3_Drum_RH_Tom01_2_HH
			track_52 = Gh3_Drum_RH_Snare_2_HH
			track_53 = Gh3_Drum_RH_HH_SFTLP
			track_54 = Gh3_Drum_RH_HH_SFTLP
			track_55 = Gh3_Drum_RH_Ride_2_HH
			track_56 = Gh3_Drum_RH_Crash01_2_HH
			track_57 = Gh3_Drum_RH_Crash02_2_HH
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_RH_Tom02_2_HH
			track_51 = Gh3_Drum_RH_Tom01_2_HH
			track_52 = Gh3_Drum_RH_Snare_2_HH
			track_53 = Gh3_Drum_RH_HH_MEDLP
			track_54 = Gh3_Drum_RH_HH_MEDLP
			track_55 = Gh3_Drum_RH_Ride_2_HH
			track_56 = Gh3_Drum_RH_Crash01_2_HH
			track_57 = Gh3_Drum_RH_Crash02_2_HH
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_RH_Tom02_2_HH
			track_51 = Gh3_Drum_RH_Tom01_2_HH
			track_52 = Gh3_Drum_RH_Snare_2_HH
			track_53 = Gh3_Drum_RH_HH_HRDLP
			track_54 = Gh3_Drum_RH_HH_HRDLP
			track_55 = Gh3_Drum_RH_Ride_2_HH
			track_56 = Gh3_Drum_RH_Crash01_2_HH
			track_57 = Gh3_Drum_RH_Crash02_2_HH
		}
	}
	track_55 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Ride
			track_50 = Gh3_Drum_RH_Tom02_2_Ride
			track_51 = Gh3_Drum_RH_Tom01_2_Ride
			track_52 = Gh3_Drum_RH_Snare_2_Ride
			track_53 = Gh3_Drum_RH_HH_2_Ride
			track_54 = Gh3_Drum_RH_HH_2_Ride
			track_55 = Gh3_Drum_RH_Ride_SFTLP
			track_56 = Gh3_Drum_RH_Crash01_2_Ride
			track_57 = Gh3_Drum_RH_Crash02_2_Ride
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Ride
			track_50 = Gh3_Drum_RH_Tom02_2_Ride
			track_51 = Gh3_Drum_RH_Tom01_2_Ride
			track_52 = Gh3_Drum_RH_Snare_2_Ride
			track_53 = Gh3_Drum_RH_HH_2_Ride
			track_54 = Gh3_Drum_RH_HH_2_Ride
			track_55 = Gh3_Drum_RH_Ride_MEDLP
			track_56 = Gh3_Drum_RH_Crash01_2_Ride
			track_57 = Gh3_Drum_RH_Crash02_2_Ride
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Ride
			track_50 = Gh3_Drum_RH_Tom02_2_Ride
			track_51 = Gh3_Drum_RH_Tom01_2_Ride
			track_52 = Gh3_Drum_RH_Snare_2_Ride
			track_53 = Gh3_Drum_RH_HH_2_Ride
			track_54 = Gh3_Drum_RH_HH_2_Ride
			track_55 = Gh3_Drum_RH_Ride_HRDLP
			track_56 = Gh3_Drum_RH_Crash01_2_Ride
			track_57 = Gh3_Drum_RH_Crash02_2_Ride
		}
	}
	track_56 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Crash01
			track_50 = Gh3_Drum_RH_Tom02_2_Crash01
			track_51 = Gh3_Drum_RH_Tom01_2_Crash01
			track_52 = Gh3_Drum_RH_Snare_2_Crash01
			track_53 = Gh3_Drum_RH_HH_2_Crash01
			track_54 = Gh3_Drum_RH_HH_2_Crash01
			track_55 = Gh3_Drum_RH_Ride_2_Crash01
			track_56 = Gh3_Drum_RH_Crash01_SFTLP
			track_57 = Gh3_Drum_RH_Crash02_2_Crsh01
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Crash01
			track_50 = Gh3_Drum_RH_Tom02_2_Crash01
			track_51 = Gh3_Drum_RH_Tom01_2_Crash01
			track_52 = Gh3_Drum_RH_Snare_2_Crash01
			track_53 = Gh3_Drum_RH_HH_2_Crash01
			track_54 = Gh3_Drum_RH_HH_2_Crash01
			track_55 = Gh3_Drum_RH_Ride_2_Crash01
			track_56 = Gh3_Drum_RH_Crash01_MEDLP
			track_57 = Gh3_Drum_RH_Crash02_2_Crsh01
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Crash01
			track_50 = Gh3_Drum_RH_Tom02_2_Crash01
			track_51 = Gh3_Drum_RH_Tom01_2_Crash01
			track_52 = Gh3_Drum_RH_Snare_2_Crash01
			track_53 = Gh3_Drum_RH_HH_2_Crash01
			track_54 = Gh3_Drum_RH_HH_2_Crash01
			track_55 = Gh3_Drum_RH_Ride_2_Crash01
			track_56 = Gh3_Drum_RH_Crash01_HRDLP
			track_57 = Gh3_Drum_RH_Crash02_2_Crsh01
		}
	}
	track_57 = {
		soft = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Crash02
			track_50 = Gh3_Drum_RH_Tom02_2_Crash02
			track_51 = Gh3_Drum_RH_Tom01_2_Crash02
			track_52 = Gh3_Drum_RH_Snare_2_Crash02
			track_53 = Gh3_Drum_RH_HH_2_Crash02
			track_54 = Gh3_Drum_RH_HH_2_Crash02
			track_55 = Gh3_Drum_RH_Ride_2_Crash02
			track_56 = Gh3_Drum_RH_Crash01_2_Crsh02
			track_57 = Gh3_Drum_RH_Crash02_SFTLP
		}
		med = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Crash02
			track_50 = Gh3_Drum_RH_Tom02_2_Crash02
			track_51 = Gh3_Drum_RH_Tom01_2_Crash02
			track_52 = Gh3_Drum_RH_Snare_2_Crash02
			track_53 = Gh3_Drum_RH_HH_2_Crash02
			track_54 = Gh3_Drum_RH_HH_2_Crash02
			track_55 = Gh3_Drum_RH_Ride_2_Crash02
			track_56 = Gh3_Drum_RH_Crash01_2_Crsh02
			track_57 = Gh3_Drum_RH_Crash02_MEDLP
		}
		hard = {
			track_49 = Gh3_Drum_RH_FlrTom_2_Crash02
			track_50 = Gh3_Drum_RH_Tom02_2_Crash02
			track_51 = Gh3_Drum_RH_Tom01_2_Crash02
			track_52 = Gh3_Drum_RH_Snare_2_Crash02
			track_53 = Gh3_Drum_RH_HH_2_Crash02
			track_54 = Gh3_Drum_RH_HH_2_Crash02
			track_55 = Gh3_Drum_RH_Ride_2_Crash02
			track_56 = Gh3_Drum_RH_Crash01_2_Crsh02
			track_57 = Gh3_Drum_RH_Crash02_HRDLP
		}
	}
	sticktap_into_l = GH3_Drummer_Hitstix_into_L
	sticktap_into_r = GH3_Drummer_Hitstix_into_R
	sticktap_l = GH3_Drummer_Hitstix_L
	sticktap_r = GH3_Drummer_Hitstix_R
	stickdown_l = GH3_Drummer_Stickdown_L
	stickdown_r = GH3_Drummer_Stickdown_R
	countoff_hihat_r = Gh3_Drum_RH_HH_MEDLP
}
drummer_animations_JoeyK = {
	stance_a = {
		idle = {
			good = {
				fast = [
					GH3_Drummer_JoeyK_Fst_Idle_01
					GH3_Drummer_JoeyK_Fst_Idle_02
					GH3_Drummer_JoeyK_Fst_Idle_03
				]
				med = [
					GH3_Drummer_JoeyK_Med_Idle_01
					GH3_Drummer_JoeyK_Med_Idle_02
					GH3_Drummer_JoeyK_Med_Idle_03
				]
				slow = [
					GH3_Drummer_JoeyK_Slw_Idle_01
					GH3_Drummer_JoeyK_Slw_Idle_02
					GH3_Drummer_JoeyK_Slw_Idle_03
				]
			}
			normal = {
				fast = [
					GH3_Drummer_JoeyK_Fst_Idle_01
					GH3_Drummer_JoeyK_Fst_Idle_02
					GH3_Drummer_JoeyK_Fst_Idle_03
				]
				med = [
					GH3_Drummer_JoeyK_Med_Idle_01
					GH3_Drummer_JoeyK_Med_Idle_02
					GH3_Drummer_JoeyK_Med_Idle_03
				]
				slow = [
					GH3_Drummer_JoeyK_Slw_Idle_01
					GH3_Drummer_JoeyK_Slw_Idle_02
					GH3_Drummer_JoeyK_Slw_Idle_03
				]
			}
			bad = {
				fast = [
					GH3_Drummer_JoeyK_Fst_Idle_01
					GH3_Drummer_JoeyK_Fst_Idle_02
					GH3_Drummer_JoeyK_Fst_Idle_03
				]
				med = [
					GH3_Drummer_JoeyK_Med_Idle_01
					GH3_Drummer_JoeyK_Med_Idle_02
					GH3_Drummer_JoeyK_Med_Idle_03
				]
				slow = [
					GH3_Drummer_JoeyK_Slw_Idle_01
					GH3_Drummer_JoeyK_Slw_Idle_02
					GH3_Drummer_JoeyK_Slw_Idle_03
				]
			}
		}
		transitions = {
		}
	}
	intro = {
		idle = {
			good = {
				fast = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
				med = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
				slow = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
			}
			normal = {
				fast = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
				med = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
				slow = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
			}
			bad = {
				fast = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
				med = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
				slow = [
					Gh3_Drum_JoeyK_Intro01
					Gh3_Drum_JoeyK_Intro02
					Gh3_Drum_JoeyK_Intro03
				]
			}
		}
		transitions = {
		}
	}
	facial_anims = {
		idle = [
			GH3_Drummer_JoeyK_FaceIdle
			GH3_Drummer_JoeyK_FaceIdle02
			GH3_Drummer_JoeyK_FaceIdle03
		]
	}
	win = {
		idle = {
			good = {
				fast = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
				med = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
				slow = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
			}
			normal = {
				fast = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
				med = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
				slow = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
			}
			bad = {
				fast = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
				med = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
				slow = [
					Gh3_Drum_JoeyK_Win01
					Gh3_Drum_JoeyK_Win02
				]
			}
		}
		transitions = {
		}
	}
	lose = {
		idle = {
			good = {
				fast = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
				med = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
				slow = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
			}
			normal = {
				fast = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
				med = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
				slow = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
			}
			bad = {
				fast = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
				med = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
				slow = [
					Gh3_Drum_JoeyK_Lose01
					Gh3_Drum_JoeyK_Lose02
				]
			}
		}
		transitions = {
		}
	}
	BodyTwist = GH3_Drummer_JoeyK_BodyTwist_D
}
cymbal_anims_JoeyK = [
	GH3_Drum_JoeyK_Cymbal_1
	GH3_Drum_JoeyK_Cymbal_2
	GH3_Drum_JoeyK_Cymbal_3
	GH3_Drum_JoeyK_Cymbal_HH
]
drummer_anims_JoeyK = {
	track_36 = GH3_Drum_JoeyK_Kick
	track_37 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_SFTLP
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_FlrTom
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_FlrTm
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_FlrTm
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_FlrTm
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_FlrTm
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_FlrTm
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_FlrTm
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_FlrTm
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_MEDLP
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_FlrTom
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_FlrTm
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_FlrTm
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_FlrTm
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_FlrTm
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_FlrTm
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_FlrTm
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_FlrTm
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_HRDLP
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_FlrTom
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_FlrTm
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_FlrTm
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_FlrTm
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_FlrTm
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_FlrTm
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_FlrTm
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_FlrTm
		}
	}
	track_38 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Tom02
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_SFTLP
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Tom02
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Tom02
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Tom02
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Tom02
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Tom02
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Tom02
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Tom02
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Tom02
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_MEDLP
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Tom02
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Tom02
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Tom02
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Tom02
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Tom02
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Tom02
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Tom02
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Tom02
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_HRDLP
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Tom02
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Tom02
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Tom02
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Tom02
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Tom02
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Tom02
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Tom02
		}
	}
	track_39 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Tom01
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Tom01
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_SFTLP
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Tom01
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Tom01
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Tom01
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Tom01
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Tom01
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Tom01
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Tom01
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Tom01
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_MEDLP
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Tom01
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Tom01
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Tom01
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Tom01
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Tom01
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Tom01
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Tom01
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Tom01
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_HRDLP
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Tom01
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Tom01
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Tom01
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Tom01
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Tom01
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Tom01
		}
	}
	track_40 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Snr
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Snr
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Snr
			track_40 = Gh3_Drum_JoeyK_LH_Snare_SFTLP
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Snr
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Snr
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Snr
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Snr
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Snr
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Snr
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Snr
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Snr
			track_40 = Gh3_Drum_JoeyK_LH_Snare_MEDLP
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Snr
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Snr
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Snr
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Snr
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Snr
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Snr
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Snr
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Snr
			track_40 = Gh3_Drum_JoeyK_LH_Snare_HRDLP
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Snr
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Snr
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Snr
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Snr
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Snr
		}
	}
	track_41 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_HH
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_HH
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_HH
			track_41 = Gh3_Drum_JoeyK_LH_HH_SFTLP
			track_42 = Gh3_Drum_JoeyK_LH_HH_SFTLP
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_HH
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_HH
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_HH
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_HH
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_HH
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_HH
			track_41 = Gh3_Drum_JoeyK_LH_HH_MEDLP
			track_42 = Gh3_Drum_JoeyK_LH_HH_MEDLP
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_HH
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_HH
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_HH
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_HH
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_HH
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_HH
			track_41 = Gh3_Drum_JoeyK_LH_HH_HRDLP
			track_42 = Gh3_Drum_JoeyK_LH_HH_HRDLP
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_HH
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_HH
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_HH
		}
	}
	track_42 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_HH
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_HH
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_HH
			track_41 = Gh3_Drum_JoeyK_LH_HH_SFTLP
			track_42 = Gh3_Drum_JoeyK_LH_HH_SFTLP
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_HH
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_HH
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_HH
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_HH
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_HH
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_HH
			track_41 = Gh3_Drum_JoeyK_LH_HH_MEDLP
			track_42 = Gh3_Drum_JoeyK_LH_HH_MEDLP
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_HH
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_HH
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_HH
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_HH
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_HH
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_HH
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_HH
			track_41 = Gh3_Drum_JoeyK_LH_HH_HRDLP
			track_42 = Gh3_Drum_JoeyK_LH_HH_HRDLP
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_HH
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_HH
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_HH
		}
	}
	track_43 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Ride
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Ride
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Ride
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Ride
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Ride
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Ride
			track_43 = Gh3_Drum_JoeyK_LH_Ride_SFTLP
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Ride
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Ride
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Ride
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Ride
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Ride
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Ride
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Ride
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Ride
			track_43 = Gh3_Drum_JoeyK_LH_Ride_MEDLP
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Ride
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Ride
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Ride
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Ride
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Ride
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Ride
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Ride
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Ride
			track_43 = Gh3_Drum_JoeyK_LH_Ride_HRDLP
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Ride
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Ride
		}
	}
	track_44 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Crash01
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Crash01
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Crash01
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Crash01
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Crash01
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Crash01
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Crash01
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_SFTLP
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Crsh01
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Crash01
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Crash01
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Crash01
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Crash01
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Crash01
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Crash01
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Crash01
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_MEDLP
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Crsh01
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Crash01
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Crash01
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Crash01
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Crash01
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Crash01
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Crash01
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Crash01
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_HRDLP
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_2_Crsh01
		}
	}
	track_45 = {
		soft = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Crash02
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Crash02
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Crash02
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Crash02
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Crash02
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Crash02
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Crash02
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Crsh02
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_SFTLP
		}
		med = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Crash02
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Crash02
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Crash02
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Crash02
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Crash02
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Crash02
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Crash02
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Crsh02
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_MEDLP
		}
		hard = {
			track_37 = Gh3_Drum_JoeyK_LH_FlrTom_2_Crash02
			track_38 = Gh3_Drum_JoeyK_LH_Tom02_2_Crash02
			track_39 = Gh3_Drum_JoeyK_LH_Tom01_2_Crash02
			track_40 = Gh3_Drum_JoeyK_LH_Snare_2_Crash02
			track_41 = Gh3_Drum_JoeyK_LH_HH_2_Crash02
			track_42 = Gh3_Drum_JoeyK_LH_HH_2_Crash02
			track_43 = Gh3_Drum_JoeyK_LH_Ride_2_Crash02
			track_44 = Gh3_Drum_JoeyK_LH_Crash01_2_Crsh02
			track_45 = Gh3_Drum_JoeyK_LH_Crash02_HRDLP
		}
	}
	track_48 = GH3_Drum_JoeyK_Kick
	track_49 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_SFTLP
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_FlrTom
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_FlrTm
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_FlrTm
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_FlrTm
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_FlrTm
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_FlrTm
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_FlrTm
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_FlrTm
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_MEDLP
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_FlrTom
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_FlrTm
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_FlrTm
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_FlrTm
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_FlrTm
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_FlrTm
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_FlrTm
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_FlrTm
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_HRDLP
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_FlrTom
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_FlrTm
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_FlrTm
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_FlrTm
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_FlrTm
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_FlrTm
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_FlrTm
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_FlrTm
		}
	}
	track_50 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Tom02
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_SFTLP
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Tom02
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Tom02
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Tom02
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Tom02
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Tom02
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Tom02
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Tom02
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Tom02
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_MEDLP
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Tom02
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Tom02
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Tom02
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Tom02
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Tom02
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Tom02
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Tom02
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Tom02
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_HRDLP
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Tom02
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Tom02
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Tom02
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Tom02
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Tom02
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Tom02
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Tom02
		}
	}
	track_51 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Tom01
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Tom01
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_SFTLP
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Tom01
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Tom01
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Tom01
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Tom01
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Tom01
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Tom01
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Tom01
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Tom01
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_MEDLP
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Tom01
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Tom01
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Tom01
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Tom01
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Tom01
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Tom01
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Tom01
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Tom01
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_HRDLP
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Tom01
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Tom01
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Tom01
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Tom01
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Tom01
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Tom01
		}
	}
	track_52 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Snr
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Snr
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Snr
			track_52 = Gh3_Drum_JoeyK_RH_Snare_SFTLP
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Snr
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Snr
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Snr
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Snr
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Snr
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Snr
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Snr
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Snr
			track_52 = Gh3_Drum_JoeyK_RH_Snare_MEDLP
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Snr
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Snr
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Snr
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Snr
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Snr
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Snr
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Snr
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Snr
			track_52 = Gh3_Drum_JoeyK_RH_Snare_HRDLP
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Snr
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Snr
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Snr
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Snr
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Snr
		}
	}
	track_53 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_HH
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_HH
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_HH
			track_53 = Gh3_Drum_JoeyK_RH_HH_SFTLP
			track_54 = Gh3_Drum_JoeyK_RH_HH_SFTLP
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_HH
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_HH
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_HH
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_HH
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_HH
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_HH
			track_53 = Gh3_Drum_JoeyK_RH_HH_MEDLP
			track_54 = Gh3_Drum_JoeyK_RH_HH_MEDLP
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_HH
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_HH
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_HH
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_HH
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_HH
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_HH
			track_53 = Gh3_Drum_JoeyK_RH_HH_HRDLP
			track_54 = Gh3_Drum_JoeyK_RH_HH_HRDLP
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_HH
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_HH
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_HH
		}
	}
	track_54 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_HH
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_HH
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_HH
			track_53 = Gh3_Drum_JoeyK_RH_HH_SFTLP
			track_54 = Gh3_Drum_JoeyK_RH_HH_SFTLP
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_HH
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_HH
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_HH
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_HH
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_HH
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_HH
			track_53 = Gh3_Drum_JoeyK_RH_HH_MEDLP
			track_54 = Gh3_Drum_JoeyK_RH_HH_MEDLP
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_HH
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_HH
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_HH
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_HH
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_HH
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_HH
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_HH
			track_53 = Gh3_Drum_JoeyK_RH_HH_HRDLP
			track_54 = Gh3_Drum_JoeyK_RH_HH_HRDLP
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_HH
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_HH
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_HH
		}
	}
	track_55 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Ride
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Ride
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Ride
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Ride
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Ride
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Ride
			track_55 = Gh3_Drum_JoeyK_RH_Ride_SFTLP
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Ride
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Ride
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Ride
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Ride
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Ride
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Ride
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Ride
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Ride
			track_55 = Gh3_Drum_JoeyK_RH_Ride_MEDLP
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Ride
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Ride
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Ride
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Ride
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Ride
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Ride
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Ride
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Ride
			track_55 = Gh3_Drum_JoeyK_RH_Ride_HRDLP
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Ride
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Ride
		}
	}
	track_56 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Crash01
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Crash01
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Crash01
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Crash01
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Crash01
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Crash01
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Crash01
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_SFTLP
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Crsh01
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Crash01
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Crash01
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Crash01
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Crash01
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Crash01
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Crash01
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Crash01
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_MEDLP
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Crsh01
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Crash01
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Crash01
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Crash01
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Crash01
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Crash01
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Crash01
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Crash01
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_HRDLP
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_2_Crsh01
		}
	}
	track_57 = {
		soft = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Crash02
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Crash02
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Crash02
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Crash02
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Crash02
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Crash02
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Crash02
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Crsh02
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_SFTLP
		}
		med = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Crash02
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Crash02
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Crash02
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Crash02
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Crash02
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Crash02
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Crash02
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Crsh02
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_MEDLP
		}
		hard = {
			track_49 = Gh3_Drum_JoeyK_RH_FlrTom_2_Crash02
			track_50 = Gh3_Drum_JoeyK_RH_Tom02_2_Crash02
			track_51 = Gh3_Drum_JoeyK_RH_Tom01_2_Crash02
			track_52 = Gh3_Drum_JoeyK_RH_Snare_2_Crash02
			track_53 = Gh3_Drum_JoeyK_RH_HH_2_Crash02
			track_54 = Gh3_Drum_JoeyK_RH_HH_2_Crash02
			track_55 = Gh3_Drum_JoeyK_RH_Ride_2_Crash02
			track_56 = Gh3_Drum_JoeyK_RH_Crash01_2_Crsh02
			track_57 = Gh3_Drum_JoeyK_RH_Crash02_HRDLP
		}
	}
	sticktap_into_l = GH3_Drummer_JoeyK_Hitstix_into_L
	sticktap_into_r = GH3_Drummer_JoeyK_Hitstix_into_R
	sticktap_l = GH3_Drummer_JoeyK_Hitstix_L
	sticktap_r = GH3_Drummer_JoeyK_Hitstix_R
	stickdown_l = GH3_Drummer_JoeyK_Stickdown_L
	stickdown_r = GH3_Drummer_JoeyK_Stickdown_R
	countoff_hihat_r = Gh3_Drum_JoeyK_RH_HH_MEDLP
}
