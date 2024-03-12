
script UnHidePlayerAndDestroyFakes 
	killspawnedScript \{Name = _TestAnimSequence}
	if compositeObjectexists \{Name = FakeCharacter}
		FakeCharacter :DIE
	endif
	if compositeObjectexists \{Name = animtreepreviewobject}
		animtreepreviewobject :DIE
	endif
endscript

script TestAnim \{Skeleton = GH3_guitarist_axel}
	if gotParam \{OFF}
		UnHidePlayerAndDestroyFakes
	else
		ReloadAndTestAnim <...> Skeleton = <Skeleton>
	endif
endscript

script ReloadAndTestAnim 
	killspawnedScript \{Name = _TestAnimSequence}
	launchevent \{Type = DrawRequested data = {cycledown}}
	formatText Checksumname = animName '%s' S = <Anim> dontassertforchecksums
	if gotParam \{DifferenceAnim}
		if (<DifferenceAnim> = "")
		else
			formatText Checksumname = DifferenceAnimName '%s' S = <DifferenceAnim>
		endif
	endif
	CreateFake \{original = GUITARIST Skeleton = GH3_guitarist_axel pos = (0.0, 2.0, 2.0)}
	if gotParam \{CYCLE}
		animtreepreviewobject :ModelViewer_PlayAnim Anim = <animName> blendperiod = 0 speed = <speed> CYCLE
	else
		animtreepreviewobject :ModelViewer_PlayAnim Anim = <animName> blendperiod = 0 speed = <speed>
	endif
	if gotParam \{DifferenceAnim}
		animtreepreviewobject :Obj_PoseControllerCommand Command = PlaySequence DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
	endif
	animtreepreviewobject :obj_forceupdate
endscript

script CreateFake 
	if NOT compositeObjectexists Name = <original>
		return
	endif
	if compositeObjectexists \{Name = animtreepreviewobject}
		animtreepreviewobject :DIE
	endif
	UpdateAnimCache \{CLEAR}
	<original> :obj_getquat
	CreateCompositeObject {
		components = [
			{
				component = suspend
			}
			{
				component = animtree
			}
			{
				component = Skeleton
			}
			{
				component = setdisplaymatrix
			}
			{
				component = model
				cloneFrom = <original>
			}
		]
		Params = {
			skeletonName = <Skeleton>
			Name = animtreepreviewobject
			pos = <pos>
			orientation = <quat>
		}
	}
	animtreepreviewobject :ModelViewer_InitAnimTree
endscript

script AnimTreePreview 
	AnimTreePreview_NxCommon targetObject = GUITARIST Ragdoll = ragdoll_ped <...>
	if NOT compositeObjectexists \{animtreepreviewobject}
		return
	endif
	animtreepreviewobject :Unpause
	if compositeObjectexists \{GUITARIST}
		GUITARIST :obj_switchscript \{guitarist_idle_animpreview}
	endif
	Change \{crowd_debug_mode = 1}
	PlayIGCCam \{Name = anim_preview_cam lockto = GUITARIST pos = (-0.9129459, 2.0256813, 2.383587) quat = (0.045517996, 0.963656, -0.18475299) fov = 72.0 play_hold interrupt_current}
endscript

script AnimTreePreviewRestore 
	UnHidePlayerAndDestroyFakes
	Change \{crowd_debug_mode = 0}
	KillSkaterCamAnim \{Name = anim_preview_cam}
	if compositeObjectexists \{GUITARIST}
		GUITARIST :Unhide
	endif
endscript

script UpdateHeroDifferenceAnim 
	if (<DifferenceAnim> = "")
	else
		formatText Checksumname = DifferenceAnimName '%s' S = <DifferenceAnim>
		if compositeObjectexists \{Name = animtreepreviewobject}
			animtreepreviewobject :UpdateDifferenceAnim DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
		endif
	endif
endscript

script _TestAnimSequence 
	if gotParam \{Animations}
		CreateFakePlayer \{Skeleton = GH3_Guitar}
		begin
		getArraySize <Animations>
		<Index> = 0
		begin
		formatText Checksumname = animName '%s' S = (<Animations> [<Index>].Anim) dontassertforchecksums
		animtreepreviewobject :ModelViewer_PlayAnim {
			Anim = <animName>
			speed = (<Animations> [<Index>].speed)
			blendperiod = (<Animations> [<Index>].blendperiod)
		}
		if (<Index> = 0)
			animtreepreviewobject :obj_forceupdate
		endif
		animtreepreviewobject :ModelViewer_WaitAnimFinished
		<Index> = (<Index> + 1)
		repeat <array_Size>
		if NOT gotParam \{CYCLE}
			break
		endif
		repeat
		Wait \{1 Second}
		Spawnscriptlater \{UnHidePlayerAndDestroyFakes}
	endif
endscript

script TestAnimSequence 
	killspawnedScript \{Name = _TestAnimSequence}
	Spawnscriptlater _TestAnimSequence Params = <...>
endscript

script killanimpreviewrefs 
	UnHidePlayerAndDestroyFakes
endscript
