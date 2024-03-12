AnimPreviewBaseTree = {
	Type = DegenerateBlend
	Id = PreviewTreeAnimNode
}

script AnimTreePreview_UpdateBlendValues 
	if compositeObjectexists \{Name = animtreepreviewobject}
		animtreepreviewobject :AnimPreview_SetSourceValues <...>
	endif
endscript

script TestAnimScript 
	Anim_Command Target = PreviewTreeAnimNode Command = DegenerateBlend_AddBranch Params = {Tree = <Tree> Params = <Tree_Params>}
	obj_forceupdate
endscript

script AnimTreePreview_NxCommon \{targetObject = Skater}
	if compositeObjectexists \{Name = animtreepreviewobject}
		AnimTreePreviewRestore
	endif
	dump <Tree>
	if NOT gotParam \{Skeleton}
		<targetObject> :Skeleton_GetSkeletonName
		Skeleton = <skeletonName>
	endif
	if NOT gotParam \{Ragdoll}
		if <targetObject> :containscomponent Ragdoll
			if <targetObject> :Ragdoll_GetRagdollName
				Ragdoll = <RagdollName>
			endif
		endif
	endif
	SetSearchAllAssetContexts
	CreateFakePlayer PositionFrom = <targetObject> cloneFrom = <targetObject> model = <model> Ragdoll = <Ragdoll> Skeleton = <Skeleton> appearance = <appearance> active_value_sources = <active_value_sources>
	animtreepreviewobject :Anim_InitTree \{Tree = $AnimPreviewBaseTree NodeIdDeclaration = [PreviewTreeAnimNode]}
	if animtreepreviewobject :Anim_LoadAnims Tree = <Tree> Params = <Tree_Params>
		animtreepreviewobject :obj_switchscript TestAnimScript Params = {Tree = <Tree> Tree_Params = <Tree_Params>}
		<targetObject> :Hide
		<targetObject> :pause
	else
		animtreepreviewobject :DIE
	endif
	dump <Tree>
endscript

script CreateFakePlayer 
	if NOT compositeObjectexists <cloneFrom>
		return
	endif
	if NOT compositeObjectexists <PositionFrom>
		return
	endif
	if compositeObjectexists \{animtreepreviewobject}
		animtreepreviewobject :DIE
	endif
	<PositionFrom> :Obj_GetPosition
	<PositionFrom> :obj_getquat
	components = []
	if gotParam \{Ragdoll}
		RagdollComponents = [
			{
				component = Ragdoll
				RagdollName = <Ragdoll>
				initialize_empty = FALSE
			}
		]
		components = (<components> + <RagdollComponents>)
	endif
	BasicComponents = [
		{
			component = AnimPreview
			active_value_source_list = <active_value_sources>
			preload_model = <model>
		}
		{
			component = Animinfo
			active_value_set = preview
		}
		{
			component = animtree
			ReferenceChecksum = <Skeleton>
			animEventTableName = SkaterAnimEventTable
		}
		{
			component = Skeleton
		}
		{
			component = setdisplaymatrix
		}
	]
	components = (<components> + <BasicComponents>)
	if gotParam \{model}
		ModelComponent = [
			{
				component = model
				model = <model>
			}
		]
	else
		ModelComponent = [
			{
				component = model
				cloneFrom = <cloneFrom>
			}
		]
	endif
	components = (<components> + <ModelComponent>)
	CreateCompositeObject {
		components = <components>
		Params = {
			skeletonName = <Skeleton>
			Name = animtreepreviewobject
			pos = <pos>
			orientation = <quat>
			Assetcontext = AnimPreviewObject
			<appearance>
		}
	}
endscript
