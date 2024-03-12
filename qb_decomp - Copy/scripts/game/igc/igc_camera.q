
script IGC_Camera_MoveToPlayer \{Time = 0 Motion = smooth}
	cameraid = skatercam0
	<cameraid> :GetHFOV
	CCam_DoMorph {
		lockto = <cameraid>
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = <hFOV>
		Time = <Time>
		Motion = <Motion>
	}
	if NOT gotParam \{no_block}
		CCam_WaitMorph
	endif
endscript
