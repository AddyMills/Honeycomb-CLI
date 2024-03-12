ped_use_GELAI = 0
Ped_StaticAnimTree = {
	type = partialswitch
	id = PedBlendRoot
	[
		{
			type = degenerateblend
			id = PedFAMAnimParentNode
		}
		{
			type = degenerateblend
			id = PedMainAnimParentNode
		}
	]
}
Ped_StaticAnimTreeWithFace = {
	type = ik
	[
		{
			type = applydifference
			id = PedWithFace
			[
				{
					type = degenerateblend
					id = face
				}
				{
					type = partialswitch
					id = PedBlendRoot
					[
						{
							type = degenerateblend
							id = PedFAMAnimParentNode
						}
						{
							type = degenerateblend
							id = PedMainAnimParentNode
						}
					]
				}
			]
		}
	]
}
Ped_AnimBranch_Standard = {
	type = param_timer_type
	id = bodytimer
	Speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = on
	[
		{
			id = BodySource
			type = source
			anim = param_anim
		}
	]
}
Ped_AnimBranch_LookAt = {
	id = LookAtController
	type = DifferenceLookAt
	params = param_lookat_params
	target = param_lookat_target
	[
		{
			$Ped_AnimBranch_Standard
		}
	]
}
Ped_AnimBranch_FAMStandard = {
	type = param_timer_type
	id = FamTimer
	Speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = on
	[
		{
			id = PedFAMAnimNode
			type = source
			anim = param_anim
		}
	]
}
Ped_AnimBranch_FAMEmpty = {
	type = blank
}
Ped_AnimBranch_Flipped = {
	type = flip
	id = BodyFlip
	[
		{
			$Ped_AnimBranch_Standard
		}
	]
}
Ped_AnimBranch_Overlay = {
	type = param_timer_type
	id = bodytimer
	Speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = on
	[
		{
			id = BodyOverlay
			type = overlay
			anim = param_overlay
			[
				{
					id = BodySource
					type = source
					anim = param_anim
				}
			]
		}
	]
}
GameObj_AnimTree = {
	type = degenerateblend
	id = Body
}
GameObj_RagdollAnimTree = {
	type = ragdoll
	[
		{
			type = degenerateblend
			id = Body
		}
	]
}
gameobj_standardanimbranch = {
	type = timertype
	id = bodytimer
	anim = anim
	anim_events = animevents
	Speed = Speed
	start = start
	[
		{
			type = source
			anim = anim
		}
	]
}

script Ped_InitStaticAnimTree \{tree = $Ped_StaticAnimTree}
	anim_uninittree
	anim_inittree tree = <tree> nodeiddeclaration = [
		PedMainAnimParentNode
		PedFAMAnimParentNode
		PedBlendRoot
		FamTimer
		PedFAMAnimNode
		bodytimer
		BodySource
		BodyOverlay
		LookAtController
		PedWithFace
		face
		faceidle_timer
		face_timer
		face_source
	]
endscript

script Ped_AddDegenerateBlendBranch 
	Ped_Anim_Command \{command = degenerateblend_addbranch params = {tree = $Ped_AnimBranch_Standard params = {param_timer_type = play param_anim = Ped_M_Idle1}}}
	anim_updatepose
	anim_command \{command = degenerateblend_setnextblendduration params = {0.0}}
endscript

script Ped_PlayAnim \{anim = 0 target = PedMainAnimParentNode tree = $Ped_AnimBranch_Standard source = BodySource Flipped = 0}
	if GotParam \{norestart}
		if Ped_Anim_Command target = <source> command = source_animequals params = {<anim>}
			return
		endif
	endif
	timer_type = play
	if GotParam \{Cycle}
		timer_type = Cycle
	endif
	if GotParam \{Wobble}
		timer_type = Wobble
	endif
	if (<Flipped> = 1)
		<tree> = Ped_AnimBranch_Flipped
	endif
	if GotParam \{PartialAnimOverlay}
		Ped_Anim_Command target = Ped_AnimBranch_Overlay command = degenerateblend_addbranch params = {
			blendduration = <BlendPeriod>
			tree = <tree> params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_overlay = <PartialAnimOverlay>
				param_speed = <Speed>
				param_start = <start>
			}
		}
	else
		Ped_Anim_Command target = <target> command = degenerateblend_addbranch params = {
			blendduration = <BlendPeriod>
			tree = <tree> params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_speed = <Speed>
				param_start = <start>
				param_lookat_params = <lookat_params>
				param_lookat_target = <lookat_target>
			}
		}
	endif
	if (DEBUG_PEDINFO = 1)
		settags LastAnim = <anim>
	endif
endscript

script Ped_Anim_Command 
	anim_command <...>
	obj_getid
	getsingletag \{board_id}
	if GotParam \{board_id}
		if IsCreated <board_id>
			<board_id> :anim_command <...>
		endif
	endif
endscript

script Ped_WaitAnimFinished \{timer = bodytimer}
	Ped_Anim_Command target = <timer> command = timer_wait
endscript

script Ped_WaitAnim 
	Ped_Anim_Command target = bodytimer command = timer_wait params = {<...>}
endscript

script Ped_AnimComplete \{timer = bodytimer}
	if anim_command target = <timer> command = timer_isanimcomplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script Ped_AnimEquals 
	if anim_command target = BodySource command = source_animequals params = {<...>}
		return \{1}
	endif
	return \{0}
endscript

script Ped_GetAnimDuration \{timer = bodytimer}
	anim_command target = <timer> command = timer_getanimduration
	return <duration>
endscript

script Ped_SetAnimCycleMode 
	timer_type = Cycle
	if GotParam \{Off}
		timer_type = play
	endif
	anim_command \{target = BodySource command = source_getanimname}
	anim = <AnimName>
	anim_command \{target = bodytimer command = timer_getframefactor}
	start = <framefactor>
	anim_command target = PedMainAnimParentNode command = degenerateblend_addbranch params = {
		blendduration = <BlendPeriod>
		tree = $Ped_AnimBranch_Standard params = {
			param_timer_type = <timer_type>
			param_anim = <anim>
			param_speed = <Speed>
			param_start = <start>
		}
	}
endscript

script Ped_Flip 
endscript

script gameobj_init_animtree 
	if GotParam \{profile}
		AddParams <profile>
	endif
	if GotParam \{AnimTargets}
		anim_inittree {
			tree = <tree>
			defaultcommandtarget = <defaultcommandtarget>
			nodeiddeclaration = <AnimTargets>
			params = <AnimTreeParams>
			animeventtablename = <animeventtablename>
		}
		anim_enable \{Off}
	endif
endscript

script GameObj_PlayAnim \{target = Body tree = $gameobj_standardanimbranch timertype = play Speed = 1.0 start = 0.0 animevents = Off blendduration = -1.0}
	if NOT GotParam \{anim}
		anim_getdefaultanimname
		anim = <defaultanimname>
	endif
	anim_enable
	anim_command target = <target> command = degenerateblend_addbranch params = {
		tree = <tree>
		blendduration = <blendduration>
		params = {
			anim = <anim>
			Speed = <Speed>
			timertype = <timertype>
			start = <start>
			animevents = <animevents>
		}
	}
endscript

script GameObj_WaitAnimFinished \{timer = bodytimer}
	anim_command target = <timer> command = timer_waitanimcomplete
endscript

script GameObj_WaitAnim 
	anim_command target = bodytimer command = timer_wait params = {<...>}
endscript

script GameObj_AnimComplete \{timer = bodytimer}
	if anim_command target = <timer> command = timer_isanimcomplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script createobjlabel 
	obj_getid
	SpawnScriptLater MaintainObjLabel params = {ObjID = <ObjID>}
endscript

script MaintainObjLabel 
	<id> = (<ObjID> + 5)
	begin
	if CompositeObjectExists name = <ObjID>
		<ObjID> :obj_getposition
		FormatText textname = text "%a" a = <ObjID> nowarning
		if ObjectExists id = <id>
			SetScreenElementProps id = <id> text = <text> pos3d = (<Pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		else
			create_object_label id = <id> text = <text> pos3d = (<Pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		endif
	else
		if ScreenElementExists id = <id>
			DestroyScreenElement id = <id>
		endif
		break
	endif
	wait \{1 frame}
	repeat
endscript

script ped_disable_bones 
endscript

script ped_enable_bones 
endscript

script Ped_InitBehaviorFromProfile 
	if GotParam \{BehaviorInitScript}
		<BehaviorInitScript>
	endif
endscript

script create_ped_label 
	SetScreenElementLock \{id = root_window Off}
	CreateScreenElement {
		id = <id>
		type = TextBlockElement
		parent = root_window
		font = text_a1
		text = ""
		Scale = 1.0
		Pos = (0.0, 0.0)
		rgba = [0 128 0 128]
		dims = (250.0, 0.0)
		allow_expansion
		just = [center top]
	}
endscript

script destroy_ped_label 
	if ObjectExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script destroy_global_peds_in_zone 
	if NOT ($disable_global_pedestrians = 1)
		if NOT InNetGame
			if IsCOIMInited
				printf \{"destroy_global_peds_in_zone called"}
				CleanupGlobalPedNodeArray name = 'zones/z_peds/z_peds.qb' zone = <zone>
			endif
		endif
	endif
endscript

script spawn_global_peds_in_zone 
	if NOT ($disable_global_pedestrians = 1)
		if NOT InNetGame
			if IsCOIMInited
				printf \{"spawn_global_peds_in_zone called"}
				ParseGlobalPedNodeArray name = 'zones/z_peds/z_peds.qb' zone = <zone>
			endif
		endif
	endif
endscript
