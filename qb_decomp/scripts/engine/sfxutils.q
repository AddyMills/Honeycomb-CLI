
script flashsounds 
	EnableRemoveSoundEntry \{enable}
	stars
	printf \{"Flashing global_sfx pak"}
	UnloadPak \{'zones/global/global_sfx.pak' heap = heap_audio localized}
	WaitUnloadPak \{'zones/global/global_sfx.pak'}
	LoadPak \{'zones/global/global_sfx.pak'
		no_vram
		heap = heap_audio
		localized}
	stars
	printf \{"Sfx Pak flashing done."}
endscript
SfxPreviewEventTree_FAM = {
	type = fam
	[
		{
			type = source
			anim = sk9_skater_Default
		}
	]
}

script SfxCreateTestFAMObject 
	if CompositeObjectExists \{SfxPreviewEventObject}
		SfxPreviewEventObject :Die
	endif
	skater :obj_getposition
	skater :Obj_GetQuat
	CreateCompositeObject priority = coim_priority_permanent heap = generic {
		Components = [{Component = SetDisplayMatrix} {Component = AnimTree}
			{Component = skeleton} {Component = Model}
			{Component = Agent} {Component = fam} {Component = stream}]
		params = {name = SfxPreviewEventObject Pos = <Pos> Orientation = <Quat> CloneFrom = skater
			SkeletonName = sk9_skater species = human voice_profile = TeenMaleSkater1 sex = Male
			notice_radius = 6.0 agent_stats = stats_player faction = $faction_test}
	}
	SfxPreviewEventObject :anim_inittree \{tree = SfxPreviewEventTree_FAM nodeiddeclaration = [fam]}
endscript

script SfxCreateTestObject 
	if CompositeObjectExists \{SfxPreviewEventObject}
		SfxPreviewEventObject :Die
	endif
	GetCurrentCameraObject
	<camid> :obj_getposition
	<camid> :Obj_GetQuat
	Pos = (<Pos> + (10 * <Quat>))
	CreateCompositeObject priority = coim_priority_permanent heap = generic {
		Components = [{Component = sound}]
		params = {name = SfxPreviewEventObject Pos = <Pos> Orientation = <Quat>}
	}
endscript

script SfxDestroyTestObject 
	if CompositeObjectExists \{SfxPreviewEventObject}
		SfxPreviewEventObject :Die
	endif
endscript

script PreviewSoundEvent 
	extendcrc <event> '_container' out = container_name
	if StructureContains structure = $<container_name> command
		printf "Previewing SoundEvent %s" s = <event>
		if ChecksumEquals a = ($<container_name>.command) b = playsound
			printf \{"Playsound!"}
			SoundEvent event = <event>
		elseif ChecksumEquals a = ($<container_name>.command) b = obj_playsound
			printf \{"Obj_Playsound!"}
			SfxCreateTestObject
			SoundEvent event = <event> object = SfxPreviewEventObject
		elseif ChecksumEquals a = ($<container_name>.command) b = agent_playvo
			printf \{"Agent_PlayVO!"}
			<stream_priority> = 1
			<logic_priority> = 50
			<animate_mouth> = TRUE
			<buss_id> = `default`
			<no_pitch_mod> = FALSE
			<use_pos_info> = TRUE
			<can_use_stream> = TRUE
			<dropoff> = 50
			<dropoff_function> = standard
			SfxCreateTestFAMObject
			SoundEvent event = <event> object = SfxPreviewEventObject <...>
		else
			printf \{"Sound Event Command is invalid"}
		endif
		waittime = 0
		begin
		if NOT (isSoundEventplaying <event>)
			break
		endif
		if (<waittime> > 200)
			stopsoundevent <event>
			break
		endif
		wait \{0.1 seconds}
		waittime = (<waittime> + 1)
		repeat
		SfxDestroyTestObject
	else
		printf "sound event does not exist: %s" s = <container_name>
	endif
endscript
