
script flashsounds 
	EnableRemoveSoundEntry \{Enable}
	STARS
	Printf \{"Flashing global_sfx pak"}
	unloadpak \{'zones/global/global_sfx.pak' Heap = heap_audio localized}
	WaitUnloadPak \{'zones/global/global_sfx.pak'}
	LoadPak \{'zones/global/global_sfx.pak' no_vram Heap = heap_audio localized}
	STARS
	Printf \{"Sfx Pak flashing done."}
endscript
SfxPreviewEventTree_FAM = {
	Type = FAM
	[
		{
			Type = Source
			Anim = sk9_skater_Default
		}
	]
}

script SfxCreateTestFAMObject 
	if compositeObjectexists \{SfxPreviewEventObject}
		SfxPreviewEventObject :DIE
	endif
	Skater :Obj_GetPosition
	Skater :obj_getquat
	CreateCompositeObject Priority = COIM_Priority_Permanent Heap = Generic {
		components = [{component = setdisplaymatrix} {component = animtree}
			{component = Skeleton} {component = model}
			{component = agent} {component = FAM} {component = Stream}]
		Params = {Name = SfxPreviewEventObject pos = <pos> orientation = <quat> cloneFrom = Skater
			skeletonName = sk9_skater species = human voice_profile = TeenMaleSkater1 sex = male
			notice_radius = 6.0 agent_stats = stats_player faction = $faction_test}
	}
	SfxPreviewEventObject :Anim_InitTree \{Tree = SfxPreviewEventTree_FAM NodeIdDeclaration = [FAM]}
endscript

script SfxCreateTestObject 
	if compositeObjectexists \{SfxPreviewEventObject}
		SfxPreviewEventObject :DIE
	endif
	GetCurrentCameraObject
	<camID> :Obj_GetPosition
	<camID> :obj_getquat
	pos = (<pos> + (10 * <quat>))
	CreateCompositeObject Priority = COIM_Priority_Permanent Heap = Generic {
		components = [{component = Sound}]
		Params = {Name = SfxPreviewEventObject pos = <pos> orientation = <quat>}
	}
endscript

script SfxDestroyTestObject 
	if compositeObjectexists \{SfxPreviewEventObject}
		SfxPreviewEventObject :DIE
	endif
endscript

script PreviewSoundEvent 
	ExtendCrc <Event> '_container' out = container_name
	if structureContains Structure = $<container_name> Command
		Printf "Previewing SoundEvent %s" S = <Event>
		if checksumequals A = ($<container_name>.Command) B = PlaySound
			Printf \{"Playsound!"}
			Soundevent Event = <Event>
			elseif checksumequals A = ($<container_name>.Command) B = Obj_PlaySound
			Printf \{"Obj_Playsound!"}
			SfxCreateTestObject
			Soundevent Event = <Event> Object = SfxPreviewEventObject
			elseif checksumequals A = ($<container_name>.Command) B = Agent_PlayVO
			Printf \{"Agent_PlayVO!"}
			<stream_priority> = 1
			<logic_priority> = 50
			<animate_mouth> = TRUE
			<buss_id> = DEFAULT
			<no_pitch_mod> = FALSE
			<use_pos_info> = TRUE
			<can_use_stream> = TRUE
			<dropoff> = 50
			<dropoff_function> = standard
			SfxCreateTestFAMObject
			Soundevent Event = <Event> Object = SfxPreviewEventObject <...>
		else
			Printf \{"Sound Event Command is invalid"}
		endif
		waitTime = 0
		begin
		if NOT (issoundeventplaying <Event>)
			break
		endif
		if (<waitTime> > 200)
			StopSoundEvent <Event>
			break
		endif
		Wait \{0.1 Seconds}
		waitTime = (<waitTime> + 1)
		repeat
		SfxDestroyTestObject
	else
		Printf "sound event does not exist: %s" S = <container_name>
	endif
endscript
