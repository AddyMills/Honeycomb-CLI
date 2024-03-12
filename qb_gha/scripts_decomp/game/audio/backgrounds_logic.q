
script Skate8_SFX_Backgrounds_New_Area \{immediate = 0}
	change SFX_Background_Last_Area = <BG_SFX_Area>
	if (<immediate> = 0)
		wait \{1 gameframe}
	endif
	change SFX_Background_Requested_Area = <BG_SFX_Area>
	Check_For_Specific_BGs_In_Struct
	spawnscriptnow \{Skate8_SFX_Background_Play}
endscript

script Skate8_SFX_Request_Background_Area_Change 
	change SFX_Background_Requested_Area = <BG_SFX_Area>
endscript
SFX_Background_Last_Area = `default`
SFX_Background_Requested_Area = `default`
SFX_Background_Requested_Checksum = `default`
SFX_Background_Requested_Volume = 60
SFX_Background_Current_Area = `default`
SFX_Background_Current_Checksum = `default`
SFX_Background_Current_Volume = 100
SFX_Background_Previous_Area = `default`
SFX_Background_Previous_Checksum = `default`
SFX_Background_FadeIn_Area = `default`
SFX_Background_FadeIn_Checksum = `default`
SFX_Background_FadeIn_Volume_Start = 1.0
SFX_Background_FadeIn_Volume_Target = 100.0
SFX_Background_FadeIn_Volume_Current = 1.0
SFX_Background_FadeIn_Volume_Add = 3.0
SFX_Background_FadingOut_Area = `default`
SFX_Background_FadingOut_Checksum = `default`
SFX_Background_FadeOut_Volume_Start = 100.0
SFX_Background_FadeOut_Volume_Target = 0.0
SFX_Background_FadeOut_Volume_Current = 100.0
SFX_Background_FadeOut_Volume_Subtract = 3.0
SFX_Background_CrossFade_Time = 0.75
Background_CrossFade_GameFrames = 90
Backgrounds_Master_Volume = 50.0
PleaseDOCrossfade = 1
SFX_Background_IS_Crossfading = FALSE
CurrentlyPlayingOneShotSoundEvent = DoNothing_OneShot
CurrentOneShotWaitTime = 15

script Check_For_Specific_BGs_In_Struct 
	SetSpawnInstanceLimits \{max = 1 management = kill_oldest}
	Local_Var_Struct = ($SFX_Background_Requested_Area)
	if StructureContains structure = $Skate8_SFX_Background_Areas_And_States <Local_Var_Struct>
		Check_For_TOD_BGs_In_Struct <...>
	else
	endif
endscript

script Check_For_TOD_BGs_In_Struct 
	<current_time> = day
	this_current_TOD_name = <current_time>
	if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) <this_current_TOD_name>
		change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.<this_current_TOD_name>)
	else
		if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) Afternoon
			change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.Afternoon)
		else
			if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>) `default`
				change SFX_Background_Requested_Checksum = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct>.`default`)
			else
			endif
		endif
	endif
endscript

script Skate8_SFX_Background_Play 
	SetSpawnInstanceLimits \{max = 1 management = kill_oldest}
	wait \{2 gameframes}
	if ($SFX_Background_IS_Crossfading = TRUE)
		if NOT issoundplaying \{$SFX_Background_FadeIn_Checksum}
			change \{SFX_Background_FadeIn_Checksum = None}
		endif
		if ($SFX_Background_Requested_Checksum = ($SFX_Background_FadeIn_Checksum))
		else
			if ($SFX_Background_Requested_Checksum = ($SFX_Background_FadingOut_Checksum))
				if ($BackgroundSFXDebugPrintToScreen = 1)
					FormatText textname = my_text "BG: %n" n = ($SFX_Background_FadingOut_Checksum) DontAssertForChecksums
					create_panel_message {text = <my_text>
						Pos = (30.0, 380.0)
						rgba = [144 32 32 100]
						font_face = text_a1
						time = 180000
						just = [left left]
						id = SFX_BG_PANEL_MESSAGE
					}
				endif
				Skate8_SFX_Reverse_Background_Fading
			else
				Skate8_SFX_Quick_Dip
				if ($BackgroundSFXDebugPrintToScreen = 1)
					FormatText textname = my_text "BG: %n" n = ($SFX_Background_Requested_Checksum) DontAssertForChecksums
					create_panel_message {text = <my_text>
						Pos = (30.0, 380.0)
						rgba = [144 32 32 100]
						font_face = text_a1
						time = 180000
						just = [left left]
						id = SFX_BG_PANEL_MESSAGE
					}
				endif
				spawnscriptnow \{Skate8_SFX_Change_Background}
			endif
		endif
	else
		if NOT issoundplaying \{$SFX_Background_Current_Checksum}
			change \{SFX_Background_Current_Checksum = None}
		endif
		if ($SFX_Background_Requested_Checksum = $SFX_Background_Current_Checksum)
		else
			if ($BackgroundSFXDebugPrintToScreen = 1)
				FormatText textname = my_text "BG: %n" n = ($SFX_Background_Requested_Checksum) DontAssertForChecksums
				create_panel_message {text = <my_text>
					Pos = (30.0, 380.0)
					rgba = [144 32 32 100]
					font_face = text_a1
					time = 180000
					just = [left left]
					id = SFX_BG_PANEL_MESSAGE
				}
			endif
			spawnscriptnow \{Skate8_SFX_Change_Background}
		endif
	endif
endscript

script Skate8_SFX_Change_Current_Area 
endscript

script Skate8_SFX_Change_Current_State 
endscript

script Skate8_SFX_Check_Current_Area 
endscript

script Skate8_SFX_Check_Current_State 
endscript

script Skate8_SFX_Do_NOT_Change_Background 
endscript

script Skate8_SFX_Change_Background 
	SetSpawnInstanceLimits \{max = 1 management = kill_oldest}
	change \{SFX_Background_IS_Crossfading = TRUE}
	change SFX_Background_FadeIn_Area = ($SFX_Background_Requested_Area)
	change SFX_Background_FadeIn_Checksum = ($SFX_Background_Requested_Checksum)
	change SFX_Background_FadingOut_Area = ($SFX_Background_Current_Area)
	change SFX_Background_FadingOut_Checksum = ($SFX_Background_Current_Checksum)
	Local_Var_Struct_FadeIn_Area = ($SFX_Background_FadeIn_Area)
	Local_Var_Struct_FadeIn_Checksum = ($SFX_Background_FadeIn_Checksum)
	Local_Var_Struct_FadeOut_Area = ($SFX_Background_FadingOut_Area)
	Local_Var_Struct_FadeOut_Checksum = ($SFX_Background_FadingOut_Checksum)
	if NOT (GotParam Overide_Crossfade_Time)
		change \{SFX_Background_CrossFade_Time = 0.75}
		if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>) Fade_From
			if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Fade_From) <Local_Var_Struct_FadeOut_Area>
				change SFX_Background_CrossFade_Time = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Fade_From.<Local_Var_Struct_FadeOut_Area>)
			endif
		endif
	else
		change SFX_Background_CrossFade_Time = <Overide_Crossfade_Time>
	endif
	change \{SFX_Background_FadeIn_Volume_Target = 100}
	if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>) Volume_Params
		if StructureContains structure = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Volume_Params) <Local_Var_Struct_FadeIn_Checksum>
			change SFX_Background_FadeIn_Volume_Target = ($Skate8_SFX_Background_Areas_And_States.<Local_Var_Struct_FadeIn_Area>.Volume_Params.<Local_Var_Struct_FadeIn_Checksum>)
		endif
	endif
	if NOT ($SFX_Background_CrossFade_Time = 0)
		temp_a = ($SFX_Background_CrossFade_Time * 30)
	else
		stars
		printf \{"SFX BG's WARNING: SFX_Background_CrossFade_Time = ZERO!!!!!!!!!!!!!"}
		stars
		temp_a = 1
	endif
	if NOT (GotParam Overide_FadeIn_Start_Vol)
		change \{SFX_Background_FadeIn_Volume_Start = 1}
	else
		change SFX_Background_FadeIn_Volume_Start = <Overide_FadeIn_Start_Vol>
	endif
	if NOT (GotParam Overide_FadeOut_Start_Vol)
		change SFX_Background_FadeOut_Volume_Start = ($SFX_Background_Current_Volume)
	else
		change SFX_Background_FadeOut_Volume_Start = <Overide_FadeOut_Start_Vol>
	endif
	change SFX_Background_FadeIn_Volume_Add = (($SFX_Background_FadeIn_Volume_Target - $SFX_Background_FadeIn_Volume_Start) / <temp_a>)
	change SFX_Background_FadeOut_Volume_Subtract = ($SFX_Background_FadeOut_Volume_Start / <temp_a>)
	CastToInteger \{temp_a}
	change Background_CrossFade_GameFrames = <temp_a>
	if ($Background_CrossFade_GameFrames < 1)
		change \{Background_CrossFade_GameFrames = 1}
	endif
	change \{SFX_Background_FadeIn_Volume_Current = $SFX_Background_FadeIn_Volume_Start}
	change \{SFX_Background_FadeOut_Volume_Current = $SFX_Background_FadeOut_Volume_Start}
	testing_a = (($SFX_Background_FadeIn_Volume_Start * ($Backgrounds_Master_Volume / 100.0)) + 1)
	if NOT (GotParam Overide_Yes)
		if ($PleaseDOCrossfade = 1)
			if IsStreamPlaying ($SFX_Background_FadeIn_Checksum)
				StopStream ($SFX_Background_FadeIn_Checksum)
				wait \{1 gameframe}
			endif
			playsound ($SFX_Background_FadeIn_Checksum) vol = (($SFX_Background_FadeIn_Volume_Start * ($Backgrounds_Master_Volume / 100.0)) + 1) num_loops = -1 priority = 105 buss = Crowd_Beds pan1x = -0.897089 pan1y = 0.1418498 pan2x = 0.88932973 pan2y = 0.15726662
		endif
	endif
	wait \{1 gameframe}
	temp_counter = 1
	begin
	change SFX_Background_FadeIn_Volume_Current = ($SFX_Background_FadeIn_Volume_Current + $SFX_Background_FadeIn_Volume_Add)
	change SFX_Background_FadeOut_Volume_Current = ($SFX_Background_FadeOut_Volume_Current - $SFX_Background_FadeOut_Volume_Subtract)
	if ($SFX_Background_FadeIn_Volume_Current > $SFX_Background_FadeIn_Volume_Target)
		change \{SFX_Background_FadeIn_Volume_Current = $SFX_Background_FadeIn_Volume_Target}
	endif
	if IsStreamPlaying ($SFX_Background_FadeIn_Checksum)
		setsoundparams ($SFX_Background_FadeIn_Checksum) vol = (($SFX_Background_FadeIn_Volume_Current * ($Backgrounds_Master_Volume / 100.0)) + 1)
	else
		playsound ($SFX_Background_FadeIn_Checksum) vol = (($SFX_Background_FadeIn_Volume_Current * ($Backgrounds_Master_Volume / 100.0)) + 1) num_loops = -1 priority = 105 buss = Crowd_Beds pan1x = -0.897089 pan1y = 0.1418498 pan2x = 0.88932973 pan2y = 0.15726662
	endif
	if ($SFX_Background_FadeOut_Volume_Current < 0)
		change \{SFX_Background_FadeOut_Volume_Current = 0}
	endif
	if IsStreamPlaying ($SFX_Background_FadingOut_Checksum)
		setsoundparams ($SFX_Background_FadingOut_Checksum) vol = (($SFX_Background_FadeOut_Volume_Current * ($Backgrounds_Master_Volume / 100.0)) + 1)
	endif
	temp_counter = (<temp_counter> + 1)
	wait \{1 gameframe}
	repeat $Background_CrossFade_GameFrames
	StopStream ($SFX_Background_FadingOut_Checksum)
	StopStream ($SFX_Background_FadingOut_Checksum)
	wait \{1 gameframe}
	StopStream ($SFX_Background_FadingOut_Checksum)
	change SFX_Background_Current_Area = ($SFX_Background_FadeIn_Area)
	change SFX_Background_Current_Checksum = ($SFX_Background_FadeIn_Checksum)
	change SFX_Background_Current_Volume = ($SFX_Background_FadeIn_Volume_Current)
	change \{SFX_Background_FadeIn_Checksum = `default`}
	change \{SFX_Background_FadingOut_Checksum = `default`}
	change \{SFX_Background_Requested_Area = `default`}
	change \{SFX_Background_Requested_Checksum = `default`}
	change \{SFX_Background_IS_Crossfading = FALSE}
endscript

script Skate8_SFX_Reverse_Background_Fading 
	KillSpawnedScript \{name = Skate8_SFX_Change_Background}
	change SFX_Background_Current_Checksum = ($SFX_Background_FadeIn_Checksum)
	change SFX_Background_Requested_Checksum = ($SFX_Background_FadingOut_Checksum)
	change SFX_Background_Requested_Area = ($SFX_Background_FadingOut_Area)
	change SFX_Background_Current_Area = ($SFX_Background_FadeIn_Area)
	Local_Overide_Calc = ($SFX_Background_CrossFade_Time * ($SFX_Background_FadeIn_Volume_Current / $SFX_Background_FadeIn_Volume_Target))
	spawnscriptnow Skate8_SFX_Change_Background params = {Overide_Yes = 1 Overide_Crossfade_Time = <Local_Overide_Calc> Overide_FadeOut_Start_Vol = ($SFX_Background_FadeIn_Volume_Current) Overide_FadeIn_Start_Vol = ($SFX_Background_FadeOut_Volume_Current)}
endscript

script Skate8_SFX_Quick_Dip 
	KillSpawnedScript \{name = Skate8_SFX_Change_Background}
	New_Requested_Area_Not_Playing = ($SFX_Background_Requested_Area)
	New_Requested_Checksum_Not_Playing = ($SFX_Background_Requested_Checksum)
	change SFX_Background_Requested_Area = ($SFX_Background_FadeIn_Area)
	change SFX_Background_Requested_Checksum = ($SFX_Background_FadeIn_Checksum)
	Local_Overide_Calc = (0.5 * ($SFX_Background_CrossFade_Time * ($SFX_Background_FadeIn_Volume_Current / $SFX_Background_FadeIn_Volume_Target)))
	spawnscriptnow Skate8_SFX_Change_Background params = {Overide_Yes = 1 Overide_Crossfade_Time = <Local_Overide_Calc> Overide_FadeIn_Start_Vol = ($SFX_Background_FadeIn_Volume_Current) Overide_FadeOut_Start_Vol = ($SFX_Background_FadeOut_Volume_Current)}
	wait \{5 gameframes}
	begin
	if ($SFX_Background_IS_Crossfading = FALSE)
		break
	endif
	wait \{1 gameframe}
	repeat
	change SFX_Background_Requested_Area = <New_Requested_Area_Not_Playing>
	change SFX_Background_Requested_Checksum = <New_Requested_Checksum_Not_Playing>
	wait \{1 gameframe}
	spawnscriptnow \{Skate8_SFX_Change_Background}
endscript

script One_Shot_SoundEvent \{waittime = 15 immediate = 0}
	if GotParam \{SoundEvent}
		RequestedSoundEvent = <SoundEvent>
	else
		RequestedSoundEvent = DoNothing_OneShot
	endif
	LocalCurrentlyPlaying = $CurrentlyPlayingOneShotSoundEvent
	if (<LocalCurrentlyPlaying> = <RequestedSoundEvent>)
		if NOT ($CurrentOneShotWaitTime = <waittime>)
			DoActualChangeingOfOneShots <...>
		endif
	else
		DoActualChangeingOfOneShots <...>
	endif
endscript

script DoActualChangeingOfOneShots \{immediate = 0}
	if isSoundEventplaying <LocalCurrentlyPlaying>
		WaitForOneShotSoundEventToEnd <...>
	endif
	KillSpawnedScript \{name = SpawnedOneShotBeginRepeatLoop}
	spawnscriptnow SpawnedOneShotBeginRepeatLoop params = {myoneshot = <RequestedSoundEvent> waittime = <waittime>}
	change CurrentlyPlayingOneShotSoundEvent = <RequestedSoundEvent>
	change CurrentOneShotWaitTime = <waittime>
endscript

script SpawnedOneShotBeginRepeatLoop \{waittime = 15}
	if NOT (<myoneshot> = DoNothing_OneShot)
		wait (RandomRange (0.3, 0.5) * <waittime>) seconds
		begin
		SoundEvent event = <myoneshot>
		begin
		if isSoundEventplaying <myoneshot>
			wait \{1 gameframe}
		else
			break
		endif
		repeat
		wait (RandomRange (0.9, 1.6) * <waittime>) seconds
		repeat
	else
	endif
endscript

script WaitForOneShotSoundEventToEnd \{immediate = 0}
	if (<immediate> = 1)
		printf \{"WaitForOneShotSoundEventToEnd IMMEDIATE"}
		if (isSoundEventplaying <LocalCurrentlyPlaying>)
			stopsoundevent <LocalCurrentlyPlaying>
		endif
		return
	endif
	begin
	if (isSoundEventplaying <LocalCurrentlyPlaying>)
	else
		break
	endif
	wait \{1 gameframe}
	repeat
endscript
