
script UnHidePlayerAndDestroyFakes 
	KillSpawnedScript \{name = _TestAnimSequence}
	if CompositeObjectExists \{name = FakeCharacter}
		FakeCharacter :Die
	endif
	if CompositeObjectExists \{name = AnimTreePreviewObject}
		AnimTreePreviewObject :Die
	endif
endscript

script TestAnim \{skeleton = GH3_Guitarist_Axel}
	if GotParam \{Off}
		UnHidePlayerAndDestroyFakes
	else
		ReloadAndTestAnim <...> skeleton = <skeleton>
	endif
endscript

script ReloadAndTestAnim 
	KillSpawnedScript \{name = _TestAnimSequence}
	LaunchEvent \{type = DrawRequested Data = {cycledown}}
	FormatText checksumname = AnimName '%s' s = <anim> DontAssertForChecksums
	if GotParam \{DifferenceAnim}
		if (<DifferenceAnim> = "")
		else
			FormatText checksumname = DifferenceAnimName '%s' s = <DifferenceAnim>
		endif
	endif
	CreateFake \{Original = guitarist skeleton = GH3_Guitarist_Axel Pos = (0.0, 2.0, 2.0)}
	if GotParam \{Cycle}
		AnimTreePreviewObject :ModelViewer_PlayAnim anim = <AnimName> BlendPeriod = 0 Speed = <Speed> Cycle
	else
		AnimTreePreviewObject :ModelViewer_PlayAnim anim = <AnimName> BlendPeriod = 0 Speed = <Speed>
	endif
	if GotParam \{DifferenceAnim}
		AnimTreePreviewObject :Obj_PoseControllerCommand command = PlaySequence DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
	endif
	AnimTreePreviewObject :Obj_ForceUpdate
endscript

script CreateFake 
	if NOT CompositeObjectExists name = <Original>
		return
	endif
	if CompositeObjectExists \{name = AnimTreePreviewObject}
		AnimTreePreviewObject :Die
	endif
	UpdateAnimCache \{Clear}
	<Original> :Obj_GetQuat
	CreateCompositeObject {
		Components = [
			{
				Component = Suspend
			}
			{
				Component = AnimTree
			}
			{
				Component = skeleton
			}
			{
				Component = SetDisplayMatrix
			}
			{
				Component = Model
				CloneFrom = <Original>
			}
		]
		params = {
			SkeletonName = <skeleton>
			name = AnimTreePreviewObject
			Pos = <Pos>
			Orientation = <Quat>
		}
	}
	AnimTreePreviewObject :ModelViewer_InitAnimTree
endscript

script AnimTreePreview 
	AnimTreePreview_NxCommon targetObject = guitarist ragdoll = ragdoll_ped <...>
	if NOT CompositeObjectExists \{AnimTreePreviewObject}
		return
	endif
	AnimTreePreviewObject :UnPause
	if CompositeObjectExists \{guitarist}
		guitarist :Obj_SwitchScript \{guitarist_idle_animpreview}
	endif
	change \{crowd_debug_mode = 1}
	PlayIGCCam \{name = anim_preview_cam LockTo = guitarist Pos = (-0.9129459, 2.0256813, 2.383587) Quat = (0.045517996, 0.963656, -0.18475299) FOV = 72.0 Play_hold interrupt_current}
endscript

script AnimTreePreviewRestore 
	UnHidePlayerAndDestroyFakes
	change \{crowd_debug_mode = 0}
	KillSkaterCamAnim \{name = anim_preview_cam}
	if CompositeObjectExists \{guitarist}
		guitarist :unhide
	endif
endscript

script UpdateHeroDifferenceAnim 
	if (<DifferenceAnim> = "")
	else
		FormatText checksumname = DifferenceAnimName '%s' s = <DifferenceAnim>
		if CompositeObjectExists \{name = AnimTreePreviewObject}
			AnimTreePreviewObject :UpdateDifferenceAnim DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
		endif
	endif
endscript

script _TestAnimSequence 
	if GotParam \{Animations}
		CreateFakePlayer \{skeleton = GH3_guitar}
		begin
		GetArraySize <Animations>
		<index> = 0
		begin
		FormatText checksumname = AnimName '%s' s = (<Animations> [<index>].anim) DontAssertForChecksums
		AnimTreePreviewObject :ModelViewer_PlayAnim {
			anim = <AnimName>
			Speed = (<Animations> [<index>].Speed)
			BlendPeriod = (<Animations> [<index>].BlendPeriod)
		}
		if (<index> = 0)
			AnimTreePreviewObject :Obj_ForceUpdate
		endif
		AnimTreePreviewObject :ModelViewer_WaitAnimFinished
		<index> = (<index> + 1)
		repeat <array_size>
		if NOT GotParam \{Cycle}
			break
		endif
		repeat
		wait \{1 second}
		SpawnScriptLater \{UnHidePlayerAndDestroyFakes}
	endif
endscript

script TestAnimSequence 
	KillSpawnedScript \{name = _TestAnimSequence}
	SpawnScriptLater _TestAnimSequence params = <...>
endscript

script KillAnimPreviewRefs 
	UnHidePlayerAndDestroyFakes
endscript
