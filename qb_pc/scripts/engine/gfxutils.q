isolate_2d_render = 0
pix_output = 0

script HiResScreenshot \{Scale = 1}
	if CutsceneFinished \{name = cutscene}
		pausegame
		GetCurrentCameraObject
	else
		PlayIGCCam \{name = hires_cutscene_hack interrupt_current Play_hold}
		wait \{1 gameframes}
		GetSkaterCamAnimParams \{name = hires_cutscene_hack}
		<cameraid> = <cam_object_id>
	endif
	<cameraid> = <camid>
	printstruct <...>
	<i> = 0
	wait \{30 frames ignoreslomo}
	printf \{"11111111111111111111111111111111111111"}
	begin
	<j> = 0
	begin
	printf \{"222222222222222222222222222222222"}
	FormatText textname = text 'hi_res_screen_%a_%b_' a = <i> b = <j>
	Sub = ((<i> * <Scale>) + <j>)
	<cameraid> :setsubfrustum res = <Scale> subimage = <Sub>
	wait \{16 frame ignoreslomo}
	ScreenShot filename = <text>
	wait \{16 frames ignoreslomo}
	<j> = (<j> + 1)
	repeat <Scale>
	<i> = (<i> + 1)
	repeat <Scale>
	<cameraid> :setsubfrustum res = 1 subimage = 0
	root_window :DoMorph \{alpha = 1}
	if GotParam \{Do2D}
		if IsXenon
			change \{isolate_2d_render = 1}
			wait \{3 frames}
			<i> = 0
			begin
			<j> = 0
			begin
			FormatText textname = text 'hi_res_screen_2d_%a_%b_' a = <i> b = <j>
			Sub = ((<i> * <Scale>) + <j>)
			<cameraid> :setsubfrustum res = <Scale> subimage = <Sub>
			wait \{16 frames}
			ScreenShot filename = <text>
			wait \{16 frames}
			<j> = (<j> + 1)
			repeat <Scale>
			<i> = (<i> + 1)
			repeat <Scale>
			<cameraid> :setsubfrustum res = 1 subimage = 0
			change \{isolate_2d_render = 0}
		endif
	endif
	if CutsceneFinished \{name = cutscene}
		UnPauseGame
	else
		KillSkaterCamAnim \{name = hires_cutscene_hack}
	endif
endscript

script SpawnHiResScreenshot 
	SpawnScriptLater HiResScreenshot params = <...>
endscript

script CubeMapScreenshots 
	change \{show_zone_budget_warnings = 0}
	change \{no_render_metrics = 1}
	root_window :DoMorph \{alpha = 0}
	if CompositeObjectExists \{skater}
		skater :hide
	endif
	SetScreen \{aspect = 1.0}
	lock_cam_cube_dir \{dir = (1.0, 0.0, 0.0)}
	wait \{16 gameframes}
	ScreenShot \{filename = 'cubemap_screen_A'}
	wait \{16 gameframes}
	lock_cam_cube_dir \{dir = (-1.0, 0.0, 0.0)}
	wait \{16 gameframes}
	ScreenShot \{filename = 'cubemap_screen_B'}
	wait \{16 gameframes}
	lock_cam_cube_dir \{dir = (0.0, 1.0, 0.0)}
	wait \{16 gameframes}
	ScreenShot \{filename = 'cubemap_screen_C'}
	wait \{16 gameframes}
	lock_cam_cube_dir \{dir = (0.0, -1.0, 0.0)}
	wait \{16 gameframes}
	ScreenShot \{filename = 'cubemap_screen_D'}
	wait \{16 gameframes}
	lock_cam_cube_dir \{dir = (0.0, 0.0, 1.0)}
	wait \{16 gameframes}
	ScreenShot \{filename = 'cubemap_screen_F'}
	wait \{16 gameframes}
	lock_cam_cube_dir \{dir = (0.0, 0.0, -1.0)}
	wait \{16 gameframes}
	ScreenShot \{filename = 'cubemap_screen_E'}
	wait \{16 gameframes}
	SetScreen \{aspect = 1.3333334}
	root_window :DoMorph \{alpha = 1}
	skater :unhide
	KillSkaterCamAnim \{all}
	change \{show_zone_budget_warnings = 1}
	change \{no_render_metrics = 0}
endscript

script SpawnCubeMapScreenshots 
	SpawnScriptLater CubeMapScreenshots params = <...>
endscript

script lock_cam_top_down 
	KillSkaterCamAnim \{all}
	GetCurrentCameraObject
	<camid> :obj_getposition
	<camid> :gethfov
	PlayIGCCam {
		facing = (0.0, -1.0, 0.0)
		Pos = <Pos>
		FOV = <hfov>
		Play_hold
	}
endscript

script lock_cam_cube_dir \{dir = (1.0, 0.0, 0.0)}
	KillSkaterCamAnim \{all}
	GetCurrentCameraObject
	<camid> :obj_getposition
	<camid> :gethfov
	PlayIGCCam {
		facing = <dir>
		Pos = <Pos>
		FOV = 90.0
		Play_hold
	}
endscript
