proximobj_composite_structure = [
	{
		Component = sound
	}
]
particle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = particle
	}
]
moving_particle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = motion
	}
	{
		Component = particle
	}
]
flexparticle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = flexibleparticle
	}
]
moving_flexparticle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = motion
	}
	{
		Component = flexibleparticle
	}
]
viewercam_composite_structure = [
	{
		Component = camera
		far_clip = $camera_default_far_clip
	}
	{
		Component = proximtrigger
		cube_length = 0.4
		trigger_checksum = camera
		inactive
	}
]
levellight_composite_structure = [
	{
		Component = positionmorph
	}
	{
		Component = dynamiclight
	}
]
igc_camera_structure = [
	{
		Component = cinematiccamera
		updatewhencamerainactive = FALSE
	}
	{
		Component = camera
	}
]
gridobj_composite_structure = [
	{
		Component = Suspend
	}
]
geometryobject_structure = [
	{
		Component = geometryobject
	}
]
master_node_composite_structure = [
	{
		Component = eventcache
	}
	{
		Component = statemachinemanager
	}
]
gameobj_composite_structure = [
	{
		Component = lockobj
		Off
	}
	{
		Component = motion
	}
]
constraint_composite_structure = [
	{
		Component = constraint
	}
]
bouncy_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = rigidbody
	}
	{
		Component = sound
	}
]

script ProcessorGroup_RegisterDefault 
	RegisterProcessorGroupDesc \{name = ProcessorGroup_CompositeSystem processors = [{name = Processor_Default Task = {name = ptask_default}}]}
	ProcessorMgr_Init \{group = ProcessorGroup_CompositeSystem}
endscript

script PassGroup_RegisterDefault 
	RegisterPassGroupDesc \{name = PassGroup_CompositeSystem passes = [{name = pass_default processors = [Processor_Default]}{name = Pass_Agent processors = [Processor_Default]}{name = Pass_Behavior processors = [Processor_Default]}{name = Pass_Anim processors = [Processor_Default]}{name = pass_move processors = [Processor_Default]}{name = Pass_Model processors = [Processor_Default]}]}
	PassMgr_Init \{group = PassGroup_CompositeSystem}
endscript

script CompositeObjects_RegisterDefault 
	PassDefault_components = [
		{name = Suspend}
		{name = bbox}
		{name = objectproximity}
		{name = sound}
		{name = stream}
	]
	RegisterCompositeObjectDesc {
		name = compositehuman
		callback = CompositeAgent_CustomizeComponents
		passes =
		[
			{pass = pass_default
				Components = <PassDefault_components>
			}
			{pass = Pass_Agent
				Components = [{name = pedlife}
					{name = aiinfo}
					{name = Agent}
					{name = fam}
					{name = locator}
					{name = itemcontrol}
					{name = vision}
					{name = collisioncache
						params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{name = navigation}
					{name = motion}
					{name = ragdoll}
				]
			}
			{pass = Pass_Behavior
				Components = [{name = eventcache}
					{name = behaviorsystem}
					{name = inventory}
					{name = seek}
					{name = passenger}
					{name = targetable}
					{name = proximity}
					{name = interact}
					{name = skaterloopingsound}
					{name = AnimTree}
					{name = lockobj
						params = {lock_to_object_matrix
							Off}}
					{name = navcollision}
					{name = aligntoground
						params = {Off}}
				]
			}
			{pass = Pass_Model
				Components = [{name = skeleton}
					{name = Model}
					{name = specialitem}
					{name = proximtrigger
						params = {trigger_checksum = ped , cube_length = 0.4}}
				]
			}
		]
	}
	RegisterCompositeObjectDesc {
		name = compositevehicle
		callback = CompositeAgent_CustomizeComponents
		passes =
		[
			{pass = pass_default
				Components = <PassDefault_components>
			}
			{pass = Pass_Agent
				Components = [{name = pedlife}
					{name = aiinfo}
					{name = Agent}
					{name = fam}
					{name = locator}
					{name = itemcontrol}
					{name = collisioncache
						params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{name = navigation}
					{name = motion}
				]
			}
			{pass = Pass_Behavior
				Components = [{name = eventcache}
					{name = behaviorsystem}
					{name = seek}
					{name = interact}
					{name = vehiclephysics}
					{name = AnimTree}
					{name = Input
						params = {controller = 1}}
				]
			}
			{pass = Pass_Model
				Components = [{name = skeleton}
					{name = Model}
					{name = proximtrigger
						params = {trigger_checksum = vehicle , cube_length = 0.4}}
				]
			}]
	}
	RegisterCompositeObjectDesc \{name = CompositeGameObject_SimpleHover callback = NullScript passes = [{pass = pass_default Components = [{name = Suspend}]}{pass = pass_move Components = [{name = hover}]}{pass = Pass_Model Components = [{name = objectproximity}{name = Model}]}]}
	RegisterCompositeObjectDesc \{name = CompositeGameObject_StandardRigidBody callback = NullScript passes = [{pass = pass_default Components = [{name = Suspend}]}{pass = pass_move Components = [{name = rigidbody}]}{pass = Pass_Model Components = [{name = sound}{name = Model}]}]}
	AdObject_components = [{name = Model}
		{name = motion}
	]
	Massive_components = [{name = massivead}]
	AdObject_components = (<AdObject_components> + <Massive_components>)
	RegisterCompositeObjectDesc {
		name = compositegameobject_adobject
		callback = NullScript
		passes =
		[
			{pass = pass_default
				Components = <AdObject_components>
			}
		]
	}
endscript

script CompositeAgent_CustomizeComponents 
	if GotParam \{compassbliptype}
		createcomponentfromstructure Component = compassblip <...>
	endif
	if GotParam \{voice_profile}
		if StructureContains \{structure = appearance voice_profile}
			voice_profile = (<appearance>.voice_profile)
		else
			voice_profile = (<profile>.voice_profile)
		endif
		if StructureContains structure = $NoticeVoVoiceProfiles <voice_profile>
			has_notice_vo = ($NoticeVoVoiceProfiles.<voice_profile>)
		else
			has_notice_vo = FALSE
		endif
		settags {
			profile = <profile>
			voice_profile = <voice_profile>
			has_notice_vo = <has_notice_vo>
		}
	endif
endscript
