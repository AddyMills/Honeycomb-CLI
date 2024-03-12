current_crowd = 1.0
average_crowd = 1.0
total_crowd = 0.0
max_crowd = 0.0
crowd_scale = 2.0
health_scale = 2.0
crowd_debug_mode = 0
viewercam_nofail = 0

script crowd_reset 
	if ($game_mode = tutorial)
		return
	endif
	if GetNodeFlag \{ls_encore_post}
		change \{current_crowd = 1.6666}
		change \{average_crowd = 1.6666}
	else
		change \{current_crowd = 1.0}
		change \{average_crowd = 1.0}
	endif
	change \{total_crowd = 0.0}
	change \{max_crowd = 0.0}
	change \{last_time_in_lead = 0.0}
	change \{last_time_in_lead_player = -1}
	if (<player> = 1)
		stopsoundevent \{$CurrentlyPlayingOneShotSoundEvent}
		if ($game_mode = training)
			BG_Crowd_Front_End_Silence \{immediate = 1}
			elseif ($end_credits = 1 ||
				GetNodeFlag ls_encore_post)
			printf \{channel = sfx "crowd_reset LS_ENCORE_POST"}
			change_crowd_looping_sfx \{crowd_looping_state = good}
		else
			printf \{channel = sfx "NOT - crowd_reset LS_ENCORE_POST"}
			change_crowd_looping_sfx \{crowd_looping_state = neutral}
		endif
	endif
	if GetNodeFlag \{ls_encore_post}
		if NOT ($game_mode = p2_battle)
			change structurename = <player_status> current_health = 1.6666
		else
			change structurename = <player_status> current_health = 1.0
		endif
	else
		change structurename = <player_status> current_health = 1.0
	endif
	if ($game_mode = p2_battle && $battle_sudden_death = 1)
		change structurename = <player_status> current_health = ($<player_status>.save_health)
	endif
	CrowdReset
endscript

script forcescore 
	switch $debug_forcescore
		case poor
		health = ($health_poor_medium / 2)
		case medium
		health = (($health_poor_medium + $health_medium_good) / 2)
		case good
		health = (($health_medium_good + $health_scale) / 2)
		default
		health = ($health_poor_medium / 2)
	endswitch
	change structurename = <player_status> current_health = <health>
	change current_crowd = <health>
endscript
z_wikker_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_wikker/z_wikker.tex
		assetcontext = Z_Wikker
		triggerscript = Z_Wikker_Crowd_Peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_wikker/z_wikker.tex
		assetcontext = Z_Wikker
		triggerscript = Z_Wikker_Crowd_Peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_wikker/z_wikker.tex
		assetcontext = Z_Wikker
		triggerscript = Z_Wikker_Crowd_Peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = tex/zones/Demo/tw_billboard04.dds
		texdict = zones/z_wikker/z_wikker.tex
		assetcontext = Z_Wikker
		triggerscript = Z_Wikker_Crowd_Peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = tex/zones/Demo/tw_billboard05.dds
		texdict = zones/z_wikker/z_wikker.tex
		assetcontext = Z_Wikker
		triggerscript = Z_Wikker_Crowd_Peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = tex/zones/Demo/tw_billboard06.dds
		texdict = zones/z_wikker/z_wikker.tex
		assetcontext = Z_Wikker
		triggerscript = Z_Wikker_Crowd_Peds
		params = {
			name = crowd6
		}
	}
]
z_dive_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_dive/z_dive.tex
		assetcontext = z_dive
		triggerscript = Z_Dive_Crowd_Peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_dive/z_dive.tex
		assetcontext = z_dive
		triggerscript = Z_Dive_Crowd_Peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_dive/z_dive.tex
		assetcontext = z_dive
		triggerscript = Z_Dive_Crowd_Peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = tex/zones/Demo/tw_billboard04.dds
		texdict = zones/z_dive/z_dive.tex
		assetcontext = z_dive
		triggerscript = Z_Dive_Crowd_Peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = tex/zones/Demo/tw_billboard05.dds
		texdict = zones/z_dive/z_dive.tex
		assetcontext = z_dive
		triggerscript = Z_Dive_Crowd_Peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = tex/zones/Demo/tw_billboard06.dds
		texdict = zones/z_dive/z_dive.tex
		assetcontext = z_dive
		triggerscript = Z_Dive_Crowd_Peds
		params = {
			name = crowd6
		}
	}
]
z_artdeco_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_artdeco/z_artdeco.tex
		assetcontext = z_artdeco
		triggerscript = z_artdeco_Crowd_Peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_artdeco/z_artdeco.tex
		assetcontext = z_artdeco
		triggerscript = z_artdeco_Crowd_Peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_artdeco/z_artdeco.tex
		assetcontext = z_artdeco
		triggerscript = z_artdeco_Crowd_Peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = tex/zones/Demo/tw_billboard04.dds
		texdict = zones/z_artdeco/z_artdeco.tex
		assetcontext = z_artdeco
		triggerscript = z_artdeco_Crowd_Peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = tex/zones/Demo/tw_billboard05.dds
		texdict = zones/z_artdeco/z_artdeco.tex
		assetcontext = z_artdeco
		triggerscript = z_artdeco_Crowd_Peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = tex/zones/Demo/tw_billboard06.dds
		texdict = zones/z_artdeco/z_artdeco.tex
		assetcontext = z_artdeco
		triggerscript = z_artdeco_Crowd_Peds
		params = {
			name = crowd6
		}
	}
]
z_prison_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_prison/z_prison.tex
		assetcontext = z_prison
		triggerscript = z_prison_Crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_prison/z_prison.tex
		assetcontext = z_prison
		triggerscript = z_prison_Crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_prison/z_prison.tex
		assetcontext = z_prison
		triggerscript = z_prison_Crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = tex/zones/Demo/tw_billboard04.dds
		texdict = zones/z_prison/z_prison.tex
		assetcontext = z_prison
		triggerscript = z_prison_Crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = tex/zones/Demo/tw_billboard05.dds
		texdict = zones/z_prison/z_prison.tex
		assetcontext = z_prison
		triggerscript = z_prison_Crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = tex/zones/Demo/tw_billboard06.dds
		texdict = zones/z_prison/z_prison.tex
		assetcontext = z_prison
		triggerscript = z_prison_Crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_party_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_party/z_party.tex
		assetcontext = z_party
		triggerscript = z_party_Crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_party/z_party.tex
		assetcontext = z_party
		triggerscript = z_party_Crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_party/z_party.tex
		assetcontext = z_party
		triggerscript = z_party_Crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = tex/zones/Demo/tw_billboard04.dds
		texdict = zones/z_party/z_party.tex
		assetcontext = z_party
		triggerscript = z_party_Crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = tex/zones/Demo/tw_billboard05.dds
		texdict = zones/z_party/z_party.tex
		assetcontext = z_party
		triggerscript = z_party_Crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = tex/zones/Demo/tw_billboard06.dds
		texdict = zones/z_party/z_party.tex
		assetcontext = z_party
		triggerscript = z_party_Crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_hell_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Biker_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_hell/z_hell.tex
		assetcontext = z_hell
		triggerscript = Z_hell_Crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Biker_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_hell/z_hell.tex
		assetcontext = z_hell
		triggerscript = Z_hell_Crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Biker_01.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_hell/z_hell.tex
		assetcontext = z_hell
		triggerscript = Z_hell_Crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Biker_02.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = tex/zones/Demo/tw_billboard04.dds
		texdict = zones/z_hell/z_hell.tex
		assetcontext = z_hell
		triggerscript = Z_hell_Crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_Biker_01.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = tex/zones/Demo/tw_billboard05.dds
		texdict = zones/z_hell/z_hell.tex
		assetcontext = z_hell
		triggerscript = Z_hell_Crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_biker_02.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = tex/zones/Demo/tw_billboard06.dds
		texdict = zones/z_hell/z_hell.tex
		assetcontext = z_hell
		triggerscript = Z_hell_Crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_training_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Characters\\Musicians\\Sec_Barker.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_training/z_training.tex
		assetcontext = z_training
		triggerscript = Z_Training_Crowd_Peds
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Characters\\Musicians\\Sec_Punk.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_training/z_training.tex
		assetcontext = z_training
		triggerscript = Z_Training_Crowd_Peds
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Characters\\Musicians\\Sec_Pro_Stabb.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_training/z_training.tex
		assetcontext = z_training
		triggerscript = Z_Training_Crowd_Peds
	}
]
z_Budokan_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_Budokan/z_Budokan.tex
		assetcontext = z_budokan
		triggerscript = Z_Budokan_Crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_Budokan/z_Budokan.tex
		assetcontext = z_budokan
		triggerscript = Z_Budokan_Crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_Budokan/z_Budokan.tex
		assetcontext = z_budokan
		triggerscript = Z_Budokan_Crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = tex/zones/Demo/tw_billboard04.dds
		texdict = zones/z_Budokan/z_Budokan.tex
		assetcontext = z_budokan
		triggerscript = Z_Budokan_Crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = tex/zones/Demo/tw_billboard05.dds
		texdict = zones/z_Budokan/z_Budokan.tex
		assetcontext = z_budokan
		triggerscript = Z_Budokan_Crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = tex/zones/Demo/tw_billboard06.dds
		texdict = zones/z_Budokan/z_Budokan.tex
		assetcontext = z_budokan
		triggerscript = Z_Budokan_Crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_video_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = tex/zones/Demo/tw_billboard01.dds
		texdict = zones/z_video/z_video.tex
		assetcontext = z_video
		triggerscript = z_video_Crowd_peds
		params = {
			name = crowd1
		}
		roty = -90
	}
	{
		name = crowd2
		camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = tex/zones/Demo/tw_billboard02.dds
		texdict = zones/z_video/z_video.tex
		assetcontext = z_video
		triggerscript = z_video_Crowd_peds
		params = {
			name = crowd2
		}
		roty = -90
	}
	{
		name = crowd3
		camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = tex/zones/Demo/tw_billboard03.dds
		texdict = zones/z_video/z_video.tex
		assetcontext = z_video
		triggerscript = z_video_Crowd_peds
		params = {
			name = crowd3
		}
		roty = -90
	}
	{
		name = crowd4
		camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = tex/zones/Demo/tw_billboard04.dds
		texdict = zones/z_video/z_video.tex
		assetcontext = z_video
		triggerscript = z_video_Crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = tex/zones/Demo/tw_billboard05.dds
		texdict = zones/z_video/z_video.tex
		assetcontext = z_video
		triggerscript = z_video_Crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = tex/zones/Demo/tw_billboard06.dds
		texdict = zones/z_video/z_video.tex
		assetcontext = z_video
		triggerscript = z_video_Crowd_peds
		params = {
			name = crowd6
		}
	}
	{
		name = crowd7
		camera = crowd7_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd7_cam_viewport
		texture = viewport7
		textureasset = tex/zones/Demo/tw_billboard07.dds
		texdict = zones/z_video/z_video.tex
		assetcontext = z_video
		triggerscript = z_video_Crowd_peds
		params = {
			name = crowd7
		}
		roty = 90
	}
	{
		name = crowd8
		camera = crowd8_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd8_cam_viewport
		texture = viewport8
		textureasset = tex/zones/Demo/tw_billboard08.dds
		texdict = zones/z_video/z_video.tex
		assetcontext = z_video
		triggerscript = z_video_Crowd_peds
		params = {
			name = crowd8
		}
		roty = 90
	}
]

script create_crowd_models 
	if ($disable_crowd = 1)
		return
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = crowd_models '%s_crowd_models' s = <pakname>
	if NOT globalexists name = <crowd_models>
		return
	endif
	change crowd_model_array = <crowd_models>
	GetArraySize $<crowd_models>
	array_count = 0
	begin
	Pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].id)
	camera = ($<crowd_models> [<array_count>].camera)
	if NOT StructureContains structure = ($<crowd_models> [<array_count>]) remap_only
		MemPushContext \{bottomupheap}
		CreateFromStructure {
			Pos = <Pos>
			Quat = (0.0, 1.0, 0.0)
			class = gameobject
			type = Ghost
			createdatstart
			($<crowd_models> [<array_count>])
			suspenddistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			profile = $Profile_Ped_Crowd_Obj
			lightgroup = crowd
			object_type = crowd
			profilecolor = 49344
			profilebudget = 200
			use_jq
		}
		model_id = ($<crowd_models> [<array_count>].name)
		extra_model = 'Real_Crowd\\Crowd_HandL_Lighter.skin'
		<model_id> :addgeom lhand_lighter Model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :addgeom lhand_rock Model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :addgeom lhand_clap Model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Fist.skin'
		<model_id> :addgeom lhand_fist Model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Lighter.skin'
		<model_id> :addgeom rhand_lighter Model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
		<model_id> :addgeom rhand_rock Model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
		<model_id> :addgeom rhand_clap Model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		<model_id> :addgeom rhand_fist Model = <extra_model> lightgroup = crowd
		<model_id> :switchoffatomic lhand_lighter
		<model_id> :switchoffatomic lhand_rock
		<model_id> :switchoffatomic lhand_fist
		<model_id> :switchonatomic lhand_clap
		<model_id> :switchoffatomic rhand_lighter
		<model_id> :switchoffatomic rhand_rock
		<model_id> :switchoffatomic rhand_fist
		<model_id> :switchonatomic rhand_clap
		if StructureContains structure = ($<crowd_models> [<array_count>]) roty
			($<crowd_models> [<array_count>].name) :obj_setorientation y = ($<crowd_models> [<array_count>].roty)
			apply_correction = 0
		else
			apply_correction = 1
		endif
		MemPopContext \{bottomupheap}
		style = imposter_rendering
		if (<array_size> <= 6)
			if IsXenon
				style = imposter_rendering_highres
			endif
		endif
		CreateScreenElement {
			parent = root_window
			just = [center center]
			type = viewportelement
			id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			Pos = (2000.0, 200.0)
			dims = (64.0, 64.0)
			alpha = 1
			style = <style>
		}
		CreateCompositeObjectInstance {
			priority = $coim_priority_permanent
			heap = generic
			Components = [
				{Component = camera}
			]
			params = {
				name = <camera>
				viewport = <viewport>
				object_type = crowd
				profilecolor = 12632064
				profilebudget = 10
				use_jq
				far_clip = 20
			}
		}
		SetActiveCamera viewport = <viewport> id = <camera>
		<camera> :sethfov hfov = 20.0
		SetViewportProperties viewport = <viewport> no_resolve_depthstencilbuffer = TRUE
		AddCrowdModelCam camera = <camera> Pos = <Pos> viewport = <viewport> apply_correction = <apply_correction>
	endif
	setsearchallassetcontexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = ($<crowd_models> [<array_count>].textureasset)
		texdict = ($<crowd_models> [<array_count>].texdict)
	}
	setsearchallassetcontexts \{Off}
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script update_crowd_model_cam 
	crowd_scaler = 25
	begin
	GetViewportCameraOrient \{viewport = bg_viewport}
	GetVectorComponents <at>
	Angle = (<x> * <crowd_scaler>)
	RotateVector vector = <at> ry = <Angle>
	at = <result_vector>
	RotateVector vector = <left> ry = <Angle>
	left = <result_vector>
	RotateVector vector = <up> ry = <Angle>
	up = <result_vector>
	posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
	<camera> :obj_setposition position = <posdir>
	<camera> :obj_setorientation dir = <at> only handles upright cameras
	SetViewportCameraOrient viewport = <viewport> at = <at> left = <left> up = <up>
	<camera> :UnPause
	wait \{1 gameframe}
	repeat
endscript

script destroy_crowd_models 
	ClearCrowdModelCams
	crowd_models = $crowd_model_array
	if (<crowd_models> = None)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	if NOT StructureContains structure = (<crowd_models> [<array_count>]) remap_only
		KillSpawnedScript \{name = update_crowd_model_cam}
		if CompositeObjectExists name = (<crowd_models> [<array_count>].camera)
			(<crowd_models> [<array_count>].camera) :Die
		endif
		if ScreenElementExists id = (<crowd_models> [<array_count>].id)
			setsearchallassetcontexts
			DestroyViewportTextureOverride id = (<crowd_models> [<array_count>].id)
			setsearchallassetcontexts \{Off}
			DestroyScreenElement id = (<crowd_models> [<array_count>].id)
		endif
		if CompositeObjectExists name = (<crowd_models> [<array_count>].name)
			(<crowd_models> [<array_count>].name) :Die
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	change \{crowd_model_array = None}
endscript

script set_crowd_hand \{Hand = left type = clap}
	obj_getid
	name = <ObjID>
	if (<Hand> = left)
		switch (<type>)
			case lighter
			part = lhand_lighter
			case rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			part = lhand_fist
		endswitch
		<name> :switchoffatomic lhand_lighter
		<name> :switchoffatomic lhand_rock
		<name> :switchoffatomic lhand_clap
		<name> :switchoffatomic lhand_fist
		<name> :switchonatomic <part>
	else
		switch (<type>)
			case lighter
			part = rhand_lighter
			case rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
		endswitch
		<name> :switchoffatomic rhand_lighter
		<name> :switchoffatomic rhand_rock
		<name> :switchoffatomic rhand_clap
		<name> :switchoffatomic rhand_fist
		<name> :switchonatomic <part>
	endif
endscript

script Crowd_SetHand \{name = crowd1 Hand = left type = clap}
	if CompositeObjectExists <name>
		<name> :set_crowd_hand Hand = <Hand> type = <type>
	endif
endscript

script Crowd_StartLighters 
	KillSpawnedScript \{name = crowd_monitor_performance}
	spawnscriptnow \{crowd_monitor_performance}
endscript

script crowd_monitor_performance 
	lighters_on = FALSE
	begin
	get_skill_level
	if (<skill> != bad)
		if (<lighters_on> = FALSE)
			Crowd_AllSetHand \{Hand = RIGHT type = lighter}
			Crowd_AllPlayAnim \{anim = special}
			lighters_on = TRUE
			Crowd_ToggleLighters \{on}
		endif
	else
		if (<lighters_on> = TRUE)
			Crowd_AllSetHand \{Hand = RIGHT type = clap}
			Crowd_AllPlayAnim \{anim = idle}
			lighters_on = FALSE
			Crowd_ToggleLighters \{Off}
		endif
	endif
	wait \{1 gameframe}
	repeat
endscript

script Crowd_StopLighters 
	KillSpawnedScript \{name = crowd_monitor_performance}
	Crowd_AllSetHand \{Hand = RIGHT type = clap}
	Crowd_AllPlayAnim \{anim = idle}
	Crowd_ToggleLighters \{Off}
endscript

script Crowd_AllSetHand 
	Crowd_SetHand name = crowd1 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd2 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd3 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd4 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd5 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd6 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd7 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd8 Hand = <Hand> type = <type>
endscript

script Crowd_AllPlayAnim 
	wait \{1 gameframe}
	Crowd_PlayAnim name = crowd1 anim = <anim>
	wait \{1 gameframe}
	Crowd_PlayAnim name = crowd2 anim = <anim>
	wait \{1 gameframe}
	Crowd_PlayAnim name = crowd3 anim = <anim>
	wait \{1 gameframe}
	Crowd_PlayAnim name = crowd4 anim = <anim>
	wait \{1 gameframe}
	Crowd_PlayAnim name = crowd5 anim = <anim>
	wait \{1 gameframe}
	Crowd_PlayAnim name = crowd6 anim = <anim>
	wait \{1 gameframe}
	Crowd_PlayAnim name = crowd7 anim = <anim>
	wait \{1 gameframe}
	Crowd_PlayAnim name = crowd8 anim = <anim>
endscript

script Crowd_PlayAnim \{name = crowd1 anim = idle}
	if NOT CompositeObjectExists <name>
		return
	endif
	if StructureContains structure = ($crowd_profiles) name = <name>
		anim_set = ($crowd_profiles.<name>.anim_set)
		<name> :obj_killspawnedscript name = crowd_play_adjusting_random_anims
		<name> :obj_spawnscriptnow crowd_play_adjusting_random_anims params = {anim_set = <anim_set> anim = <anim>}
	else
		printf channel = crowd "animset not found for %a......" a = <name>
	endif
endscript

script crowd_create_lighters 
	GetPakManCurrent \{map = zones}
	if (<pak> = z_artdeco)
		return
	endif
	GetPakManCurrentName \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		FormatText checksumname = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		FormatText checksumname = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if CompositeObjectExists name = <crowd_lighter>
		<crowd_lighter> :hide
	else
		if IsInNodeArray <crowd_lighter>
			if NOT IsCreated <crowd_lighter>
				Create name = <crowd_lighter>
				if CompositeObjectExists name = <crowd_lighter>
					<crowd_lighter> :hide
				else
					printf "failed to create lighter object %a! ...." a = <crowd_lighter>
				endif
			else
			endif
		else
		endif
	endif
	index = (<index> + 1)
	if (<index> = 15)
		break
	endif
	repeat
endscript

script Crowd_ToggleLighters 
	GetPakManCurrentName \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		FormatText checksumname = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		FormatText checksumname = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if CompositeObjectExists name = <crowd_lighter>
		if GotParam \{on}
			<crowd_lighter> :unhide
			elseif GotParam \{Off}
			<crowd_lighter> :hide
		endif
	endif
	index = (<index> + 1)
	if (<index> = 15)
		break
	endif
	repeat
endscript

script Crowd_StageDiver_Hide \{index = 1}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists name = <stagediver>
		<stagediver> :hide
	endif
endscript

script Crowd_StageDiver_Jump \{index = 1}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists name = <stagediver>
		<stagediver> :unhide
		GetPakManCurrent \{map = zones}
		if StructureContains structure = ($stagediver_anims) name = <pak>
			anims = ($stagediver_anims.<pak>)
		else
			anims = ($stagediver_anims.`default`)
		endif
		GetArraySize <anims>
		getrandomvalue name = anim_index integer a = 0 b = (<array_size> - 1)
		anim_name = (<anims> [<anim_index>])
		printf channel = crowd "Playing stagedive anim %a ....." a = <anim_name>
		<stagediver> :GameObj_PlayAnim anim = <anim_name>
		<stagediver> :GameObj_WaitAnimFinished
		<stagediver> :hide
	else
		printf \{channel = crowd "Stagediver not found........."}
	endif
endscript
