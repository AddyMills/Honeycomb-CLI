AnimPreviewBaseTree = {
	type = degenerateblend
	id = PreviewTreeAnimNode
}

script AnimTreePreview_UpdateBlendValues 
	if CompositeObjectExists \{name = AnimTreePreviewObject}
		AnimTreePreviewObject :animpreview_setsourcevalues <...>
	endif
endscript

script TestAnimScript 
	anim_command target = PreviewTreeAnimNode command = degenerateblend_addbranch params = {tree = <tree> params = <Tree_Params>}
	Obj_ForceUpdate
endscript

script AnimTreePreview_NxCommon \{targetObject = skater}
	if CompositeObjectExists \{name = AnimTreePreviewObject}
		AnimTreePreviewRestore
	endif
	dump <tree>
	if NOT GotParam \{skeleton}
		<targetObject> :skeleton_getskeletonname
		skeleton = <SkeletonName>
	endif
	if NOT GotParam \{ragdoll}
		if <targetObject> :ContainsComponent ragdoll
			if <targetObject> :ragdoll_getragdollname
				ragdoll = <ragdollname>
			endif
		endif
	endif
	setsearchallassetcontexts
	CreateFakePlayer PositionFrom = <targetObject> CloneFrom = <targetObject> Model = <Model> ragdoll = <ragdoll> skeleton = <skeleton> appearance = <appearance> active_value_sources = <active_value_sources>
	AnimTreePreviewObject :anim_inittree \{tree = $AnimPreviewBaseTree nodeiddeclaration = [PreviewTreeAnimNode]}
	if AnimTreePreviewObject :anim_loadanims tree = <tree> params = <Tree_Params>
		AnimTreePreviewObject :Obj_SwitchScript TestAnimScript params = {tree = <tree> Tree_Params = <Tree_Params>}
		<targetObject> :hide
		<targetObject> :Pause
	else
		AnimTreePreviewObject :Die
	endif
	dump <tree>
endscript

script CreateFakePlayer 
	if NOT CompositeObjectExists <CloneFrom>
		return
	endif
	if NOT CompositeObjectExists <PositionFrom>
		return
	endif
	if CompositeObjectExists \{AnimTreePreviewObject}
		AnimTreePreviewObject :Die
	endif
	<PositionFrom> :obj_getposition
	<PositionFrom> :Obj_GetQuat
	Components = []
	if GotParam \{ragdoll}
		RagdollComponents = [
			{
				Component = ragdoll
				ragdollname = <ragdoll>
				initialize_empty = FALSE
			}
		]
		Components = (<Components> + <RagdollComponents>)
	endif
	BasicComponents = [
		{
			Component = animpreview
			active_value_source_list = <active_value_sources>
			preload_model = <Model>
		}
		{
			Component = animinfo
			active_value_set = preview
		}
		{
			Component = AnimTree
			ReferenceChecksum = <skeleton>
			animeventtablename = SkaterAnimEventTable
		}
		{
			Component = skeleton
		}
		{
			Component = SetDisplayMatrix
		}
	]
	Components = (<Components> + <BasicComponents>)
	if GotParam \{Model}
		ModelComponent = [
			{
				Component = Model
				Model = <Model>
			}
		]
	else
		ModelComponent = [
			{
				Component = Model
				CloneFrom = <CloneFrom>
			}
		]
	endif
	Components = (<Components> + <ModelComponent>)
	CreateCompositeObject {
		Components = <Components>
		params = {
			SkeletonName = <skeleton>
			name = AnimTreePreviewObject
			Pos = <Pos>
			Orientation = <Quat>
			assetcontext = AnimPreviewObject
			<appearance>
		}
	}
endscript
