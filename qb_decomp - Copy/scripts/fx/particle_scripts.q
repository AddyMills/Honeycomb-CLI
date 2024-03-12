Force_Particle_Update_Time = 1.0

script CreateFlexibleParticleSystem \{groupID = 0}
	if gotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT gotParam \{params_Script}
		if NOT Globalexists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
			return
		endif
	endif
	if NOT gotParam \{objId}
		Obj_Getid
	endif
	MangleChecksums A = <Name> B = <objId>
	if NOT ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFlexibleParticleSystem
				ignore_duplicates
				Name = <mangled_ID>
				destroy_params = {Name = <Name> objId = <objId>}
			}
		endif
		alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> objId = <objId> Bone = <Bone> attachNode = <attachNode> Bone = <Bone> groupID = <groupID> PERM = <PERM>
	endif
endscript

script CreateFlexibleParticleSystem_Editor 
	killspawnedScript \{Name = CreateFlexibleParticleSystem_Editor_Spawned}
	SpawnScriptNOw CreateFlexibleParticleSystem_Editor_Spawned Params = <...>
endscript

script CreateFlexibleParticleSystem_Editor_Spawned \{groupID = 0}
	if gotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT gotParam \{objId}
		Obj_Getid
	endif
	if gotParam \{attachObjId}
		<objId> = <attachObjId>
	endif
	if gotParam \{objId}
		attachObjId = <objId>
	endif
	if gotParam \{objId}
		MangleChecksums A = <Name> B = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if (iscreated <Name>)
		<Name> :DIE
		Wait \{1 Frame}
	endif
	if (iscreated <mangled_ID>)
		<mangled_ID> :DIE
		Wait \{1 Frame}
	endif
	if NOT iscreated <mangled_ID>
		if (gotParam Attach)
			alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> objId = <attachObjId> attachNode = <attachNode> Bone = <Bone> groupID = <groupID> PERM = <PERM>
		else
			alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> groupID = <groupID> PERM = <PERM>
		endif
	endif
endscript

script GetFlexibleParticleSystem 
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{objId}
		Obj_Getid
	endif
	MangleChecksums A = <Name> B = <objId>
	if ObjectExists Id = <mangled_ID>
		return systemID = <mangled_ID>
	endif
endscript

script DestroyFlexibleParticleSystem 
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{objId}
		Obj_Getid
	endif
	MangleChecksums A = <Name> B = <objId>
	if ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript

script DestroyFlexibleParticleSystem_Editor 
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{objId}
		Obj_Getid
	endif
	MangleChecksums A = <Name> B = <objId>
	if ObjectExists Id = <Name>
		<Name> :DestroyParticles
	endif
	if ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript
LockableFlexibleParticleComponents = [
	{
		component = LockObj
	}
	{
		component = FlexibleParticle
	}
]

script alloc_flexible_particle \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>
		Printf \{"Invalid particle structure"}
		return
	endif
	if gotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			Heap = GameObj
		else
			Priority = COIM_Priority_Effects
			Heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	CreateGameObject Priority = <Priority> Heap = <Heap> components = $LockableFlexibleParticleComponents Params = {
		Name = <Name>
		<params_Script>
		IgnoreLockDie
		Id = <objId>
		parent_object = <objId>
		Bone = <Bone>
		groupID = <groupID>
		attachNode = <attachNode>
		object_type = Particle
	}
endscript
SuspendibleFlexibleParticleComponents = [
	{
		component = FlexibleParticle
	}
]
FlexibleParticleComponents = [
	{
		component = FlexibleParticle
	}
]

script CreateGlobalFlexParticleSystem \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>
		Printf \{"Invalid particle structure"}
		return
	endif
	if gotParam \{PERM}
		Priority = COIM_Priority_Permanent
		Heap = GameObj
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT gotParam \{params_Script}
		if NOT Globalexists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
			return
		endif
	endif
	if NOT ObjectExists Id = <Name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFlexParticleSystem
				ignore_duplicates
				Name = <Name>
				destroy_params = {Name = <Name>}
			}
		endif
		if structureContains \{Structure = params_Script SuspendDistance}
			CreateGameObject Priority = <Priority> Heap = <Heap> components = $SuspendibleFlexibleParticleComponents Params = {
				Name = <Name>
				<params_Script>
				groupID = <groupID>
				pos = <pos>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> components = $FlexibleParticleComponents Params = {
				Name = <Name>
				<params_Script>
				groupID = <groupID>
				pos = <pos>
				object_type = Particle
			}
		endif
	endif
endscript

script DestroyGlobalFlexParticleSystem 
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if ObjectExists Id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :DestroyParticles
	endif
endscript

script CreateFastParticleSystem \{groupID = 0}
	CreateSplineParticleSystem Params = <...>
endscript

script CreateSplineParticleSystem \{groupID = 0}
	if gotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT gotParam \{params_Script}
		if NOT Globalexists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
			return
		endif
	endif
	if gotParam \{attachObjId}
		<objId> = <attachObjId>
	endif
	if gotParam \{objId}
		attachObjId = <objId>
	endif
	if gotParam \{objId}
		MangleChecksums A = <Name> B = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if NOT iscreated <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFastParticleSystem
				ignore_duplicates
				Name = <mangled_ID>
				destroy_params = {Name = <Name> attachObjId = <attachObjId>}
			}
		endif
		alloc_spline_particle {params_Script = <params_Script> Name = <mangled_ID> attachObjId = <objId> objId = <objId> Bone = <Bone> groupID = <groupID>
			attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
	endif
	if ((iscreated <mangled_ID>) && (gotParam objId) && (structureContains Structure = params_Script applyenvbrightness))
		<mangled_ID> :applyenvbrightness from = <objId>
	endif
	if iscreated <mangled_ID>
		return systemID = <mangled_ID>
	endif
endscript

script CreateSplineParticleSystem_Editor 
	killspawnedScript \{Name = CreateSplineParticleSystem_Editor_Spawned}
	SpawnScriptNOw CreateSplineParticleSystem_Editor_Spawned Params = <...>
endscript

script CreateSplineParticleSystem_Editor_Spawned \{groupID = 0}
	if gotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if gotParam \{attachObjId}
		<objId> = <attachObjId>
	endif
	if gotParam \{objId}
		attachObjId = <objId>
	endif
	if gotParam \{objId}
		MangleChecksums A = <Name> B = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if (iscreated <Name>)
		<Name> :DIE
		Wait \{1 Frame}
	endif
	if (iscreated <mangled_ID>)
		<mangled_ID> :DIE
		Wait \{1 Frame}
	endif
	if (iscreated <mangled_ID>)
		<mangled_ID> :UpdateParams {params_Script = <params_Script>}
		if gotParam \{Attach}
			<mangled_ID> :Obj_LockToObject objectName = <objId>
		else
			<mangled_ID> :Obj_LockToObject OFF objectName = <objId>
		endif
	else
		alloc_spline_particle {params_Script = <params_Script> Name = <mangled_ID> attachObjId = <objId> objId = <objId> Bone = <Bone> groupID = <groupID>
			attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
	endif
endscript
SuspendibleFastParticleComponents = [
	{
		component = Particle
	}
]
FastParticleComponents = [
	{
		component = Particle
	}
]

script CreateGlobalFastParticleSystem \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>
		Printf \{"Invalid particle structure"}
		return
	endif
	if gotParam \{PERM}
		Priority = COIM_Priority_Permanent
		Heap = GameObj
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT gotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT gotParam \{params_Script}
		if NOT Globalexists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
			return
		endif
	endif
	if NOT iscreated <Name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFastParticleSystem
				ignore_duplicates
				Name = <Name>
				destroy_params = {Name = <Name>}
			}
		endif
		if structureContains \{Structure = params_Script SuspendDistance}
			CreateGameObject Priority = <Priority> Heap = <Heap> components = SuspendibleFastParticleComponents Params = {
				Name = <Name>
				parent_object = <objId>
				groupID = <groupID>
				<params_Script>
				pos = <pos>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> components = $FastParticleComponents Params = {
				Name = <Name>
				parent_object = <objId>
				groupID = <groupID>
				<params_Script>
				pos = <pos>
				object_type = Particle
			}
		endif
	endif
	if iscreated <Name>
		if gotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> Params = <emit_params>
		endif
	endif
endscript

script DestroyGlobalFastParticleSystem 
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if ObjectExists Id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :DIE
	endif
endscript

script DestroyFastParticleSystem 
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if gotParam \{objId}
		attachObjId = <objId>
	endif
	if gotParam \{attachObjId}
		MangleChecksums A = <Name> B = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DIE
	endif
endscript

script DestroyParticleSystem_Editor 
	killspawnedScript \{Name = DestroyParticleSystem_Editor_Spawn}
	SpawnScriptNOw DestroyParticleSystem_Editor_Spawn Params = <...>
endscript

script DestroyParticleSystem_Editor_Spawn 
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if gotParam \{objId}
		attachObjId = <objId>
	endif
	if gotParam \{attachObjId}
		MangleChecksums A = <Name> B = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists Id = <mangled_ID>
		<mangled_ID> :DIE
	endif
	if ObjectExists Id = <Name>
		<Name> :DIE
	endif
endscript

script DestroySplineParticleSystem_Editor 
	if NOT gotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if gotParam \{objId}
		attachObjId = <objId>
	endif
	if gotParam \{attachObjId}
		MangleChecksums A = <Name> B = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DIE
	endif
	if ObjectExists Id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :DIE
	endif
endscript

script EmitFastParticles 
	if gotParam \{wait_frames}
		Wait <wait_frames> frames
	else
		Wait <wait_seconds> Seconds
	endif
	SetEmitRate \{0}
	begin
	if NOT IsEmitting
		break
	endif
	Wait \{1 Frame}
	repeat
	DIE
endscript
LockableSplineParticleComponents = [
	{
		component = LockObj
	}
	{
		component = Particle
	}
]

script alloc_spline_particle \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>
		Printf \{"Invalid particle structure"}
		return
	endif
	if gotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			Heap = GameObj
		else
			Priority = COIM_Priority_Effects
			Heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	if NOT ObjectExists Id = <Name>
		if gotParam \{attachObjId}
			CreateGameObject Priority = <Priority> Heap = <Heap> components = $LockableSplineParticleComponents Params = {
				Name = <Name>
				<params_Script>
				Id = <attachObjId>
				IgnoreLockDie
				parent_object = <attachObjId>
				Bone = <Bone>
				groupID = <groupID>
				LocalSpace
				creation_node = <creation_node>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				components = [
					{
						component = Particle
						Name = <Name>
						Bone = <Bone>
						groupID = <groupID>
						<params_Script>
					}
				]
				Params = {
					Name = <Name>
					Bone = <Bone>
					creation_node = <creation_node>
					object_type = Particle
				}
			}
			if structureContains \{Structure = params_Script LocalSpace}
				if NOT structureContains \{Structure = params_Script boxPositions}
					printStruct <params_Script>
					Script_Assert \{"No <boxPositions> parameter...  system should not have been defined in LocalSpace"}
				endif
				if ObjectExists Id = <Name>
					<Name> :SetStartPos (<params_Script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists Id = <Name>
		if gotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> Params = <emit_params>
		endif
	endif
endscript

script alloc_fast_particle \{groupID = 0}
	if NOT gotParam \{params_Script}
		if NOT Globalexists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
			return
		endif
	endif
	if gotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			Heap = GameObj
		else
			Priority = COIM_Priority_Effects
			Heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	if NOT ObjectExists Id = <Name>
		if gotParam \{attachObjId}
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				components = [
					{
						component = LockObj
						Id = <attachObjId>
						<params_Script>
						IgnoreLockDie
					}
					{
						component = Particle
						Name = <Name>
						groupID = <groupID>
						parent_object = <attachObjId>
						Bone = <Bone>
						<params_Script>
						systemLifetime = (<params_Script>.EmitDuration)
						systemLifetime = <systemLifetime>
					}
				]
				Params = {
					Name = <Name>
					Bone = <Bone>
					LocalSpace
					creation_node = <creation_node>
					object_type = Particle
				}
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				components = [
					{
						component = Particle
						Name = <Name>
						Bone = <Bone>
						groupID = <groupID>
						<params_Script>
					}
				]
				Params = {
					Name = <Name>
					Bone = <Bone>
					creation_node = <creation_node>
					object_type = Particle
				}
			}
			if structureContains \{Structure = params_Script LocalSpace}
				if NOT structureContains \{Structure = params_Script boxPositions}
					printStruct <params_Script>
					Script_Assert \{"No <boxPositions> parameter...  system should not have been defined in LocalSpace"}
				endif
				if ObjectExists Id = <Name>
					<Name> :SetStartPos (<params_Script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists Id = <Name>
		if gotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> Params = <emit_params>
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
	return rgb = (<rgba> [0] * (1.0, 0.0, 0.0) + <rgba> [1] * (0.0, 1.0, 0.0) + <rgba> [2] * (0.0, 0.0, 1.0)) A = (<rgba> [3])
endscript

script JOW_VectorToRGBA \{rgb = (0.0, 0.0, 0.0) A = 0}
	rgba = [0 0 0 0]
	val = (<rgb>.(1.0, 0.0, 0.0))
	castToInteger \{val}
	setarrayelement Arrayname = rgba Index = 0 NewValue = <val>
	val = (<rgb>.(0.0, 1.0, 0.0))
	castToInteger \{val}
	setarrayelement Arrayname = rgba Index = 1 NewValue = <val>
	val = (<rgb>.(0.0, 0.0, 1.0))
	castToInteger \{val}
	setarrayelement Arrayname = rgba Index = 2 NewValue = <val>
	castToInteger \{A}
	setarrayelement Arrayname = rgba Index = 3 NewValue = <A>
	return rgba = <rgba>
endscript

script Hero_ContinuousTerrainParticles_Off 
	ClearEventHandlerGroup
	SetEventHandler \{Event = NewTerrainType Scr = Hero_ContinuousTerrainParticles_On response = switch_script}
	OnExceptionRun
	block
endscript

script Hero_ContinuousTerrainParticles_On 
	GetTerrainTypeParam param = TreadActions terrain_id = <TerrainType>
	if NOT structureContains \{Structure = TreadActions HeroContinuousParticleParams}
		Goto \{Hero_ContinuousTerrainParticles_Off}
	endif
	GetUniqueCompositeobjectID \{PreferredId = Hero_ContinuousTerrainParticles}
	ClearEventHandlerGroup
	SetEventHandler Event = NewTerrainType Scr = Hero_ContinuousTerrainParticles_Switch response = switch_script Params = {ParticleId = <UniqueId>}
	OnExceptionRun
	begin
	if NOT compositeObjectexists <UniqueId>
		CreateGameObject Priority = COIM_Priority_Effects Heap = Particle OldHeap = COM components = [
			{component = FlexibleParticle}
		] Params = {
			Name = <UniqueId>
			(<TreadActions>.HeroContinuousParticleParams)
			NoVisibilityTest
			object_type = Particle
		}
	endif
	Obj_GetVelocity
	NormalizeVector <vel>
	Obj_GetPosition
	if compositeObjectexists <UniqueId>
		<UniqueId> :Obj_SetPosition Position = (((1.0, 0.0, 1.0) && <pos>) + (0.0, 1.0, 0.0) * <TerrainParticleHeight> + (((1.0, 0.0, 1.0) && <norm>) * 0.1 * <length>))
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script Hero_ContinuousTerrainParticles_Switch 
	if compositeObjectexists <ParticleId>
		<ParticleId> :emitRate RATE = 0
		<ParticleId> :Destroy IfEmpty = 1
	endif
	Goto Hero_ContinuousTerrainParticles_On Params = <...>
endscript

script GetParticleType \{params_Script}
	Type = FLEXIBLE
	if CheckFlexibleParticleStructure <params_Script>
		if Globalexists Name = <params_Script> Type = Structure
			if structureContains Structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					Type = FLEXIBLE
					case SplineParticle
					Type = FAST
				endswitch
			else
				if structureContains Structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						Type = FAST
					endif
				endif
			endif
		endif
	endif
	if CheckSplineParticleStructure <params_Script>
		if Globalexists Name = <params_Script> Type = Structure
			if structureContains Structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					Type = FLEXIBLE
					case SplineParticle
					Type = FAST
				endswitch
			else
				if structureContains Structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						Type = FAST
					endif
				endif
			endif
		endif
	endif
	return Type = <Type>
endscript

script WaterRippleGenerated 
endscript
