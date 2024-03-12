force_particle_update_time = 1.0

script CreateParticleSystem_WithScript 
	if GotParam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	printf "particle name %a" a = <name>
	if NOT GotParam \{params_script}
		printf \{"No <params_script> parameter"}
		return
	endif
	if NOT GotParam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf "Global particle %s could not be found." s = <params_script>
			return
		endif
	endif
	if GotParam \{ObjID}
		attachobjid = <ObjID>
		MangleChecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if ObjectExists id = <mangled_id>
		printf \{"Failed to create particle object. Object already exists."}
		return
	endif
	GetParticleType params_script = <params_script>
	if GotParam \{Pos}
		if (<type> = fast)
			CreateGlobalFastParticleSystem <...>
		else
			CreateGlobalFlexParticlesystem <...>
		endif
	else
		if (<type> = fast)
			if CutsceneDestroyListActive
				AddToCutsceneDestroyList {
					destroy_func = DestroyFastParticleSystem
					name = <mangled_id>
					destroy_params = {name = <name> attachobjid = <attachobjid>}
				}
			endif
			alloc_spline_particle {params_script = <params_script> name = <mangled_id> attachobjid = <ObjID> ObjID = <ObjID> bone = <bone> groupid = <groupid>
				attachnode = <attachnode> emit_script = <emit_script> emit_params = <emit_params> perm = <perm> creation_node = <creation_node>}
		else
			if CutsceneDestroyListActive
				AddToCutsceneDestroyList {
					destroy_func = DestroyFlexibleParticleSystem
					name = <mangled_id>
					destroy_params = {name = <name> ObjID = <ObjID>}
				}
			endif
			alloc_flexible_particle params_script = (<params_script>) name = <mangled_id> ObjID = <ObjID> bone = <bone> attachnode = <attachnode> bone = <bone> groupid = <groupid> perm = <perm>
		endif
	endif
endscript

script CreateFlexibleParticleSystem \{groupid = 0}
	if GotParam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_script}
		script_assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf "Global particle %s could not be found." s = <params_script>
			return
		endif
	endif
	if NOT GotParam \{ObjID}
		obj_getid
	endif
	MangleChecksums a = <name> b = <ObjID>
	if NOT ObjectExists id = <mangled_id>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFlexibleParticleSystem
				ignore_duplicates
				name = <mangled_id>
				destroy_params = {name = <name> ObjID = <ObjID>}
			}
		endif
		alloc_flexible_particle params_script = (<params_script>) name = <mangled_id> ObjID = <ObjID> bone = <bone> attachnode = <attachnode> bone = <bone> groupid = <groupid> perm = <perm>
	endif
endscript

script CreateFlexibleParticleSystem_Editor 
	KillSpawnedScript \{name = CreateFlexibleParticleSystem_Editor_Spawned}
	spawnscriptnow CreateFlexibleParticleSystem_Editor_Spawned params = <...>
endscript

script CreateFlexibleParticleSystem_Editor_Spawned \{groupid = 0}
	if GotParam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_script}
		script_assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{ObjID}
		obj_getid
	endif
	if GotParam \{attachobjid}
		<ObjID> = <attachobjid>
	endif
	if GotParam \{ObjID}
		attachobjid = <ObjID>
	endif
	if GotParam \{ObjID}
		MangleChecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if (IsCreated <name>)
		<name> :Die
		wait \{1 frame}
	endif
	if (IsCreated <mangled_id>)
		<mangled_id> :Die
		wait \{1 frame}
	endif
	if NOT IsCreated <mangled_id>
		if (GotParam attach)
			alloc_flexible_particle params_script = (<params_script>) name = <mangled_id> ObjID = <attachobjid> attachnode = <attachnode> bone = <bone> groupid = <groupid> perm = <perm>
		else
			alloc_flexible_particle params_script = (<params_script>) name = <mangled_id> groupid = <groupid> perm = <perm>
		endif
	endif
endscript

script GetFlexibleParticleSystem 
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{ObjID}
		obj_getid
	endif
	MangleChecksums a = <name> b = <ObjID>
	if ObjectExists id = <mangled_id>
		return systemID = <mangled_id>
	endif
endscript

script DestroyFlexibleParticleSystem 
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{ObjID}
		obj_getid
	endif
	MangleChecksums a = <name> b = <ObjID>
	if ObjectExists id = <mangled_id>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_id>
		endif
		<mangled_id> :destroyparticles
	endif
endscript

script DestroyFlexibleParticleSystem_Editor 
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{ObjID}
		obj_getid
	endif
	MangleChecksums a = <name> b = <ObjID>
	if ObjectExists id = <name>
		<name> :destroyparticles
	endif
	if ObjectExists id = <mangled_id>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_id>
		endif
		<mangled_id> :destroyparticles
	endif
endscript
LockableFlexibleParticleComponents = [
	{
		Component = attach
	}
	{
		Component = flexibleparticle
	}
]

script alloc_flexible_particle \{groupid = 0}
	if NOT CheckFlexibleParticleStructure <params_script>
		printf \{"Invalid particle structure"}
		return
	endif
	if GotParam \{perm}
		if (<perm> = 1)
			priority = coim_priority_permanent
			heap = gameobj
		else
			priority = coim_priority_effects
			heap = particle
		endif
	else
		priority = coim_priority_effects
		heap = particle
	endif
	CreateGameObject priority = <priority> heap = <heap> Components = $LockableFlexibleParticleComponents params = {
		name = <name>
		<params_script>
		ignorelockdie
		id = <ObjID>
		attach_target = <ObjID>
		parent_object = <ObjID>
		bone = <bone>
		attach_bone = <bone>
		groupid = <groupid>
		attachnode = <attachnode>
		object_type = particle
	}
endscript
SuspendibleFlexibleParticleComponents = [
	{
		Component = flexibleparticle
	}
]
flexibleparticlecomponents = [
	{
		Component = flexibleparticle
	}
]

script CreateGlobalFlexParticlesystem \{groupid = 0}
	if NOT CheckFlexibleParticleStructure <params_script>
		printf \{"Invalid particle structure"}
		return
	endif
	if GotParam \{perm}
		priority = coim_priority_permanent
		heap = gameobj
	else
		priority = coim_priority_effects
		heap = particle
	endif
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_script}
		script_assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf "Global particle %s could not be found." s = <params_script>
			return
		endif
	endif
	if NOT ObjectExists id = <name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFlexParticleSystem
				ignore_duplicates
				name = <name>
				destroy_params = {name = <name>}
			}
		endif
		if StructureContains \{structure = params_script suspenddistance}
			CreateGameObject priority = <priority> heap = <heap> Components = $SuspendibleFlexibleParticleComponents params = {
				name = <name>
				<params_script>
				groupid = <groupid>
				Pos = <Pos>
				object_type = particle
			}
		else
			CreateGameObject priority = <priority> heap = <heap> Components = $flexibleparticlecomponents params = {
				name = <name>
				<params_script>
				groupid = <groupid>
				Pos = <Pos>
				object_type = particle
			}
		endif
	endif
endscript

script DestroyGlobalFlexParticleSystem 
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if ObjectExists id = <name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <name>
		endif
		<name> :destroyparticles
	endif
endscript

script CreateFastParticleSystem \{groupid = 0}
	CreateSplineParticleSystem params = <...>
endscript

script CreateSplineParticleSystem \{groupid = 0}
	if GotParam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_script}
		script_assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf "Global particle %s could not be found." s = <params_script>
			return
		endif
	endif
	if GotParam \{attachobjid}
		<ObjID> = <attachobjid>
	endif
	if GotParam \{ObjID}
		attachobjid = <ObjID>
	endif
	if GotParam \{ObjID}
		MangleChecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if NOT IsCreated <mangled_id>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFastParticleSystem
				ignore_duplicates
				name = <mangled_id>
				destroy_params = {name = <name> attachobjid = <attachobjid>}
			}
		endif
		alloc_spline_particle {params_script = <params_script> name = <mangled_id> attachobjid = <ObjID> ObjID = <ObjID> bone = <bone> groupid = <groupid>
			attachnode = <attachnode> emit_script = <emit_script> emit_params = <emit_params> perm = <perm> creation_node = <creation_node>}
	endif
	if ((IsCreated <mangled_id>) && (GotParam ObjID) && (StructureContains structure = params_script ApplyEnvBrightness))
		<mangled_id> :ApplyEnvBrightness from = <ObjID>
	endif
	if IsCreated <mangled_id>
		return systemID = <mangled_id>
	endif
endscript

script CreateSplineParticleSystem_Editor 
	KillSpawnedScript \{name = CreateSplineParticleSystem_Editor_Spawned}
	spawnscriptnow CreateSplineParticleSystem_Editor_Spawned params = <...>
endscript

script CreateSplineParticleSystem_Editor_Spawned \{groupid = 0}
	if GotParam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_script}
		script_assert \{"No <params_script> parameter"}
	endif
	if GotParam \{attachobjid}
		<ObjID> = <attachobjid>
	endif
	if GotParam \{ObjID}
		attachobjid = <ObjID>
	endif
	if GotParam \{ObjID}
		MangleChecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if (IsCreated <name>)
		<name> :Die
		wait \{1 frame}
	endif
	if (IsCreated <mangled_id>)
		<mangled_id> :Die
		wait \{1 frame}
	endif
	if (IsCreated <mangled_id>)
		<mangled_id> :updateparams {params_script = <params_script>}
		if GotParam \{attach}
			<mangled_id> :obj_locktoobject objectname = <ObjID>
		else
			<mangled_id> :obj_locktoobject Off objectname = <ObjID>
		endif
	else
		alloc_spline_particle {params_script = <params_script> name = <mangled_id> attachobjid = <ObjID> ObjID = <ObjID> bone = <bone> groupid = <groupid>
			attachnode = <attachnode> emit_script = <emit_script> emit_params = <emit_params> perm = <perm> creation_node = <creation_node>}
	endif
endscript
SuspendibleFastParticleComponents = [
	{
		Component = particle
	}
]
fastparticlecomponents = [
	{
		Component = particle
	}
]

script CreateGlobalFastParticleSystem \{groupid = 0}
	if NOT CheckSplineParticleStructure <params_script>
		printf \{"Invalid particle structure"}
		return
	endif
	if GotParam \{perm}
		priority = coim_priority_permanent
		heap = gameobj
	else
		priority = coim_priority_effects
		heap = particle
	endif
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_script}
		script_assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf "Global particle %s could not be found." s = <params_script>
			return
		endif
	endif
	if NOT IsCreated <name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFastParticleSystem
				ignore_duplicates
				name = <name>
				destroy_params = {name = <name>}
			}
		endif
		if StructureContains \{structure = params_script suspenddistance}
			CreateGameObject priority = <priority> heap = <heap> Components = SuspendibleFastParticleComponents params = {
				name = <name>
				parent_object = <ObjID>
				groupid = <groupid>
				<params_script>
				Pos = <Pos>
				object_type = particle
			}
		else
			CreateGameObject priority = <priority> heap = <heap> Components = $fastparticlecomponents params = {
				name = <name>
				parent_object = <ObjID>
				groupid = <groupid>
				<params_script>
				Pos = <Pos>
				object_type = particle
			}
		endif
	endif
	if IsCreated <name>
		if GotParam \{emit_script}
			<name> :obj_spawnscriptlater <emit_script> params = <emit_params>
		endif
	endif
endscript

script DestroyGlobalFastParticleSystem 
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if ObjectExists id = <name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <name>
		endif
		<name> :Die
	endif
endscript

script DestroyFastParticleSystem 
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if GotParam \{ObjID}
		attachobjid = <ObjID>
	endif
	if GotParam \{attachobjid}
		MangleChecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if ObjectExists id = <mangled_id>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_id>
		endif
		<mangled_id> :Die
	endif
endscript

script DestroyParticleSystem_Editor 
	KillSpawnedScript \{name = DestroyParticleSystem_Editor_Spawn}
	spawnscriptnow DestroyParticleSystem_Editor_Spawn params = <...>
endscript

script DestroyParticleSystem_Editor_Spawn 
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if GotParam \{ObjID}
		attachobjid = <ObjID>
	endif
	if GotParam \{attachobjid}
		MangleChecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if ObjectExists id = <mangled_id>
		<mangled_id> :Die
	endif
	if ObjectExists id = <name>
		<name> :Die
	endif
endscript

script DestroySplineParticleSystem_Editor 
	if NOT GotParam \{name}
		script_assert \{"No <name> parameter"}
	endif
	if GotParam \{ObjID}
		attachobjid = <ObjID>
	endif
	if GotParam \{attachobjid}
		MangleChecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if ObjectExists id = <mangled_id>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_id>
		endif
		<mangled_id> :Die
	endif
	if ObjectExists id = <name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <name>
		endif
		<name> :Die
	endif
endscript

script EmitFastParticles 
	if GotParam \{wait_frames}
		wait <wait_frames> frames
	else
		wait <wait_seconds> seconds
	endif
	setemitrate \{0}
	begin
	if NOT isemitting
		break
	endif
	wait \{1 frame}
	repeat
	Die
endscript
LockableSplineParticleComponents = [
	{
		Component = attach
	}
	{
		Component = particle
	}
]

script alloc_spline_particle \{groupid = 0}
	if NOT CheckSplineParticleStructure <params_script>
		printf \{"Invalid particle structure"}
		return
	endif
	if GotParam \{perm}
		if (<perm> = 1)
			priority = coim_priority_permanent
			heap = gameobj
		else
			priority = coim_priority_effects
			heap = particle
		endif
	else
		priority = coim_priority_effects
		heap = particle
	endif
	if NOT ObjectExists id = <name>
		if GotParam \{attachobjid}
			CreateGameObject priority = <priority> heap = <heap> Components = $LockableSplineParticleComponents params = {
				name = <name>
				<params_script>
				id = <attachobjid>
				attach_target = <attachobjid>
				ignorelockdie
				parent_object = <attachobjid>
				bone = <bone>
				attach_bone = <bone>
				groupid = <groupid>
				LocalSpace
				creation_node = <creation_node>
				object_type = particle
			}
		else
			CreateGameObject priority = <priority> heap = <heap> {
				Components = [
					{
						Component = particle
						name = <name>
						bone = <bone>
						groupid = <groupid>
						<params_script>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					creation_node = <creation_node>
					object_type = particle
				}
			}
			if StructureContains \{structure = params_script LocalSpace}
				if NOT StructureContains \{structure = params_script boxPositions}
					printstruct <params_script>
					script_assert \{"No <boxPositions> parameter...  system should not have been defined in LocalSpace"}
				endif
				if ObjectExists id = <name>
					<name> :SetStartPos (<params_script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists id = <name>
		if GotParam \{emit_script}
			<name> :obj_spawnscriptlater <emit_script> params = <emit_params>
		endif
	endif
endscript

script alloc_fast_particle \{groupid = 0}
	if NOT GotParam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf "Global particle %s could not be found." s = <params_script>
			return
		endif
	endif
	if GotParam \{perm}
		if (<perm> = 1)
			priority = coim_priority_permanent
			heap = gameobj
		else
			priority = coim_priority_effects
			heap = particle
		endif
	else
		priority = coim_priority_effects
		heap = particle
	endif
	if NOT ObjectExists id = <name>
		if GotParam \{attachobjid}
			CreateGameObject priority = <priority> heap = <heap> {
				Components = [
					{
						Component = attach
						attach_target = <attachobjid>
						<params_script>
						ignorelockdie
					}
					{
						Component = particle
						name = <name>
						groupid = <groupid>
						parent_object = <attachobjid>
						bone = <bone>
						<params_script>
						systemLifetime = (<params_script>.emitduration)
						systemLifetime = <systemLifetime>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					LocalSpace
					creation_node = <creation_node>
					object_type = particle
				}
			}
		else
			CreateGameObject priority = <priority> heap = <heap> {
				Components = [
					{
						Component = particle
						name = <name>
						bone = <bone>
						groupid = <groupid>
						<params_script>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					creation_node = <creation_node>
					object_type = particle
				}
			}
			if StructureContains \{structure = params_script LocalSpace}
				if NOT StructureContains \{structure = params_script boxPositions}
					printstruct <params_script>
					script_assert \{"No <boxPositions> parameter...  system should not have been defined in LocalSpace"}
				endif
				if ObjectExists id = <name>
					<name> :SetStartPos (<params_script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists id = <name>
		if GotParam \{emit_script}
			<name> :obj_spawnscriptlater <emit_script> params = <emit_params>
		endif
	endif
endscript

script CreateGameObject 
	if IsCompositeObjectManagerEnabled
		CreateCompositeObject <...>
	else
		CreateCompositeObjectInstance <...>
	endif
endscript

script JOW_RGBAToVector \{rgba = [0 0 0 0]}
	return rgb = (<rgba> [0] * (1.0, 0.0, 0.0) + <rgba> [1] * (0.0, 1.0, 0.0) + <rgba> [2] * (0.0, 0.0, 1.0)) a = (<rgba> [3])
endscript

script JOW_VectorToRGBA \{rgb = (0.0, 0.0, 0.0) a = 0}
	rgba = [0 0 0 0]
	val = (<rgb>.(1.0, 0.0, 0.0))
	CastToInteger \{val}
	SetArrayElement arrayName = rgba index = 0 newValue = <val>
	val = (<rgb>.(0.0, 1.0, 0.0))
	CastToInteger \{val}
	SetArrayElement arrayName = rgba index = 1 newValue = <val>
	val = (<rgb>.(0.0, 0.0, 1.0))
	CastToInteger \{val}
	SetArrayElement arrayName = rgba index = 2 newValue = <val>
	CastToInteger \{a}
	SetArrayElement arrayName = rgba index = 3 newValue = <a>
	return rgba = <rgba>
endscript

script Hero_ContinuousTerrainParticles_Off 
	cleareventhandlergroup
	seteventhandler \{event = NewTerrainType scr = Hero_ContinuousTerrainParticles_On Response = switch_script}
	OnExceptionRun
	Block
endscript

script Hero_ContinuousTerrainParticles_On 
	GetTerrainTypeParam param = treadActions terrain_id = <terraintype>
	if NOT StructureContains \{structure = treadActions HeroContinuousParticleParams}
		goto \{Hero_ContinuousTerrainParticles_Off}
	endif
	GetUniqueCompositeObjectID \{preferredid = Hero_ContinuousTerrainParticles}
	cleareventhandlergroup
	seteventhandler event = NewTerrainType scr = Hero_ContinuousTerrainParticles_Switch Response = switch_script params = {ParticleId = <uniqueid>}
	OnExceptionRun
	begin
	if NOT CompositeObjectExists <uniqueid>
		CreateGameObject priority = coim_priority_effects heap = particle oldheap = com Components = [
			{Component = flexibleparticle}
		] params = {
			name = <uniqueid>
			(<treadActions>.HeroContinuousParticleParams)
			novisibilitytest
			object_type = particle
		}
	endif
	obj_getvelocity
	NormalizeVector <vel>
	obj_getposition
	if CompositeObjectExists <uniqueid>
		<uniqueid> :obj_setposition position = (((1.0, 0.0, 1.0) && <Pos>) + (0.0, 1.0, 0.0) * <TerrainParticleHeight> + (((1.0, 0.0, 1.0) && <norm>) * 0.1 * <Length>))
	endif
	wait \{1 gameframe}
	repeat
endscript

script Hero_ContinuousTerrainParticles_Switch 
	if CompositeObjectExists <ParticleId>
		<ParticleId> :emitrate rate = 0
		<ParticleId> :destroy ifempty = 1
	endif
	goto Hero_ContinuousTerrainParticles_On params = <...>
endscript

script GetParticleType \{params_script}
	type = flexible
	if CheckFlexibleParticleStructure <params_script>
		if globalexists name = <params_script> type = structure
			if StructureContains structure = (<params_script>) particletype
				switch (<params_script>.particletype)
					case flexparticle
					type = flexible
					case splineparticle
					type = fast
				endswitch
			else
				if StructureContains structure = (<params_script>) class
					if ((<params_script>.class) = particleobject)
						type = fast
					endif
				endif
			endif
		endif
	endif
	if CheckSplineParticleStructure <params_script>
		if globalexists name = <params_script> type = structure
			if StructureContains structure = (<params_script>) particletype
				switch (<params_script>.particletype)
					case flexparticle
					type = flexible
					case splineparticle
					type = fast
				endswitch
			else
				if StructureContains structure = (<params_script>) class
					if ((<params_script>.class) = particleobject)
						type = fast
					endif
				endif
			endif
		endif
	endif
	return type = <type>
endscript

script waterripplegenerated 
endscript
