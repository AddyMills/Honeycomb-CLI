
script IGC_Camera_MoveToPlayer \{time = 0 motion = smooth}
	cameraid = skatercam0
	<cameraid> :gethfov
	ccam_domorph {
		LockTo = <cameraid>
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = <hfov>
		time = <time>
		motion = <motion>
	}
	if NOT GotParam \{no_block}
		ccam_waitmorph
	endif
endscript
