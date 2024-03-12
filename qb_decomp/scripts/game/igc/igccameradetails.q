debug_igc_camera = 0
igc_camera_show_frame_info = 0
cinematic_camera_default_lerp_params = {
	type = all
	on = 1
	slow_lerp_factor = 0.6
	fast_lerp_factor = 0.0
	lerp_dropoff = 16.0
}
cinematic_camera_default_handcam_params = {
	motionx = {
		amplitude = 0.033999998
		center = 0.0
		periodbase = 0.012999999
		periodmultiples = [
			1
			3
			4
		]
	}
	motiony = {
		amplitude = 0.04
		center = 0.0
		periodbase = 0.016999999
		periodmultiples = [
			1
			3
			4
		]
	}
	amplitudeposition = {
		amplitude = 0.2
		center = 0.0
		periodbase = 0.0023
		periodmultiples = [
			1
			16
		]
	}
	amplituderotation = {
		amplitude = -0.3
		center = 0.0
		periodbase = 0.0023
		periodmultiples = [
			1
		]
	}
	zoomstabilitymap = [
		(1.3, 0.7)
		(30.0, 100.0)
	]
	driftslerpmap = [
		(0.0, 0.8)
		(0.05, 1.0)
	]
	zoomdriftmap = [
		(1.2, 0.6)
		(30.0, 100.0)
	]
	driftallowedamplitude = {
		amplitude = 0.4
		center = 1.0
		periodbase = 0.02
		periodmultiples = [
			1
		]
	}
}

script igc_runcamerascript 
	ccam_on
	if GotParam \{ControlScript}
		<ControlScript> <params>
	else
		ccam_setsmoothing \{type = all on = 1 fast_lerp_factor = 0.6}
		<cam_params> = <...>
		RemoveComponent \{structure_name = cam_params name = time}
		ccam_domorph <cam_params>
		if GotParam \{frames}
			scriptassert \{"PlayIGCCam frames is deprecated; please use time= in seconds instead"}
		endif
		if GotParam \{time}
			wait <time> seconds
		endif
	endif
	if GotParam \{Play_hold}
		play_hold_value = <Play_hold>
		if GotParam \{play_hold_value}
			if NOT (<play_hold_value> = 1)
				RemoveParameter \{Play_hold}
			endif
		endif
		if GotParam \{Play_hold}
			begin
			wait \{1 gameframes}
			repeat
		endif
	endif
endscript

script igc_camera_update_frame_count 
	if NOT ScreenElementExists \{id = igc_camera_frame_info}
		SetScreenElementLock \{id = root_window Off}
		CreateScreenElement \{parent = root_window
			id = igc_camera_frame_info
			type = ContainerElement
			z_priority = 10000}
		CreateScreenElement \{type = TextElement
			parent = igc_camera_frame_info
			local_id = counter1
			Pos = (25.0, 400.0)
			text = ""
			font = text_a1
			rgba = [
				60
				60
				100
				100
			]
			just = [
				left
				center
			]
			Scale = 0.8}
		CreateScreenElement \{type = TextElement
			parent = igc_camera_frame_info
			local_id = counter2
			Pos = (25.0, 418.0)
			text = ""
			font = text_a1
			rgba = [
				60
				60
				100
				100
			]
			just = [
				left
				center
			]
			Scale = 0.8}
	endif
	FormatText {
		textname = text1
		"Frame %f"
		f = <frames>
	}
	FormatText {
		textname = text2
		"%m:%s:%p"
		m = <minutes>
		s = <seconds>
		p = <pct>
		integer_width = 2
	}
	SetScreenElementProps id = {igc_camera_frame_info child = counter1} text = <text1>
	SetScreenElementProps id = {igc_camera_frame_info child = counter2} text = <text2>
endscript

script igc_camera_frame_counter_kill 
	if ScreenElementExists \{id = igc_camera_frame_info}
		DestroyScreenElement \{id = igc_camera_frame_info}
	endif
endscript
