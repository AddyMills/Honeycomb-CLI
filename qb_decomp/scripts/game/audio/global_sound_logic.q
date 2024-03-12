
script stars 
	printf \{channel = sfx "*******************************************************"}
	printf \{channel = sfx "*******************************************************"}
	printf \{channel = sfx "*******************************************************"}
	printf \{channel = sfx "*******************************************************"}
	printf \{channel = sfx "*******************************************************"}
endscript
interiorpanningradius = 10
Global_User_SFX_Number = 10
guitar_always_volume_100 = 0
Star_power_verb_is_on = 0
sfx_adjusted_guitar_volume = 100
highpass_cutoff_freq_modulated = 2000
lowpass_cutoff_freq_modulated = 1000
phaser_delay_time_modulated = 10
auto_wah_is_on = 0
wah_cutoff_freq_modulated = 900
current_audio_effect_type = HighPass
guitar_audio_effects_are_on = 0
guitar_audio_effects_are_on_p1 = 0
guitar_audio_effects_are_on_p2 = 0
Debug_Audible_Downbeat = 0
Debug_Audible_Open = 0
Debug_Audible_Close = 0
Debug_Audible_HitNote = 0
CrowdListenerStateClapOn1234 = 0
crowdlevelforsurges = 1.66
temp_language_hack = lang_english
StreamPriorityLow = 10
StreamPriorityLowMid = 30
StreamPriorityMid = 50
StreamPriorityMidHigh = 70
StreamPriorityHigh = 90
StreamPriorityHighest = 95
streamprioritysystem = 109
global_soundevent_default_priority = 50
global_soundevent_default_buss = `default`
global_soundevent_norepeatfor = 0.1
global_soundevent_instancemanagement = stop_furthest
global_soundevent_instancelimit = 1
guitarvolumefullstereolevel = 100
guitarvolumepartialstereolevel = 85
guitarvolumeramptimeup = 0.0
guitarvolumeramptimedown = 0.02
Player1Pan = {
	panlcr1 = -100
	panlcr2 = -100
}
Player2Pan = {
	panlcr1 = 100
	panlcr2 = 100
}

script SoundEvent 
	SoundEventFast <...>
endscript

script registersoundevent 
	AddSoundEventScript soundevent_eventid = <soundevent_eventid>
	OnExitRun DeRegisterSoundEvent params = {soundevent_eventid = <soundevent_eventid>}
	<event> <...>
endscript

script DeRegisterSoundEvent 
	RemoveSoundEventScript soundevent_eventid = <soundevent_eventid>
endscript

script Master_SFX_Adding_Sound_Busses 
	CreateBussSystem \{$BussTree}
	setsoundbussparams \{$Default_BussSet}
	setsoundbussparams \{$Default_BussSet time = 0.5}
	SoundBussLock \{master}
	SoundBussLock \{User_Guitar}
	SoundBussLock \{User_Band}
	SoundBussLock \{User_Sfx}
	SoundBussLock \{User_Music}
	SoundBussLock \{Crowd_Beds}
	SoundBussLock \{Crowd_Singalong}
	SoundBussLock \{Band_Balance}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{music_setlist}
	CreateSoundBussEffects \{Guitar_Balance = {effect = $Echo_Guitar_Buss_Dry effect2 = $Reverb_Guitar_Buss_Dry}}
	CreateSoundBussEffects \{Crowd_W_Reverb = {effect = $Echo_Crowd_Buss effect2 = $Reverb_Crowd_Buss}}
endscript

script GH3_Change_crowd_reverb_settings_by_Venue 
	GetPakManCurrent \{map = zones}
	printf channel = sfx "*************************************changing reverb settings to %s zone" s = <pak>
	switch <pak>
		case z_party
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_party}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_party}
		case z_dive
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_dive}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_dive}
		case z_soundcheck
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_dive}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_dive}
		case z_prison
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_prison}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_prison}
		case z_artdeco
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_artdeco}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_artdeco}
		case z_video
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_video}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_video}
		case Z_Wikker
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_wikker}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_wikker}
		case z_budokan
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_budokan}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_budokan}
		case z_hell
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss_z_hell}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss_z_hell}
		default
		setsoundbusseffects \{effect = $Reverb_Crowd_Buss}
		setsoundbusseffects \{effect = $Echo_Crowd_Buss}
	endswitch
endscript

script PrintPushPopDebugInfo 
	if NOT GotParam \{push}
		if NOT GotParam \{POP}
			printf \{"Did not specify push or pop!"}
			return
		endif
	endif
	if GotParam \{push}
		pushPop = "push"
	else
		pushPop = "pop"
	endif
	if NOT GotParam \{name}
		printf \{"Did not specify script name!"}
		return
	endif
	printf "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= %a %b" a = <name> b = <pushPop>
endscript

script Generic_Reverb_Functionality_Script \{NewEchoSettings = $Echo_Generic_Outside_Slap
		EchoFadeTime = 0.5
		NewReverbSettings = $Reverb_Generic_Outside_Verb
		ReverbFadeTime = 0.5}
	if inside
		if GotParam \{NewEchoSettings}
			if GotParam \{EchoFadeTime}
				setsoundbusseffects effect = <NewEchoSettings> time = <EchoFadeTime>
			else
				setsoundbusseffects effect = <NewEchoSettings>
			endif
		endif
		if GotParam \{NewReverbSettings}
			if GotParam \{ReverbFadeTime}
				setsoundbusseffects effect = <NewReverbSettings> time = <ReverbFadeTime>
			else
				setsoundbusseffects effect = <NewReverbSettings>
			endif
		endif
	else
		if GotParam \{destroyed}
		else
			if GotParam \{created}
			else
				if GotParam \{ExitEchoSettings}
					if GotParam \{ExitEchoFadeTime}
						setsoundbusseffects effect = <ExitEchoSettings> time = <ExitEchoFadeTime>
					else
						setsoundbusseffects effect = <ExitEchoSettings>
					endif
				endif
				if GotParam \{ExitReverbSettings}
					if GotParam \{ExitReverbFadeTime}
						setsoundbusseffects effect = <ExitReverbSettings> time = <ExitReverbFadeTime>
					else
						setsoundbusseffects effect = <ExitReverbSettings>
					endif
				endif
			endif
		endif
	endif
endscript

script GH_Guitar_Battle_DSP_Effects_Player1 
	switch <attack_effect>
		case double_note_flange
		printf \{channel = sfx "setting to doublenote flange"}
		setsoundbusseffects \{effect = $Flange_DoubleNotes1}
		printf \{channel = sfx "changing p1 balance buss"}
		setsoundbussparams \{Guitar_Balance_First_Player = {vol = 2}}
		case overload_highpass
		printf \{channel = sfx "setting to overload highpass"}
		setsoundbusseffects \{effect = $HighPass_Thin1}
		printf \{channel = sfx "changing p1 balance buss"}
		setsoundbussparams \{Guitar_Balance_First_Player = {vol = 3}}
		case brokenstring_chorus
		printf \{channel = sfx "setting to broken string chorus"}
		setsoundbusseffects \{effect = $Chorus_Generic1}
		printf \{channel = sfx "changing p1 balance buss"}
		setsoundbussparams \{Guitar_Balance_First_Player = {vol = 0}}
		case lefty_eq
		printf \{channel = sfx "setting to lefty eq"}
		setsoundbusseffects \{effect = $LowPass_Muffled1}
		printf \{channel = sfx "changing p1 balance buss"}
		setsoundbussparams \{Guitar_Balance_First_Player = {vol = 6}}
		case diffup_eq
		printf \{channel = sfx "setting to diffup eq"}
		setsoundbusseffects \{effect = $EQ_Wah1}
		printf \{channel = sfx "changing p1 balance buss"}
		setsoundbussparams \{Guitar_Balance_First_Player = {vol = -6}}
		default
		printf \{channel = sfx "default"}
	endswitch
endscript

script GH_Guitar_Battle_DSP_Effects_Player2 
	switch <attack_effect>
		case double_note_flange
		printf \{channel = sfx "setting to doublenote flange"}
		setsoundbusseffects \{effect = $Flange_DoubleNotes2}
		printf \{channel = sfx "changing p2 balance buss"}
		setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 2}}
		case overload_highpass
		printf \{channel = sfx "setting to overload highpass"}
		setsoundbusseffects \{effect = $HighPass_Thin2}
		printf \{channel = sfx "changing p2 balance buss"}
		setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 3}}
		case brokenstring_chorus
		printf \{channel = sfx "setting to broken string chorus"}
		setsoundbusseffects \{effect = $Chorus_Generic2}
		printf \{channel = sfx "changing p2 balance buss"}
		setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 0}}
		case lefty_eq
		printf \{channel = sfx "setting to lefty eq"}
		setsoundbusseffects \{effect = $LowPass_Muffled2}
		printf \{channel = sfx "changing p2 balance buss"}
		setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 6}}
		case diffup_eq
		printf \{channel = sfx "setting to diffup eq"}
		setsoundbusseffects \{effect = $EQ_Wah2}
		printf \{channel = sfx "changing p2 balance buss"}
		setsoundbussparams \{Guitar_Balance_Second_Player = {vol = -6}}
		default
		printf \{channel = sfx "default"}
	endswitch
endscript

script GH3_Change_Guitar_Audio_Effects_Guitar_Single_Player \{effect_type = `default`}
endscript

script GH3_Guitar_Effects_Wait 
endscript

script GH3_Battle_Attack_Finished_SFX 
	if (<player> = 1)
		SoundEvent \{event = GH_SFX_BattleMode_Attack_Over_P1}
	else
		SoundEvent \{event = GH_SFX_BattleMode_Attack_Over_P2}
	endif
endscript

script Reset_Battle_DSP_Effects 
	if (<player> = 1)
		Reset_Battle_DSP_Effects_Player1
	else
		Reset_Battle_DSP_Effects_Player2
	endif
endscript

script Reset_Battle_DSP_Effects_Player1 
	setsoundbusseffects \{effect = $LowPass_Default1 time = 0.15}
	setsoundbusseffects \{effect = $HighPass_Default1 time = 0.15}
	setsoundbusseffects \{effect = $Flange_Default1 time = 0.15}
	setsoundbusseffects \{effect = $Chorus_Default1 time = 0.15}
	setsoundbusseffects \{effect = $EQ_Default1 time = 0.15}
	printf \{channel = sfx "RESTTING p1 balance buss"}
	setsoundbussparams \{Guitar_Balance_First_Player = {vol = 0}}
endscript

script Reset_Battle_DSP_Effects_Player2 
	setsoundbusseffects \{effect = $LowPass_Default2 time = 0.15}
	setsoundbusseffects \{effect = $HighPass_Default2 time = 0.15}
	setsoundbusseffects \{effect = $Flange_Default2 time = 0.15}
	setsoundbusseffects \{effect = $Chorus_Default2 time = 0.15}
	setsoundbusseffects \{effect = $EQ_Default2 time = 0.15}
	printf \{channel = sfx "RESTTING p2 balance buss"}
	setsoundbussparams \{Guitar_Balance_Second_Player = {vol = 0}}
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
	change \{Star_power_verb_is_on = 1}
	SoundEvent \{event = Star_Power_Deployed_SFX}
	if ($game_mode != tutorial)
		SoundEvent \{event = Star_Power_Deployed_Cheer_SFX}
	endif
	PushSoundBussParams
	setsoundbussparams \{$Star_Power_BussSet time = 0.5}
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
	setsoundbusseffects effect = {effect = echo name = GuitarEcho1 delay = <beat_duration>}
	setsoundbusseffects \{effect = {effect = echo
			name = GuitarEcho1
			Drymix = 1.0
			Wetmix = 0.5} time = 0.1}
	setsoundbusseffects \{effect = {effect = sfxreverb
			name = GuitarReverb1
			ReflectionsLevel = -1200.0
			reverblevel = -550.0} time = 0.1}
endscript

script GH_Star_Power_Verb_Off 
	if ($Star_power_verb_is_on = 1)
		PopSoundBussParams
	endif
	setsoundbusseffects \{effect = {effect = echo name = GuitarEcho1 Wetmix = 0.0} time = 0.1}
	setsoundbusseffects \{effect = {effect = sfxreverb
			name = GuitarReverb1
			ReflectionsLevel = -10000.0
			reverblevel = -10000.0} time = 0.5}
	change \{Star_power_verb_is_on = 0}
endscript

script GH3_Set_Guitar_Verb_And_Echo_to_Dry 
	setsoundbusseffects \{effect = $Echo_Guitar_Buss_Dry}
	setsoundbusseffects \{effect = $Reverb_Guitar_Buss_Dry}
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

script gh_battlemode_modulate_wah_value 
endscript

script GH_BattleMode_Player1_SFX_DiffUp_Start 
	SoundEvent \{event = GH_SFX_BattleMode_DiffUp_P1}
endscript

script GH_BattleMode_Player2_SFX_DiffUp_Start 
	SoundEvent \{event = GH_SFX_BattleMode_DiffUp_P2}
endscript

script GH_BattleMode_Player1_SFX_DoubleNotes_Start 
	SoundEvent \{event = GH_SFX_BattleMode_DoubleNote_P1}
endscript

script GH_BattleMode_Player2_SFX_DoubleNotes_Start 
	SoundEvent \{event = GH_SFX_BattleMode_DoubleNote_P2}
endscript

script GH_BattleMode_Player1_SFX_Shake_Start 
	SoundEvent \{event = GH_SFX_BattleMode_Lightning_Player1}
endscript

script GH_BattleMode_Player2_SFX_Shake_Start 
	SoundEvent \{event = GH_SFX_BattleMode_Lightning_Player2}
endscript

script GH_BattleMode_Player1_SFX_LeftyNotes_Start 
	SoundEvent \{event = GH_SFX_BattleMode_Lefty_P1}
endscript

script GH_BattleMode_Player2_SFX_LeftyNotes_Start 
	SoundEvent \{event = GH_SFX_BattleMode_Lefty_P2}
endscript

script GH_BattleMode_Player1_SFX_BrokenString_Start 
	SoundEvent \{event = GH_SFX_BattleMode_StringBreak_P1}
endscript

script GH_BattleMode_Player2_SFX_BrokenString_Start 
	SoundEvent \{event = GH_SFX_BattleMode_StringBreak_P2}
endscript

script GH_BattleMode_Player1_SFX_Steal 
	SoundEvent \{event = GH_SFX_BattleMode_Steal_P1}
endscript

script GH_BattleMode_Player2_SFX_Steal 
	SoundEvent \{event = GH_SFX_BattleMode_Steal_P2}
endscript

script GH_BattleMode_Player1_SFX_Whammy_Start 
	SoundEvent \{event = GH_SFX_BattleMode_WhammyAttack_P1}
endscript

script GH_BattleMode_Player2_SFX_Whammy_Start 
	SoundEvent \{event = GH_SFX_BattleMode_WhammyAttack_P2}
endscript

script GH_BattleMode_Player1_SFX_Death_Drain 
	SoundEvent \{event = GH_SFX_BattleMode_Death_Drain_P1}
endscript

script GH_BattleMode_Player2_SFX_Death_Drain 
	SoundEvent \{event = GH_SFX_BattleMode_Death_Drain_P2}
endscript

script GH_BattleMode_Start_Heartbeat_P1 
	SoundEvent \{event = Battlemode_HeartBeat_P1}
endscript

script GH_BattleMode_Stop_Heartbeat_P1 
	stopsoundevent \{Battlemode_HeartBeat_P1}
endscript

script GH_BattleMode_Start_Heartbeat_P2 
	SoundEvent \{event = Battlemode_HeartBeat_P2}
endscript

script GH_BattleMode_Stop_Heartbeat_P2 
	stopsoundevent \{Battlemode_HeartBeat_P2}
endscript

script GH_BattleMode_SFX_Sudden_Death 
	SoundEvent \{event = GH_SFX_BattleMode_Sudden_Death}
endscript

script GH3_Battle_Play_Crowd_Reaction_SFX 
	if (<receiving_player> = 1)
		Battle_Attack_Cheer_Based_On_Venue_P2
	else
		Battle_Attack_Cheer_Based_On_Venue_P1
	endif
endscript

script Battle_Attack_Cheer_Based_On_Venue_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Battle_Attack_Small_Crowd_Cheer_P1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Battle_Attack_Medium_Crowd_Cheer_P1}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Battle_Attack_Large_Crowd_Cheer_P1}
		case z_hell
		SoundEvent \{event = Battle_Attack_Hell_Crowd_Cheer_P1}
		default
		SoundEvent \{event = Battle_Attack_Medium_Crowd_Cheer_P1}
	endswitch
endscript

script Battle_Attack_Cheer_Based_On_Venue_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Battle_Attack_Small_Crowd_Cheer_P2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Battle_Attack_Medium_Crowd_Cheer_P2}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Battle_Attack_Large_Crowd_Cheer_P2}
		case z_hell
		SoundEvent \{event = Battle_Attack_Hell_Crowd_Cheer_P2}
		default
		SoundEvent \{event = Battle_Attack_Medium_Crowd_Cheer_P2}
	endswitch
endscript

script GH3_Battle_Play_Whammy_Pitch_Up_Sound 
	num_strums = ($<other_player_status>.whammy_attack)
	player_pan = ($<other_player_status>.player)
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
	switch <difficulty>
		case easy
		<total_strums> = ($battlemode_powerups [6].easy_repair)
		case medium
		<total_strums> = ($battlemode_powerups [6].medium_repair)
		case hard
		<total_strums> = ($battlemode_powerups [6].hard_repair)
		case expert
		<total_strums> = ($battlemode_powerups [6].expert_repair)
		default
		printf \{"moron"}
	endswitch
	<change_pitch> = (1.3 * <num_strums> / <total_strums>)
	<local_pitch> = (100.0 - (10.0 * <change_pitch>))
	playsound GH3_BattleMode_WhammyAttack_Received vol = 50 pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
endscript

script GH3_Crowd_Manipulate_SFX 
endscript

script GH3_Crowd_Event_Listener \{event_type = surge_fast}
	if NOT ($game_mode = training)
		if GotParam \{event_type}
			if ($current_crowd > $crowdlevelforsurges)
				switch <event_type>
					case sing
					printf \{" "}
					spawnscriptnow \{GH3_AdjustCrowdSingingVolumeUp}
					case surge_fast
					GH3_AdjustCrowdFastSurge <...>
					case surge_slow
					GH3_AdjustCrowdSlowSurge <...>
					case applause
					GH3_Play_A_Crowd_Applause_Based_On_Venue
					default
					printf \{"idiot"}
				endswitch
			else
				if GotParam \{override_state}
					switch <event_type>
						case sing
						printf \{" "}
						spawnscriptnow \{GH3_AdjustCrowdSingingVolumeUp}
						case surge_fast
						GH3_Play_A_Fast_Crowd_Swell_Based_On_Venue
						case surge_slow
						GH3_Play_A_Crowd_Applause_Based_On_Venue
						GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
						case applause
						GH3_Play_A_Crowd_Applause_Based_On_Venue
						default
						printf \{"idiot"}
					endswitch
				endif
			endif
		endif
	endif
endscript

script GH3_Play_A_Fast_Crowd_Swell_Based_On_Venue 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		SoundEvent \{event = Small_Crowd_Swell}
		case z_prison
		case z_artdeco
		case z_video
		SoundEvent \{event = Medium_Crowd_Swell}
		case Z_Wikker
		case z_budokan
		SoundEvent \{event = Crowd_Fast_Surge_Cheer}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Swell}
		default
		SoundEvent \{event = Medium_Crowd_Swell}
	endswitch
endscript

script GH3_Play_A_Crowd_Applause_Based_On_Venue 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		SoundEvent \{event = Small_Crowd_Applause_SE}
		case z_prison
		case z_artdeco
		case z_video
		SoundEvent \{event = Medium_Crowd_Applause}
		case Z_Wikker
		case z_budokan
		SoundEvent \{event = Large_Crowd_Applause_SFX}
		case z_hell
		SoundEvent \{event = Medium_Crowd_Applause}
		default
		SoundEvent \{event = Medium_Crowd_Applause}
	endswitch
endscript

script GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		case z_prison
		case z_artdeco
		case z_video
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		case Z_Wikker
		case z_budokan
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		case z_hell
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		default
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
	endswitch
endscript

script GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		case z_dive
		case z_soundcheck
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
		case z_prison
		case z_artdeco
		case z_video
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
		case Z_Wikker
		case z_budokan
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
		case z_hell
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
		default
		SoundEvent \{event = Crowd_OneShots_Boo_Close}
	endswitch
endscript

script GH3_SFX_Encore_Accept 
	Do_Actual_Transition_SFX_Medium_To_Good
	GH3_Play_A_Crowd_OneShot_Positive_Based_On_Venue
endscript

script GH3_SFX_Encore_Decline 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Encore_Decline_Small_Crowd_Med_To_Bad_SFX}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Encore_Decline_Medium_Crowd_Med_To_Bad_SFX}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Encore_Decline_Crowd_Med_To_Bad_SFX}
		case z_hell
		SoundEvent \{event = Encore_Decline_Hell_Crowd_Med_To_Bad_SFX}
		default
		SoundEvent \{event = Encore_Decline_Medium_Crowd_Med_To_Bad_SFX}
	endswitch
	GH3_Play_A_Crowd_OneShot_Negative_Based_On_Venue
endscript

script GH3_AdjustCrowdSingingVolumeUp 
endscript

script GH3_AdjustCrowdSingingVolumeDown 
endscript

script GH3_AdjustCrowdFastSurge 
	soundbussunlock \{Crowd_Beds}
	setsoundbussparams \{$CrowdSurgeBig_BussSet time = 1.2}
	SoundBussLock \{Crowd_Beds}
	wait \{1.5 seconds}
	soundbussunlock \{Crowd_Beds}
	setsoundbussparams \{$CrowdNormal_BussSet time = 4}
	SoundBussLock \{Crowd_Beds}
endscript

script GH3_AdjustCrowdSlowSurge 
	soundbussunlock \{Crowd_Beds}
	setsoundbussparams \{$CrowdSurgeSmall_BussSet time = 4}
	SoundBussLock \{Crowd_Beds}
	wait \{8 seconds}
	soundbussunlock \{Crowd_Beds}
	setsoundbussparams \{$CrowdNormal_BussSet time = 4}
	SoundBussLock \{Crowd_Beds}
endscript

script crowd_singalong_volume_up 
	soundbussunlock \{Crowd_Singalong}
	setsoundbussparams \{$CrowdSingingVolUp_BussSet time = 4}
	SoundBussLock \{Crowd_Singalong}
endscript

script crowd_singalong_volume_down 
	soundbussunlock \{Crowd_Singalong}
	setsoundbussparams \{$CrowdSingingVolDown_BussSet time = 1}
	SoundBussLock \{Crowd_Singalong}
endscript

script menu_music_on 
	SetSpawnInstanceLimits \{max = 1 management = ignore_spawn_request}
	if GotParam \{waitforguitarlick}
		wait \{3 seconds}
	endif
	EnableUserMusic
	begin
	SoundEvent \{event = Menu_Music_SE}
	wait \{3 seconds}
	Menu_music_Checking
	wait \{1 second}
	repeat
endscript

script Menu_music_Checking 
	begin
	if NOT isSoundEventplaying \{Menu_Music_SE}
		break
	endif
	wait \{1 second}
	repeat
endscript

script Menu_Music_Off 
	EnableUserMusic \{disable}
	KillSpawnedScript \{name = menu_music_on}
	stopsoundevent \{Menu_Music_SE}
endscript

script PlayEncoreStreamSFX 
endscript

script Song_Intro_Kick_SFX_Waiting 
	printingtext = ($current_intro.hud_move_time)
	wait ($current_intro.hud_move_time / 1000.0) seconds
	SoundEvent \{event = Song_Intro_Kick_SFX}
endscript

script Song_Intro_Highway_Up_SFX_Waiting 
	printingtext = ($current_intro.highway_move_time)
	waittime = (($current_intro.highway_move_time / 1000.0) - 1.5)
	if (<waittime> < 0)
		waittime = 0
	endif
	wait <waittime> seconds
	SoundEvent \{event = Song_Intro_Highway_Up}
endscript

script change_crowd_looping_sfx \{crowd_looping_state = good player = 1}
	printf channel = sfx "changing crowd looping to %s" s = <crowd_looping_state>
	if ($boss_battle = 1)
		printf \{channel = sfx "we're in boss battle - see who requested this crowd loop change - p1 or p2"}
		if (<player> = 1)
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		else
			printf \{channel = sfx "do nothing, since it's the boss's health that was requesting a change"}
		endif
	else
		printf \{channel = sfx "we're not in boss battle"}
		if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			do_actual_changing_of_looping_sound \{crowd_looping_state = good}
		else
			do_actual_changing_of_looping_sound crowd_looping_state = <crowd_looping_state>
		endif
	endif
endscript

script do_actual_changing_of_looping_sound 
	if GotParam \{crowd_looping_state}
		switch <crowd_looping_state>
			case bad
			Change_Crowd_Looping_SFX_Bad
			case neutral
			Change_Crowd_Looping_SFX_Neutral
			case good
			Change_Crowd_Looping_SFX_Good
			default
			Change_Crowd_Looping_SFX_Good
		endswitch
	endif
endscript

script Change_Crowd_Looping_SFX_Bad 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		BG_Crowd_Small_Bad
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		BG_Crowd_Medium_Bad
		case z_budokan
		case Z_Wikker
		BG_Crowd_Large_Bad
		case z_hell
		BG_Crowd_Hell_Bad
		default
		BG_Crowd_Medium_Bad
	endswitch
endscript

script Change_Crowd_Looping_SFX_Neutral 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		BG_Crowd_Small_Neutral
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		BG_Crowd_Medium_Neutral
		case z_budokan
		case Z_Wikker
		BG_Crowd_Large_Neutral
		case z_hell
		BG_Crowd_Hell_Neutral
		default
		BG_Crowd_Medium_Neutral
	endswitch
endscript

script Change_Crowd_Looping_SFX_Good 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		BG_Crowd_Small_Good
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		BG_Crowd_Medium_Good
		case z_budokan
		case Z_Wikker
		case z_credits
		BG_Crowd_Large_Good
		case z_hell
		BG_Crowd_Hell_Good
		default
		BG_Crowd_Medium_Good
	endswitch
endscript

script Crowd_Transition_SFX_Poor_To_Medium 
	printf \{channel = sfx "poor to med"}
	if GotParam \{player}
		Crowd_generic_transition_sfx state = poor_to_med player = <player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Good 
	printf \{channel = sfx "med to good"}
	if GotParam \{player}
		Crowd_generic_transition_sfx state = med_to_good player = <player>
	endif
endscript

script Crowd_Transition_SFX_Medium_To_Poor 
	printf \{channel = sfx "med to poor"}
	if GotParam \{player}
		Crowd_generic_transition_sfx state = med_to_poor player = <player>
	endif
endscript

script Crowd_Transition_SFX_Good_To_Medium 
	printf \{channel = sfx "good to med"}
	if GotParam \{player}
		Crowd_generic_transition_sfx state = good_to_med player = <player>
	endif
endscript

script Crowd_generic_transition_sfx \{state = med_to_good}
	if ($game_mode = p2_battle)
	else
		if ($boss_battle = 1)
			if (<player> = 1)
				transition_sfx_left_side state = <state>
			else
			endif
		else
			if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			else
				transition_sfx_both_sides state = <state>
			endif
		endif
	endif
endscript

script transition_sfx_left_side 
	if GotParam \{state}
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium_P1
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor_P1
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good_P1
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium_P1
		endif
	endif
endscript

script transition_sfx_right_side 
	if GotParam \{state}
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium_P2
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor_P2
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good_P2
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium_P2
		endif
	endif
endscript

script transition_sfx_both_sides 
	if GotParam \{state}
		if (<state> = poor_to_med)
			Do_Actual_Transition_SFX_Poor_To_Medium
		endif
		if (<state> = med_to_poor)
			Do_Actual_Transition_SFX_Medium_To_Poor
		endif
		if (<state> = med_to_good)
			Do_Actual_Transition_SFX_Medium_To_Good
		endif
		if (<state> = good_to_med)
			Do_Actual_Transition_SFX_Good_To_Medium
		endif
	endif
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Bad_To_Med_SFX}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Bad_To_Med_SFX}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Bad_To_Med_SFX}
		default
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Bad_To_Med_SFX_P1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX_P1}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Bad_To_Med_SFX_P1}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Bad_To_Med_SFX_P1}
		default
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Poor_To_Medium_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Bad_To_Med_SFX_P2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX_P2}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Bad_To_Med_SFX_P2}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Bad_To_Med_SFX_P2}
		default
		SoundEvent \{event = Medium_Crowd_Bad_To_Med_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Good_SFX}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Med_To_Good_SFX}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Good_SFX}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Good_SFX_P1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX_P1}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Med_To_Good_SFX_P1}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Good_SFX_P1}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Good_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Good_SFX_P2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX_P2}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Med_To_Good_SFX_P2}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Good_SFX_P2}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Good_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Bad_SFX}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Med_To_Bad_SFX}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Bad_SFX}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Bad_SFX_P1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX_P1}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Med_To_Bad_SFX_P1}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Bad_SFX_P1}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Medium_To_Poor_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Med_To_Bad_SFX_P2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX_P2}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Med_To_Bad_SFX_P2}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Med_To_Bad_SFX_P2}
		default
		SoundEvent \{event = Medium_Crowd_Med_To_Bad_SFX_P2}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Good_To_Med_SFX}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Good_To_Med_SFX}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Good_To_Med_SFX}
		default
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium_P1 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Good_To_Med_SFX_P1}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX_P1}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Good_To_Med_SFX_P1}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Good_To_Med_SFX_P1}
		default
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX_P1}
	endswitch
endscript

script Do_Actual_Transition_SFX_Good_To_Medium_P2 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		case z_party
		SoundEvent \{event = Small_Crowd_Good_To_Med_SFX_P2}
		case z_artdeco
		case z_video
		case z_prison
		case z_soundcheck
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX_P2}
		case z_budokan
		case Z_Wikker
		SoundEvent \{event = Crowd_Good_To_Med_SFX_P2}
		case z_hell
		SoundEvent \{event = Hell_Crowd_Good_To_Med_SFX_P2}
		default
		SoundEvent \{event = Medium_Crowd_Good_To_Med_SFX_P2}
	endswitch
endscript

script You_Rock_Waiting_Crowd_SFX 
	wait \{2 seconds}
	SoundEvent \{event = Crowd_Fast_Surge_Cheer}
	SoundEvent \{event = Medium_Crowd_Applause}
endscript
save_check_time_early = 0.0
save_check_time_late = 0.0

script Audio_Sync_Test_Disable_Highway 
	disable_bg_viewport
	change \{save_check_time_early = $check_time_early}
	change \{save_check_time_late = $check_time_late}
	change \{check_time_early = 1.0}
	change \{check_time_late = 1.0}
endscript

script Audio_Sync_Test_Enable_Highway 
	enable_bg_viewport
	change \{check_time_early = $save_check_time_early}
	change \{check_time_late = $save_check_time_late}
endscript

script GH_SFX_Intro_WarmUp 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		playsound \{z_party_intro vol = 100 buss = Crowd_PreSong_Intro}
		case z_dive
		playsound \{z_dive_intro vol = 100 buss = Crowd_PreSong_Intro}
		case z_artdeco
		playsound \{z_artdeco_intro vol = 100 buss = Crowd_PreSong_Intro}
		case z_video
		playsound \{z_video_intro vol = 100 buss = Crowd_PreSong_Intro}
		case z_prison
		playsound \{z_prison_intro vol = 100 buss = Crowd_PreSong_Intro}
		case z_budokan
		playsound \{z_budokan_intro vol = 100 buss = Crowd_PreSong_Intro}
		case Z_Wikker
		playsound \{z_wikker_intro vol = 100 buss = Crowd_PreSong_Intro}
		case z_hell
		playsound \{z_hell_intro vol = 45 buss = Crowd_PreSong_Intro}
		case z_soundcheck
		playsound \{z_party_intro vol = 100 buss = Crowd_PreSong_Intro}
		default
		playsound \{z_party_intro vol = 100 buss = Crowd_PreSong_Intro}
	endswitch
endscript

script PreEncore_Crowd_Build_SFX 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		printf \{channel = sfx "playing party build"}
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Backyard}
		case z_dive
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Dive}
		case z_artdeco
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Deco}
		case z_video
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Video}
		case z_prison
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Prison}
		case z_budokan
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Budokan}
		case Z_Wikker
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Wikker}
		case z_hell
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Hell}
		case z_soundcheck
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Backyard}
		default
		SoundEvent \{event = PreEncore_Crowd_Build_SFX_Backyard}
	endswitch
endscript

script PreEncore_Crowd_Build_SFX_STOP 
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Backyard}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Dive}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Deco}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Video}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Prison}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Budokan}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Wikker}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Hell}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Backyard}
	stopsoundevent \{PreEncore_Crowd_Build_SFX_Backyard}
endscript

script GH_BossDevil_Death_Transition_SFX 
	SoundEvent \{event = Devil_Die_Transition_SFX}
endscript

script Battle_SFX_Repair_Broken_String 
	if GotParam \{num_strums}
		if GotParam \{player_pan}
			if GotParam \{difficulty}
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
				switch <difficulty>
					case easy
					<total_strums> = ($battlemode_powerups [5].easy_repair)
					case medium
					<total_strums> = ($battlemode_powerups [5].medium_repair)
					case hard
					<total_strums> = ($battlemode_powerups [5].hard_repair)
					case expert
					<total_strums> = ($battlemode_powerups [5].expert_repair)
					default
					printf \{"moron"}
				endswitch
				<change_pitch> = (1.0 * <num_strums> / <total_strums>)
				<local_pitch> = (100.0 - (10.0 * <change_pitch>))
				playsound GH3_Battlemode_StringTune_2 vol = 50 pitch = <local_pitch> pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endif
		endif
	endif
endscript

script GH_SFX_Play_Encore_Audio_From_Zone_Memory 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_party
		playsound \{z_party_encore_L
			vol = 130
			buss = binkcutscenes
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_party_encore_R
			vol = 130
			buss = binkcutscenes
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_party_encore_LS
			vol = 130
			buss = binkcutscenes
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_party_encore_RS
			vol = 130
			buss = binkcutscenes
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_dive
		playsound \{z_dive_encore_L
			vol = 130
			buss = binkcutscenes
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_dive_encore_R
			vol = 130
			buss = binkcutscenes
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_dive_encore_LS
			vol = 130
			buss = binkcutscenes
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_dive_encore_RS
			vol = 130
			buss = binkcutscenes
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_video
		playsound \{z_video_encore_L
			vol = 150
			buss = binkcutscenes
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_video_encore_R
			vol = 150
			buss = binkcutscenes
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_video_encore_LS
			vol = 150
			buss = binkcutscenes
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_video_encore_RS
			vol = 150
			buss = binkcutscenes
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_artdeco
		playsound \{z_artdeco_encore_L
			vol = 150
			buss = binkcutscenes
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_artdeco_encore_R
			vol = 150
			buss = binkcutscenes
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_artdeco_encore_LS
			vol = 150
			buss = binkcutscenes
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_artdeco_encore_RS
			vol = 150
			buss = binkcutscenes
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_prison
		playsound \{z_prison_encore_L
			vol = 150
			buss = binkcutscenes
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_prison_encore_R
			vol = 150
			buss = binkcutscenes
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_prison_encore_LS
			vol = 150
			buss = binkcutscenes
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_prison_encore_RS
			vol = 150
			buss = binkcutscenes
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case Z_Wikker
		playsound \{z_wikker_encore_L
			vol = 140
			buss = binkcutscenes
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_wikker_encore_R
			vol = 140
			buss = binkcutscenes
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_wikker_encore_LS
			vol = 140
			buss = binkcutscenes
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_wikker_encore_RS
			vol = 140
			buss = binkcutscenes
			pan1x = 0.86602545
			pan1y = -0.5000001}
		case z_budokan
		playsound \{z_budokan_encore_L
			vol = 130
			buss = binkcutscenes
			pan1x = -0.5000002
			pan1y = 0.8660253}
		playsound \{z_budokan_encore_R
			vol = 130
			buss = binkcutscenes
			pan1x = 0.5
			pan1y = 0.86602545}
		playsound \{z_budokan_encore_LS
			vol = 130
			buss = binkcutscenes
			pan1x = -0.86602545
			pan1y = -0.4999999}
		playsound \{z_budokan_encore_RS
			vol = 130
			buss = binkcutscenes
			pan1x = 0.86602545
			pan1y = -0.5000001}
		default
		printf \{"do nothing - default case"}
	endswitch
endscript
Tom_Intro_Front_Speakers_unique_id = null
Tom_Intro_Back_Speakers_unique_id = null
Slash_Intro_Front_Speakers_unique_id = null
Slash_Intro_Back_Speakers_unique_id = null
Lou_Intro_Front_Speakers_unique_id = null
Lou_Intro_Back_Speakers_unique_id = null

script GH_SFX_Preload_Boss_Intro_Audio 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_dive
		if ($current_song = bosstom)
			printf \{channel = sfx "Preload z_dive intro boss sounds"}
			change \{Tom_Intro_Front_Speakers_unique_id = null}
			change \{Tom_Intro_Back_Speakers_unique_id = null}
			if PreLoadStream \{Tom_Intro_Front_Speakers buss = master}
				change Tom_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = Tom_Intro_Front_Speakers_unique_id}
			else
				printf \{channel = sfx "Failed preload Tom_Intro_Front_Speakers"}
			endif
			if PreLoadStream \{Tom_Intro_Back_Speakers buss = master}
				change Tom_Intro_Back_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = Tom_Intro_Back_Speakers_unique_id}
			else
				printf \{channel = sfx "Failed preload Tom_Intro_Back_Speakers"}
			endif
			StartPreLoadedStream \{startpaused = 1
				$Tom_Intro_Front_Speakers_unique_id
				vol = 80
				pan1x = -0.5
				pan1y = 0.86
				pan2x = 0.5
				pan2y = 0.86
				buss = Encore_Events}
			StartPreLoadedStream \{startpaused = 1
				$Tom_Intro_Back_Speakers_unique_id
				vol = 80
				pan1x = -0.86
				pan1y = -0.49
				pan2x = 0.86
				pan2y = -0.5
				buss = Encore_Events}
		endif
		case z_prison
		if ($current_song = bossslash)
			printf \{channel = sfx "Preload z_prison intro boss sounds"}
			change \{Slash_Intro_Front_Speakers_unique_id = null}
			change \{Slash_Intro_Back_Speakers_unique_id = null}
			if PreLoadStream \{Slash_Intro_Front_Speakers buss = master}
				change Slash_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = Slash_Intro_Front_Speakers_unique_id}
			else
				printf \{channel = sfx "Failed preload Slash_Intro_Back_Speakers"}
			endif
			if PreLoadStream \{Slash_Intro_Back_Speakers buss = master}
				change Slash_Intro_Back_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = Slash_Intro_Back_Speakers_unique_id}
			else
				printf \{channel = sfx "Failed preload Slash_Intro_Back_Speakers"}
			endif
			StartPreLoadedStream \{startpaused = 1
				$Slash_Intro_Front_Speakers_unique_id
				vol = 80
				pan1x = -0.5
				pan1y = 0.86
				pan2x = 0.5
				pan2y = 0.86
				buss = Encore_Events}
			StartPreLoadedStream \{startpaused = 1
				$Slash_Intro_Back_Speakers_unique_id
				vol = 80
				pan1x = -0.86
				pan1y = -0.49
				pan2x = 0.86
				pan2y = -0.5
				buss = Encore_Events}
		endif
		case z_hell
		if ($current_song = bossdevil)
			printf \{channel = sfx "Preload z_hell intro boss sounds"}
			change \{Lou_Intro_Front_Speakers_unique_id = null}
			change \{Lou_Intro_Back_Speakers_unique_id = null}
			if PreLoadStream \{Lou_Intro_Front_Speakers buss = master}
				change Lou_Intro_Front_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = Lou_Intro_Front_Speakers_unique_id}
			else
				printf \{channel = sfx "Failed preload Lou_Intro_Front_Speakers"}
			endif
			if PreLoadStream \{Lou_Intro_Back_Speakers buss = master}
				change Lou_Intro_Back_Speakers_unique_id = <unique_id>
				waitforpreload_stream \{stream = Lou_Intro_Back_Speakers_unique_id}
			else
				printf \{channel = sfx "Failed preload Lou_Intro_Back_Speakers"}
			endif
			StartPreLoadedStream \{startpaused = 1
				$Lou_Intro_Front_Speakers_unique_id
				vol = 120
				pan1x = -0.5
				pan1y = 0.86
				pan2x = 0.5
				pan2y = 0.86
				buss = Encore_Events}
			StartPreLoadedStream \{startpaused = 1
				$Lou_Intro_Back_Speakers_unique_id
				vol = 120
				pan1x = -0.86
				pan1y = -0.49
				pan2x = 0.86
				pan2y = -0.5
				buss = Encore_Events}
		endif
		default
		printf \{"do nothing - default case"}
	endswitch
endscript

script GH_SFX_Play_Boss_Audio_From_Zone_Memory 
	GetPakManCurrent \{map = zones}
	switch <pak>
		default
		printf \{"do nothing - default case"}
	endswitch
endscript

script GH3_SFX_fail_song_stop_sounds 
	Stopsoundsbybuss \{crowd}
	Stopsoundsbybuss \{UI_Star_Power}
	Stopsoundsbybuss \{UI_Battle_Mode}
	Stopsoundsbybuss \{Wrong_Notes_Player1}
	Stopsoundsbybuss \{Wrong_Notes_Player2}
	Stopsoundsbybuss \{Practice_Band_Playback}
	Stopsoundsbybuss \{binkcutscenes}
	BG_Crowd_Front_End_Silence \{immediate = 1}
endscript

script GH3_SFX_Stop_Sounds_For_KillSong 
	stopsoundevent \{Song_Intro_Kick_SFX}
	stopsoundevent \{Notes_Ripple_Up_SFX}
	stopsoundevent \{Song_Intro_Highway_Up}
	stopsoundevent \{Crowd_Low_To_Med_SFX}
	stopsoundevent \{Crowd_Good_To_Med_SFX}
	stopsoundevent \{Crowd_Med_To_Bad_SFX}
	stopsoundevent \{Crowd_Med_To_Good_SFX}
	stopsoundevent \{Crowd_OneShots_Cheer_Close}
	stopsoundevent \{Crowd_Fast_Surge_Cheer}
	stopsoundevent \{Crowd_OneShots_Boo_Close}
	stopsoundevent \{Medium_Crowd_Bad_To_Med_SFX}
	stopsoundevent \{Medium_Crowd_Med_To_Bad_SFX}
	stopsoundevent \{Medium_Crowd_Swell}
	stopsoundevent \{Medium_Crowd_Applause}
	stopsoundevent \{Large_Crowd_Applause_SFX}
	stopsoundevent \{Small_Crowd_Bad_To_Med}
	stopsoundevent \{Small_Crowd_Med_To_Bad_SFX}
	stopsoundevent \{Small_Crowd_Med_To_Good}
	stopsoundevent \{Small_Crowd_Good_To_Med_SFX}
	stopsoundevent \{Small_Crowd_OneShots_Boo}
	stopsoundevent \{Small_Crowd_OneShots_Cheer}
	stopsoundevent \{Hell_Crowd_Good_To_Med}
	stopsoundevent \{Hell_Crowd_Good_To_Med_SFX}
	stopsoundevent \{Lose_Multiplier_Crowd}
	stopsoundevent \{Star_Power_Awarded_SFX}
	stopsoundevent \{Star_Power_Ready_SFX}
	stopsoundevent \{Star_Power_Deployed_SFX}
	stopsoundevent \{Star_Power_Deployed_Cheer_SFX}
	stopsoundevent \{Single_Player_Bad_Note_Guitar}
	stopsoundevent \{Midori_Win_1}
	stopsoundevent \{Midori_Lose_1}
	stopsoundevent \{Lars_Win_3}
	stopsoundevent \{Lars_lose_1}
	stopsoundevent \{Johnny_Lose_1}
	stopsoundevent \{Izzy_Lose_2}
	stopsoundevent \{Izzy_Lose_1}
	stopsoundevent \{Axel_Win_4}
	stopsoundevent \{Axel_Win_1}
	stopsoundevent \{Axel_Lose_2}
	stopsoundevent \{Axel_Lose_1}
	stopsoundevent \{Small_Crowd_Applause_SE}
	stopsoundevent \{Slash_Outro}
	stopsoundevent \{GH_SFX_BattleMode_Lightning_Player1}
	stopsoundevent \{GH_SFX_BattleMode_Lightning_Player2}
	stopsoundevent \{GH_SFX_BattleMode_DeathOf_P1}
	stopsoundevent \{GH_SFX_BattleMode_DeathOf_P2}
	stopsoundevent \{GH_SFX_BattleMode_DiffUp_P1}
	stopsoundevent \{GH_SFX_BattleMode_DiffUp_P2}
	stopsoundevent \{GH_SFX_BattleMode_DoubleNote_P1}
	stopsoundevent \{GH_SFX_BattleMode_DoubleNote_P2}
	stopsoundevent \{GH_SFX_BattleMode_Lefty_P1}
	stopsoundevent \{GH_SFX_BattleMode_Lefty_P2}
	stopsoundevent \{GH_SFX_BattleMode_Steal_P1}
	stopsoundevent \{GH_SFX_BattleMode_Steal_P2}
	stopsoundevent \{GH_SFX_BattleMode_StringBreak_P1}
	stopsoundevent \{GH_SFX_BattleMode_StringBreak_P2}
	stopsoundevent \{GH_SFX_BattleMode_WhammyAttack_P1}
	stopsoundevent \{GH_SFX_BattleMode_WhammyAttack_P2}
	stopsoundevent \{GH_SFX_BossBattle_PlayerDies}
	stopsoundevent \{GH_SFX_BattleMode_Attack_Over_P1}
	stopsoundevent \{GH_SFX_BattleMode_Attack_Over_P2}
	stopsoundevent \{Battle_Power_Awarded_SFX_P1}
	stopsoundevent \{Battle_Power_Awarded_SFX_P2}
	stopsoundevent \{GH_SFX_BattleMode_WhammyAttack_Received_P1}
	stopsoundevent \{GH_SFX_BattleMode_WhammyAttack_Received_P2}
	stopsoundevent \{GH_SFX_BattleMode_Death_Drain_P1}
	stopsoundevent \{GH_SFX_BattleMode_Death_Drain_P2}
	stopsoundevent \{Battle_Attack_Small_Crowd_Cheer_P1}
	stopsoundevent \{Battle_Attack_Small_Crowd_Cheer_P2}
	stopsoundevent \{Battle_Attack_Medium_Crowd_Cheer_P1}
	stopsoundevent \{Battle_Attack_Medium_Crowd_Cheer_P2}
	stopsoundevent \{Battle_Attack_Large_Crowd_Cheer_P1}
	stopsoundevent \{Battle_Attack_Large_Crowd_Cheer_P2}
	stopsoundevent \{Battle_Attack_Hell_Crowd_Cheer_P1}
	stopsoundevent \{Battle_Attack_Hell_Crowd_Cheer_P2}
	stopsoundevent \{Battlemode_HeartBeat_P1}
	stopsoundevent \{Battlemode_HeartBeat_P2}
	Stopsoundsbybuss \{Practice_Band_Playback}
	stopsoundevent \{UI_SFX_Lose_Multiplier_2X}
	stopsoundevent \{UI_SFX_Lose_Multiplier_3X}
	stopsoundevent \{UI_SFX_Lose_Multiplier_4X}
	stopsoundevent \{Lose_Multiplier_Crowd}
	StopSound \{Tom_Intro_Front_Speakers}
	StopSound \{Tom_Intro_Back_Speakers}
	StopSound \{Slash_Intro_Front_Speakers}
	StopSound \{Slash_Intro_Back_Speakers}
	StopSound \{Lou_Intro_Front_Speakers}
	StopSound \{Lou_Intro_Back_Speakers}
	if NOT (($current_transition = preencore) || ($current_playing_transition = songlost))
		printf \{channel = sfx "changing bg to silence"}
		BG_Crowd_Front_End_Silence \{immediate = 1}
	endif
endscript

script GH_SFX_Countoff_Logic 
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> name = countoff
		countoff_sound = (<song_struct>.countoff)
	else
		countoff_sound = 'sticks_normal'
	endif
	if (<velocity> > 99)
		FormatText checksumname = sound_event_name 'Countoff_SFX_%s_Hard' s = <countoff_sound>
	else
		if (<velocity> > 74)
			FormatText checksumname = sound_event_name 'Countoff_SFX_%s_Med' s = <countoff_sound>
		else
			if (<velocity> > 49)
				FormatText checksumname = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
			else
				FormatText checksumname = sound_event_name 'Countoff_SFX_%s_Soft' s = <countoff_sound>
			endif
		endif
	endif
	SoundEvent event = <sound_event_name>
endscript

script GH_SFX_Training_Tuning_Strings 
	switch <note_played>
		case 0
		switch <training_notes_strummed>
			case 1
			playsound \{E_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{E_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{E_String vol = 90 pitch = 90}
		endswitch
		case 1
		switch <training_notes_strummed>
			case 1
			playsound \{A_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{A_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{A_String vol = 90 pitch = 90}
		endswitch
		case 2
		switch <training_notes_strummed>
			case 1
			playsound \{D_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{D_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{D_String vol = 90 pitch = 90}
		endswitch
		case 3
		switch <training_notes_strummed>
			case 1
			playsound \{G_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{G_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{G_String vol = 90 pitch = 90}
		endswitch
		case 4
		switch <training_notes_strummed>
			case 1
			playsound \{B_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{B_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{B_String vol = 90 pitch = 90}
		endswitch
	endswitch
endscript

script GH_SFX_Note_Streak_SinglePlayer 
	if (<combo> = 50)
		SoundEvent \{event = UI_SFX_50_Note_Streak_SinglePlayer}
	else
		SoundEvent \{event = UI_SFX_100_Note_Streak_SinglePlayer}
	endif
endscript

script GH_SFX_Note_Streak_P1 
	if (<combo> = 50)
		SoundEvent \{event = UI_SFX_50_Note_Streak_P1}
	else
		SoundEvent \{event = UI_SFX_100_Note_Streak_P1}
	endif
endscript

script GH_SFX_Note_Streak_P2 
	if (<combo> = 50)
		SoundEvent \{event = UI_SFX_50_Note_Streak_P2}
	else
		SoundEvent \{event = UI_SFX_100_Note_Streak_P2}
	endif
endscript

script GH_SFX_Training_Hammer_On_Lesson_2 
	switch <note_played>
		case 0
		switch <training_notes_strummed>
			case 1
			playsound \{E_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{E_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{E_String vol = 90 pitch = 90}
		endswitch
		case 1
		switch <training_notes_strummed>
			case 1
			playsound \{A_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{A_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{A_String vol = 90 pitch = 90}
		endswitch
		case 2
		switch <training_notes_strummed>
			case 1
			playsound \{D_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{D_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{D_String vol = 90 pitch = 90}
		endswitch
		case 3
		switch <training_notes_strummed>
			case 1
			playsound \{G_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{G_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{G_String vol = 90 pitch = 90}
		endswitch
		case 4
		switch <training_notes_strummed>
			case 1
			playsound \{B_Tuning vol = 90 pitch = 80}
			case 2
			playsound \{B_Tuning vol = 90 pitch = 90}
			case 3
			playsound \{B_String vol = 90 pitch = 90}
		endswitch
	endswitch
endscript

script StopNotes_01 
	if isSoundEventplaying \{Tutorial_String_1_Strum_Free}
		setsoundparams \{Tutorial_String_1_Strum_Free vol = 100}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_1_Strum_Free vol = 50}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_1_Strum_Free vol = 10}
		stopsoundevent \{Tutorial_String_1_Strum_Free}
	endif
endscript

script StopNotes_02 
	if isSoundEventplaying \{Tutorial_String_2_HOPO_Free}
		setsoundparams \{Tutorial_String_2_HOPO_Free vol = 100}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_2_HOPO_Free vol = 50}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_2_HOPO_Free vol = 10}
		stopsoundevent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_03 
	if isSoundEventplaying \{Tutorial_String_3_HOPO_Free}
		setsoundparams \{Tutorial_String_3_HOPO_Free vol = 100}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_3_HOPO_Free vol = 50}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_3_HOPO_Free vol = 10}
		stopsoundevent \{Tutorial_String_3_HOPO_Free}
	endif
endscript

script StopNotes_04 
	if isSoundEventplaying \{Tutorial_String_3_Strum_Free}
		setsoundparams \{Tutorial_String_3_Strum_Free vol = 100}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_3_Strum_Free vol = 50}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_3_Strum_Free vol = 10}
		stopsoundevent \{Tutorial_String_3_Strum_Free}
	endif
endscript

script StopNotes_05 
	if isSoundEventplaying \{Tutorial_String_2_HOPO_Free}
		setsoundparams \{Tutorial_String_2_HOPO_Free vol = 100}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_2_HOPO_Free vol = 50}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_2_HOPO_Free vol = 10}
		stopsoundevent \{Tutorial_String_2_HOPO_Free}
	endif
endscript

script StopNotes_06 
	if isSoundEventplaying \{Tutorial_String_1_HOPO_Free}
		setsoundparams \{Tutorial_String_1_HOPO_Free vol = 100}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_1_HOPO_Free vol = 50}
		wait \{0.05 seconds}
		setsoundparams \{Tutorial_String_1_HOPO_Free vol = 10}
		stopsoundevent \{Tutorial_String_1_HOPO_Free}
	endif
endscript

script Tutorial_Mode_Finish_Chord_02 
	wait \{1 seconds}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
endscript

script Tutorial_Mode_Finish_Chord_03 
	wait \{0.3 seconds}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
endscript
