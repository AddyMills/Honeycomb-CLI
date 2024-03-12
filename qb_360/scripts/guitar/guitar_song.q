stream_config = gh1
song_fsb_id = -1
song_fsb_name = 'none'
song_stream_id = null
song_unique_id = null
guitar_player1_stream_id = null
guitar_player1_unique_id = null
guitar_player2_stream_id = null
guitar_player2_unique_id = null
extra_stream_id = null
extra_unique_id = null
band_stream_id = null
band_unique_id = null
crowd_stream_id = null
crowd_unique_id = null
song_paused = 0

script preload_song \{starttime = 0 fadeintime = 0.0}
	printf "song %s" s = <song_name>
	change \{song_stream_id = null}
	change \{song_unique_id = null}
	change \{guitar_player1_stream_id = null}
	change \{guitar_player1_unique_id = null}
	change \{guitar_player2_stream_id = null}
	change \{guitar_player2_unique_id = null}
	change \{extra_stream_id = null}
	change \{extra_unique_id = null}
	change \{band_stream_id = null}
	change \{band_unique_id = null}
	change \{crowd_stream_id = null}
	change \{crowd_unique_id = null}
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	if NOT SongLoadFSB song_prefix = <song_prefix>
		downloadcontentlost
		return
	endif
	stream_config = gh1
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> name = version
		stream_config = (<song_struct>.version)
	endif
	soundbussunlock \{Band_Balance}
	soundbussunlock \{Guitar_Balance}
	if StructureContains structure = <song_struct> name = band_playback_volume
		setsoundbussparams {Band_Balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}} time = <fadeintime>
	else
		setsoundbussparams {Band_Balance = {vol = -1.5}} time = <fadeinttime>
	endif
	if StructureContains structure = <song_struct> name = guitar_playback_volume
		setsoundbussparams {Guitar_Balance = {vol = ((<song_struct>.guitar_playback_volume) - 1.5)}} time = <fadeintime>
	else
		setsoundbussparams {Guitar_Balance = {vol = -1.5}} time = <fadeintime>
	endif
	SoundBussLock \{Band_Balance}
	SoundBussLock \{Guitar_Balance}
	change stream_config = <stream_config>
	FormatText checksumname = song_stream '%s_song' s = <song_prefix> addtostringlookup
	FormatText checksumname = guitar_stream '%s_guitar' s = <song_prefix> addtostringlookup
	FormatText checksumname = rhythm_stream '%s_rhythm' s = <song_prefix> addtostringlookup
	FormatText checksumname = crowd_stream '%s_crowd' s = <song_prefix> addtostringlookup
	if ($game_mode = p2_career || $game_mode = p2_coop ||
			($game_mode = training && ($player1_status.part = rhythm)))
		if StructureContains structure = <song_struct> use_coop_notetracks
			FormatText checksumname = song_stream '%s_coop_song' s = <song_prefix> addtostringlookup
			FormatText checksumname = guitar_stream '%s_coop_guitar' s = <song_prefix> addtostringlookup
			FormatText checksumname = rhythm_stream '%s_coop_rhythm' s = <song_prefix> addtostringlookup
		endif
	endif
	change song_stream_id = <song_stream>
	if PreLoadStream <song_stream> buss = master
		change song_unique_id = <unique_id>
	else
		scriptassert "Could not load song track for %s" s = <song_prefix>
	endif
	extra_stream = null
	if (<stream_config> = gh3)
		change crowd_stream_id = <crowd_stream>
		if PreLoadStream <crowd_stream> buss = master
			change crowd_unique_id = <unique_id>
		endif
		<extra_stream> = <rhythm_stream>
	endif
	if StructureContains structure = <song_struct> name = extra_stream
		FormatText checksumname = extra_stream '%s_%t' s = <song_prefix> t = (<song_struct>.extra_stream) addtostringlookup
	endif
	if ($current_num_players = 1)
		if (($player1_status.part) = rhythm && (<stream_config> != gh1))
			if NOT PreLoadStream <extra_stream> buss = master
				scriptassert "Could not load player1 guitar track for %s" s = <song_prefix>
			endif
			change guitar_player1_unique_id = <unique_id>
			<extra_stream> = <guitar_stream>
		else
			if NOT PreLoadStream <guitar_stream> buss = master
				scriptassert "Could not load player1 guitar track for %s" s = <song_prefix>
			endif
			change guitar_player1_unique_id = <unique_id>
			<extra_stream> = <rhythm_stream>
		endif
		if NOT (<extra_stream> = null)
			change extra_stream_id = <extra_stream>
			if PreLoadStream <extra_stream> buss = master
				change extra_unique_id = <unique_id>
			endif
		endif
	else
		if (($player1_status.part) = rhythm && (<stream_config> != gh1))
			change guitar_player1_stream_id = <extra_stream>
			if NOT PreLoadStream <extra_stream> buss = master
				scriptassert "Could not load player1 guitar track for %s" s = <song_prefix>
			endif
		else
			change guitar_player1_stream_id = <guitar_stream>
			if NOT PreLoadStream <guitar_stream> buss = master
				scriptassert "Could not load player1 guitar track for %s" s = <song_prefix>
			endif
		endif
		change guitar_player1_unique_id = <unique_id>
		if (($player2_status.part) = rhythm && (<stream_config> != gh1))
			change guitar_player2_stream_id = <extra_stream>
			if NOT PreLoadStream <extra_stream> buss = master
				scriptassert "Could not load player2 guitar track for %s" s = <song_prefix>
			endif
		else
			change guitar_player2_stream_id = <guitar_stream>
			if NOT PreLoadStream <guitar_stream> buss = master
				scriptassert "Could not load player2 guitar track for %s" s = <song_prefix>
			endif
		endif
		change guitar_player2_unique_id = <unique_id>
		if (<stream_config> != gh1)
			if NOT ((($player1_status.part) = rhythm) || (($player2_status.part) = rhythm))
				change extra_stream_id = <extra_stream>
				if PreLoadStream <extra_stream> buss = master
					change extra_unique_id = <unique_id>
				endif
			endif
		endif
	endif
	waitforpreload_song <...>
	change \{song_paused = 1}
	SetLastGuitarVolume \{player = 1 last_guitar_volume = 100}
	SetLastGuitarVolume \{player = 2 last_guitar_volume = 100}
	startpreloadpaused_song
	setseekposition_song position = <starttime>
endscript

script SongUnLoadFSBIfDownloaded 
	GetContentFolderIndexFromFile ($song_fsb_name)
	if (<device> = content)
		UnLoadFSB \{fsb_index = $song_fsb_id}
		Downloads_CloseContentFolder content_index = <content_index>
		change \{song_fsb_id = -1}
		change \{song_fsb_name = 'none'}
	endif
endscript

script SongUnLoadFSB 
	SongUnLoadFSBIfDownloaded
	if NOT ($song_fsb_id = -1)
		UnLoadFSB \{fsb_index = $song_fsb_id}
		change \{song_fsb_id = -1}
		change \{song_fsb_name = 'none'}
	endif
endscript

script SongLoadFSB 
	FormatText keep_case textname = filename '%n.fsb' n = <song_prefix>
	if ($song_fsb_name = <filename>)
		return \{TRUE}
	endif
	SongUnLoadFSB
	FormatText keep_case textname = fsbfilename '%n' n = <song_prefix>
	GetContentFolderIndexFromFile <filename>
	if (<device> = content)
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			return \{FALSE}
		endif
	else
		FormatText keep_case textname = fsbfilename 'music/%n' n = <song_prefix>
	endif
	if NOT LoadFSB filename = <fsbfilename> numstreams = 5 encryptionkey = '5atu6w4zaw' device = <device>
		return \{FALSE}
	endif
	if (<fsb_index> = -1)
		change \{song_fsb_id = -1}
		change \{song_fsb_name = 'none'}
		scriptassert "could not load FSB for: %s" s = <song_prefix>
	else
		change song_fsb_id = <fsb_index>
		change song_fsb_name = <filename>
	endif
	return \{TRUE}
endscript

script waitforpreload_song 
	waitforpreload_stream \{stream = extra_unique_id}
	waitforpreload_stream \{stream = song_unique_id}
	waitforpreload_stream \{stream = crowd_unique_id}
	waitforpreload_stream \{stream = guitar_player1_unique_id}
	waitforpreload_stream \{stream = guitar_player2_unique_id}
endscript

script waitforpreload_stream \{stream = None}
	if NOT ($<stream> = null)
		begin
		if PreLoadStreamDone $<stream>
			break
		endif
		wait \{1 gameframe}
		printf "Waiting for preload %s" s = <stream>
		repeat
	endif
endscript

script waitforseek_song 
	wait \{15 gameframe}
	return
endscript

script setslomo_song 
	if NOT ($song_unique_id = null)
		setsoundparams unique_id = $song_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($guitar_player1_unique_id = null)
		setsoundparams unique_id = $guitar_player1_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($extra_unique_id = null)
		setsoundparams unique_id = $extra_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($crowd_unique_id = null)
		setsoundparams unique_id = $crowd_unique_id pitch = (<slomo> * 100)
	endif
	if NOT ($guitar_player2_unique_id = null)
		setsoundparams unique_id = $guitar_player2_unique_id pitch = (<slomo> * 100)
	endif
endscript
Player1Effects = {
	effect = $PitchShiftEffect1
	effect2 = $Flange_Default1
	effect3 = $Chorus_Default1
	effect4 = $Echo_Default1
	effect5 = $HighPass_Default1
	effect6 = $LowPass_Default1
	effect7 = $EQ_Default1
}
Player2Effects = {
	effect = $PitchShiftEffect2
	effect2 = $Flange_Default2
	effect3 = $Chorus_Default2
	effect4 = $Echo_Default2
	effect5 = $HighPass_Default2
	effect6 = $LowPass_Default2
	effect7 = $EQ_Default2
}
PitchShiftEffect1 = {
	effect = FastPitchShift
	name = Guitar1PitchShift
	pitch = 1.0
	MaxChannels = 0
}
PitchShiftEffect2 = {
	effect = FastPitchShift
	name = Guitar2PitchShift
	pitch = 1.0
	MaxChannels = 0
}
Player1PracticeEffects = {
	effect = $PitchShiftSlow1
	effect2 = $PitchShiftEffect1
}
PitchShiftSlow1 = {
	effect = PitchShift
	name = SlowGuitar1PitchShift
	pitch = 1.0
	MaxChannels = 2
	fftsize = 4096
}

script startpreloadpaused_song 
	both_players_lead = 0
	if (($player1_status.part) = ($player2_status.part))
		both_players_lead = 1
	endif
	if ($current_num_players = 1)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player1PracticeEffects
		else
			StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player1Effects
		endif
	else
		if (<both_players_lead> = 1)
			StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player1Effects $Player1Pan voll = 100 volr = 0
			StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Second_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player2Effects $Player2Pan voll = 0 volr = 100
		else
			StartPreLoadedStream $guitar_player1_unique_id startpaused = 1 buss = First_Player_Lead_Playback pitch = ($current_speedfactor * 100) $Player1Effects
			StartPreLoadedStream $guitar_player2_unique_id startpaused = 1 buss = Second_Player_Rhythm_Playback pitch = ($current_speedfactor * 100) $Player2Effects
		endif
	endif
	StartPreLoadedStream $song_unique_id startpaused = 1 buss = Band_Playback pitch = ($current_speedfactor * 100)
	if NOT ($extra_stream_id = null)
		StartPreLoadedStream $extra_unique_id startpaused = 1 buss = Single_Player_Rhythm_Playback pitch = ($current_speedfactor * 100)
	endif
	if NOT ($crowd_unique_id = null)
		StartPreLoadedStream $crowd_unique_id startpaused = 1 buss = Crowd_Singalong pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5 pitch = ($current_speedfactor * 100)
	endif
endscript

script begin_song \{Pause = 0}
	lockdsp
	PauseSound unique_id = $song_unique_id Pause = <Pause>
	PauseSound unique_id = $guitar_player1_unique_id Pause = <Pause>
	if NOT ($extra_stream_id = null)
		PauseSound unique_id = $extra_unique_id Pause = <Pause>
	endif
	if NOT ($crowd_stream_id = null)
		PauseSound unique_id = $crowd_unique_id Pause = <Pause>
	endif
	if NOT ($guitar_player2_stream_id = null)
		PauseSound unique_id = $guitar_player2_unique_id Pause = <Pause>
	endif
	unlockdsp
	change \{song_paused = 0}
endscript

script setseekposition_song \{position = 0}
	if NOT ($song_unique_id = null)
		SetSoundSeekPosition unique_id = $song_unique_id position = <position>
	endif
	if NOT ($guitar_player1_unique_id = null)
		if ($game_mode = training && $in_menu_choose_practice_section = 0)
			SetSoundSeekPosition unique_id = $guitar_player1_unique_id position = (<position> - ($default_practice_mode_pitchshift_offset_song))
		else
			SetSoundSeekPosition unique_id = $guitar_player1_unique_id position = <position>
		endif
	endif
	if NOT ($extra_unique_id = null)
		SetSoundSeekPosition unique_id = $extra_unique_id position = <position>
	endif
	if NOT ($crowd_unique_id = null)
		SetSoundSeekPosition unique_id = $crowd_unique_id position = <position>
	endif
	if NOT ($guitar_player2_unique_id = null)
		SetSoundSeekPosition unique_id = $guitar_player2_unique_id position = <position>
	endif
endscript
Waiting_For_Pitching = 0

script Failed_Song_Pitch_Down 
	soundbussunlock \{Guitar_Balance}
	soundbussunlock \{Band_Balance}
	setsoundbussparams \{Band_Balance = {vol = -20 pitch = -8} time = 3}
	setsoundbussparams \{Guitar_Balance = {vol = -20 pitch = -8} time = 3}
	change \{Waiting_For_Pitching = 1}
	SoundBussLock \{Band_Balance}
	SoundBussLock \{Guitar_Balance}
	wait \{3 seconds}
	spawnscriptnow \{end_song}
endscript

script end_song \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		KillSpawnedScript \{name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			change \{Waiting_For_Pitching = 0}
			soundbussunlock \{Guitar_Balance}
			soundbussunlock \{Band_Balance}
			setsoundbussparams {Band_Balance = {vol = (($Default_BussSet.Band_Balance.vol) - 2.5) pitch = ($Default_BussSet.Band_Balance.pitch)}}
			setsoundbussparams {Guitar_Balance = {vol = (($Default_BussSet.Guitar_Balance.vol) - 2.5) pitch = ($Default_BussSet.Guitar_Balance.pitch)}}
			SoundBussLock \{Band_Balance}
			SoundBussLock \{Guitar_Balance}
		endif
		StopStream \{unique_id = $song_unique_id}
		StopStream \{unique_id = $guitar_player1_unique_id}
	else
		printf \{channel = sfx "We are pitching the stream down because we failed"}
		spawnscriptnow \{Failed_Song_Pitch_Down}
	endif
	if NOT ($extra_unique_id = null)
		StopStream \{unique_id = $extra_unique_id}
	endif
	if NOT ($crowd_unique_id = null)
		StopStream \{unique_id = $crowd_unique_id}
	endif
	if NOT ($guitar_player2_unique_id = null)
		StopStream \{unique_id = $guitar_player2_unique_id}
	endif
	change \{song_paused = 0}
endscript
p1_whammy_control = 0.0

script set_whammy_pitchshift 
	if ($<player_status>.player = 1)
		setsoundbusseffects effect = {effect = PitchShift name = Guitar1PitchShift pitch = (1 - (<control> * 0.057))}
		change p1_whammy_control = <control>
	else
		setsoundbusseffects effect = {effect = PitchShift name = Guitar2PitchShift pitch = (1 - (<control> * 0.057))}
	endif
endscript

script PauseGh3Sounds 
	lockdsp
	PauseSoundsByBuss \{master}
	unlockdsp
	if NOT GotParam \{no_seek}
		getsongtimems
		CastToInteger \{time}
		if (<time> > $current_starttime)
			if NOT GotParam \{seek_on_unpause}
				setseekposition_song position = <time>
			endif
		endif
	endif
endscript

script UnpauseGh3Sounds 
	if GotParam \{seek_on_unpause}
		getsongtimems
		CastToInteger \{time}
		if (<time> > $current_starttime)
			setseekposition_song position = <time>
		endif
	endif
	lockdsp
	if ($song_paused = 0)
		UnpauseSoundsByBuss \{master}
	else
		UnpauseSoundsByBuss \{ui}
		UnpauseSoundsByBuss \{Crowd_One_Shots}
		UnpauseSoundsByBuss \{Crowd_One_Shots_Negative}
		UnpauseSoundsByBuss \{Crowd_Beds}
		UnpauseSoundsByBuss \{Crowd_Cheers}
		UnpauseSoundsByBuss \{Crowd_Boos}
		UnpauseSoundsByBuss \{Crowd_Nuetral}
		UnpauseSoundsByBuss \{`default`}
		UnpauseSoundsByBuss \{Test_Tones}
		UnpauseSoundsByBuss \{Practice_Band_Playback}
		UnpauseSoundsByBuss \{Test_Tones_DSP}
		UnpauseSoundsByBuss \{Right_Notes_Player2}
		UnpauseSoundsByBuss \{Wrong_Notes_Player1}
		UnpauseSoundsByBuss \{Wrong_Notes_Player2}
		UnpauseSoundsByBuss \{User_Vocal}
		UnpauseSoundsByBuss \{User_Music}
		UnpauseSoundsByBuss \{Encore_Events}
		UnpauseSoundsByBuss \{binkcutscenes}
	endif
	unlockdsp
endscript
