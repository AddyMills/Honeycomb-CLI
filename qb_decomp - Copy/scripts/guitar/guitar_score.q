points_per_note = {
	EASY = 50.0
	MEDIUM = 50.0
	HARD = 50.0
	EXPERT = 50.0
}
points_per_note_per_beat = {
	EASY = 25.0
	MEDIUM = 25.0
	HARD = 25.0
	EXPERT = 25.0
}

script reset_score 
	Change StructureName = <player_status> score = 0
	Change StructureName = <player_status> NOTES_HIT = 0
	Change StructureName = <player_status> total_notes = 0
	Change StructureName = <player_status> best_run = 0
	Change StructureName = <player_status> current_run = 0
	Change StructureName = <player_status> sp_phrases_hit = 0
	Change StructureName = <player_status> multiplier_count = 0
	Change StructureName = <player_status> num_multiplier = 0
	Change StructureName = <player_status> time_in_lead = 0.0
	last_time_in_lead = 0.0
	last_time_in_lead_player = -1
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	Change current_section_array = <song_section_array>
	Change \{current_section_array_entry = 0}
	formatText Checksumname = detailstats_array '%s_last_song_detailed_stats' S = (<player_status>.Text)
	Change StructureName = <player_status> current_detailedstats_array_entry = 0
	Change StructureName = <player_status> current_detailedstats_array = <detailstats_array>
	formatText Checksumname = detailstats_array_max '%s_last_song_detailed_stats_max' S = (<player_status>.Text)
	Change StructureName = <player_status> current_detailedstats_max_array = <detailstats_array_max>
	getArraySize ($<detailstats_array>)
	array_count = 0
	begin
	setarrayelement Arrayname = <detailstats_array> globalArray Index = <array_count> NewValue = 0
	setarrayelement Arrayname = <detailstats_array_max> globalArray Index = <array_count> NewValue = 0
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Change \{whammy_mania_achievement_invalidated = 0}
	Change \{gStar_Power_Triggered = 0}
endscript

script calc_songscoreinfo \{player_status = player1_status}
	get_song_prefix Song = ($current_song)
	CalcSongScoreInfo <...>
	return
	fast_base_score = ($<player_status>.base_score)
	fast_max_notes = ($<player_status>.max_notes)
	fast_sp_phrases_total = ($<player_status>.sp_phrases_total)
	if ($devil_finish = 1)
		return
	endif
	base_score = 0
	max_notes = 0
	sim_bot_score = 0
	sim_bot_multiplier = 1
	sim_bot_note_count = 0
	fretbar_array = ($<player_status>.current_song_fretbar_array)
	if (<fretbar_array> = NONE)
		return
	endif
	fretbar_count = 0
	getArraySize $<fretbar_array>
	fretbar_size = <array_Size>
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	getArraySize ($<song_section_array>)
	song_section_array_size = <array_Size>
	formatText Checksumname = detailstats_array_max '%s_last_song_detailed_stats_max' S = (<player_status>.Text)
	getArraySize ($<detailstats_array_max>)
	array_count = 0
	begin
	setarrayelement Arrayname = <detailstats_array_max> globalArray Index = <array_count> NewValue = 0
	array_count = (<array_count> + 1)
	repeat <array_Size>
	starpower_array = ($<player_status>.current_song_star_array)
	starpower_array_entry = 0
	starpower_on = 0
	getArraySize ($<starpower_array>)
	starpower_array_size = <array_Size>
	sp_phrases_total = 0
	if ($game_mode = p2_faceoff)
		faceoff_array_entry = 0
		gemfiller_on = 0
		get_song_prefix Song = ($current_song)
		formatText Checksumname = faceoff_array '%s_faceoff%p' S = <song_prefix> P = ($<player_status>.Text) AddToStringLookup
		getArraySize $<faceoff_array>
		faceoff_array_size = <array_Size>
	else
		gemfiller_on = 1
	endif
	Song = ($<player_status>.current_song_gem_array)
	DIFFICULTY = $current_difficulty
	getArraySize $<Song>
	song_size = (<array_Size> / $num_song_columns)
	array_count = 0
	if (<song_size> = 0)
		Change StructureName = <player_status> max_notes = 0
		Change StructureName = <player_status> base_score = 0
		return
	endif
	section_index = 0
	last_array_count = -1
	begin
	Time = ($<Song> [<array_count>])
	begin
	if ((<fretbar_count> + 1) = (<fretbar_size> - 1))
		break
	endif
	beat_time = ($<fretbar_array> [(<fretbar_count> + 1)] - $<fretbar_array> [<fretbar_count>])
	if ($<fretbar_array> [(<fretbar_count> + 1)] > <Time>)
		break
	endif
	fretbar_count = (<fretbar_count> + 1)
	repeat
	if ($game_mode = p2_faceoff)
		begin
		if (<faceoff_array_entry> >= <faceoff_array_size>)
			break
		endif
		faceoff_starttime = ($<faceoff_array> [<faceoff_array_entry>] [0])
		faceoff_endtime = (<faceoff_starttime> + $<faceoff_array> [<faceoff_array_entry>] [1])
		if (<gemfiller_on> = 1)
			if (<faceoff_endtime> <= <Time>)
				gemfiller_on = 0
				Printf "gemfiller_on %a %i" A = <gemfiller_on> I = <Time>
				faceoff_array_entry = (<faceoff_array_entry> + 1)
			else
				break
			endif
			elseif (<gemfiller_on> = 0)
			if (<faceoff_starttime> <= <Time>)
				gemfiller_on = 1
				Printf "gemfiller_on %a %i" A = <gemfiller_on> I = <Time>
			else
				break
			endif
		endif
		repeat
	endif
	begin
	if (<starpower_array_entry> >= <starpower_array_size>)
		break
	endif
	star_starttime = ($<starpower_array> [<starpower_array_entry>] [0])
	star_endtime = (<star_starttime> + $<starpower_array> [<starpower_array_entry>] [1])
	if (<starpower_on> = 1)
		if (<star_endtime> <= <Time>)
			starpower_on = 0
			Printf "starpower_on %a %i" A = <starpower_on> I = <Time>
			starpower_array_entry = (<starpower_array_entry> + 1)
		else
			break
		endif
		elseif (<starpower_on> = 0)
		if (<star_starttime> <= <Time>)
			starpower_on = 1
			Printf "starpower_on %a %i" A = <starpower_on> I = <Time>
			if (<gemfiller_on> = 1)
				sp_phrases_total = (<sp_phrases_total> + 1)
			endif
		else
			break
		endif
	endif
	repeat
	begin
	if (<song_section_array_size> > (<section_index> + 1))
		if ($<song_section_array> [(<section_index> + 1)].Time > <Time>)
			break
		else
			section_index = (<section_index> + 1)
		endif
	else
		break
	endif
	repeat
	if (<gemfiller_on> = 1)
		sim_bot_note_count = (<sim_bot_note_count> + 1)
		max_notes = (<max_notes> + 1)
		setarrayelement Arrayname = <detailstats_array_max> globalArray Index = <section_index> NewValue = (($<detailstats_array_max> [<section_index>]) + 1)
	endif
	getArraySize \{$gem_colors}
	Color = 0
	whammy_value = -1
	length = ($<Song> [(<array_count> + 1)])
	value_bitfield = ($<Song> [(<array_count> + 2)])
	begin
	Value = 0
	if NOT ((<value_bitfield> / 2) * 2 = <value_bitfield>)
		Value = <length>
	endif
	value_bitfield = (<value_bitfield> / 2)
	if (<gemfiller_on> = 1 &&
			<Value> > 0)
		if (<whammy_value> = -1)
			whammy_value = <Value>
		endif
		base_score = (<base_score> + $points_per_note.<DIFFICULTY>)
		if (<sim_bot_note_count> < 10)
			sim_bot_score = (<sim_bot_score> + $points_per_note.<DIFFICULTY>)
			elseif (<sim_bot_note_count> < 20)
			sim_bot_score = (<sim_bot_score> + $points_per_note.<DIFFICULTY> * 2)
			elseif (<sim_bot_note_count> < 30)
			sim_bot_score = (<sim_bot_score> + $points_per_note.<DIFFICULTY> * 3)
		else
			sim_bot_score = (<sim_bot_score> + $points_per_note.<DIFFICULTY> * 4)
		endif
	endif
	Color = (<Color> + 1)
	repeat <array_Size>
	if (<gemfiller_on> &&
			<whammy_value> > (<beat_time> / 2.0) &&
			<last_array_count> != <array_count>)
		last_array_count = <array_count>
		whammy_score = 0
		whammy_value = (<whammy_value> - $whammy_shorten * <beat_time>)
		whammy_value_beat = <whammy_value>
		finished = 0
		whammy_fretbar_count = <fretbar_count>
		begin
		whammy_beat_time = ($<fretbar_array> [(<whammy_fretbar_count> + 1)] - $<fretbar_array> [<whammy_fretbar_count>])
		if (<whammy_value> > <whammy_beat_time>)
			whammy_value_beat = <whammy_beat_time>
			whammy_value = (<whammy_value> - <whammy_beat_time>)
		else
			whammy_value_beat = <whammy_value>
			finished = 1
		endif
		additional_score = ($points_per_note_per_beat.<DIFFICULTY> * 1.0)
		additional_score = (<additional_score> * <whammy_value_beat>)
		additional_score = (<additional_score> / <whammy_beat_time>)
		whammy_score = (<whammy_score> + <additional_score>)
		if (<sim_bot_note_count> < 10)
			sim_bot_score = (<sim_bot_score> + <additional_score>)
			elseif (<sim_bot_note_count> < 20)
			sim_bot_score = (<sim_bot_score> + <additional_score> * 2)
			elseif (<sim_bot_note_count> < 30)
			sim_bot_score = (<sim_bot_score> + <additional_score> * 3)
		else
			sim_bot_score = (<sim_bot_score> + <additional_score> * 4)
		endif
		Printf "Simbot %i Entry %a Whammy %d" I = <sim_bot_score> A = <array_count> D = <additional_score>
		if (<finished> = 1)
			break
		endif
		repeat
		Printf "Score %i Entry %a Color %t + whammy %v" I = <base_score> A = <array_count> T = <Color> v = <whammy_score>
		base_score = (<base_score> + <whammy_score>)
	endif
	array_count = (<array_count> + $num_song_columns)
	repeat <song_size>
	printStruct <...>
	Change StructureName = <player_status> max_notes = <max_notes>
	Change StructureName = <player_status> base_score = <base_score>
	Change StructureName = <player_status> sp_phrases_total = <sp_phrases_total>
	castToInteger \{fast_base_score}
	castToInteger \{base_score}
	if (<fast_base_score> != <base_score> ||
			<fast_max_notes> != <max_notes> ||
			<fast_sp_phrases_total> != <sp_phrases_total>)
		Scriptassert \{"Mismatch in CalcSongScoreInfo"}
	endif
endscript

script hit_note 
	Change StructureName = <player_status> NOTES_HIT = ($<player_status>.NOTES_HIT + 1)
	Change StructureName = <player_status> current_run = ($<player_status>.current_run + 1)
	Change StructureName = <player_status> total_notes = ($<player_status>.total_notes + 1)
	if ($<player_status>.current_run > $<player_status>.best_run)
		Change StructureName = <player_status> best_run = ($<player_status>.current_run)
	endif
	get_current_multiplier player_status = <player_status>
	DIFFICULTY = $current_difficulty
	Change StructureName = <player_status> score = ($<player_status>.score + (<Multiplier> * $points_per_note.<DIFFICULTY>))
endscript

script miss_note 
	Change StructureName = <player_status> total_notes = ($<player_status>.total_notes + 1)
	Change StructureName = <player_status> current_run = 0
endscript

script unnecessary_note 
	Change StructureName = <player_status> current_run = 0
endscript

script update_score_fast 
	UpdateScoreFastInit player_status = <player_status>
	begin
	GetSongtimeMS
	UpdateScoreFastPerFrame player_status = <player_status> Time = <Time>
	Wait \{1 GameFrame}
	repeat
endscript

script update_score 
	last_score = -1
	last_star = -1.0
	last_health = -1.0
	last_run = -1
	ExtendCrc ScoreMeter_Wheel_100000 <player_Text> out = Wheel_100000
	ExtendCrc ScoreMeter_Wheel_10000 <player_Text> out = Wheel_10000
	ExtendCrc ScoreMeter_Wheel_1000 <player_Text> out = Wheel_1000
	ExtendCrc ScoreMeter_Wheel_100 <player_Text> out = Wheel_100
	ExtendCrc ScoreMeter_Wheel_10 <player_Text> out = Wheel_10
	ExtendCrc ScoreMeter_Wheel_1 <player_Text> out = Wheel_1
	ExtendCrc RockMeter_Bulb0 <player_Text> out = Bulb0
	ExtendCrc RockMeter_Bulb1 <player_Text> out = Bulb1
	ExtendCrc RockMeter_Bulb2 <player_Text> out = Bulb2
	ExtendCrc RockMeter_Bulb3 <player_Text> out = Bulb3
	ExtendCrc RockMeter_Bulb4 <player_Text> out = Bulb4
	ExtendCrc RockMeter_Bulb5 <player_Text> out = Bulb5
	ExtendCrc RockMeter_Bulb_Lit0 <player_Text> out = Bulb_Lit0
	ExtendCrc RockMeter_Bulb_Lit1 <player_Text> out = Bulb_Lit1
	ExtendCrc RockMeter_Bulb_Lit2 <player_Text> out = Bulb_Lit2
	ExtendCrc RockMeter_Bulb_Lit3 <player_Text> out = Bulb_Lit3
	ExtendCrc RockMeter_Bulb_Lit4 <player_Text> out = Bulb_Lit4
	ExtendCrc RockMeter_Bulb_Lit5 <player_Text> out = Bulb_Lit5
	begin
	<score> = ($<player_status>.score)
	if NOT (<last_score> = <score>)
		<last_score> = <score>
		<score_1000000> = (<score> / 1000000)
		<score_100000> = (<score> / 100000)
		<score_10000> = (<score> / 10000)
		<score_1000> = (<score> / 1000)
		<score_100> = (<score> / 100)
		<score_10> = (<score> / 10)
		<score_1> = (<score> - (<score_10> * 10))
		<score_10> = (<score_10> - (<score_100> * 10))
		<score_100> = (<score_100> - (<score_1000> * 10))
		<score_1000> = (<score_1000> - (<score_10000> * 10))
		<score_10000> = (<score_10000> - (<score_100000> * 10))
		<score_100000> = (<score_100000> - (<score_1000000> * 10))
		<step> = ((3.1415927 * 2.0) / 10.0)
		setScreenElementProps Id = <Wheel_100000> anglex = (<step> * <score_100000>)
		setScreenElementProps Id = <Wheel_10000> anglex = (<step> * <score_10000>)
		setScreenElementProps Id = <Wheel_1000> anglex = (<step> * <score_1000>)
		setScreenElementProps Id = <Wheel_100> anglex = (<step> * <score_100>)
		setScreenElementProps Id = <Wheel_10> anglex = (<step> * <score_10>)
		setScreenElementProps Id = <Wheel_1> anglex = (<step> * <score_1>)
	endif
	<Star> = ($<player_status>.star_power_amount)
	if NOT (<last_star> = <Star>)
		<last_star> = <Star>
		<amount_per_bulb> = (100.0 / 6.0)
		if (<Star> >= <amount_per_bulb>)
			DoScreenElementMorph Id = <Bulb0> Alpha = 0
			DoScreenElementMorph Id = <Bulb_Lit0> Alpha = 1
		else
			DoScreenElementMorph Id = <Bulb0> Alpha = 1
			DoScreenElementMorph Id = <Bulb_Lit0> Alpha = 0
		endif
		if (<Star> >= (<amount_per_bulb> * 2))
			DoScreenElementMorph Id = <Bulb1> Alpha = 0
			DoScreenElementMorph Id = <Bulb_Lit1> Alpha = 1
		else
			DoScreenElementMorph Id = <Bulb1> Alpha = 1
			DoScreenElementMorph Id = <Bulb_Lit1> Alpha = 0
		endif
		if (<Star> >= (<amount_per_bulb> * 3))
			DoScreenElementMorph Id = <Bulb2> Alpha = 0
			DoScreenElementMorph Id = <Bulb_Lit2> Alpha = 1
		else
			DoScreenElementMorph Id = <Bulb2> Alpha = 1
			DoScreenElementMorph Id = <Bulb_Lit2> Alpha = 0
		endif
		if (<Star> >= (<amount_per_bulb> * 4))
			DoScreenElementMorph Id = <Bulb3> Alpha = 0
			DoScreenElementMorph Id = <Bulb_Lit3> Alpha = 1
		else
			DoScreenElementMorph Id = <Bulb3> Alpha = 1
			DoScreenElementMorph Id = <Bulb_Lit3> Alpha = 0
		endif
		if (<Star> >= (<amount_per_bulb> * 5))
			DoScreenElementMorph Id = <Bulb4> Alpha = 0
			DoScreenElementMorph Id = <Bulb_Lit4> Alpha = 1
		else
			DoScreenElementMorph Id = <Bulb4> Alpha = 1
			DoScreenElementMorph Id = <Bulb_Lit4> Alpha = 0
		endif
		if (<Star> >= (<amount_per_bulb> * 6))
			DoScreenElementMorph Id = <Bulb5> Alpha = 0
			DoScreenElementMorph Id = <Bulb_Lit5> Alpha = 1
		else
			DoScreenElementMorph Id = <Bulb5> Alpha = 1
			DoScreenElementMorph Id = <Bulb_Lit5> Alpha = 0
		endif
	endif
	<health> = ($health_scale - $<player_status>.current_health)
	if NOT (<last_health> = <health>)
		<last_health> = <health>
		<rot> = (((<health> / $health_scale) * (0.65000004 * 2.0)) - 0.65000004)
		ExtendCrc RockMeter_Needle <player_Text> out = needle
		setScreenElementProps Id = <needle> anglez = <rot>
	endif
	<run> = ($<player_status>.current_run)
	if NOT (<last_run> = <run>)
		<last_run> = <run>
		<Bulbs> = 0
		if (<run> > 40)
			<Bulbs> = 10
		else
			if (<run> > 30)
				<Bulbs> = (<run> - 30)
			else
				if (<run> > 20)
					<Bulbs> = (<run> - 20)
				else
					if (<run> > 10)
						<Bulbs> = (<run> - 10)
					else
						<Bulbs> = <run>
					endif
				endif
			endif
		endif
		Index = 0
		begin
		formatText Checksumname = dark_bulb 'ScoreMeter_Bulb%n%p' N = <Index> P = <player_Text>
		formatText Checksumname = lit_bulb 'ScoreMeter_Bulb_Lit%n%p' N = <Index> P = <player_Text>
		if (<Bulbs> > <Index>)
			DoScreenElementMorph Id = <dark_bulb> Alpha = 0
			DoScreenElementMorph Id = <lit_bulb> Alpha = 1
		else
			DoScreenElementMorph Id = <dark_bulb> Alpha = 1
			DoScreenElementMorph Id = <lit_bulb> Alpha = 0
		endif
		<Index> = (<Index> + 1)
		repeat 10
		get_current_multiplier <...>
		mults = [1 , 2 , 3 , 4 , 6 , 8]
		idx = 0
		begin
		<Index> = (<mults> [<idx>])
		formatText Checksumname = multiplier_element 'ScoreMeter_Multiplier%n%p' N = <Index> P = <player_Text>
		if (<Multiplier> = <Index>)
			DoScreenElementMorph Id = <multiplier_element> Alpha = 1
		else
			DoScreenElementMorph Id = <multiplier_element> Alpha = 0
		endif
		<idx> = (<idx> + 1)
		repeat 6
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script get_current_multiplier 
	Multiplier = 4
	if ($<player_status>.current_run < 10)
		<Multiplier> = 1
		elseif ($<player_status>.current_run < 20)
		<Multiplier> = 2
		elseif ($<player_status>.current_run < 30)
		<Multiplier> = 3
	endif
	if ($<player_status>.star_power_used = 1)
		<Multiplier> = (<Multiplier> * 2)
	endif
	return <...>
endscript
