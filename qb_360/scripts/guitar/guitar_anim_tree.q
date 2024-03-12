
script create_band_member \{name = guitarist lightgroup = band async = 0 animpak = 1}
	create_band_member_wait_for_lock
	printf "Create_Band_Member name=%a............." a = <name>
	FormatText checksumname = bandmember_body_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.Body)
	FormatText checksumname = bandmember_anim_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.anim)
	FormatText checksumname = bandmember_instrument_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.Instrument)
	Pos = (0.0, 0.0, 0.0)
	dir = (0.0, 0.0, 1.0)
	if GotParam \{start_node}
		if DoesWayPointExist name = <start_node>
			GetWaypointPos name = <start_node>
			GetWaypointDir name = <start_node>
		endif
	endif
	if CompositeObjectExists <name>
		if GotParam \{useoldpos}
			<name> :obj_getposition
			<name> :obj_getorientation
			dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
		endif
		<name> :Die
	endif
	unload_musician_pak_file desc_id = ($<bandmember_body_pak>) async = <async> type = Body
	unload_musician_pak_file desc_id = ($<bandmember_anim_pak>) async = <async> type = anim
	unload_musician_pak_file desc_id = ($<bandmember_instrument_pak>) async = <async> type = Instrument
	change globalname = <bandmember_body_pak> newValue = no_pak_id
	change globalname = <bandmember_anim_pak> newValue = no_pak_id
	change globalname = <bandmember_instrument_pak> newValue = no_pak_id
	if (<name> = guitarist || <name> = bassist)
		startslot = 0
	else
		startslot = 2
	endif
	body_asset_context = 0
	if (<name> = guitarist)
		if CompositeObjectExists \{name = bassist}
			bassist :hero_pause_anim
		endif
		elseif (<name> = bassist)
		if CompositeObjectExists \{name = guitarist}
			guitarist :hero_pause_anim
		endif
	endif
	if StructureContains structure = <profile> musician_body
		if NOT load_musician_pak_file profile = <profile> async = <async> type = Body
			create_band_member_unlock
			return \{FALSE}
		endif
		change globalname = <bandmember_body_pak> newValue = <filename_crc>
		body_asset_context = <assetcontext>
		if (<animpak> = 1)
			if NOT load_musician_pak_file profile = <profile> async = <async> type = anim startslot = <startslot>
				create_band_member_unlock
				return \{FALSE}
			endif
			change globalname = <bandmember_anim_pak> newValue = <filename_crc>
		endif
	endif
	if StructureContains structure = <profile> musician_instrument
		if NOT load_musician_pak_file profile = <profile> async = <async> type = Instrument
			create_band_member_unlock
			return \{FALSE}
		endif
		change globalname = <bandmember_instrument_pak> newValue = <filename_crc>
	endif
	if (<name> = guitarist)
		if CompositeObjectExists \{name = bassist}
			bassist :hero_unpause_anim
		endif
		elseif (<name> = bassist)
		if CompositeObjectExists \{name = guitarist}
			guitarist :hero_unpause_anim
		endif
	endif
	dump_pak_info
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_training
		case z_viewer
		lightgroup = None
		default
		if (<name> = guitarist)
			lightgroup = Alt_Band
		endif
	endswitch
	if ($soundcheck_in_store = 1)
		<lightgroup> = Guitar_Center_Band
	endif
	skeleton_name = (<profile>.skeleton)
	ragdoll_name = (<profile>.ragdoll)
	collision_group = (<profile>.ragdoll_collision_group)
	if StructureContains structure = <profile> outfit
		if (<profile>.outfit = 2)
			skeleton_name = (<profile>.skeleton2)
			ragdoll_name = (<profile>.ragdoll2)
			collision_group = (<profile>.ragdoll_collision_group2)
		endif
	endif
	if StructureContains structure = <profile> ik_params
		ik_params = (<profile>.ik_params)
	else
		ik_params = Hero_IK_Params
	endif
	CreateCompositeObject {
		Components = [
			{
				Component = ragdoll
				initialize_empty = FALSE
				disable_collision_callbacks
				SkeletonName = <skeleton_name>
				ragdollname = <ragdoll_name>
				ragdollcollisiongroup = $<collision_group>
			}
			{
				Component = SetDisplayMatrix
			}
			{
				Component = AnimTree
				animeventtablename = ped_animevents
			}
			{
				Component = skeleton
				SkeletonName = <skeleton_name>
			}
			{
				Component = Model
				lightgroup = <lightgroup>
			}
			{
				Component = motion
			}
		]
		params = {
			name = <name>
			Pos = <Pos>
			assetcontext = <body_asset_context>
			<profile>
			object_type = bandmember
			profilebudget = 800
		}
	}
	<name> :obj_setorientation dir = <dir>
	<name> :obj_initmodelfromprofile struct = <profile> buildscript = create_ped_model_from_appearance params = {lightgroup = <lightgroup>}
	switch (<name>)
		case vocalist
		desired_tree = vocalist_static_tree
		case drummer
		desired_tree = drummer_static_tree
		default
		desired_tree = guitarist_static_tree
	endswitch
	<name> :anim_inittree {
		tree = $<desired_tree>
		animeventtablename = ped_animevents
		nodeiddeclaration = [
			base
			Body
			bodytimer
			StrumTimer
			FretTimer
			FingerTimer
			FacialTimer
			ik
			Standard_Branch
			Turn_Branch
			LeftArmPartial
			LeftHandPartial
			RightArmPartial
			DrummerLeftArm
			DrummerRightArm
			leftarm_timer
			rightarm_timer
			leftarm
			lefthand
			rightarm
			face
			cymbal1
			cymbal2
			cymbal3
			cymbal4
			CymbalTimer1
			CymbalTimer2
			CymbalTimer3
			CymbalTimer4
			leftfoot
			leftfoot_timer
			rightfoot
			rightfoot_timer
			BodyTwist
			bodytwist_timer
			bodytwist_branch
			arm_branch
			left_arm_branch
			right_arm_branch
		]
		params = {
			ik_params = <ik_params>
		}
	}
	create_band_member_unlock
	return \{TRUE}
endscript

script preload_band_member \{name = guitarist async = 0}
	create_band_member_wait_for_lock
	filename_crc = None
	instrument_crc = None
	create_guitarist_profile <...>
	if (<found> = 1)
		if StructureContains structure = <profile> musician_instrument
			if NOT load_musician_pak_file profile = <profile> async = <async> type = Instrument
				create_band_member_unlock
				return \{FALSE}
			endif
			instrument_crc = <filename_crc>
		endif
		if StructureContains structure = <profile> musician_body
			if NOT load_musician_pak_file profile = <profile> async = <async> type = Body
				create_band_member_unlock
				return \{FALSE}
			endif
		endif
	endif
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc> TRUE
endscript

script preload_band_member_finish \{name = guitarist async = 0}
	create_band_member_wait_for_lock
	if NOT (<instrument_crc> = None)
		unload_musician_pak_file desc_id = <instrument_crc> async = <async> type = Instrument
	endif
	if NOT (<filename_crc> = None)
		unload_musician_pak_file desc_id = <filename_crc> async = <async> type = Body
	endif
	create_band_member_unlock
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0

script create_band_member_unlock 
	change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	wait \{1 gameframe}
	repeat
	change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	wait \{1 gameframe}
	repeat
	change \{create_band_member_lock_queue = 0}
	change \{create_band_member_lock = 1}
endscript

script destroy_band 
	destroy_band_member \{name = guitarist}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = drummer}
	destroy_band_member \{name = vocalist}
	if GotParam \{unload_paks}
		force_unload_all_character_paks
	endif
endscript

script destroy_band_member 
	if CompositeObjectExists name = <name>
		<name> :Die
		FormatText checksumname = bandmember_body_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.Body)
		FormatText checksumname = bandmember_anim_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.anim)
		FormatText checksumname = bandmember_instrument_pak '%s_%p_pak_file' s = ($character_pak_crc_to_text.<name>) p = ($character_pak_crc_to_text.Instrument)
		unload_musician_pak_file desc_id = ($<bandmember_body_pak>) async = <async> type = Body
		unload_musician_pak_file desc_id = ($<bandmember_anim_pak>) async = <async> type = anim
		unload_musician_pak_file desc_id = ($<bandmember_instrument_pak>) async = <async> type = Instrument
		change globalname = <bandmember_body_pak> newValue = no_pak_id
		change globalname = <bandmember_anim_pak> newValue = no_pak_id
		change globalname = <bandmember_instrument_pak> newValue = no_pak_id
	endif
endscript

script kill_character_scripts 
	printf \{"kill character scripts......."}
	if CompositeObjectExists \{name = guitarist}
		guitarist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = bassist}
		bassist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = vocalist}
		vocalist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = drummer}
		drummer :Obj_SwitchScript \{EmptyScript}
	endif
endscript

script EmptyScript 
endscript

script hero_pause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer command = timer_setspeed params = {Speed = 0.0}}
	endif
endscript

script hero_unpause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer command = timer_setspeed params = {Speed = 1.0}}
	endif
endscript

script hero_play_turn_anim \{blendduration = 0.2 TurnBlend = 1.0}
	anim_command {
		target = Body
		command = degenerateblend_addbranch
		params = {
			tree = $Hero_turning_tree
			blendduration = <blendduration>
			params = {
				timer_type = play
				anim_name = <Idleanim>
				second_anim_name = <turnAnim>
				second_anim_blend = <TurnBlend>
			}
		}
	}
endscript

script hero_play_blended_anim \{blendduration = 0.2 Blend = 1.0}
	if GotParam \{Cycle}
		timer_type = Cycle
	else
		timer_type = play
	endif
	anim_command {
		target = Body
		command = degenerateblend_addbranch
		params = {
			tree = $Hero_turning_tree
			blendduration = <blendduration>
			params = {
				timer_type = <timer_type>
				anim_name = <first_anim>
				second_anim_name = <second_anim>
				second_anim_blend = <Blend>
			}
		}
	}
endscript

script hero_play_strum_anim \{blendduration = 0.2}
	if anim_animnodeexists \{id = rightarm}
		anim_command {
			target = rightarm
			command = degenerateblend_addbranch
			params = {
				tree = $hero_strumming_branch
				blendduration = <blendduration>
				params = {
					strum_name = <anim>
				}
			}
		}
	endif
endscript

script hero_play_fret_anim \{blendduration = $fret_blend_time}
	if anim_animnodeexists \{id = leftarm}
		anim_command {
			target = leftarm
			command = degenerateblend_addbranch
			params = {
				tree = $hero_fret_branch
				blendduration = <blendduration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_play_finger_anim \{blendduration = 0.2}
	if anim_animnodeexists \{id = lefthand}
		anim_command {
			target = lefthand
			command = degenerateblend_addbranch
			params = {
				tree = $hero_finger_branch
				blendduration = <blendduration>
				params = {
					finger_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_play_drum_anim \{blendduration = $drum_blend_time}
	if anim_animnodeexists \{id = cymbal1}
		anim_command {
			target = Body
			command = degenerateblend_addbranch
			params = {
				tree = $hero_cymbal_branch
				blendduration = <blendduration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_cymbal_anim \{blendduration = $fret_blend_time}
	if anim_animnodeexists \{id = cymbal1}
		anim_command {
			target = cymbal1
			command = degenerateblend_addbranch
			params = {
				tree = $hero_cymbal_branch
				blendduration = <blendduration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_play_facial_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = face}
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = $hero_face_branch
				blendduration = <blendduration>
				params = {
					facial_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_wait_until_anim_finished \{timer = bodytimer}
	begin
	if hero_anim_complete timer = <timer>
		break
	endif
	wait \{1 gameframe}
	repeat
endscript

script hero_anim_complete \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{TRUE}
	else
		if anim_command target = <timer> command = timer_isanimcomplete
			return \{TRUE}
		else
			return \{FALSE}
		endif
	endif
endscript

script hero_wait_until_anim_near_end \{timer = bodytimer time_from_end = 0.2}
	begin
	if hero_anim_near_end timer = <timer> time_from_end = <time_from_end>
		break
	endif
	wait \{1 gameframe}
	repeat
endscript

script hero_anim_near_end \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{TRUE}
	else
		if anim_command target = <timer> command = timer_wait params = {secondsfromend = <time_from_end>}
			return \{TRUE}
		else
			return \{FALSE}
		endif
	endif
endscript

script hero_disable_arms \{blend_time = 0.25}
	if anim_animnodeexists \{id = arm_branch}
		if (<blend_time> = 0.0)
			anim_command \{target = arm_branch command = modulate_setstrength params = {strength = 0.0 blendduration = 2.0}}
		else
			anim_command {
				target = arm_branch
				command = modulate_startblend
				params = {
					blendcurve = [0.0 1.0]
					blendduration = <blend_time>
				}
			}
		endif
	endif
	if anim_animnodeexists \{id = ik}
		obj_getid
		if (<ObjID> = drummer)
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = bone_ik_hand_slave_r
				}
			}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = bone_ik_hand_slave_l
				}
			}
		else
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = bone_ik_hand_guitar_r
				}
			}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = bone_ik_hand_guitar_l
				}
			}
		endif
	endif
endscript

script hero_enable_arms \{blend_time = 0.25}
	if anim_animnodeexists \{id = arm_branch}
		anim_command {
			target = arm_branch
			command = modulate_startblend
			params = {
				blendcurve = [1.0 0.0]
				blendduration = <blend_time>
			}
		}
	endif
	if anim_animnodeexists \{id = ik}
		obj_getid
		if (<ObjID> = drummer)
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = bone_ik_hand_slave_r
				}
			}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = bone_ik_hand_slave_l
				}
			}
		else
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = bone_ik_hand_guitar_r
				}
			}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = bone_ik_hand_guitar_l
				}
			}
		endif
	endif
endscript

script hero_toggle_arms \{num_arms = 2 prev_num_arms = 0 blend_time = 0.25}
	disable_left_arm = FALSE
	enable_left_arm = FALSE
	disable_right_arm = FALSE
	enable_right_arm = FALSE
	if (<num_arms> = 0)
		if (<prev_num_arms> = 1)
			disable_right_arm = TRUE
			elseif (<prev_num_arms> = 2)
			disable_left_arm = TRUE
			disable_right_arm = TRUE
		endif
		elseif (<num_arms> = 1)
		if (<prev_num_arms> = 2)
			disable_right_arm = TRUE
			enable_left_arm = TRUE
		endif
		elseif (<num_arms> = 2)
		if (<prev_num_arms> = 0)
			enable_left_arm = TRUE
			enable_right_arm = TRUE
			elseif (<prev_num_arms> = 1)
			enable_right_arm = TRUE
		endif
	endif
	obj_getid
	if (<ObjID> = drummer)
		left_hand_bone = bone_ik_hand_slave_l
		right_hand_bone = bone_ik_hand_slave_r
	else
		left_hand_bone = bone_ik_hand_guitar_l
		right_hand_bone = bone_ik_hand_guitar_r
	endif
	if (<disable_left_arm> = TRUE)
		printf \{channel = newdebug "disable_left_arm is true "}
		if anim_animnodeexists \{id = left_arm_branch}
			if (<blend_time> = 0.0)
				anim_command \{target = left_arm_branch command = modulate_setstrength params = {strength = 0.0 blendduration = 2.0}}
			else
				anim_command {
					target = left_arm_branch
					command = modulate_startblend
					params = {
						blendcurve = [0.0 1.0]
						blendduration = <blend_time>
					}
				}
			endif
		else
			printf \{channel = newdebug "left_arm_branch doesn't exist......."}
		endif
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		else
			printf \{channel = newdebug "ik node doesn't exist......."}
		endif
	endif
	if (<disable_right_arm> = TRUE)
		if anim_animnodeexists \{id = right_arm_branch}
			if (<blend_time> = 0.0)
				anim_command \{target = right_arm_branch command = modulate_setstrength params = {strength = 0.0 blendduration = 2.0}}
			else
				anim_command {
					target = right_arm_branch
					command = modulate_startblend
					params = {
						blendcurve = [0.0 1.0]
						blendduration = <blend_time>
					}
				}
			endif
		endif
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
	if (<enable_left_arm> = TRUE)
		if anim_animnodeexists \{id = left_arm_branch}
			anim_command {
				target = left_arm_branch
				command = modulate_startblend
				params = {
					blendcurve = [1.0 0.0]
					blendduration = <blend_time>
				}
			}
		endif
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		endif
	endif
	if (<enable_right_arm> = TRUE)
		if anim_animnodeexists \{id = right_arm_branch}
			anim_command {
				target = right_arm_branch
				command = modulate_startblend
				params = {
					blendcurve = [1.0 0.0]
					blendduration = <blend_time>
				}
			}
		endif
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
endscript

script drummer_twist 
	if anim_animnodeexists \{id = bodytwist_branch}
		anim_command {
			target = bodytwist_branch
			command = modulate_setstrength
			params = {
				strength = <strength>
			}
		}
	endif
endscript
generic_static_tree = {
	type = degenerateblend
	id = Body
}
guitarist_static_tree = {
	type = constraintbones
	constraintbones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = ik
					two_bone_chains = ik_params
					id = ik
					[
						{
							type = partialswitch
							state = on
							[
								{
									type = degenerateblend
									id = face
								}
								{
									type = applydifference
									id = LeftHandPartial
									[
										{
											$hero_arm_branch
										}
										{
											type = degenerateblend
											id = Body
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
hero_arm_branch = {
	type = modulate
	strength = 1.0
	id = arm_branch
	[
		{
			type = Add
			[
				{
					type = modulate
					strength = 1.0
					id = left_arm_branch
					[
						{
							type = Add
							[
								{
									type = degenerateblend
									id = leftarm
								}
								{
									type = degenerateblend
									id = lefthand
								}
							]
						}
					]
				}
				{
					type = modulate
					strength = 1.0
					id = right_arm_branch
					[
						{
							type = degenerateblend
							id = rightarm
						}
					]
				}
			]
		}
	]
}
hero_body_branch = {
	type = timer_type
	id = bodytimer
	anim = anim_name
	Speed = Speed
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_strumming_branch = {
	type = play
	id = StrumTimer
	anim = strum_name
	[
		{
			type = source
			anim = strum_name
		}
	]
}
hero_fret_branch = {
	type = play
	id = FretTimer
	anim = fret_anim
	[
		{
			type = source
			anim = fret_anim
		}
	]
}
hero_finger_branch = {
	type = play
	id = FingerTimer
	anim = finger_anim
	[
		{
			type = source
			anim = finger_anim
		}
	]
}
hero_face_branch = {
	type = play
	id = FacialTimer
	anim = facial_anim
	[
		{
			type = source
			anim = facial_anim
		}
	]
}
hero_drumming_branch = {
	type = timer_type
	id = timer_id
	anim = anim_name
	Speed = Speed
	[
		{
			type = source
			anim = anim_name
		}
	]
}
drummer_twist_branch = {
	type = play
	id = bodytwist_timer
	anim = anim_name
	[
		{
			type = modulate
			strength = 1.0
			id = bodytwist_branch
			[
				{
					type = source
					anim = anim_name
				}
			]
		}
	]
}
Hero_turning_tree = {
	type = timer_type
	id = bodytimer
	anim = anim_name
	[
		{
			type = Blend
			blend_factor = second_anim_blend
			[
				{
					type = motionextractedsource
					anim = anim_name
				}
				{
					type = motionextractedsource
					anim = second_anim_name
				}
			]
		}
	]
}
vocalist_static_tree = {
	type = constraintbones
	constraintbones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = ik
					two_bone_chains = singer_IK_Params
					[
						{
							type = partialswitch
							state = on
							[
								{
									type = degenerateblend
									id = face
								}
								{
									type = degenerateblend
									id = Body
								}
							]
						}
					]
				}
			]
		}
	]
}
drummer_static_tree = {
	type = constraintbones
	constraintbones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = ik
					two_bone_chains = drummer_IK_params
					id = ik
					[
						{
							type = partialswitch
							state = on
							[
								{
									$drummer_cymbals_branch
								}
								{
									type = applydifference
									[
										{
											type = degenerateblend
											id = BodyTwist
										}
										{
											type = partialswitch
											state = on
											[
												{
													type = modulate
													strength = 1.0
													id = arm_branch
													[
														{
															type = Add
															[
																{
																	type = Add
																	[
																		{
																			type = degenerateblend
																			id = DrummerLeftArm
																		}
																		{
																			type = degenerateblend
																			id = DrummerRightArm
																		}
																	]
																}
																{
																	type = Add
																	[
																		{
																			type = degenerateblend
																			id = leftfoot
																		}
																		{
																			type = degenerateblend
																			id = rightfoot
																		}
																	]
																}
															]
														}
													]
												}
												{
													type = degenerateblend
													id = Body
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
hero_cymbal_branch = {
	type = play
	id = cymbal_timer_id
	anim = cymbal_anim
	[
		{
			type = source
			anim = cymbal_anim
		}
	]
}
drummer_cymbals_branch = {
	type = Add
	[
		{
			type = Add
			[
				{
					type = degenerateblend
					id = cymbal1
				}
				{
					type = degenerateblend
					id = cymbal2
				}
			]
		}
		{
			type = Add
			[
				{
					type = degenerateblend
					id = cymbal3
				}
				{
					type = degenerateblend
					id = cymbal4
				}
			]
		}
	]
}
Hero_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Slave_R
	}
]
Satan_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
	}
	{
		bone0 = Bone_Knee_L
		bone1 = Bone_Ankle_L
		bone2 = Bone_Toe_L
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Knee_R
		bone1 = Bone_Ankle_R
		bone2 = Bone_Toe_R
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Slave_R
	}
]
singer_IK_Params = [
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Slave_R
	}
]
drummer_IK_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = Bone_IK_Foot_Slave_R
	}
]
hero_ConstraintBones = [
	{
		type = twistchild
		bone = Bone_Twist_Wrist_L
		target = Bone_Palm_L
		amount = 0.5
	}
	{
		type = twistchild
		bone = Bone_Twist_Wrist_R
		target = Bone_Palm_R
		amount = 0.5
	}
	{
		type = twist
		bone = Bone_Twist_Bicep_Mid_R
		target = Bone_Bicep_R
		amount = 0.5
	}
	{
		type = twist
		bone = Bone_Twist_Bicep_Mid_L
		target = Bone_Bicep_L
		amount = 0.5
	}
	{
		type = twist
		bone = Bone_Twist_Bicep_Top_R
		target = Bone_Bicep_R
		amount = 1.0
	}
	{
		type = twist
		bone = Bone_Twist_Bicep_Top_L
		target = Bone_Bicep_L
		amount = 1.0
	}
	{
		type = twist
		bone = Bone_Twist_Thigh_R
		target = Bone_Thigh_R
		amount = 0.5
	}
	{
		type = twist
		bone = Bone_Twist_Thigh_L
		target = Bone_Thigh_L
		amount = 0.5
	}
	{
		type = split
		bone = Bone_Split_Knee_R
		target = Bone_Knee_R
		amount = 0.5
	}
	{
		type = split
		bone = Bone_Split_Knee_L
		target = Bone_Knee_L
		amount = 0.5
	}
	{
		type = splitr
		bone = Bone_Split_Ass_R
		target = Bone_Twist_Thigh_R
		amount = 0.5
	}
	{
		type = splitr
		bone = Bone_Split_Ass_L
		target = Bone_Twist_Thigh_L
		amount = 0.5
	}
	{
		type = split
		bone = Bone_Split_Elbow_R
		target = Bone_Forearm_R
		amount = 0.5
	}
	{
		type = split
		bone = Bone_Split_Elbow_L
		target = Bone_Forearm_L
		amount = 0.5
	}
]
