proximobj_composite_structure = [
	{
		component = Sound
	}
]
particle_composite_structure = [
	{
		component = suspend
	}
	{
		component = Particle
	}
]
moving_particle_composite_structure = [
	{
		component = suspend
	}
	{
		component = Motion
	}
	{
		component = Particle
	}
]
flexparticle_composite_structure = [
	{
		component = suspend
	}
	{
		component = FlexibleParticle
	}
]
moving_flexparticle_composite_structure = [
	{
		component = suspend
	}
	{
		component = Motion
	}
	{
		component = FlexibleParticle
	}
]
viewercam_composite_structure = [
	{
		component = Camera
		far_clip = $camera_default_far_clip
	}
	{
		component = proximtrigger
		cube_length = 0.4
		trigger_checksum = Camera
		Inactive
	}
]
levellight_composite_structure = [
	{
		component = PositionMorph
	}
	{
		component = dynamiclight
	}
]
igc_camera_structure = [
	{
		component = CinematicCamera
		UpdateWhenCameraInactive = FALSE
	}
	{
		component = Camera
	}
]
gridobj_composite_structure = [
	{
		component = suspend
	}
]
GeometryObject_structure = [
	{
		component = GeometryObject
	}
]
master_node_composite_structure = [
	{
		component = EventCache
	}
	{
		component = StateMachineManager
	}
]
gameobj_composite_structure = [
	{
		component = LockObj
		OFF
	}
	{
		component = Motion
	}
]
constraint_composite_structure = [
	{
		component = constraint
	}
]
bouncy_composite_structure = [
	{
		component = suspend
	}
	{
		component = rigidbody
	}
	{
		component = Sound
	}
]

script ProcessorGroup_RegisterDefault 
	RegisterProcessorGroupDesc \{Name = ProcessorGroup_CompositeSystem processors = [{Name = Processor_Default task = {Name = PTask_Default}}]}
	ProcessorMgr_Init \{Group = ProcessorGroup_CompositeSystem}
endscript

script PassGroup_RegisterDefault 
	RegisterPassGroupDesc \{Name = PassGroup_CompositeSystem passes = [{Name = Pass_Default processors = [Processor_Default]}{Name = Pass_Agent processors = [Processor_Default]}{Name = Pass_Behavior processors = [Processor_Default]}{Name = Pass_Anim processors = [Processor_Default]}{Name = Pass_Move processors = [Processor_Default]}{Name = Pass_Model processors = [Processor_Default]}]}
	PassMgr_Init \{Group = PassGroup_CompositeSystem}
endscript

script CompositeObjects_RegisterDefault 
	PassDefault_components = [
		{Name = suspend}
		{Name = BBox}
		{Name = ObjectProximity}
		{Name = Sound}
		{Name = Stream}
	]
	RegisterCompositeObjectDesc {
		Name = CompositeHuman
		callback = CompositeAgent_CustomizeComponents
		passes =
		[
			{pass = Pass_Default
				components = <PassDefault_components>
			}
			{pass = Pass_Agent
				components = [{Name = PedLife}
					{Name = AiInfo}
					{Name = agent}
					{Name = FAM}
					{Name = Locator}
					{Name = ItemControl}
					{Name = Vision}
					{Name = CollisionCache
						Params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{Name = Navigation}
					{Name = Motion}
					{Name = Ragdoll}
				]
			}
			{pass = Pass_Behavior
				components = [{Name = EventCache}
					{Name = BehaviorSystem}
					{Name = Inventory}
					{Name = Seek}
					{Name = Passenger}
					{Name = Targetable}
					{Name = Proximity}
					{Name = Interact}
					{Name = SkaterLoopingSound}
					{Name = animtree}
					{Name = LockObj
						Params = {lock_to_object_matrix
							OFF}}
					{Name = NavCollision}
					{Name = AlignToGround
						Params = {OFF}}
				]
			}
			{pass = Pass_Model
				components = [{Name = Skeleton}
					{Name = model}
					{Name = SpecialItem}
					{Name = proximtrigger
						Params = {trigger_checksum = Ped , cube_length = 0.4}}
				]
			}
		]
	}
	RegisterCompositeObjectDesc {
		Name = CompositeVehicle
		callback = CompositeAgent_CustomizeComponents
		passes =
		[
			{pass = Pass_Default
				components = <PassDefault_components>
			}
			{pass = Pass_Agent
				components = [{Name = PedLife}
					{Name = AiInfo}
					{Name = agent}
					{Name = FAM}
					{Name = Locator}
					{Name = ItemControl}
					{Name = CollisionCache
						Params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{Name = Navigation}
					{Name = Motion}
				]
			}
			{pass = Pass_Behavior
				components = [{Name = EventCache}
					{Name = BehaviorSystem}
					{Name = Seek}
					{Name = Interact}
					{Name = VehiclePhysics}
					{Name = animtree}
					{Name = input
						Params = {controller = 1}}
				]
			}
			{pass = Pass_Model
				components = [{Name = Skeleton}
					{Name = model}
					{Name = proximtrigger
						Params = {trigger_checksum = Vehicle , cube_length = 0.4}}
				]
			}]
	}
	RegisterCompositeObjectDesc \{Name = CompositeGameObject_SimpleHover callback = nullScript passes = [{pass = Pass_Default components = [{Name = suspend}]}{pass = Pass_Move components = [{Name = Hover}]}{pass = Pass_Model components = [{Name = ObjectProximity}{Name = model}]}]}
	RegisterCompositeObjectDesc \{Name = CompositeGameObject_StandardRigidBody callback = nullScript passes = [{pass = Pass_Default components = [{Name = suspend}]}{pass = Pass_Move components = [{Name = rigidbody}]}{pass = Pass_Model components = [{Name = Sound}{Name = model}]}]}
	AdObject_components = [{Name = model}
		{Name = Motion}
	]
	Massive_components = [{Name = MassiveAd}]
	AdObject_components = (<AdObject_components> + <Massive_components>)
	RegisterCompositeObjectDesc {
		Name = CompositeGameObject_AdObject
		callback = nullScript
		passes =
		[
			{pass = Pass_Default
				components = <AdObject_components>
			}
		]
	}
endscript

script CompositeAgent_CustomizeComponents 
	if gotParam \{CompassBlipType}
		CreateComponentFromStructure component = CompassBlip <...>
	endif
	if gotParam \{voice_profile}
		if structureContains \{Structure = appearance voice_profile}
			voice_profile = (<appearance>.voice_profile)
		else
			voice_profile = (<Profile>.voice_profile)
		endif
		if structureContains Structure = $NoticeVoVoiceProfiles <voice_profile>
			has_notice_vo = ($NoticeVoVoiceProfiles.<voice_profile>)
		else
			has_notice_vo = FALSE
		endif
		SetTags {
			Profile = <Profile>
			voice_profile = <voice_profile>
			has_notice_vo = <has_notice_vo>
		}
	endif
endscript
