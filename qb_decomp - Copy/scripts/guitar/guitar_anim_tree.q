
script create_band_member \{Name = GUITARIST lightGroup = BAND async = 0 animpak = 1}
	create_band_member_wait_for_lock
	Printf "Create_Band_Member name=%a............." A = <Name>
	formatText Checksumname = bandmember_body_pak '%s_%p_pak_file' S = ($character_pak_crc_to_text.<Name>) P = ($character_pak_crc_to_text.body)
	formatText Checksumname = bandmember_anim_pak '%s_%p_pak_file' S = ($character_pak_crc_to_text.<Name>) P = ($character_pak_crc_to_text.Anim)
	formatText Checksumname = bandmember_instrument_pak '%s_%p_pak_file' S = ($character_pak_crc_to_text.<Name>) P = ($character_pak_crc_to_text.instrument)
	pos = (0.0, 0.0, 0.0)
	Dir = (0.0, 0.0, 1.0)
	if gotParam \{start_node}
		if DoesWaypointExist Name = <start_node>
			GetWaypointPos Name = <start_node>
			GetWaypointDir Name = <start_node>
		endif
	endif
	if compositeObjectexists <Name>
		if gotParam \{useOldPos}
			<Name> :Obj_GetPosition
			<Name> :Obj_GetOrientation
			Dir = ((1.0, 0.0, 0.0) * <X> + (0.0, 1.0, 0.0) * <Y> + (0.0, 0.0, 1.0) * <Z>)
		endif
		<Name> :DIE
	endif
	unload_musician_pak_file desc_id = ($<bandmember_body_pak>) async = <async> Type = body
	unload_musician_pak_file desc_id = ($<bandmember_anim_pak>) async = <async> Type = Anim
	unload_musician_pak_file desc_id = ($<bandmember_instrument_pak>) async = <async> Type = instrument
	Change globalName = <bandmember_body_pak> NewValue = no_pak_id
	Change globalName = <bandmember_anim_pak> NewValue = no_pak_id
	Change globalName = <bandmember_instrument_pak> NewValue = no_pak_id
	if (<Name> = GUITARIST || <Name> = BASSIST)
		startslot = 0
	else
		startslot = 2
	endif
	body_asset_context = 0
	if (<Name> = GUITARIST)
		if compositeObjectexists \{Name = BASSIST}
			BASSIST :hero_pause_anim
		endif
		elseif (<Name> = BASSIST)
		if compositeObjectexists \{Name = GUITARIST}
			GUITARIST :hero_pause_anim
		endif
	endif
	if structureContains Structure = <Profile> musician_body
		if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = body
			create_band_member_unlock
			return \{FALSE}
		endif
		Change globalName = <bandmember_body_pak> NewValue = <filename_crc>
		body_asset_context = <Assetcontext>
		if (<animpak> = 1)
			if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = Anim startslot = <startslot>
				create_band_member_unlock
				return \{FALSE}
			endif
			Change globalName = <bandmember_anim_pak> NewValue = <filename_crc>
		endif
	endif
	if structureContains Structure = <Profile> musician_instrument
		if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = instrument
			create_band_member_unlock
			return \{FALSE}
		endif
		Change globalName = <bandmember_instrument_pak> NewValue = <filename_crc>
	endif
	if (<Name> = GUITARIST)
		if compositeObjectexists \{Name = BASSIST}
			BASSIST :hero_unpause_anim
		endif
		elseif (<Name> = BASSIST)
		if compositeObjectexists \{Name = GUITARIST}
			GUITARIST :hero_unpause_anim
		endif
	endif
	dump_pak_info
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case z_training
		case Z_Viewer
		lightGroup = NONE
		default
		if (<Name> = GUITARIST)
			lightGroup = alt_band
		endif
	endswitch
	if ($soundcheck_in_store = 1)
		<lightGroup> = GUITAR_CENTER_BAND
	endif
	skeleton_name = (<Profile>.Skeleton)
	ragdoll_name = (<Profile>.Ragdoll)
	collision_group = (<Profile>.ragdoll_collision_group)
	if structureContains Structure = <Profile> outfit
		if (<Profile>.outfit = 2)
			skeleton_name = (<Profile>.skeleton2)
			ragdoll_name = (<Profile>.ragdoll2)
			collision_group = (<Profile>.ragdoll_collision_group2)
		endif
	endif
	if structureContains Structure = <Profile> ik_params
		ik_params = (<Profile>.ik_params)
	else
		ik_params = hero_IK_Params
	endif
	CreateCompositeObject {
		components = [
			{
				component = Ragdoll
				initialize_empty = FALSE
				disable_collision_callbacks
				skeletonName = <skeleton_name>
				RagdollName = <ragdoll_name>
				RagdollCollisionGroup = $<collision_group>
			}
			{
				component = setdisplaymatrix
			}
			{
				component = animtree
				animEventTableName = ped_animevents
			}
			{
				component = Skeleton
				skeletonName = <skeleton_name>
			}
			{
				component = model
				lightGroup = <lightGroup>
			}
			{
				component = Motion
			}
		]
		Params = {
			Name = <Name>
			pos = <pos>
			Assetcontext = <body_asset_context>
			<Profile>
			object_type = bandmember
			profilebudget = 800
		}
	}
	<Name> :Obj_SetOrientation Dir = <Dir>
	<Name> :Obj_InitModelFromProfile Struct = <Profile> buildScript = create_ped_model_from_appearance Params = {lightGroup = <lightGroup>}
	switch (<Name>)
		case VOCALIST
		desired_tree = vocalist_static_tree
		case DRUMMER
		desired_tree = drummer_static_tree
		default
		desired_tree = guitarist_static_tree
	endswitch
	<Name> :Anim_InitTree {
		Tree = $<desired_tree>
		animEventTableName = ped_animevents
		NodeIdDeclaration = [
			Base
			body
			BodyTimer
			StrumTimer
			FretTimer
			FingerTimer
			FacialTimer
			Ik
			Standard_Branch
			Turn_Branch
			LeftArmPartial
			LeftHandPartial
			RightArmPartial
			DrummerLeftArm
			DrummerRightArm
			leftarm_timer
			rightarm_timer
			LeftArm
			LeftHand
			RightArm
			Face
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
		Params = {
			ik_params = <ik_params>
		}
	}
	create_band_member_unlock
	return \{TRUE}
endscript

script preload_band_member \{Name = GUITARIST async = 0}
	create_band_member_wait_for_lock
	filename_crc = NONE
	instrument_crc = NONE
	create_guitarist_profile <...>
	if (<found> = 1)
		if structureContains Structure = <Profile> musician_instrument
			if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = instrument
				create_band_member_unlock
				return \{FALSE}
			endif
			instrument_crc = <filename_crc>
		endif
		if structureContains Structure = <Profile> musician_body
			if NOT load_musician_pak_file Profile = <Profile> async = <async> Type = body
				create_band_member_unlock
				return \{FALSE}
			endif
		endif
	endif
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc> TRUE
endscript

script preload_band_member_finish \{Name = GUITARIST async = 0}
	create_band_member_wait_for_lock
	if NOT (<instrument_crc> = NONE)
		unload_musician_pak_file desc_id = <instrument_crc> async = <async> Type = instrument
	endif
	if NOT (<filename_crc> = NONE)
		unload_musician_pak_file desc_id = <filename_crc> async = <async> Type = body
	endif
	create_band_member_unlock
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0

script create_band_member_unlock 
	Change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	Change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	Change \{create_band_member_lock_queue = 0}
	Change \{create_band_member_lock = 1}
endscript

script destroy_band 
	destroy_band_member \{Name = GUITARIST}
	destroy_band_member \{Name = BASSIST}
	destroy_band_member \{Name = DRUMMER}
	destroy_band_member \{Name = VOCALIST}
	if gotParam \{unload_paks}
		force_unload_all_character_paks
	endif
endscript

script destroy_band_member 
	if compositeObjectexists Name = <Name>
		<Name> :DIE
		formatText Checksumname = bandmember_body_pak '%s_%p_pak_file' S = ($character_pak_crc_to_text.<Name>) P = ($character_pak_crc_to_text.body)
		formatText Checksumname = bandmember_anim_pak '%s_%p_pak_file' S = ($character_pak_crc_to_text.<Name>) P = ($character_pak_crc_to_text.Anim)
		formatText Checksumname = bandmember_instrument_pak '%s_%p_pak_file' S = ($character_pak_crc_to_text.<Name>) P = ($character_pak_crc_to_text.instrument)
		unload_musician_pak_file desc_id = ($<bandmember_body_pak>) async = <async> Type = body
		unload_musician_pak_file desc_id = ($<bandmember_anim_pak>) async = <async> Type = Anim
		unload_musician_pak_file desc_id = ($<bandmember_instrument_pak>) async = <async> Type = instrument
		Change globalName = <bandmember_body_pak> NewValue = no_pak_id
		Change globalName = <bandmember_anim_pak> NewValue = no_pak_id
		Change globalName = <bandmember_instrument_pak> NewValue = no_pak_id
	endif
endscript

script kill_character_scripts 
	Printf \{"kill character scripts......."}
	if compositeObjectexists \{Name = GUITARIST}
		GUITARIST :obj_switchscript \{EmptyScript}
	endif
	if compositeObjectexists \{Name = BASSIST}
		BASSIST :obj_switchscript \{EmptyScript}
	endif
	if compositeObjectexists \{Name = VOCALIST}
		VOCALIST :obj_switchscript \{EmptyScript}
	endif
	if compositeObjectexists \{Name = DRUMMER}
		DRUMMER :obj_switchscript \{EmptyScript}
	endif
endscript

script EmptyScript 
endscript

script hero_pause_anim 
	if Anim_AnimNodeExists \{Id = BodyTimer}
		Anim_Command \{Target = BodyTimer Command = Timer_SetSpeed Params = {speed = 0.0}}
	endif
endscript

script hero_unpause_anim 
	if Anim_AnimNodeExists \{Id = BodyTimer}
		Anim_Command \{Target = BodyTimer Command = Timer_SetSpeed Params = {speed = 1.0}}
	endif
endscript

script hero_play_turn_anim \{Blendduration = 0.2 turnBlend = 1.0}
	Anim_Command {
		Target = body
		Command = DegenerateBlend_AddBranch
		Params = {
			Tree = $Hero_turning_tree
			Blendduration = <Blendduration>
			Params = {
				timer_type = Play
				anim_name = <idleAnim>
				second_anim_name = <turnAnim>
				second_anim_blend = <turnBlend>
			}
		}
	}
endscript

script hero_play_blended_anim \{Blendduration = 0.2 BLEND = 1.0}
	if gotParam \{CYCLE}
		timer_type = CYCLE
	else
		timer_type = Play
	endif
	Anim_Command {
		Target = body
		Command = DegenerateBlend_AddBranch
		Params = {
			Tree = $Hero_turning_tree
			Blendduration = <Blendduration>
			Params = {
				timer_type = <timer_type>
				anim_name = <first_anim>
				second_anim_name = <second_anim>
				second_anim_blend = <BLEND>
			}
		}
	}
endscript

script hero_play_strum_anim \{Blendduration = 0.2}
	if Anim_AnimNodeExists \{Id = RightArm}
		Anim_Command {
			Target = RightArm
			Command = DegenerateBlend_AddBranch
			Params = {
				Tree = $hero_strumming_branch
				Blendduration = <Blendduration>
				Params = {
					strum_name = <Anim>
				}
			}
		}
	endif
endscript

script hero_play_fret_anim \{Blendduration = $fret_blend_time}
	if Anim_AnimNodeExists \{Id = LeftArm}
		Anim_Command {
			Target = LeftArm
			Command = DegenerateBlend_AddBranch
			Params = {
				Tree = $hero_fret_branch
				Blendduration = <Blendduration>
				Params = {
					fret_anim = <Anim>
				}
			}
		}
	endif
endscript

script hero_play_finger_anim \{Blendduration = 0.2}
	if Anim_AnimNodeExists \{Id = LeftHand}
		Anim_Command {
			Target = LeftHand
			Command = DegenerateBlend_AddBranch
			Params = {
				Tree = $hero_finger_branch
				Blendduration = <Blendduration>
				Params = {
					finger_anim = <Anim>
				}
			}
		}
	endif
endscript

script hero_play_drum_anim \{Blendduration = $drum_blend_time}
	if Anim_AnimNodeExists \{Id = cymbal1}
		Anim_Command {
			Target = body
			Command = DegenerateBlend_AddBranch
			Params = {
				Tree = $hero_cymbal_branch
				Blendduration = <Blendduration>
				Params = {
					fret_anim = <Anim>
				}
			}
		}
	endif
endscript

script hero_cymbal_anim \{Blendduration = $fret_blend_time}
	if Anim_AnimNodeExists \{Id = cymbal1}
		Anim_Command {
			Target = cymbal1
			Command = DegenerateBlend_AddBranch
			Params = {
				Tree = $hero_cymbal_branch
				Blendduration = <Blendduration>
				Params = {
					fret_anim = <Anim>
				}
			}
		}
	endif
endscript

script hero_play_facial_anim \{Blendduration = 0.0}
	if Anim_AnimNodeExists \{Id = Face}
		Anim_Command {
			Target = Face
			Command = DegenerateBlend_AddBranch
			Params = {
				Tree = $hero_face_branch
				Blendduration = <Blendduration>
				Params = {
					facial_anim = <Anim>
				}
			}
		}
	endif
endscript

script hero_wait_until_anim_finished \{Timer = BodyTimer}
	begin
	if hero_anim_complete Timer = <Timer>
		break
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script hero_anim_complete \{Timer = BodyTimer}
	if NOT Anim_AnimNodeExists Id = <Timer>
		return \{TRUE}
	else
		if Anim_Command Target = <Timer> Command = Timer_IsAnimComplete
			return \{TRUE}
		else
			return \{FALSE}
		endif
	endif
endscript

script hero_wait_until_anim_near_end \{Timer = BodyTimer time_from_end = 0.2}
	begin
	if hero_anim_near_end Timer = <Timer> time_from_end = <time_from_end>
		break
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script hero_anim_near_end \{Timer = BodyTimer}
	if NOT Anim_AnimNodeExists Id = <Timer>
		return \{TRUE}
	else
		if Anim_Command Target = <Timer> Command = Timer_Wait Params = {SecondsFromEnd = <time_from_end>}
			return \{TRUE}
		else
			return \{FALSE}
		endif
	endif
endscript

script hero_disable_arms \{blend_time = 0.25}
	if Anim_AnimNodeExists \{Id = arm_branch}
		if (<blend_time> = 0.0)
			Anim_Command \{Target = arm_branch Command = Modulate_SetStrength Params = {Strength = 0.0 Blendduration = 2.0}}
		else
			Anim_Command {
				Target = arm_branch
				Command = Modulate_StartBlend
				Params = {
					BlendCurve = [0.0 1.0]
					Blendduration = <blend_time>
				}
			}
		endif
	endif
	if Anim_AnimNodeExists \{Id = Ik}
		Obj_Getid
		if (<objId> = DRUMMER)
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 0.0
					Blendduration = <blend_time>
					Chain = Bone_IK_hand_Slave_R
				}
			}
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 0.0
					Blendduration = <blend_time>
					Chain = Bone_IK_hand_Slave_L
				}
			}
		else
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 0.0
					Blendduration = <blend_time>
					Chain = BONE_IK_HAND_GUITAR_R
				}
			}
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 0.0
					Blendduration = <blend_time>
					Chain = BONE_IK_HAND_GUITAR_L
				}
			}
		endif
	endif
endscript

script hero_enable_arms \{blend_time = 0.25}
	if Anim_AnimNodeExists \{Id = arm_branch}
		Anim_Command {
			Target = arm_branch
			Command = Modulate_StartBlend
			Params = {
				BlendCurve = [1.0 0.0]
				Blendduration = <blend_time>
			}
		}
	endif
	if Anim_AnimNodeExists \{Id = Ik}
		Obj_Getid
		if (<objId> = DRUMMER)
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 1.0
					Blendduration = <blend_time>
					Chain = Bone_IK_hand_Slave_R
				}
			}
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 1.0
					Blendduration = <blend_time>
					Chain = Bone_IK_hand_Slave_L
				}
			}
		else
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 1.0
					Blendduration = <blend_time>
					Chain = BONE_IK_HAND_GUITAR_R
				}
			}
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 1.0
					Blendduration = <blend_time>
					Chain = BONE_IK_HAND_GUITAR_L
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
	Obj_Getid
	if (<objId> = DRUMMER)
		left_hand_bone = Bone_IK_hand_Slave_L
		right_hand_bone = Bone_IK_hand_Slave_R
	else
		left_hand_bone = BONE_IK_HAND_GUITAR_L
		right_hand_bone = BONE_IK_HAND_GUITAR_R
	endif
	if (<disable_left_arm> = TRUE)
		Printf \{Channel = newdebug "disable_left_arm is true "}
		if Anim_AnimNodeExists \{Id = left_arm_branch}
			if (<blend_time> = 0.0)
				Anim_Command \{Target = left_arm_branch Command = Modulate_SetStrength Params = {Strength = 0.0 Blendduration = 2.0}}
			else
				Anim_Command {
					Target = left_arm_branch
					Command = Modulate_StartBlend
					Params = {
						BlendCurve = [0.0 1.0]
						Blendduration = <blend_time>
					}
				}
			endif
		else
			Printf \{Channel = newdebug "left_arm_branch doesn't exist......."}
		endif
		if Anim_AnimNodeExists \{Id = Ik}
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 0.0
					Blendduration = <blend_time>
					Chain = <left_hand_bone>
				}
			}
		else
			Printf \{Channel = newdebug "ik node doesn't exist......."}
		endif
	endif
	if (<disable_right_arm> = TRUE)
		if Anim_AnimNodeExists \{Id = right_arm_branch}
			if (<blend_time> = 0.0)
				Anim_Command \{Target = right_arm_branch Command = Modulate_SetStrength Params = {Strength = 0.0 Blendduration = 2.0}}
			else
				Anim_Command {
					Target = right_arm_branch
					Command = Modulate_StartBlend
					Params = {
						BlendCurve = [0.0 1.0]
						Blendduration = <blend_time>
					}
				}
			endif
		endif
		if Anim_AnimNodeExists \{Id = Ik}
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 0.0
					Blendduration = <blend_time>
					Chain = <right_hand_bone>
				}
			}
		endif
	endif
	if (<enable_left_arm> = TRUE)
		if Anim_AnimNodeExists \{Id = left_arm_branch}
			Anim_Command {
				Target = left_arm_branch
				Command = Modulate_StartBlend
				Params = {
					BlendCurve = [1.0 0.0]
					Blendduration = <blend_time>
				}
			}
		endif
		if Anim_AnimNodeExists \{Id = Ik}
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 1.0
					Blendduration = <blend_time>
					Chain = <left_hand_bone>
				}
			}
		endif
	endif
	if (<enable_right_arm> = TRUE)
		if Anim_AnimNodeExists \{Id = right_arm_branch}
			Anim_Command {
				Target = right_arm_branch
				Command = Modulate_StartBlend
				Params = {
					BlendCurve = [1.0 0.0]
					Blendduration = <blend_time>
				}
			}
		endif
		if Anim_AnimNodeExists \{Id = Ik}
			Anim_Command {
				Target = Ik
				Command = IK_SetChainStrength
				Params = {
					Strength = 1.0
					Blendduration = <blend_time>
					Chain = <right_hand_bone>
				}
			}
		endif
	endif
endscript

script drummer_twist 
	if Anim_AnimNodeExists \{Id = bodytwist_branch}
		Anim_Command {
			Target = bodytwist_branch
			Command = Modulate_SetStrength
			Params = {
				Strength = <Strength>
			}
		}
	endif
endscript
generic_static_tree = {
	Type = DegenerateBlend
	Id = body
}
guitarist_static_tree = {
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = Ragdoll
			[
				{
					Type = Ik
					two_bone_chains = ik_params
					Id = Ik
					[
						{
							Type = partialSwitch
							State = On
							[
								{
									Type = DegenerateBlend
									Id = Face
								}
								{
									Type = ApplyDifference
									Id = LeftHandPartial
									[
										{
											$hero_arm_branch
										}
										{
											Type = DegenerateBlend
											Id = body
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
	Type = modulate
	Strength = 1.0
	Id = arm_branch
	[
		{
			Type = add
			[
				{
					Type = modulate
					Strength = 1.0
					Id = left_arm_branch
					[
						{
							Type = add
							[
								{
									Type = DegenerateBlend
									Id = LeftArm
								}
								{
									Type = DegenerateBlend
									Id = LeftHand
								}
							]
						}
					]
				}
				{
					Type = modulate
					Strength = 1.0
					Id = right_arm_branch
					[
						{
							Type = DegenerateBlend
							Id = RightArm
						}
					]
				}
			]
		}
	]
}
hero_body_branch = {
	Type = timer_type
	Id = BodyTimer
	Anim = anim_name
	speed = speed
	Anim_Events = On
	[
		{
			Type = source_type
			Anim = anim_name
		}
	]
}
hero_strumming_branch = {
	Type = Play
	Id = StrumTimer
	Anim = strum_name
	[
		{
			Type = Source
			Anim = strum_name
		}
	]
}
hero_fret_branch = {
	Type = Play
	Id = FretTimer
	Anim = fret_anim
	[
		{
			Type = Source
			Anim = fret_anim
		}
	]
}
hero_finger_branch = {
	Type = Play
	Id = FingerTimer
	Anim = finger_anim
	[
		{
			Type = Source
			Anim = finger_anim
		}
	]
}
hero_face_branch = {
	Type = Play
	Id = FacialTimer
	Anim = facial_anim
	[
		{
			Type = Source
			Anim = facial_anim
		}
	]
}
hero_drumming_branch = {
	Type = timer_type
	Id = timer_id
	Anim = anim_name
	speed = speed
	[
		{
			Type = Source
			Anim = anim_name
		}
	]
}
drummer_twist_branch = {
	Type = Play
	Id = bodytwist_timer
	Anim = anim_name
	[
		{
			Type = modulate
			Strength = 1.0
			Id = bodytwist_branch
			[
				{
					Type = Source
					Anim = anim_name
				}
			]
		}
	]
}
Hero_turning_tree = {
	Type = timer_type
	Id = BodyTimer
	Anim = anim_name
	[
		{
			Type = BLEND
			blend_factor = second_anim_blend
			[
				{
					Type = MotionExtractedSource
					Anim = anim_name
				}
				{
					Type = MotionExtractedSource
					Anim = second_anim_name
				}
			]
		}
	]
}
vocalist_static_tree = {
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = Ragdoll
			[
				{
					Type = Ik
					two_bone_chains = Singer_IK_Params
					[
						{
							Type = partialSwitch
							State = On
							[
								{
									Type = DegenerateBlend
									Id = Face
								}
								{
									Type = DegenerateBlend
									Id = body
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
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = Ragdoll
			[
				{
					Type = Ik
					two_bone_chains = Drummer_Ik_Params
					Id = Ik
					[
						{
							Type = partialSwitch
							State = On
							[
								{
									$drummer_cymbals_branch
								}
								{
									Type = ApplyDifference
									[
										{
											Type = DegenerateBlend
											Id = BodyTwist
										}
										{
											Type = partialSwitch
											State = On
											[
												{
													Type = modulate
													Strength = 1.0
													Id = arm_branch
													[
														{
															Type = add
															[
																{
																	Type = add
																	[
																		{
																			Type = DegenerateBlend
																			Id = DrummerLeftArm
																		}
																		{
																			Type = DegenerateBlend
																			Id = DrummerRightArm
																		}
																	]
																}
																{
																	Type = add
																	[
																		{
																			Type = DegenerateBlend
																			Id = leftfoot
																		}
																		{
																			Type = DegenerateBlend
																			Id = rightfoot
																		}
																	]
																}
															]
														}
													]
												}
												{
													Type = DegenerateBlend
													Id = body
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
	Type = Play
	Id = cymbal_timer_id
	Anim = cymbal_anim
	[
		{
			Type = Source
			Anim = cymbal_anim
		}
	]
}
drummer_cymbals_branch = {
	Type = add
	[
		{
			Type = add
			[
				{
					Type = DegenerateBlend
					Id = cymbal1
				}
				{
					Type = DegenerateBlend
					Id = cymbal2
				}
			]
		}
		{
			Type = add
			[
				{
					Type = DegenerateBlend
					Id = cymbal3
				}
				{
					Type = DegenerateBlend
					Id = cymbal4
				}
			]
		}
	]
}
hero_IK_Params = [
	{
		bone0 = BONE_BICEP_R
		Bone1 = BONE_FOREARM_R
		bone2 = bone_palm_r
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_R
	}
	{
		bone0 = bone_bicep_l
		Bone1 = BONE_FOREARM_L
		bone2 = bone_palm_l
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_L
	}
	{
		bone0 = BONE_THIGH_L
		Bone1 = BONE_KNEE_L
		bone2 = bone_ankle_l
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = BONE_THIGH_R
		Bone1 = BONE_KNEE_R
		bone2 = bone_ankle_r
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Satan_Ik_params = [
	{
		bone0 = BONE_BICEP_R
		Bone1 = BONE_FOREARM_R
		bone2 = bone_palm_r
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_R
	}
	{
		bone0 = bone_bicep_l
		Bone1 = BONE_FOREARM_L
		bone2 = bone_palm_l
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = BONE_IK_HAND_GUITAR_L
	}
	{
		bone0 = BONE_KNEE_L
		Bone1 = bone_ankle_l
		bone2 = BONE_TOE_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = BONE_KNEE_R
		Bone1 = bone_ankle_r
		bone2 = BONE_TOE_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Singer_IK_Params = [
	{
		bone0 = BONE_THIGH_L
		Bone1 = BONE_KNEE_L
		bone2 = bone_ankle_l
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = BONE_THIGH_R
		Bone1 = BONE_KNEE_R
		bone2 = bone_ankle_r
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Drummer_Ik_Params = [
	{
		bone0 = BONE_BICEP_R
		Bone1 = BONE_FOREARM_R
		bone2 = bone_palm_r
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_hand_Slave_R
	}
	{
		bone0 = bone_bicep_l
		Bone1 = BONE_FOREARM_L
		bone2 = bone_palm_l
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_hand_Slave_L
	}
	{
		bone0 = BONE_THIGH_L
		Bone1 = BONE_KNEE_L
		bone2 = bone_ankle_l
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = BONE_THIGH_R
		Bone1 = BONE_KNEE_R
		bone2 = bone_ankle_r
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
hero_ConstraintBones = [
	{
		Type = Twistchild
		Bone = Bone_Twist_Wrist_L
		Target = bone_palm_l
		Amount = 0.5
	}
	{
		Type = Twistchild
		Bone = Bone_Twist_Wrist_R
		Target = bone_palm_r
		Amount = 0.5
	}
	{
		Type = TWIST
		Bone = Bone_Twist_Bicep_Mid_R
		Target = BONE_BICEP_R
		Amount = 0.5
	}
	{
		Type = TWIST
		Bone = Bone_Twist_Bicep_Mid_L
		Target = bone_bicep_l
		Amount = 0.5
	}
	{
		Type = TWIST
		Bone = Bone_Twist_Bicep_Top_R
		Target = BONE_BICEP_R
		Amount = 1.0
	}
	{
		Type = TWIST
		Bone = Bone_Twist_Bicep_Top_L
		Target = bone_bicep_l
		Amount = 1.0
	}
	{
		Type = TWIST
		Bone = Bone_Twist_Thigh_R
		Target = BONE_THIGH_R
		Amount = 0.5
	}
	{
		Type = TWIST
		Bone = Bone_Twist_Thigh_L
		Target = BONE_THIGH_L
		Amount = 0.5
	}
	{
		Type = Split
		Bone = Bone_Split_Knee_R
		Target = BONE_KNEE_R
		Amount = 0.5
	}
	{
		Type = Split
		Bone = Bone_Split_Knee_L
		Target = BONE_KNEE_L
		Amount = 0.5
	}
	{
		Type = SplitR
		Bone = Bone_Split_Ass_R
		Target = Bone_Twist_Thigh_R
		Amount = 0.5
	}
	{
		Type = SplitR
		Bone = Bone_Split_Ass_L
		Target = Bone_Twist_Thigh_L
		Amount = 0.5
	}
	{
		Type = Split
		Bone = Bone_Split_Elbow_R
		Target = BONE_FOREARM_R
		Amount = 0.5
	}
	{
		Type = Split
		Bone = Bone_Split_Elbow_L
		Target = BONE_FOREARM_L
		Amount = 0.5
	}
]
