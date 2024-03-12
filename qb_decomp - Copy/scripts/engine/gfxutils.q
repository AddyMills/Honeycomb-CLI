ISOLATE_2D_RENDER = 0
pix_output = 0

script HiResScreenshot \{scale = 1}
	if CutsceneFinished \{Name = cutscene}
		Pausegame
		GetCurrentCameraObject
	else
		PlayIGCCam \{Name = hires_cutscene_hack interrupt_current play_hold}
		Wait \{1 gameframes}
		GetSkaterCamAnimParams \{Name = hires_cutscene_hack}
		<cameraid> = <cam_object_id>
	endif
	<cameraid> = <camID>
	printStruct <...>
	<I> = 0
	Wait \{30 frames IgnoreSlomo}
	Printf \{"11111111111111111111111111111111111111"}
	begin
	<J> = 0
	begin
	Printf \{"222222222222222222222222222222222"}
	formatText Textname = Text 'hi_res_screen_%a_%b_' A = <I> B = <J>
	sub = ((<I> * <scale>) + <J>)
	<cameraid> :SetSubFrustum res = <scale> subImage = <sub>
	Wait \{16 Frame IgnoreSlomo}
	screenshot FileName = <Text>
	Wait \{16 frames IgnoreSlomo}
	<J> = (<J> + 1)
	repeat <scale>
	<I> = (<I> + 1)
	repeat <scale>
	<cameraid> :SetSubFrustum res = 1 subImage = 0
	root_window :doMorph \{Alpha = 1}
	if gotParam \{Do2D}
		if isxenon
			Change \{ISOLATE_2D_RENDER = 1}
			Wait \{3 frames}
			<I> = 0
			begin
			<J> = 0
			begin
			formatText Textname = Text 'hi_res_screen_2d_%a_%b_' A = <I> B = <J>
			sub = ((<I> * <scale>) + <J>)
			<cameraid> :SetSubFrustum res = <scale> subImage = <sub>
			Wait \{16 frames}
			screenshot FileName = <Text>
			Wait \{16 frames}
			<J> = (<J> + 1)
			repeat <scale>
			<I> = (<I> + 1)
			repeat <scale>
			<cameraid> :SetSubFrustum res = 1 subImage = 0
			Change \{ISOLATE_2D_RENDER = 0}
		endif
	endif
	if CutsceneFinished \{Name = cutscene}
		unpauseGame
	else
		KillSkaterCamAnim \{Name = hires_cutscene_hack}
	endif
endscript

script SpawnHiResScreenShot 
	Spawnscriptlater HiResScreenshot Params = <...>
endscript

script CubeMapScreenshots 
	Change \{Show_Zone_budget_Warnings = 0}
	Change \{no_render_metrics = 1}
	root_window :doMorph \{Alpha = 0}
	if compositeObjectexists \{Skater}
		Skater :Hide
	endif
	SetScreen \{Aspect = 1.0}
	lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	Wait \{16 gameframes}
	screenshot \{FileName = 'cubemap_screen_A'}
	Wait \{16 gameframes}
	lock_cam_cube_dir \{Dir = (-1.0, 0.0, 0.0)}
	Wait \{16 gameframes}
	screenshot \{FileName = 'cubemap_screen_B'}
	Wait \{16 gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 1.0, 0.0)}
	Wait \{16 gameframes}
	screenshot \{FileName = 'cubemap_screen_C'}
	Wait \{16 gameframes}
	lock_cam_cube_dir \{Dir = (0.0, -1.0, 0.0)}
	Wait \{16 gameframes}
	screenshot \{FileName = 'cubemap_screen_D'}
	Wait \{16 gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, 1.0)}
	Wait \{16 gameframes}
	screenshot \{FileName = 'cubemap_screen_F'}
	Wait \{16 gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, -1.0)}
	Wait \{16 gameframes}
	screenshot \{FileName = 'cubemap_screen_E'}
	Wait \{16 gameframes}
	SetScreen \{Aspect = 1.3333334}
	root_window :doMorph \{Alpha = 1}
	Skater :Unhide
	KillSkaterCamAnim \{All}
	Change \{Show_Zone_budget_Warnings = 1}
	Change \{no_render_metrics = 0}
endscript

script SpawnCubeMapScreenshots 
	Spawnscriptlater CubeMapScreenshots Params = <...>
endscript

script lock_cam_top_down 
	KillSkaterCamAnim \{All}
	GetCurrentCameraObject
	<camID> :Obj_GetPosition
	<camID> :GetHFOV
	PlayIGCCam {
		Facing = (0.0, -1.0, 0.0)
		pos = <pos>
		fov = <hFOV>
		play_hold
	}
endscript

script lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	KillSkaterCamAnim \{All}
	GetCurrentCameraObject
	<camID> :Obj_GetPosition
	<camID> :GetHFOV
	PlayIGCCam {
		Facing = <Dir>
		pos = <pos>
		fov = 90.0
		play_hold
	}
endscript
