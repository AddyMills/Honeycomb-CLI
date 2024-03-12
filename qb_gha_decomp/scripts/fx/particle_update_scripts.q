
script align_scale_to_vel_update \{ObjID = skater
		bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)
		base_vel = 800.0
		min_vel_range = 4
		max_vel_range = 8
		base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
	if shouldemit
		<ObjID> :obj_getvelocity
		NormalizeVector <vel>
		<Length> = (<Length> / <base_vel>)
		setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
		setspeedrange min = (<min_vel_range> * <Length>) max = (<max_vel_range> * <Length>)
		emitrate rate = (<Length> * <base_emit_rate>)
		if NOT (<update_pos> = 0)
			<x> = 0
			<y> = 0
			<z> = 0
			if GotParam \{get_bone_script}
				<get_bone_script> ObjID = <parentId>
			endif
			<ObjID> :obj_getboneposition bone = <bone>
			<pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<ObjID> :obj_getvelocity
			NormalizeVector <vel>
			<Length> = (<Length> / <base_vel>)
			emitrate rate = (<Length> * <base_emit_rate>)
		endif
	endif
	wait \{1 gameframe}
	repeat
endscript

script align_scale_size_to_vel_update \{ObjID = skater
		bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)
		base_vel = 800.0
		min_vel_range = 4
		max_vel_range = 8
		base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
	if shouldemit
		<ObjID> :obj_getvelocity
		NormalizeVector <vel>
		<Length> = (<Length> / <base_vel>)
		setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
		setspeedrange min = (<min_vel_range> * <Length>) max = (<max_vel_range> * <Length>)
		emitrate rate = (<Length> * <base_emit_rate>)
		setparticlesizescale scalesize = <Length>
		if NOT (<update_pos> = 0)
			<x> = 0
			<y> = 0
			<z> = 0
			if GotParam \{get_bone_script}
				<get_bone_script> ObjID = <parentId>
			endif
			<ObjID> :obj_getboneposition bone = <bone>
			<pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<ObjID> :obj_getvelocity
			NormalizeVector <vel>
			<Length> = (<Length> / <base_vel>)
			emitrate rate = (<Length> * <base_emit_rate>)
		endif
	endif
	wait \{1 gameframe}
	repeat
endscript

script align_to_vel_update \{ObjID = skater
		bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
	if shouldemit
		if CompositeObjectExists name = <ObjID>
			<ObjID> :obj_getvelocity
			NormalizeVector <vel>
			setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
			if NOT (<update_pos> = 0)
				<x> = 0
				<y> = 0
				<z> = 0
				if GotParam \{get_bone_script}
					<get_bone_script> ObjID = <parentId>
				endif
				<ObjID> :obj_getboneposition bone = <bone>
				<pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
				<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
				<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
				setpos Pos = <pos_offset>
			endif
		endif
	endif
	wait \{1 gameframe}
	repeat
endscript

script align_to_obj_orient \{ObjID = skater
		bone = Bone_Board_Truck_Back
		update_pos = 0
		pos_offset = (0.0, -2.0, 0.0)
		emit_scale = 1.0}
	pos0_offset = <pos_offset>
	begin
	if shouldemit
		<ObjID> :obj_getorientation
		<orient> = ((<x> * (1.0, 0.0, 0.0)) + (<y> * (0.0, 1.0, 0.0)) + (<z> * (0.0, 0.0, 1.0)))
		NormalizeVector <orient>
		setemittarget target = ((<emit_scale> * <norm>))
		if NOT (<update_pos> = 0)
			<x> = 0
			<y> = 0
			<z> = 0
			<ObjID> :obj_getboneposition bone = <bone>
			<pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	endif
	wait \{1 gameframe}
	repeat
endscript

script emitRate_Speed \{ObjID = skater
		minrate = 0
		maxrate = 64
		minspeed = 0
		maxspeed = 12}
	speedDiff = (<maxspeed> - <minspeed>)
	rateDiff = (<maxrate> - <minrate>)
	if (<ObjID> = parent)
		lockobj_getparent
		printstruct <parent>
		ObjID = <parent>
	endif
	begin
	<ObjID> :obj_getvelocity
	NormalizeVector <vel>
	if (<Length> < <minspeed>)
		newRate = <minrate>
	else
		if (<Length> > <maxspeed>)
			newRate = <maxrate>
		else
			factor = ((<Length> - <minspeed>) / <speedDiff>)
			newRate = (<minrate> + (<factor> * <rateDiff>))
		endif
	endif
	emitrate rate = <newRate>
	wait \{1 frame}
	repeat
endscript

script emitRate_Size_Speed \{ObjID = skater
		minrate = 0
		maxrate = 64
		minStartSize = (0.4, 0.4)
		minEndSize = (1.5, 1.5)
		maxStartSize = (0.8, 0.8)
		maxEndSize = (3.0, 3.0)
		minspeed = 0
		maxspeed = 12}
	JOW_Stars \{'emitRate_Size_Speed'}
	speedDiff = (<maxspeed> - <minspeed>)
	rateDiff = (<maxrate> - <minrate>)
	JOW_Stars \{'calc size'}
	sizeDiffStart = (<maxStartSize> - <minStartSize>)
	sizeDiffEnd = (<maxEndSize> - <minEndSize>)
	printstruct <...>
	JOW_Stars \{'begin'}
	begin
	<ObjID> :obj_getvelocity
	NormalizeVector <vel>
	if (<Length> < <minspeed>)
		newRate = <minrate>
		newsize = <minSize>
	else
		if (<Length> > <maxspeed>)
			newRate = <maxrate>
			newsize = <maxSize>
		else
			factor = ((<Length> - <minspeed>) / <speedDiff>)
			newRate = (<minrate> + (<factor> * <rateDiff>))
			newStartSize = (<minStartSize> + (<factor> * <sizeDiffStart>))
			newEndSize = (<minEndSize> + (<factor> * <sizeDiffEnd>))
		endif
	endif
	emitrate rate = <newRate>
	setparticlesize sw = (<newStartSize>.(1.0, 0.0)) sh = (<newStartSize>.(0.0, 1.0)) ew = (<newEndSize>.(1.0, 0.0)) eh = (<newEndSize>.(0.0, 1.0))
	wait \{1 frame}
	repeat
endscript

script rotDir_Turn \{ObjID = skater minRot = 0.0 maxRot = 0.3}
	begin
	if <ObjID> :IsTurningLeft
		setrotate min = (-1 * <minRot>) max = (-1 * <maxRot>)
	elseif <ObjID> :IsTurningRight
		setrotate min = <minRot> max = <maxRot>
	else
		setrotate min = (-1 * <minRot>) max = <minRot>
	endif
	wait \{0.1 seconds}
	repeat
endscript

script starPower_Butterflies \{sMinW = 1.0
		sMaxW = 0.4
		eMinH = 0.2
		sMaxW = 0.1
		sMinH = 0.05
		sMaxH = 0.5
		eMinH = 0.02
		sMaxH = 0.1
		cycleTime = 0.5
		updateTime = 0.05}
	numsteps = (<cycleTime> / <updateTime>)
	sWStepSize = (2.0 * (<sMaxW> - <sMinW>) / <numsteps>)
	eWStepSize = (2.0 * (<eMaxW> - <eMinW>) / <numsteps>)
	sHStepSize = (2.0 * (<sMaxH> - <sMinH>) / <numsteps>)
	eHStepSize = (2.0 * (<eMaxH> - <eMinH>) / <numsteps>)
	f = <numsteps>
	CastToInteger \{f}
	f = (0.1 * RandomRange (0.0, 10.0) * <f>)
	sCurW = (<sMinW> + (<f> * <sHStepSize>))
	eCurW = (<eMinW> + (<f> * <sHStepSize>))
	sCurH = (<sMinH> + (<f> * <sHStepSize>))
	eCurH = (<eMinH> + (<f> * <sHStepSize>))
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
	setparticlesize sw = <sCurW> ew = <eCurW> sh = <sCurH> eh = <eCurH>
	sCurW = (<sCurW> + (<factor> * <sWStepSize>))
	eCurW = (<eCurW> + (<factor> * <eWStepSize>))
	sCurH = (<sCurH> + (<factor> * <sHStepSize>))
	eCurH = (<eCurH> + (<factor> * <eHStepSize>))
	wait <updateTime> seconds
	repeat
endscript
