
script STARS 
	Printf \{Channel = SFX "*******************************************************"}
	Printf \{Channel = SFX "*******************************************************"}
	Printf \{Channel = SFX "*******************************************************"}
	Printf \{Channel = SFX "*******************************************************"}
	Printf \{Channel = SFX "*******************************************************"}
endscript
InteriorPanningRadius = 10
Global_User_SFX_Number = 10
Guitar_Always_Volume_100 = 0
Star_power_verb_is_on = 0
sfx_adjusted_guitar_volume = 100
highpass_cutoff_freq_modulated = 2000
lowpass_cutoff_freq_modulated = 1000
phaser_delay_time_modulated = 10
auto_wah_is_on = 0
wah_cutoff_freq_modulated = 900
current_audio_effect_type = highpass
guitar_audio_effects_are_on = 0
guitar_audio_effects_are_on_p1 = 0
guitar_audio_effects_are_on_p2 = 0
Debug_Audible_Downbeat = 0
Debug_Audible_Open = 0
Debug_Audible_Close = 0
Debug_Audible_HitNote = 0
CrowdListenerStateClapOn1234 = 0
CrowdLevelForSurges = 1.66
temp_language_hack = lang_english
StreamPriorityLow = 10
StreamPriorityLowMid = 30
StreamPriorityMid = 50
StreamPriorityMidHigh = 70
StreamPriorityHigh = 90
StreamPriorityHighest = 95
StreamPrioritySystem = 109
Global_SoundEvent_Default_Priority = 50
Global_SoundEvent_Default_Buss = DEFAULT
Global_SoundEvent_NoRepeatFor = 0.1
Global_SoundEvent_InstanceManagement = stop_furthest
Global_SoundEvent_InstanceLimit = 1
GuitarVolumeFullStereoLevel = 100
GuitarVolumePartialStereoLevel = 85
GuitarVolumeRamptimeUp = 0.0
GuitarVolumeRamptimeDown = 0.02
Player1Pan = {
	panLCR1 = -100
	panLCR2 = -100
}
Player2Pan = {
	panLCR1 = 100
	panLCR2 = 100
}

script Soundevent 
	SoundEventFast <...>
endscript

script RegisterSoundEvent 
	AddSoundEventScript SoundEvent_EventID = <SoundEvent_EventID>
	onexitrun DeRegisterSoundEvent Params = {SoundEvent_EventID = <SoundEvent_EventID>}
	<Event> <...>
endscript

script DeRegisterSoundEvent 
	RemoveSoundEventScript SoundEvent_EventID = <SoundEvent_EventID>
endscript

script Master_SFX_Adding_Sound_Busses 
	CreateBussSystem \{$BussTree}
	Setsoundbussparams \{$default_BussSet}
	Setsoundbussparams \{$default_BussSet Time = 0.5}
	SoundBussLock \{Master}
	SoundBussLock \{User_Guitar}
	SoundBussLock \{User_Band}
	SoundBussLock \{User_SFX}
	SoundBussLock \{User_Music}
	SoundBussLock \{Crowd_beds}
	SoundBussLock \{Crowd_Singalong}
	SoundBussLock \{band_Balance}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{Music_Setlist}
	createsoundbusseffects \{Guitar_Balance = {Effect = $Echo_Guitar_Buss_Dry effect2 = $Reverb_Guitar_Buss_Dry}}
	createsoundbusseffects \{Crowd_W_Reverb = {Effect = $Echo_Crowd_Buss effect2 = $Reverb_Crowd_Buss}}
endscript

script GH3_Change_crowd_reverb_settings_by_Venue 
	GetPakManCurrent \{map = Zones}
	Printf Channel = SFX "*************************************changing reverb settings to %s zone" S = <pak>
	switch <pak>
		case Z_Party
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_party}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_party}
		case Z_Dive
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_dive}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_dive}
		case Z_Soundcheck
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_dive}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_dive}
		case Z_Prison
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_prison}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_prison}
		case Z_ArtDeco
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_artdeco}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_artdeco}
		case Z_Video
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_video}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_video}
		case z_wikker
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_wikker}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_wikker}
		case z_Budokan
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_budokan}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_budokan}
		case Z_Hell
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss_z_hell}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss_z_hell}
		default
		SetSoundBussEffects \{Effect = $Reverb_Crowd_Buss}
		SetSoundBussEffects \{Effect = $Echo_Crowd_Buss}
	endswitch
endscript

script PrintPushPopDebugInfo 
	if NOT gotParam \{push}
		if NOT gotParam \{pop}
			Printf \{"Did not specify push or pop!"}
			return
		endif
	endif
	if gotParam \{push}
		pushPop = "push"
	else
		pushPop = "pop"
	endif
	if NOT gotParam \{Name}
		Printf \{"Did not specify script name!"}
		return
	endif
	Printf "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= %a %b" A = <Name> B = <pushPop>
endscript

script Generic_Reverb_Functionality_Script \{NewEchoSettings = $Echo_Generic_Outside_Slap EchoFadeTime = 0.5 NewReverbSettings = $Reverb_Generic_Outside_Verb ReverbFadeTime = 0.5}
	if inside
		if gotParam \{NewEchoSettings}
			if gotParam \{EchoFadeTime}
				SetSoundBussEffects Effect = <NewEchoSettings> Time = <EchoFadeTime>
			else
				SetSoundBussEffects Effect = <NewEchoSettings>
			endif
		endif
		if gotParam \{NewReverbSettings}
			if gotParam \{ReverbFadeTime}
				SetSoundBussEffects Effect = <NewReverbSettings> Time = <ReverbFadeTime>
			else
				SetSoundBussEffects Effect = <NewReverbSettings>
			endif
		endif
	else
		if gotParam \{Destroyed}
		else
			if gotParam \{Created}
			else
				if gotParam \{ExitEchoSettings}
					if gotParam \{ExitEchoFadeTime}
						SetSoundBussEffects Effect = <ExitEchoSettings> Time = <ExitEchoFadeTime>
					else
						SetSoundBussEffects Effect = <ExitEchoSettings>
					endif
				endif
				if gotParam \{ExitReverbSettings}
					if gotParam \{ExitReverbFadeTime}
						SetSoundBussEffects Effect = <ExitReverbSettings> Time = <ExitReverbFadeTime>
					else
						SetSoundBussEffects Effect = <ExitReverbSettings>
					endif
				endif
			endif
		endif
	endif
endscript

script GH_Guitar_Battle_DSP_Effects_Player1 
	switch <attack_effect>
		case double_note_flange
		Printf \{Channel = SFX "setting to doublenote flange"}
		SetSoundBussEffects \{Effect = $Flange_DoubleNotes1}
		Printf \{Channel = SFX "changing p1 balance buss"}
		Setsoundbussparams \{Guitar_Balance_First_Player = {vol = 2}}
		case overload_highpass
		Printf \{Channel = SFX "setting to overload highpass"}
		SetSoundBussEffects \{Effect = $HighPass_Thin1}
		Printf \{Channel = SFX "changing p1 balance buss"}
		Setsoundbussparams \{Guitar_Balance_First_Player = {vol = 3}}
		case brokenstring_chorus
		Printf \{Channel = SFX "setting to broken string chorus"}
		SetSoundBussEffects \{Effect = $Chorus_Generic1}
		Printf \{Channel = SFX "changing p1 balance buss"}
		Setsoundbussparams \{Guitar_Balance_First_Player = {vol = 0}}
		case lefty_eq
		Printf \{Channel = SFX "setting to lefty eq"}
		SetSoundBussEffects \{Effect = $LowPass_Muffled1}
		Printf \{Channel = SFX "changing p1 balance buss"}
		Setsoundbussparams \{Guitar_Balance_First_Player = {vol = 6}}
		case diffup_eq
		Printf \{Channel = SFX "setting to diffup eq"}
		SetSoundBussEffects \{Effect = $EQ_Wah1}
		Printf \{Channel = SFX "changing p1 balance buss"}
		Setsoundbussparams \{Guitar_Balance_First_Player = {vol = -6}}
		default
		Printf \{Channel = SFX "default"}
	endswitch
endscript

script GH_Guitar_Battle_DSP_Effects_Player2 
	switch <attack_effect>
		case double_note_flange
		Printf \{Channel = SFX "setting to doublenote flange"}
		SetSoundBussEffects \{Effect = $Flange_DoubleNotes2}
		Printf \{Channel = SFX "changing p2 balance buss"}
		Setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 2}}
		case overload_highpass
		Printf \{Channel = SFX "setting to overload highpass"}
		SetSoundBussEffects \{Effect = $HighPass_Thin2}
		Printf \{Channel = SFX "changing p2 balance buss"}
		Setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 3}}
		case brokenstring_chorus
		Printf \{Channel = SFX "setting to broken string chorus"}
		SetSoundBussEffects \{Effect = $Chorus_Generic2}
		Printf \{Channel = SFX "changing p2 balance buss"}
		Setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 0}}
		case lefty_eq
		Printf \{Channel = SFX "setting to lefty eq"}
		SetSoundBussEffects \{Effect = $LowPass_Muffled2}
		Printf \{Channel = SFX "changing p2 balance buss"}
		Setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 6}}
		case diffup_eq
		Printf \{Channel = SFX "setting to diffup eq"}
		SetSoundBussEffects \{Effect = $EQ_Wah2}
		Printf \{Channel = SFX "changing p2 balance buss"}
		Setsoundbussparams \{Guitar_Balance_Second_Player = {vol = -6}}
		default
		Printf \{Channel = SFX "default"}
	endswitch
endscript

script GH3_Change_Guitar_Audio_Effects_Guitar_Single_Player \{effect_type = DEFAULT}
endscript

script GH3_Guitar_Effects_Wait 
endscript

script GH3_Battle_Attack_Finished_SFX 
	if (<Player> = 1)
		Soundevent \{Event = GH_SFX_BattleMode_Attack_Over_P1}
	else
		Soundevent \{Event = GH_SFX_BattleMode_Attack_Over_P2}
	endif
endscript

script Reset_Battle_DSP_Effects 
	if (<Player> = 1)
		Reset_Battle_DSP_Effects_Player1
	else
		Reset_Battle_DSP_Effects_Player2
	endif
endscript

script Reset_Battle_DSP_Effects_Player1 
	SetSoundBussEffects \{Effect = $LowPass_Default1 Time = 0.15}
	SetSoundBussEffects \{Effect = $HighPass_Default1 Time = 0.15}
	SetSoundBussEffects \{Effect = $Flange_Default1 Time = 0.15}
	SetSoundBussEffects \{Effect = $Chorus_Default1 Time = 0.15}
	SetSoundBussEffects \{Effect = $EQ_Default1 Time = 0.15}
	Printf \{Channel = SFX "RESTTING p1 balance buss"}
	Setsoundbussparams \{Guitar_Balance_First_Player = {vol = 0}}
endscript

script Reset_Battle_DSP_Effects_Player2 
	SetSoundBussEffects \{Effect = $LowPass_Default2 Time = 0.15}
	SetSoundBussEffects \{Effect = $HighPass_Default2 Time = 0.15}
	SetSoundBussEffects \{Effect = $Flange_Default2 Time = 0.15}
	SetSoundBussEffects \{Effect = $Chorus_Default2 Time = 0.15}
	SetSoundBussEffects \{Effect = $EQ_Default2 Time = 0.15}
	Printf \{Channel = SFX "RESTTING p2 balance buss"}
	Setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 0}}
endscript

script Check_And_Reset_Effects 
endscript

script cleanup_spawned_scripts_for_effects 
endscript

script turn_off_current_audio_effect 
endscript

script Profiling_FMOD_EFFECTS 
endscript

script GH_Star_Power_Verb_On 
	if ($Star_power_verb_is_on = 1)
		return
	endif
	Change \{Star_power_verb_is_on = 1}
	Soundevent \{Event = Star_Power_Deployed_SFX}
	if ($game_mode != tutorial)
		Soundevent \{Event = Star_Power_Deployed_Cheer_SFX}
	endif
	PushSoundBussParams
	Setsoundbussparams \{$Star_Power_BussSet Time = 0.5}
	get_song_tempo_cfunc
	if (<beat_duration> > 400)
		beat_duration = (<beat_duration> / 2)
	endif
	if (<beat_duration> > 400)
		beat_duration = (<beat_duration> / 2)
	endif
	if (<beat_duration> > 400)
		beat_duration = (<beat_duration> / 2)
	endif
	if (<beat_duration> > 400)
		beat_duration = 400
	endif
	SetSoundBussEffects Effect = {Effect = echo Name = GuitarEcho1 Delay = <beat_duration>}
	SetSoundBussEffects \{Effect = {Effect = echo Name = GuitarEcho1 drymix = 1.0 WetMix = 0.5} Time = 0.1}
	SetSoundBussEffects \{Effect = {Effect = sfxreverb Name = GuitarReverb1 reflectionslevel = -1200.0 ReverbLevel = -550.0} Time = 0.1}
endscript

script GH_Star_Power_Verb_Off 
	if ($Star_power_verb_is_on = 1)
		PopSoundBussParams
	endif
	SetSoundBussEffects \{Effect = {Effect = echo Name = GuitarEcho1 WetMix = 0.0} Time = 0.1}
	SetSoundBussEffects \{Effect = {Effect = sfxreverb Name = GuitarReverb1 reflectionslevel = -10000.0 ReverbLevel = -10000.0} Time = 0.5}
	Change \{Star_power_verb_is_on = 0}
endscript

script GH3_Set_Guitar_Verb_And_Echo_to_Dry 
	SetSoundBussEffects \{Effect = $Echo_Guitar_Buss_Dry}
	SetSoundBussEffects \{Effect = $Reverb_Guitar_Buss_Dry}
endscript

script GH_SFX_Overloaded_Static_Player1 
endscript

script GH_SFX_wait_then_kill_Overloaded_Static_Player1 
endscript

script GH_SFX_Overloaded_Static_Player2 
endscript

script GH_SFX_wait_then_kill_Overloaded_Static_Player2 
endscript

script GH_BattleMode_Modulate_HPF_Cutoff 
endscript

script gh_battlemode_modulate_HPF_value 
endscript

script GH_BattleMode_Modulate_LPF_Cutoff 
endscript

script gh_battlemode_modulate_LPF_value 
endscript

script GH_BattleMode_Modulate_Phaser_Delay 
endscript

script gh_modulate_Phaser_Delay_Value 
endscript

script gh_battlemode_modulate_Wah_value 
endscript

script GH_BattleMode_Player1_SFX_DiffUp_Start 
	Soundevent \{Event = GH_SFX_BattleMode_DiffUp_P1}
endscript

script GH_BattleMode_Player2_SFX_DiffUp_Start 
	Soundevent \{Event = GH_SFX_BattleMode_DiffUp_P2}
endscript

script GH_BattleMode_Player1_SFX_DoubleNotes_Start 
	Soundevent \{Event = GH_SFX_BattleMode_DoubleNote_P1}
endscript

script GH_BattleMode_Player2_SFX_DoubleNotes_Start 
	Soundevent \{Event = GH_SFX_BattleMode_DoubleNote_P2}
endscript

script GH_BattleMode_Player1_SFX_Shake_Start 
	Soundevent \{Event = GH_SFX_BattleMode_Lightning_Player1}
endscript

script GH_BattleMode_Player2_SFX_Shake_Start 
	Soundevent \{Event = GH_SFX_BattleMode_Lightning_Player2}
endscript

script GH_BattleMode_Player1_SFX_LeftyNotes_Start 
	Soundevent \{Event = GH_SFX_BattleMode_Lefty_P1}
endscript

script GH_BattleMode_Player2_SFX_LeftyNotes_Start 
	Soundevent \{Event = GH_SFX_BattleMode_Lefty_P2}
endscript

script GH_BattleMode_Player1_SFX_BrokenString_Start 
	Soundevent \{Event = GH_SFX_BattleMode_StringBreak_P1}
endscript

script GH_BattleMode_Player2_SFX_BrokenString_Start 
	Soundevent \{Event = GH_SFX_BattleMode_StringBreak_P2}
endscript

script GH_BattleMode_Player1_SFX_Steal 
	Soundevent \{Event = GH_SFX_BattleMode_Steal_P1}
endscript

script GH_BattleMode_Player2_SFX_Steal 
	Soundevent \{Event = GH_SFX_BattleMode_Steal_P2}
endscript

script GH_BattleMode_Player1_SFX_Whammy_Start 
	Soundevent \{Event = GH_SFX_BattleMode_WhammyAttack_P1}
endscript

script GH_BattleMode_Player2_SFX_Whammy_Start 
	Soundevent \{Event = GH_SFX_BattleMode_WhammyAttack_P2}
endscript

script GH_BattleMode_Player1_SFX_Death_Drain 
	Soundevent \{Event = GH_SFX_BattleMode_Death_Drain_P1}
endscript

script GH_BattleMode_Player2_SFX_Death_Drain 
	Soundevent \{Event = GH_SFX_BattleMode_Death_Drain_P2}
endscript

script GH_BattleMode_Start_Heartbeat_P1 
	Soundevent \{Event = Battlemode_HeartBeat_P1}
endscript

script GH_BattleMode_Stop_Heartbeat_P1 
	StopSoundEvent \{Battlemode_HeartBeat_P1}
endscript

script GH_BattleMode_Start_Heartbeat_P2 
	Soundevent \{Event = Battlemode_HeartBeat_P2}
endscript

script GH_BattleMode_Stop_Heartbeat_P2 
	StopSoundEvent \{Battlemode_HeartBeat_P2}
endscript

script GH_BattleMode_SFX_Sudden_Death 
	Soundevent \{Event = GH_SFX_BattleMode_Sudden_Death}
endscript

script GH3_Battle_Play_Crowd_Reaction_SFX 
	if (<receiving_player> = 1)
		Battle_Attack_Cheer_Based_On_Venue_P2
	else
		Battle_Attack_Cheer_Based_On_Venue_P1
	endif
endscript

script Battle_Attack_Cheer_Based_On_Venue_P1 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Battle_Attack_Small_Crowd_Cheer_P1}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Battle_Attack_Medium_Crowd_Cheer_P1}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Battle_Attack_Large_Crowd_Cheer_P1}
		case Z_Hell
		Soundevent \{Event = Battle_Attack_Hell_Crowd_Cheer_P1}
		default
		Soundevent \{Event = Battle_Attack_Medium_Crowd_Cheer_P1}
	endswitch
endscript

script Battle_Attack_Cheer_Based_On_Venue_P2 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Battle_Attack_Small_Crowd_Cheer_P2}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Battle_Attack_Medium_Crowd_Cheer_P2}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Battle_Attack_Large_Crowd_Cheer_P2}
		case Z_Hell
		Soundevent \{Event = Battle_Attack_Hell_Crowd_Cheer_P2}
		default
		Soundevent \{Event = Battle_Attack_Medium_Crowd_Cheer_P2}
	endswitch
endscript

script GH3_Battle_Play_Whammy_Pitch_Up_Sound 
	num_strums = ($<other_player_status>.whammy_attack)
	player_pan = ($<other_player_status>.Player)
	if (<player_pan> = 1)
		<pan1x> = -0.76199996
		<pan1y> = 0.6470001
		<pan2x> = -0.44799998
		<pan2y> = 0.894
	else
		<pan1x> = 0.47
		<pan1y> = 0.883
		<pan2x> = 0.728
		<pan2y> = 0.685
	endif
	switch <DIFFICULTY>
		case EASY
		<total_strums> = ($battlemode_powerups [6].easy_repair)
		case MEDIUM
		<total_strums> = ($battlemode_powerups [6].medium_repair)
		case HARD
		<total_strums> = ($battlemode_powerups [6].hard_repair)
		case EXPERT
		<total_strums> = ($battlemode_powerups [6].expert_repair)
		default
		Printf \{"moron"}
	endswitch
	<change_pitch> = (1.3 * <num_strums> / <total_strums>)
	<local_pitch> = (100.0 - (10.0 * <change_pitch>))
	PlaySound GH3_BattleMode_WhammyAttack_Received vol = 50 Pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script GH3_Crowd_Manipulate_SFX 
endscript

script GH3_Crowd_Event_Listener \{event_type = surge_fast}
	if NOT ($game_mode = training)
		if gotParam \{event_type}
			if ($current_crowd > $CrowdLevelForSurges)
				switch <event_type>
					case Sing
					Printf \{" "}
					SpawnScriptNOw \{GH3_AdjustCrowdSingingVolumeUp}
					case surge_fast
					GH3_AdjustCrowdFastSurge <...>
					case surge_slow
					GH3_AdjustCrowdSlowSurge <...>
					case applause
					GH3_Play_A_Crowd_Applause_Based_On_Venue
					default
					Printf \{"idiot"}
				endswitch
			else
				if gotParam \{override_state}
					switch <event_type>
						case Sing
						Printf \{" "}
						SpawnScriptNOw \{GH3_AdjustCrowdSingingVolumeUp}
						case surge_fast
						GH3_Play_A_Fast_Crowd_Swell_Based_On_Venue
						case surge_slow
						GH3_Play_A_Crowd_Applause_Based_On_Venue
						GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
						case applause
						GH3_Play_A_Crowd_Applause_Based_On_Venue
						default
						Printf \{"idiot"}
					endswitch
				endif
			endif
		endif
	endif
endscript

script GH3_Play_A_Fast_Crowd_Swell_Based_On_Venue 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Party
		case Z_Dive
		case Z_Soundcheck
		Soundevent \{Event = Small_Crowd_Swell}
		case Z_Prison
		case Z_ArtDeco
		case Z_Video
		Soundevent \{Event = Medium_Crowd_Swell}
		case z_wikker
		case z_Budokan
		Soundevent \{Event = Crowd_Fast_Surge_Cheer}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Swell}
		default
		Soundevent \{Event = Medium_Crowd_Swell}
	endswitch
endscript

script GH3_Play_A_Crowd_Applause_Based_On_Venue 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Party
		case Z_Dive
		case Z_Soundcheck
		Soundevent \{Event = Small_Crowd_Applause_SE}
		case Z_Prison
		case Z_ArtDeco
		case Z_Video
		Soundevent \{Event = Medium_Crowd_Applause}
		case z_wikker
		case z_Budokan
		Soundevent \{Event = Large_Crowd_Applause_SFX}
		case Z_Hell
		Soundevent \{Event = Medium_Crowd_Applause}
		default
		Soundevent \{Event = Medium_Crowd_Applause}
	endswitch
endscript

script GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Party
		case Z_Dive
		case Z_Soundcheck
		Soundevent \{Event = Crowd_OneShots_Cheer_Close}
		case Z_Prison
		case Z_ArtDeco
		case Z_Video
		Soundevent \{Event = Crowd_OneShots_Cheer_Close}
		case z_wikker
		case z_Budokan
		Soundevent \{Event = Crowd_OneShots_Cheer_Close}
		case Z_Hell
		Soundevent \{Event = Crowd_OneShots_Cheer_Close}
		default
		Soundevent \{Event = Crowd_OneShots_Cheer_Close}
	endswitch
endscript

script GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Party
		case Z_Dive
		case Z_Soundcheck
		Soundevent \{Event = Crowd_OneShots_Boo_Close}
		case Z_Prison
		case Z_ArtDeco
		case Z_Video
		Soundevent \{Event = Crowd_OneShots_Boo_Close}
		case z_wikker
		case z_Budokan
		Soundevent \{Event = Crowd_OneShots_Boo_Close}
		case Z_Hell
		Soundevent \{Event = Crowd_OneShots_Boo_Close}
		default
		Soundevent \{Event = Crowd_OneShots_Boo_Close}
	endswitch
endscript

script GH3_SFX_Encore_Accept 
	Do_Actual_Transition_SFX_Medium_To_Good
	GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
endscript

script GH3_SFX_Encore_Decline 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Encore_Decline_Small_Crowd_Med_To_Bad_SFX}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Encore_Decline_Medium_Crowd_Med_To_Bad_SFX}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Encore_Decline_Crowd_Med_To_Bad_SFX}
		case Z_Hell
		Soundevent \{Event = Encore_Decline_Hell_Crowd_Med_To_Bad_SFX}
		default
		Soundevent \{Event = Encore_Decline_Medium_Crowd_Med_To_Bad_SFX}
	endswitch
	GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue
endscript

script GH3_AdjustCrowdSingingVolumeUp 
endscript

script GH3_AdjustCrowdSingingVolumeDown 
endscript

script GH3_AdjustCrowdFastSurge 
	SoundBussUnlock \{Crowd_beds}
	Setsoundbussparams \{$CrowdSurgeBig_BussSet Time = 1.2}
	SoundBussLock \{Crowd_beds}
	Wait \{1.5 Seconds}
	SoundBussUnlock \{Crowd_beds}
	Setsoundbussparams \{$CrowdNormal_BussSet Time = 4}
	SoundBussLock \{Crowd_beds}
endscript

script GH3_AdjustCrowdSlowSurge 
	SoundBussUnlock \{Crowd_beds}
	Setsoundbussparams \{$CrowdSurgeSmall_BussSet Time = 4}
	SoundBussLock \{Crowd_beds}
	Wait \{8 Seconds}
	SoundBussUnlock \{Crowd_beds}
	Setsoundbussparams \{$CrowdNormal_BussSet Time = 4}
	SoundBussLock \{Crowd_beds}
endscript

script Crowd_Singalong_Volume_Up 
	SoundBussUnlock \{Crowd_Singalong}
	Setsoundbussparams \{$CrowdSingingVolUp_BussSet Time = 4}
	SoundBussLock \{Crowd_Singalong}
endscript

script Crowd_Singalong_Volume_Down 
	SoundBussUnlock \{Crowd_Singalong}
	Setsoundbussparams \{$CrowdSingingVolDown_BussSet Time = 1}
	SoundBussLock \{Crowd_Singalong}
endscript

script Menu_Music_On 
	setSpawnInstanceLimits \{MAX = 1 management = ignore_spawn_request}
	if gotParam \{waitforguitarlick}
		Wait \{3 Seconds}
	endif
	EnableUserMusic
	begin
	Soundevent \{Event = Menu_Music_SE}
	Wait \{3 Seconds}
	Menu_music_Checking
	Wait \{1 Second}
	repeat
endscript

script Menu_music_Checking 
	begin
	if NOT issoundeventplaying \{Menu_Music_SE}
		break
	endif
	Wait \{1 Second}
	repeat
endscript

script menu_music_off 
	EnableUserMusic \{disable}
	killspawnedScript \{Name = Menu_Music_On}
	StopSoundEvent \{Menu_Music_SE}
endscript

script PlayEncoreStreamSFX 
endscript

script Song_Intro_Kick_SFX_Waiting 
	printingtext = ($current_intro.hud_move_time)
	Wait ($current_intro.hud_move_time / 1000.0) Seconds
	Soundevent \{Event = Song_Intro_Kick_SFX}
endscript

script Song_Intro_Highway_Up_SFX_Waiting 
	printingtext = ($current_intro.highway_move_time)
	waitTime = (($current_intro.highway_move_time / 1000.0) - 1.5)
	if (<waitTime> < 0)
		waitTime = 0
	endif
	Wait <waitTime> Seconds
	Soundevent \{Event = Song_Intro_Highway_Up}
endscript

script Change_Crowd_Looping_SFX \{crowd_looping_state = GOOD Player = 1}
	Printf Channel = SFX "changing crowd looping to %s" S = <crowd_looping_state>
	if ($boss_battle = 1)
		Printf \{Channel = SFX "we're in boss battle - see who requested this crowd loop change - p1 or p2"}
		if (<Player> = 1)
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		else
			Printf \{Channel = SFX "do nothing, since it's the boss's health that was requesting a change"}
		endif
	else
		Printf \{Channel = SFX "we're not in boss battle"}
		if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			do_actual_changing_of_looping_sound \{crowd_looping_state = GOOD}
		else
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		endif
	endif
endscript

script do_actual_changing_of_looping_sound 
	if gotParam \{crowd_looping_state}
		switch <crowd_looping_state>
			case Bad
			Change_Crowd_Looping_SFX_Bad
			case neutral
			Change_Crowd_Looping_SFX_Neutral
			case GOOD
			Change_Crowd_Looping_SFX_Good
			default
			Change_Crowd_Looping_SFX_Good
		endswitch
	endif
endscript

script Change_Crowd_Looping_SFX_Bad 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		BG_Crowd_Small_Bad
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		BG_Crowd_Medium_Bad
		case z_Budokan
		case z_wikker
		BG_Crowd_Large_Bad
		case Z_Hell
		BG_Crowd_Hell_Bad
		default
		BG_Crowd_Medium_Bad
	endswitch
endscript

script Change_Crowd_Looping_SFX_Neutral 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		BG_Crowd_Small_Neutral
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		BG_Crowd_Medium_Neutral
		case z_Budokan
		case z_wikker
		BG_Crowd_Large_Neutral
		case Z_Hell
		BG_Crowd_Hell_Neutral
		default
		BG_Crowd_Medium_Neutral
	endswitch
endscript

script Change_Crowd_Looping_SFX_Good 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		BG_Crowd_Small_Good
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		BG_Crowd_Medium_Good
		case z_Budokan
		case z_wikker
		case Z_credits
		BG_Crowd_Large_Good
		case Z_Hell
		BG_Crowd_Hell_Good
		default
		BG_Crowd_Medium_Good
	endswitch
endscript

script crowd_transition_sfx_poor_to_medium 
	Printf \{Channel = SFX "poor to med"}
	if gotParam \{Player}
		Crowd_generic_transition_sfx State = poor_to_med Player = <Player>
	endif
endscript

script crowd_transition_sfx_medium_to_good 
	Printf \{Channel = SFX "med to good"}
	if gotParam \{Player}
		Crowd_generic_transition_sfx State = med_to_good Player = <Player>
	endif
endscript

script crowd_transition_sfx_medium_to_poor 
	Printf \{Channel = SFX "med to poor"}
	if gotParam \{Player}
		Crowd_generic_transition_sfx State = med_to_poor Player = <Player>
	endif
endscript

script crowd_transition_sfx_good_to_medium 
	Printf \{Channel = SFX "good to med"}
	if gotParam \{Player}
		Crowd_generic_transition_sfx State = good_to_med Player = <Player>
	endif
endscript

script Crowd_generic_transition_sfx \{State = med_to_good}
	if ($game_mode = p2_battle)
	else
		if ($boss_battle = 1)
			if (<Player> = 1)
				transition_sfx_left_side State = <State>
			else
			endif
		else
			if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			else
				transition_sfx_both_sides State = <State>
			endif
		endif
	endif
endscript

script transition_sfx_left_side 
	if gotParam \{State}
		if (<State> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium_P1
		endif
		if (<State> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor_P1
		endif
		if (<State> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good_P1
		endif
		if (<State> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium_P1
		endif
	endif
endscript

script transition_sfx_right_side 
	if gotParam \{State}
		if (<State> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium_P2
		endif
		if (<State> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor_P2
		endif
		if (<State> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good_P2
		endif
		if (<State> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium_P2
		endif
	endif
endscript

script transition_sfx_both_sides 
	if gotParam \{State}
		if (<State> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium
		endif
		if (<State> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor
		endif
		if (<State> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good
		endif
		if (<State> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium
		endif
	endif
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Bad_To_Med_SFX}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Bad_To_Med_SFX}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Bad_To_Med_SFX}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Bad_To_Med_SFX}
		default
		Soundevent \{Event = Medium_Crowd_Bad_To_Med_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium_P1 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Bad_To_Med_SFX_P1}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Bad_To_Med_SFX_P1}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Bad_To_Med_SFX_P1}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Bad_To_Med_SFX_P1}
		default
		Soundevent \{Event = Medium_Crowd_Bad_To_Med_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium_P2 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Bad_To_Med_SFX_P2}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Bad_To_Med_SFX_P2}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Bad_To_Med_SFX_P2}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Bad_To_Med_SFX_P2}
		default
		Soundevent \{Event = Medium_Crowd_Bad_To_Med_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Med_To_Good_SFX}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Med_To_Good_SFX}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Med_To_Good_SFX}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Med_To_Good_SFX}
		default
		Soundevent \{Event = Medium_Crowd_Med_To_Good_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good_P1 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Med_To_Good_SFX_P1}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Med_To_Good_SFX_P1}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Med_To_Good_SFX_P1}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Med_To_Good_SFX_P1}
		default
		Soundevent \{Event = Medium_Crowd_Med_To_Good_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good_P2 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Med_To_Good_SFX_P2}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Med_To_Good_SFX_P2}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Med_To_Good_SFX_P2}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Med_To_Good_SFX_P2}
		default
		Soundevent \{Event = Medium_Crowd_Med_To_Good_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Med_To_Bad_SFX}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Med_To_Bad_SFX}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Med_To_Bad_SFX}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Med_To_Bad_SFX}
		default
		Soundevent \{Event = Medium_Crowd_Med_To_Bad_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor_P1 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Med_To_Bad_SFX_P1}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Med_To_Bad_SFX_P1}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Med_To_Bad_SFX_P1}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Med_To_Bad_SFX_P1}
		default
		Soundevent \{Event = Medium_Crowd_Med_To_Bad_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor_P2 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Med_To_Bad_SFX_P2}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Med_To_Bad_SFX_P2}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Med_To_Bad_SFX_P2}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Med_To_Bad_SFX_P2}
		default
		Soundevent \{Event = Medium_Crowd_Med_To_Bad_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Good_To_Med_SFX}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Good_To_Med_SFX}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Good_To_Med_SFX}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Good_To_Med_SFX}
		default
		Soundevent \{Event = Medium_Crowd_Good_To_Med_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium_P1 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Good_To_Med_SFX_P1}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Good_To_Med_SFX_P1}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Good_To_Med_SFX_P1}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Good_To_Med_SFX_P1}
		default
		Soundevent \{Event = Medium_Crowd_Good_To_Med_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium_P2 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		case Z_Party
		Soundevent \{Event = Small_Crowd_Good_To_Med_SFX_P2}
		case Z_ArtDeco
		case Z_Video
		case Z_Prison
		case Z_Soundcheck
		Soundevent \{Event = Medium_Crowd_Good_To_Med_SFX_P2}
		case z_Budokan
		case z_wikker
		Soundevent \{Event = Crowd_Good_To_Med_SFX_P2}
		case Z_Hell
		Soundevent \{Event = Hell_Crowd_Good_To_Med_SFX_P2}
		default
		Soundevent \{Event = Medium_Crowd_Good_To_Med_SFX_P2}
	endswitch
endscript

script You_Rock_Waiting_Crowd_SFX 
	Wait \{2 Seconds}
	Soundevent \{Event = Crowd_Fast_Surge_Cheer}
	Soundevent \{Event = Medium_Crowd_Applause}
endscript
save_check_time_early = 0.0
save_check_time_late = 0.0

script audio_sync_test_disable_highway 
	disable_bg_viewport
	Change \{save_check_time_early = $check_time_early}
	Change \{save_check_time_late = $check_time_late}
	Change \{check_time_early = 1.0}
	Change \{check_time_late = 1.0}
endscript

script audio_sync_test_enable_highway 
	enable_bg_viewport
	Change \{check_time_early = $save_check_time_early}
	Change \{check_time_late = $save_check_time_late}
endscript

script GH_SFX_Intro_WarmUp 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Party
		PlaySound \{z_party_intro vol = 100 buss = Crowd_PreSong_Intro}
		case Z_Dive
		PlaySound \{z_dive_intro vol = 100 buss = Crowd_PreSong_Intro}
		case Z_ArtDeco
		PlaySound \{z_artdeco_intro vol = 100 buss = Crowd_PreSong_Intro}
		case Z_Video
		PlaySound \{z_video_intro vol = 100 buss = Crowd_PreSong_Intro}
		case Z_Prison
		PlaySound \{z_prison_intro vol = 100 buss = Crowd_PreSong_Intro}
		case z_Budokan
		PlaySound \{z_budokan_intro vol = 100 buss = Crowd_PreSong_Intro}
		case z_wikker
		PlaySound \{z_wikker_intro vol = 100 buss = Crowd_PreSong_Intro}
		case Z_Hell
		PlaySound \{z_hell_intro vol = 45 buss = Crowd_PreSong_Intro}
		case Z_Soundcheck
		PlaySound \{z_party_intro vol = 100 buss = Crowd_PreSong_Intro}
		default
		PlaySound \{z_party_intro vol = 100 buss = Crowd_PreSong_Intro}
	endswitch
endscript

script PreEncore_Crowd_Build_SFX 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Party
		Printf \{Channel = SFX "playing party build"}
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Backyard}
		case Z_Dive
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Dive}
		case Z_ArtDeco
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Deco}
		case Z_Video
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Video}
		case Z_Prison
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Prison}
		case z_Budokan
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Budokan}
		case z_wikker
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Wikker}
		case Z_Hell
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Hell}
		case Z_Soundcheck
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Backyard}
		default
		Soundevent \{Event = PreEncore_Crowd_Build_SFX_Backyard}
	endswitch
endscript

script PreEncore_Crowd_Build_SFX_STOP 
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Backyard}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Dive}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Deco}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Video}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Prison}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Budokan}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Wikker}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Hell}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Backyard}
	StopSoundEvent \{PreEncore_Crowd_Build_SFX_Backyard}
endscript

script GH_BossDevil_Death_Transition_SFX 
	Soundevent \{Event = Devil_Die_Transition_SFX}
endscript

script Battle_SFX_Repair_Broken_String 
	if gotParam \{num_strums}
		if gotParam \{player_pan}
			if gotParam \{DIFFICULTY}
				if (<player_pan> = 1)
					<pan1x> = -0.76199996
					<pan1y> = 0.6470001
					<pan2x> = -0.44799998
					<pan2y> = 0.894
				else
					<pan1x> = 0.47
					<pan1y> = 0.883
					<pan2x> = 0.728
					<pan2y> = 0.685
				endif
				switch <DIFFICULTY>
					case EASY
					<total_strums> = ($battlemode_powerups [5].easy_repair)
					case MEDIUM
					<total_strums> = ($battlemode_powerups [5].medium_repair)
					case HARD
					<total_strums> = ($battlemode_powerups [5].hard_repair)
					case EXPERT
					<total_strums> = ($battlemode_powerups [5].expert_repair)
					default
					Printf \{"moron"}
				endswitch
				<change_pitch> = (1.0 * <num_strums> / <total_strums>)
				<local_pitch> = (100.0 - (10.0 * <change_pitch>))
				PlaySound GH3_Battlemode_StringTune_2 vol = 50 Pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		endif
	endif
endscript

script GH_SFX_Play_Encore_Audio_From_Zone_Memory 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Party
		PlaySound \{z_party_encore_L vol = 130 buss = BinkCutScenes pan1x = -0.5000002 pan1y = 0.8660253}
		PlaySound \{z_party_encore_R vol = 130 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.86602545}
		PlaySound \{z_party_encore_LS vol = 130 buss = BinkCutScenes pan1x = -0.86602545 pan1y = -0.4999999}
		PlaySound \{z_party_encore_RS vol = 130 buss = BinkCutScenes pan1x = 0.86602545 pan1y = -0.5000001}
		case Z_Dive
		PlaySound \{z_dive_encore_L vol = 130 buss = BinkCutScenes pan1x = -0.5000002 pan1y = 0.8660253}
		PlaySound \{z_dive_encore_R vol = 130 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.86602545}
		PlaySound \{z_dive_encore_LS vol = 130 buss = BinkCutScenes pan1x = -0.86602545 pan1y = -0.4999999}
		PlaySound \{z_dive_encore_RS vol = 130 buss = BinkCutScenes pan1x = 0.86602545 pan1y = -0.5000001}
		case Z_Video
		PlaySound \{z_video_encore_L vol = 150 buss = BinkCutScenes pan1x = -0.5000002 pan1y = 0.8660253}
		PlaySound \{z_video_encore_R vol = 150 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.86602545}
		PlaySound \{z_video_encore_LS vol = 150 buss = BinkCutScenes pan1x = -0.86602545 pan1y = -0.4999999}
		PlaySound \{z_video_encore_RS vol = 150 buss = BinkCutScenes pan1x = 0.86602545 pan1y = -0.5000001}
		case Z_ArtDeco
		PlaySound \{z_artdeco_encore_L vol = 150 buss = BinkCutScenes pan1x = -0.5000002 pan1y = 0.8660253}
		PlaySound \{z_artdeco_encore_R vol = 150 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.86602545}
		PlaySound \{z_artdeco_encore_LS vol = 150 buss = BinkCutScenes pan1x = -0.86602545 pan1y = -0.4999999}
		PlaySound \{z_artdeco_encore_RS vol = 150 buss = BinkCutScenes pan1x = 0.86602545 pan1y = -0.5000001}
		case Z_Prison
		PlaySound \{z_prison_encore_L vol = 150 buss = BinkCutScenes pan1x = -0.5000002 pan1y = 0.8660253}
		PlaySound \{z_prison_encore_R vol = 150 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.86602545}
		PlaySound \{z_prison_encore_LS vol = 150 buss = BinkCutScenes pan1x = -0.86602545 pan1y = -0.4999999}
		PlaySound \{z_prison_encore_RS vol = 150 buss = BinkCutScenes pan1x = 0.86602545 pan1y = -0.5000001}
		case z_wikker
		PlaySound \{z_wikker_encore_L vol = 140 buss = BinkCutScenes pan1x = -0.5000002 pan1y = 0.8660253}
		PlaySound \{z_wikker_encore_R vol = 140 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.86602545}
		PlaySound \{z_wikker_encore_LS vol = 140 buss = BinkCutScenes pan1x = -0.86602545 pan1y = -0.4999999}
		PlaySound \{z_wikker_encore_RS vol = 140 buss = BinkCutScenes pan1x = 0.86602545 pan1y = -0.5000001}
		case z_Budokan
		PlaySound \{z_budokan_encore_L vol = 130 buss = BinkCutScenes pan1x = -0.5000002 pan1y = 0.8660253}
		PlaySound \{z_budokan_encore_R vol = 130 buss = BinkCutScenes pan1x = 0.5 pan1y = 0.86602545}
		PlaySound \{z_budokan_encore_LS vol = 130 buss = BinkCutScenes pan1x = -0.86602545 pan1y = -0.4999999}
		PlaySound \{z_budokan_encore_RS vol = 130 buss = BinkCutScenes pan1x = 0.86602545 pan1y = -0.5000001}
		default
		Printf \{"do nothing - default case"}
	endswitch
endscript
Tom_Intro_Front_Speakers_unique_id = NULL
Tom_Intro_Back_Speakers_unique_id = NULL
Slash_Intro_Front_Speakers_unique_id = NULL
Slash_Intro_Back_Speakers_unique_id = NULL
Lou_Intro_Front_Speakers_unique_id = NULL
Lou_Intro_Back_Speakers_unique_id = NULL

script GH_SFX_Preload_Boss_Intro_Audio 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Dive
		if ($current_song = bosstom)
			Printf \{Channel = SFX "Preload z_dive intro boss sounds"}
			Change \{Tom_Intro_Front_Speakers_unique_id = NULL}
			Change \{Tom_Intro_Back_Speakers_unique_id = NULL}
			if PreloadStream \{Tom_Intro_Front_Speakers buss = Master}
				Change Tom_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Tom_Intro_Front_Speakers_unique_id}
			else
				Printf \{Channel = SFX "Failed preload Tom_Intro_Front_Speakers"}
			endif
			if PreloadStream \{Tom_Intro_Back_Speakers buss = Master}
				Change Tom_Intro_Back_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Tom_Intro_Back_Speakers_unique_id}
			else
				Printf \{Channel = SFX "Failed preload Tom_Intro_Back_Speakers"}
			endif
			StartPreloadedStream \{startpaused = 1 $Tom_Intro_Front_Speakers_unique_id vol = 80 pan1x = -0.5 pan1y = 0.86 pan2x = 0.5 pan2y = 0.86 buss = Encore_Events}
			StartPreloadedStream \{startpaused = 1 $Tom_Intro_Back_Speakers_unique_id vol = 80 pan1x = -0.86 pan1y = -0.49 pan2x = 0.86 pan2y = -0.5 buss = Encore_Events}
		endif
		case Z_Prison
		if ($current_song = bossslash)
			Printf \{Channel = SFX "Preload z_prison intro boss sounds"}
			Change \{Slash_Intro_Front_Speakers_unique_id = NULL}
			Change \{Slash_Intro_Back_Speakers_unique_id = NULL}
			if PreloadStream \{Slash_Intro_Front_Speakers buss = Master}
				Change Slash_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Slash_Intro_Front_Speakers_unique_id}
			else
				Printf \{Channel = SFX "Failed preload Slash_Intro_Back_Speakers"}
			endif
			if PreloadStream \{Slash_Intro_Back_Speakers buss = Master}
				Change Slash_Intro_Back_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Slash_Intro_Back_Speakers_unique_id}
			else
				Printf \{Channel = SFX "Failed preload Slash_Intro_Back_Speakers"}
			endif
			StartPreloadedStream \{startpaused = 1 $Slash_Intro_Front_Speakers_unique_id vol = 80 pan1x = -0.5 pan1y = 0.86 pan2x = 0.5 pan2y = 0.86 buss = Encore_Events}
			StartPreloadedStream \{startpaused = 1 $Slash_Intro_Back_Speakers_unique_id vol = 80 pan1x = -0.86 pan1y = -0.49 pan2x = 0.86 pan2y = -0.5 buss = Encore_Events}
		endif
		case Z_Hell
		if ($current_song = bossdevil)
			Printf \{Channel = SFX "Preload z_hell intro boss sounds"}
			Change \{Lou_Intro_Front_Speakers_unique_id = NULL}
			Change \{Lou_Intro_Back_Speakers_unique_id = NULL}
			if PreloadStream \{Lou_Intro_Front_Speakers buss = Master}
				Change Lou_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Lou_Intro_Front_Speakers_unique_id}
			else
				Printf \{Channel = SFX "Failed preload Lou_Intro_Front_Speakers"}
			endif
			if PreloadStream \{Lou_Intro_Back_Speakers buss = Master}
				Change Lou_Intro_Back_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{Stream = Lou_Intro_Back_Speakers_unique_id}
			else
				Printf \{Channel = SFX "Failed preload Lou_Intro_Back_Speakers"}
			endif
			StartPreloadedStream \{startpaused = 1 $Lou_Intro_Front_Speakers_unique_id vol = 120 pan1x = -0.5 pan1y = 0.86 pan2x = 0.5 pan2y = 0.86 buss = Encore_Events}
			StartPreloadedStream \{startpaused = 1 $Lou_Intro_Back_Speakers_unique_id vol = 120 pan1x = -0.86 pan1y = -0.49 pan2x = 0.86 pan2y = -0.5 buss = Encore_Events}
		endif
		default
		Printf \{"do nothing - default case"}
	endswitch
endscript

script GH_SFX_Play_Boss_Audio_From_Zone_Memory 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		default
		Printf \{"do nothing - default case"}
	endswitch
endscript

script GH3_SFX_fail_song_stop_sounds 
	StopSoundsByBuss \{Crowd}
	StopSoundsByBuss \{UI_Star_Power}
	StopSoundsByBuss \{UI_Battle_Mode}
	StopSoundsByBuss \{Wrong_Notes_Player1}
	StopSoundsByBuss \{Wrong_Notes_Player2}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundsByBuss \{BinkCutScenes}
	BG_Crowd_Front_End_Silence \{IMMEDIATE = 1}
endscript

script GH3_SFX_Stop_Sounds_For_KillSong 
	StopSoundEvent \{Song_Intro_Kick_SFX}
	StopSoundEvent \{Notes_Ripple_Up_SFX}
	StopSoundEvent \{Song_Intro_Highway_Up}
	StopSoundEvent \{Crowd_Low_To_Med_SFX}
	StopSoundEvent \{Crowd_Good_To_Med_SFX}
	StopSoundEvent \{Crowd_Med_To_Bad_SFX}
	StopSoundEvent \{Crowd_Med_To_Good_SFX}
	StopSoundEvent \{Crowd_OneShots_Cheer_Close}
	StopSoundEvent \{Crowd_Fast_Surge_Cheer}
	StopSoundEvent \{Crowd_OneShots_Boo_Close}
	StopSoundEvent \{Medium_Crowd_Bad_To_Med_SFX}
	StopSoundEvent \{Medium_Crowd_Med_To_Bad_SFX}
	StopSoundEvent \{Medium_Crowd_Swell}
	StopSoundEvent \{Medium_Crowd_Applause}
	StopSoundEvent \{Large_Crowd_Applause_SFX}
	StopSoundEvent \{Small_Crowd_Bad_To_Med}
	StopSoundEvent \{Small_Crowd_Med_To_Bad_SFX}
	StopSoundEvent \{Small_Crowd_Med_To_Good}
	StopSoundEvent \{Small_Crowd_Good_To_Med_SFX}
	StopSoundEvent \{Small_Crowd_OneShots_Boo}
	StopSoundEvent \{Small_Crowd_OneShots_Cheer}
	StopSoundEvent \{Hell_Crowd_Good_To_Med}
	StopSoundEvent \{Hell_Crowd_Good_To_Med_SFX}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	StopSoundEvent \{Star_Power_Awarded_SFX}
	StopSoundEvent \{Star_Power_Ready_SFX}
	StopSoundEvent \{Star_Power_Deployed_SFX}
	StopSoundEvent \{Star_Power_Deployed_Cheer_SFX}
	StopSoundEvent \{Single_Player_Bad_Note_Guitar}
	StopSoundEvent \{Midori_Win_1}
	StopSoundEvent \{Midori_Lose_1}
	StopSoundEvent \{Lars_Win_3}
	StopSoundEvent \{Lars_Lose_1}
	StopSoundEvent \{Johnny_Lose_1}
	StopSoundEvent \{Izzy_Lose_2}
	StopSoundEvent \{Izzy_Lose_1}
	StopSoundEvent \{Axel_Win_4}
	StopSoundEvent \{Axel_Win_1}
	StopSoundEvent \{Axel_Lose_2}
	StopSoundEvent \{Axel_Lose_1}
	StopSoundEvent \{Small_Crowd_Applause_SE}
	StopSoundEvent \{Slash_Outro}
	StopSoundEvent \{GH_SFX_BattleMode_Lightning_Player1}
	StopSoundEvent \{GH_SFX_BattleMode_Lightning_Player2}
	StopSoundEvent \{GH_SFX_BattleMode_DeathOf_P1}
	StopSoundEvent \{GH_SFX_BattleMode_DeathOf_P2}
	StopSoundEvent \{GH_SFX_BattleMode_DiffUp_P1}
	StopSoundEvent \{GH_SFX_BattleMode_DiffUp_P2}
	StopSoundEvent \{GH_SFX_BattleMode_DoubleNote_P1}
	StopSoundEvent \{GH_SFX_BattleMode_DoubleNote_P2}
	StopSoundEvent \{GH_SFX_BattleMode_Lefty_P1}
	StopSoundEvent \{GH_SFX_BattleMode_Lefty_P2}
	StopSoundEvent \{GH_SFX_BattleMode_Steal_P1}
	StopSoundEvent \{GH_SFX_BattleMode_Steal_P2}
	StopSoundEvent \{GH_SFX_BattleMode_StringBreak_P1}
	StopSoundEvent \{GH_SFX_BattleMode_StringBreak_P2}
	StopSoundEvent \{GH_SFX_BattleMode_WhammyAttack_P1}
	StopSoundEvent \{GH_SFX_BattleMode_WhammyAttack_P2}
	StopSoundEvent \{GH_SFX_BossBattle_PlayerDies}
	StopSoundEvent \{GH_SFX_BattleMode_Attack_Over_P1}
	StopSoundEvent \{GH_SFX_BattleMode_Attack_Over_P2}
	StopSoundEvent \{Battle_Power_Awarded_SFX_P1}
	StopSoundEvent \{Battle_Power_Awarded_SFX_P2}
	StopSoundEvent \{GH_SFX_BattleMode_WhammyAttack_Received_P1}
	StopSoundEvent \{GH_SFX_BattleMode_WhammyAttack_Received_P2}
	StopSoundEvent \{GH_SFX_BattleMode_Death_Drain_P1}
	StopSoundEvent \{GH_SFX_BattleMode_Death_Drain_P2}
	StopSoundEvent \{Battle_Attack_Small_Crowd_Cheer_P1}
	StopSoundEvent \{Battle_Attack_Small_Crowd_Cheer_P2}
	StopSoundEvent \{Battle_Attack_Medium_Crowd_Cheer_P1}
	StopSoundEvent \{Battle_Attack_Medium_Crowd_Cheer_P2}
	StopSoundEvent \{Battle_Attack_Large_Crowd_Cheer_P1}
	StopSoundEvent \{Battle_Attack_Large_Crowd_Cheer_P2}
	StopSoundEvent \{Battle_Attack_Hell_Crowd_Cheer_P1}
	StopSoundEvent \{Battle_Attack_Hell_Crowd_Cheer_P2}
	StopSoundEvent \{Battlemode_HeartBeat_P1}
	StopSoundEvent \{Battlemode_HeartBeat_P2}
	StopSoundsByBuss \{Practice_Band_Playback}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_2X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_3X}
	StopSoundEvent \{UI_SFX_Lose_Multiplier_4X}
	StopSoundEvent \{Lose_Multiplier_Crowd}
	Stopsound \{Tom_Intro_Front_Speakers}
	Stopsound \{Tom_Intro_Back_Speakers}
	Stopsound \{Slash_Intro_Front_Speakers}
	Stopsound \{Slash_Intro_Back_Speakers}
	Stopsound \{Lou_Intro_Front_Speakers}
	Stopsound \{Lou_Intro_Back_Speakers}
	if NOT (($current_transition = PREENCORE) || ($current_playing_transition = songlost))
		Printf \{Channel = SFX "changing bg to silence"}
		BG_Crowd_Front_End_Silence \{IMMEDIATE = 1}
	endif
endscript

script GH_SFX_Countoff_Logic 
	get_song_struct Song = ($current_song)
	if structureContains Structure = <song_struct> Name = countoff
		countoff_sound = (<song_struct>.countoff)
	else
		countoff_sound = 'sticks_normal'
	endif
	if (<Velocity> > 99)
		formatText Checksumname = sound_event_name 'Countoff_SFX_%s_Hard' S = <countoff_sound>
	else
		if (<Velocity> > 74)
			formatText Checksumname = sound_event_name 'Countoff_SFX_%s_Med' S = <countoff_sound>
		else
			if (<Velocity> > 49)
				formatText Checksumname = sound_event_name 'Countoff_SFX_%s_Soft' S = <countoff_sound>
			else
				formatText Checksumname = sound_event_name 'Countoff_SFX_%s_Soft' S = <countoff_sound>
			endif
		endif
	endif
	Soundevent Event = <sound_event_name>
endscript

script GH_SFX_Training_Tuning_Strings 
	switch <note_played>
		case 0
		switch <training_notes_strummed>
			case 1
			PlaySound \{E_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{E_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{E_String vol = 90 Pitch = 90}
		endswitch
		case 1
		switch <training_notes_strummed>
			case 1
			PlaySound \{A_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{A_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{A_String vol = 90 Pitch = 90}
		endswitch
		case 2
		switch <training_notes_strummed>
			case 1
			PlaySound \{D_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{D_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{D_String vol = 90 Pitch = 90}
		endswitch
		case 3
		switch <training_notes_strummed>
			case 1
			PlaySound \{G_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{G_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{G_String vol = 90 Pitch = 90}
		endswitch
		case 4
		switch <training_notes_strummed>
			case 1
			PlaySound \{B_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{B_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{B_String vol = 90 Pitch = 90}
		endswitch
	endswitch
endscript

script GH_SFX_Note_Streak_SinglePlayer 
	if (<Combo> = 50)
		Soundevent \{Event = UI_SFX_50_Note_Streak_SinglePlayer}
	else
		Soundevent \{Event = UI_SFX_100_Note_Streak_SinglePlayer}
	endif
endscript

script GH_SFX_Note_Streak_P1 
	if (<Combo> = 50)
		Soundevent \{Event = UI_SFX_50_Note_Streak_P1}
	else
		Soundevent \{Event = UI_SFX_100_Note_Streak_P1}
	endif
endscript

script GH_SFX_Note_Streak_P2 
	if (<Combo> = 50)
		Soundevent \{Event = UI_SFX_50_Note_Streak_P2}
	else
		Soundevent \{Event = UI_SFX_100_Note_Streak_P2}
	endif
endscript

script GH_SFX_Training_Hammer_On_Lesson_2 
	switch <note_played>
		case 0
		switch <training_notes_strummed>
			case 1
			PlaySound \{E_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{E_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{E_String vol = 90 Pitch = 90}
		endswitch
		case 1
		switch <training_notes_strummed>
			case 1
			PlaySound \{A_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{A_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{A_String vol = 90 Pitch = 90}
		endswitch
		case 2
		switch <training_notes_strummed>
			case 1
			PlaySound \{D_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{D_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{D_String vol = 90 Pitch = 90}
		endswitch
		case 3
		switch <training_notes_strummed>
			case 1
			PlaySound \{G_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{G_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{G_String vol = 90 Pitch = 90}
		endswitch
		case 4
		switch <training_notes_strummed>
			case 1
			PlaySound \{B_Tuning vol = 90 Pitch = 80}
			case 2
			PlaySound \{B_Tuning vol = 90 Pitch = 90}
			case 3
			PlaySound \{B_String vol = 90 Pitch = 90}
		endswitch
	endswitch
endscript

script StopNotes_01 
	if issoundeventplaying \{Tutorial_String_1_Strum_Free}
		SetSoundParams \{Tutorial_String_1_Strum_Free vol = 100}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_1_Strum_Free vol = 50}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_1_Strum_Free vol = 10}
		StopSoundEvent \{Tutorial_String_1_Strum_Free}
	endif
endscript

script StopNotes_02 
	if issoundeventplaying \{Tutorial_String_2_HOPO_Free}
		SetSoundParams \{Tutorial_String_2_HOPO_Free vol = 100}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free vol = 50}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free vol = 10}
		StopSoundEvent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_03 
	if issoundeventplaying \{Tutorial_String_3_HOPO_Free}
		SetSoundParams \{Tutorial_String_3_HOPO_Free vol = 100}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_3_HOPO_Free vol = 50}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_3_HOPO_Free vol = 10}
		StopSoundEvent \{Tutorial_String_3_HOPO_Free}
	endif
endscript

script StopNotes_04 
	if issoundeventplaying \{Tutorial_String_3_Strum_Free}
		SetSoundParams \{Tutorial_String_3_Strum_Free vol = 100}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_3_Strum_Free vol = 50}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_3_Strum_Free vol = 10}
		StopSoundEvent \{Tutorial_String_3_Strum_Free}
	endif
endscript

script StopNotes_05 
	if issoundeventplaying \{Tutorial_String_2_HOPO_Free}
		SetSoundParams \{Tutorial_String_2_HOPO_Free vol = 100}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free vol = 50}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_2_HOPO_Free vol = 10}
		StopSoundEvent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_06 
	if issoundeventplaying \{Tutorial_String_1_HOPO_Free}
		SetSoundParams \{Tutorial_String_1_HOPO_Free vol = 100}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_1_HOPO_Free vol = 50}
		Wait \{0.05 Seconds}
		SetSoundParams \{Tutorial_String_1_HOPO_Free vol = 10}
		StopSoundEvent \{Tutorial_String_1_HOPO_Free}
	endif
endscript

script Tutorial_Mode_Finish_Chord_02 
	Wait \{1 Seconds}
	Soundevent \{Event = Tutorial_Mode_Finish_Chord}
endscript

script Tutorial_Mode_Finish_Chord_03 
	Wait \{0.3 Seconds}
	Soundevent \{Event = Tutorial_Mode_Finish_Chord}
endscript
