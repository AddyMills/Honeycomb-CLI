
script align_scale_to_vel_update \{objId = Skater Bone = Bone_Board_Truck_Back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0) base_vel = 800.0 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <objId>
	begin
	if ShouldEmit
		<objId> :Obj_GetVelocity
		NormalizeVector <vel>
		<length> = (<length> / <base_vel>)
		SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
		SetSpeedRange Min = (<min_vel_range> * <length>) MAX = (<max_vel_range> * <length>)
		emitRate RATE = (<length> * <base_emit_rate>)
		if NOT (<update_pos> = 0)
			<X> = 0
			<Y> = 0
			<Z> = 0
			if gotParam \{get_bone_script}
				<get_bone_script> objId = <parentId>
			endif
			<objId> :Obj_GetBonePosition Bone = <Bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <Z> * (0.0, 0.0, 1.0))
			setpos pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<objId> :Obj_GetVelocity
			NormalizeVector <vel>
			<length> = (<length> / <base_vel>)
			emitRate RATE = (<length> * <base_emit_rate>)
		endif
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script align_scale_size_to_vel_update \{objId = Skater Bone = Bone_Board_Truck_Back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0) base_vel = 800.0 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <objId>
	begin
	if ShouldEmit
		<objId> :Obj_GetVelocity
		NormalizeVector <vel>
		<length> = (<length> / <base_vel>)
		SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
		SetSpeedRange Min = (<min_vel_range> * <length>) MAX = (<max_vel_range> * <length>)
		emitRate RATE = (<length> * <base_emit_rate>)
		SetParticleSizeScale scaleSize = <length>
		if NOT (<update_pos> = 0)
			<X> = 0
			<Y> = 0
			<Z> = 0
			if gotParam \{get_bone_script}
				<get_bone_script> objId = <parentId>
			endif
			<objId> :Obj_GetBonePosition Bone = <Bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <Z> * (0.0, 0.0, 1.0))
			setpos pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<objId> :Obj_GetVelocity
			NormalizeVector <vel>
			<length> = (<length> / <base_vel>)
			emitRate RATE = (<length> * <base_emit_rate>)
		endif
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script align_to_vel_update \{objId = Skater Bone = Bone_Board_Truck_Back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0)}
	pos0_offset = <pos_offset>
	<parentId> = <objId>
	begin
	if ShouldEmit
		if compositeObjectexists Name = <objId>
			<objId> :Obj_GetVelocity
			NormalizeVector <vel>
			SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
			if NOT (<update_pos> = 0)
				<X> = 0
				<Y> = 0
				<Z> = 0
				if gotParam \{get_bone_script}
					<get_bone_script> objId = <parentId>
				endif
				<objId> :Obj_GetBonePosition Bone = <Bone>
				<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
				<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
				<pos_offset> = (<pos_offset> + <Z> * (0.0, 0.0, 1.0))
				setpos pos = <pos_offset>
			endif
		endif
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script align_to_obj_orient \{objId = Skater Bone = Bone_Board_Truck_Back update_pos = 0 pos_offset = (0.0, -2.0, 0.0) emit_scale = 1.0}
	pos0_offset = <pos_offset>
	begin
	if ShouldEmit
		<objId> :Obj_GetOrientation
		<Orient> = ((<X> * (1.0, 0.0, 0.0)) + (<Y> * (0.0, 1.0, 0.0)) + (<Z> * (0.0, 0.0, 1.0)))
		NormalizeVector <Orient>
		SetEmitTarget Target = ((<emit_scale> * <norm>))
		if NOT (<update_pos> = 0)
			<X> = 0
			<Y> = 0
			<Z> = 0
			<objId> :Obj_GetBonePosition Bone = <Bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <Z> * (0.0, 0.0, 1.0))
			setpos pos = <pos_offset>
		endif
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script emitRate_Speed \{objId = Skater minRate = 0 maxRate = 64 minSpeed = 0 maxSpeed = 12}
	speedDiff = (<maxSpeed> - <minSpeed>)
	rateDiff = (<maxRate> - <minRate>)
	if (<objId> = PARENT)
		LockObj_GetParent
		printStruct <PARENT>
		objId = <PARENT>
	endif
	begin
	<objId> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> < <minSpeed>)
		newRate = <minRate>
	else
		if (<length> > <maxSpeed>)
			newRate = <maxRate>
		else
			factor = ((<length> - <minSpeed>) / <speedDiff>)
			newRate = (<minRate> + (<factor> * <rateDiff>))
		endif
	endif
	emitRate RATE = <newRate>
	Wait \{1 Frame}
	repeat
endscript

script emitRate_Size_Speed \{objId = Skater minRate = 0 maxRate = 64 minStartSize = (0.4, 0.4) minEndSize = (1.5, 1.5) maxStartSize = (0.8, 0.8) maxEndSize = (3.0, 3.0) minSpeed = 0 maxSpeed = 12}
	JOW_Stars \{'emitRate_Size_Speed'}
	speedDiff = (<maxSpeed> - <minSpeed>)
	rateDiff = (<maxRate> - <minRate>)
	JOW_Stars \{'calc size'}
	sizeDiffStart = (<maxStartSize> - <minStartSize>)
	sizeDiffEnd = (<maxEndSize> - <minEndSize>)
	printStruct <...>
	JOW_Stars \{'begin'}
	begin
	<objId> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> < <minSpeed>)
		newRate = <minRate>
		newSize = <minSize>
	else
		if (<length> > <maxSpeed>)
			newRate = <maxRate>
			newSize = <maxSize>
		else
			factor = ((<length> - <minSpeed>) / <speedDiff>)
			newRate = (<minRate> + (<factor> * <rateDiff>))
			newStartSize = (<minStartSize> + (<factor> * <sizeDiffStart>))
			newEndSize = (<minEndSize> + (<factor> * <sizeDiffEnd>))
		endif
	endif
	emitRate RATE = <newRate>
	SetParticleSize sw = (<newStartSize>.(1.0, 0.0)) Sh = (<newStartSize>.(0.0, 1.0)) ew = (<newEndSize>.(1.0, 0.0)) Eh = (<newEndSize>.(0.0, 1.0))
	Wait \{1 Frame}
	repeat
endscript

script rotDir_Turn \{objId = Skater minrot = 0.0 maxrot = 0.3}
	begin
	if <objId> :IsTurningLeft
		SetRotate Min = (-1 * <minrot>) MAX = (-1 * <maxrot>)
		elseif <objId> :IsTurningRight
		SetRotate Min = <minrot> MAX = <maxrot>
	else
		SetRotate Min = (-1 * <minrot>) MAX = <minrot>
	endif
	Wait \{0.1 Seconds}
	repeat
endscript

script starPower_Butterflies \{sMinW = 1.0 sMaxW = 0.4 eMinH = 0.2 sMaxW = 0.1 sMinH = 0.05 sMaxH = 0.5 eMinH = 0.02 sMaxH = 0.1 cycleTime = 0.5 updateTime = 0.05}
	numSteps = (<cycleTime> / <updateTime>)
	sWStepSize = (2.0 * (<sMaxW> - <sMinW>) / <numSteps>)
	eWStepSize = (2.0 * (<eMaxW> - <eMinW>) / <numSteps>)
	sHStepSize = (2.0 * (<sMaxH> - <sMinH>) / <numSteps>)
	eHStepSize = (2.0 * (<eMaxH> - <eMinH>) / <numSteps>)
	F = <numSteps>
	castToInteger \{F}
	F = (0.1 * RandomRange (0.0, 10.0) * <F>)
	sCurW = (<sMinW> + (<F> * <sHStepSize>))
	eCurW = (<eMinW> + (<F> * <sHStepSize>))
	sCurH = (<sMinH> + (<F> * <sHStepSize>))
	eCurH = (<eMinH> + (<F> * <sHStepSize>))
	factor = 1.0
	begin
	if (<sCurH> < <sMinH> || <eCurH> < <eMinH>)
		sCurW = <sMinW>
		eCurW = <eMinW>
		sCurH = <sMinH>
		eCurH = <eMinH>
		factor = (-1.0 * <factor>)
		elseif (<sCurH> > <sMaxH> || <eCurH> > <eMaxH>)
		sCurW = <sMaxW>
		eCurW = <eMaxW>
		sCurH = <sMaxH>
		eCurH = <eMaxH>
		factor = (-1.0 * <factor>)
	endif
	SetParticleSize sw = <sCurW> ew = <eCurW> Sh = <sCurH> Eh = <eCurH>
	sCurW = (<sCurW> + (<factor> * <sWStepSize>))
	eCurW = (<eCurW> + (<factor> * <eWStepSize>))
	sCurH = (<sCurH> + (<factor> * <sHStepSize>))
	eCurH = (<eCurH> + (<factor> * <eHStepSize>))
	Wait <updateTime> Seconds
	repeat
endscript
