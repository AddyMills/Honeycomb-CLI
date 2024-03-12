ped_use_GELAI = 0
Ped_StaticAnimTree = {
	Type = partialSwitch
	Id = PedBlendRoot
	[
		{
			Type = DegenerateBlend
			Id = PedFAMAnimParentNode
		}
		{
			Type = DegenerateBlend
			Id = PedMainAnimParentNode
		}
	]
}
Ped_StaticAnimTreeWithFace = {
	Type = Ik
	[
		{
			Type = ApplyDifference
			Id = PedWithFace
			[
				{
					Type = DegenerateBlend
					Id = Face
				}
				{
					Type = partialSwitch
					Id = PedBlendRoot
					[
						{
							Type = DegenerateBlend
							Id = PedFAMAnimParentNode
						}
						{
							Type = DegenerateBlend
							Id = PedMainAnimParentNode
						}
					]
				}
			]
		}
	]
}
Ped_AnimBranch_Standard = {
	Type = param_timer_type
	Id = BodyTimer
	speed = param_speed
	Start = param_start
	Anim = param_anim
	Anim_Events = On
	[
		{
			Id = BodySource
			Type = Source
			Anim = param_anim
		}
	]
}
Ped_AnimBranch_LookAt = {
	Id = LookAtController
	Type = DifferenceLookAt
	Params = param_lookat_params
	Target = param_lookat_target
	[
		{
			$Ped_AnimBranch_Standard
		}
	]
}
Ped_AnimBranch_FAMStandard = {
	Type = param_timer_type
	Id = FamTimer
	speed = param_speed
	Start = param_start
	Anim = param_anim
	Anim_Events = On
	[
		{
			Id = PedFAMAnimNode
			Type = Source
			Anim = param_anim
		}
	]
}
Ped_AnimBranch_FAMEmpty = {
	Type = Blank
}
Ped_AnimBranch_Flipped = {
	Type = Flip
	Id = BodyFlip
	[
		{
			$Ped_AnimBranch_Standard
		}
	]
}
Ped_AnimBranch_Overlay = {
	Type = param_timer_type
	Id = BodyTimer
	speed = param_speed
	Start = param_start
	Anim = param_anim
	Anim_Events = On
	[
		{
			Id = BodyOverlay
			Type = OVERLAY
			Anim = param_overlay
			[
				{
					Id = BodySource
					Type = Source
					Anim = param_anim
				}
			]
		}
	]
}
GameObj_AnimTree = {
	Type = DegenerateBlend
	Id = body
}
GameObj_RagdollAnimTree = {
	Type = Ragdoll
	[
		{
			Type = DegenerateBlend
			Id = body
		}
	]
}
GameObj_StandardAnimBranch = {
	Type = TimerType
	Id = BodyTimer
	Anim = Anim
	Anim_Events = AnimEvents
	speed = speed
	Start = Start
	[
		{
			Type = Source
			Anim = Anim
		}
	]
}

script Ped_InitStaticAnimTree \{Tree = $Ped_StaticAnimTree}
	Anim_UnInitTree
	Anim_InitTree Tree = <Tree> NodeIdDeclaration = [
		PedMainAnimParentNode
		PedFAMAnimParentNode
		PedBlendRoot
		FamTimer
		PedFAMAnimNode
		BodyTimer
		BodySource
		BodyOverlay
		LookAtController
		PedWithFace
		Face
		faceidle_timer
		face_timer
		face_source
	]
endscript

script Ped_AddDegenerateBlendBranch 
	Ped_Anim_Command \{Command = DegenerateBlend_AddBranch Params = {Tree = $Ped_AnimBranch_Standard Params = {param_timer_type = Play param_anim = Ped_M_Idle1}}}
	Anim_UpdatePose
	Anim_Command \{Command = DegenerateBlend_SetNextBlendDuration Params = {0.0}}
endscript

script Ped_PlayAnim \{Anim = 0 Target = PedMainAnimParentNode Tree = $Ped_AnimBranch_Standard Source = BodySource Flipped = 0}
	if gotParam \{NoRestart}
		if Ped_Anim_Command Target = <Source> Command = Source_AnimEquals Params = {<Anim>}
			return
		endif
	endif
	timer_type = Play
	if gotParam \{CYCLE}
		timer_type = CYCLE
	endif
	if gotParam \{Wobble}
		timer_type = Wobble
	endif
	if (<Flipped> = 1)
		<Tree> = Ped_AnimBranch_Flipped
	endif
	if gotParam \{PartialAnimOverlay}
		Ped_Anim_Command Target = Ped_AnimBranch_Overlay Command = DegenerateBlend_AddBranch Params = {
			Blendduration = <blendperiod>
			Tree = <Tree> Params = {
				param_timer_type = <timer_type>
				param_anim = <Anim>
				param_overlay = <PartialAnimOverlay>
				param_speed = <speed>
				param_start = <Start>
			}
		}
	else
		Ped_Anim_Command Target = <Target> Command = DegenerateBlend_AddBranch Params = {
			Blendduration = <blendperiod>
			Tree = <Tree> Params = {
				param_timer_type = <timer_type>
				param_anim = <Anim>
				param_speed = <speed>
				param_start = <Start>
				param_lookat_params = <lookat_params>
				param_lookat_target = <Lookat_Target>
			}
		}
	endif
	if (DEBUG_PEDINFO = 1)
		SetTags LastAnim = <Anim>
	endif
endscript

script Ped_Anim_Command 
	Anim_Command <...>
	Obj_Getid
	GetSingleTag \{board_id}
	if gotParam \{board_id}
		if iscreated <board_id>
			<board_id> :Anim_Command <...>
		endif
	endif
endscript

script Ped_WaitAnimFinished \{Timer = BodyTimer}
	Ped_Anim_Command Target = <Timer> Command = Timer_Wait
endscript

script Ped_WaitAnim 
	Ped_Anim_Command Target = BodyTimer Command = Timer_Wait Params = {<...>}
endscript

script Ped_AnimComplete \{Timer = BodyTimer}
	if Anim_Command Target = <Timer> Command = Timer_IsAnimComplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script Ped_AnimEquals 
	if Anim_Command Target = BodySource Command = Source_AnimEquals Params = {<...>}
		return \{1}
	endif
	return \{0}
endscript

script Ped_GetAnimDuration \{Timer = BodyTimer}
	Anim_Command Target = <Timer> Command = Timer_GetAnimDuration
	return <Duration>
endscript

script Ped_SetAnimCycleMode 
	timer_type = CYCLE
	if gotParam \{OFF}
		timer_type = Play
	endif
	Anim_Command \{Target = BodySource Command = Source_GetAnimName}
	Anim = <animName>
	Anim_Command \{Target = BodyTimer Command = Timer_GetFrameFactor}
	Start = <FrameFactor>
	Anim_Command Target = PedMainAnimParentNode Command = DegenerateBlend_AddBranch Params = {
		Blendduration = <blendperiod>
		Tree = $Ped_AnimBranch_Standard Params = {
			param_timer_type = <timer_type>
			param_anim = <Anim>
			param_speed = <speed>
			param_start = <Start>
		}
	}
endscript

script Ped_Flip 
endscript

script gameobj_init_animtree 
	if gotParam \{Profile}
		addparams <Profile>
	endif
	if gotParam \{AnimTargets}
		Anim_InitTree {
			Tree = <Tree>
			DefaultCommandTarget = <DefaultCommandTarget>
			NodeIdDeclaration = <AnimTargets>
			Params = <AnimTreeParams>
			animEventTableName = <animEventTableName>
		}
		Anim_Enable \{OFF}
	endif
endscript

script GameObj_PlayAnim \{Target = body Tree = $GameObj_StandardAnimBranch TimerType = Play speed = 1.0 Start = 0.0 AnimEvents = OFF Blendduration = -1.0}
	if NOT gotParam \{Anim}
		Anim_GetDefaultAnimName
		Anim = <defaultAnimName>
	endif
	Anim_Enable
	Anim_Command Target = <Target> Command = DegenerateBlend_AddBranch Params = {
		Tree = <Tree>
		Blendduration = <Blendduration>
		Params = {
			Anim = <Anim>
			speed = <speed>
			TimerType = <TimerType>
			Start = <Start>
			AnimEvents = <AnimEvents>
		}
	}
endscript

script GameObj_WaitAnimFinished \{Timer = BodyTimer}
	Anim_Command Target = <Timer> Command = Timer_WaitAnimComplete
endscript

script GameObj_WaitAnim 
	Anim_Command Target = BodyTimer Command = Timer_Wait Params = {<...>}
endscript

script GameObj_AnimComplete \{Timer = BodyTimer}
	if Anim_Command Target = <Timer> Command = Timer_IsAnimComplete
		return \{scriptresult = 1}
	else
		return \{scriptresult = 0}
	endif
endscript

script CreateObjLabel 
	Obj_Getid
	Spawnscriptlater MaintainObjLabel Params = {objId = <objId>}
endscript

script MaintainObjLabel 
	<Id> = (<objId> + 5)
	begin
	if compositeObjectexists Name = <objId>
		<objId> :Obj_GetPosition
		formatText Textname = Text "%a" A = <objId> nowarning
		if ObjectExists Id = <Id>
			setScreenElementProps Id = <Id> Text = <Text> pos3D = (<pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		else
			create_object_label Id = <Id> Text = <Text> pos3D = (<pos> + (0.0, 80.0, 0.0)) rgba = [100 0 0 128]
		endif
	else
		if ScreenelementExists Id = <Id>
			DestroyScreenelement Id = <Id>
		endif
		break
	endif
	Wait \{1 Frame}
	repeat
endscript

script ped_disable_bones 
endscript

script ped_enable_bones 
endscript

script Ped_InitBehaviorFromProfile 
	if gotParam \{BehaviorInitScript}
		<BehaviorInitScript>
	endif
endscript

script create_ped_label 
	SetScreenElementLock \{Id = root_window OFF}
	createScreenElement {
		Id = <Id>
		Type = textblockelement
		PARENT = root_window
		font = text_A1
		Text = ""
		scale = 1.0
		pos = (0.0, 0.0)
		rgba = [0 128 0 128]
		Dims = (250.0, 0.0)
		allow_expansion
		just = [Center top]
	}
endscript

script destroy_ped_label 
	if ObjectExists Id = <Id>
		DestroyScreenelement Id = <Id>
	endif
endscript

script destroy_global_peds_in_zone 
	if NOT ($disable_global_pedestrians = 1)
		if NOT innetgame
			if IsCOIMInited
				Printf \{"destroy_global_peds_in_zone called"}
				CleanupGlobalPedNodeArray Name = 'zones/z_peds/z_peds.qb' zone = <zone>
			endif
		endif
	endif
endscript

script spawn_global_peds_in_zone 
	if NOT ($disable_global_pedestrians = 1)
		if NOT innetgame
			if IsCOIMInited
				Printf \{"spawn_global_peds_in_zone called"}
				ParseGlobalPedNodeArray Name = 'zones/z_peds/z_peds.qb' zone = <zone>
			endif
		endif
	endif
endscript
