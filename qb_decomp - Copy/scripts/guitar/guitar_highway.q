button_up_models = {
	Green = {
		Name = button_g
		name_string = 'button_g'
		material_lip = sys_NowBar_Button01_Green_Lip_sys_NowBar_Button01_Green_Lip
		material_mid = sys_NowBar_Button01_Green_Mid2_sys_NowBar_Button01_Green_Mid2
		material_head = sys_NowBar_Head_Green_sys_NowBar_Head_Green
		material_head_lit = sys_NowBar_Head_GreenL_sys_NowBar_Head_GreenL
		material_neck = sys_NowBar_Neck01_sys_NowBar_Neck01
		material_down = sys_NowBar_Button01_Green_Down_sys_NowBar_Button01_Green_Down
	}
	Red = {
		Name = button_r
		name_string = 'button_r'
		material_lip = sys_NowBar_Button01_Red_Lip_sys_NowBar_Button01_Red_Lip
		material_mid = sys_NowBar_Button01_Red_Mid2_sys_NowBar_Button01_Red_Mid2
		material_head = sys_NowBar_Head_Red_sys_NowBar_Head_Red
		material_head_lit = sys_NowBar_Head_RedL_sys_NowBar_Head_RedL
		material_neck = sys_NowBar_Neck01_sys_NowBar_Neck01
		material_down = sys_NowBar_Button01_Red_Down_sys_NowBar_Button01_Red_Down
	}
	Yellow = {
		Name = button_y
		name_string = 'button_y'
		material_lip = sys_NowBar_Button01_Yellow_Lip_sys_NowBar_Button01_Yellow_Lip
		material_mid = sys_NowBar_Button01_Yellow_Mid2_sys_NowBar_Button01_Yellow_Mid2
		material_head = sys_NowBar_Head_Yellow_sys_NowBar_Head_Yellow
		material_head_lit = sys_NowBar_Head_YellowL_sys_NowBar_Head_YellowL
		material_neck = sys_NowBar_Neck01_sys_NowBar_Neck01
		material_down = sys_NowBar_Button01_Yellow_Down_sys_NowBar_Button01_Yellow_Down
	}
	Blue = {
		Name = button_b
		name_string = 'button_b'
		material_lip = sys_NowBar_Button01_Blue_Lip_sys_NowBar_Button01_Blue_Lip
		material_mid = sys_NowBar_Button01_Blue_Mid2_sys_NowBar_Button01_Blue_Mid2
		material_head = sys_NowBar_Head_Blue_sys_NowBar_Head_Blue
		material_head_lit = sys_NowBar_Head_BlueL_sys_NowBar_Head_BlueL
		material_neck = sys_NowBar_Neck01_sys_NowBar_Neck01
		material_down = sys_NowBar_Button01_Blue_Down_sys_NowBar_Button01_Blue_Down
	}
	Orange = {
		Name = button_o
		name_string = 'button_o'
		material_lip = sys_NowBar_Button01_Orange_Lip_sys_NowBar_Button01_Orange_Lip
		material_mid = sys_NowBar_Button01_Orange_Mid2_sys_NowBar_Button01_Orange_Mid2
		material_head = sys_NowBar_Head_Orange_sys_NowBar_Head_Orange
		material_head_lit = sys_NowBar_Head_OrangeL_sys_NowBar_Head_OrangeL
		material_neck = sys_NowBar_Neck01_sys_NowBar_Neck01
		material_down = sys_NowBar_Button01_Orange_Down_sys_NowBar_Button01_Orange_Down
	}
}

script setup_highway \{Player = 1}
	generate_pos_table
	SetScreenElementLock \{Id = root_window OFF}
	if ($current_num_players = 1)
		<pos> = (0.0, 0.0)
		<scale> = (1.0, 1.0)
	else
		if (<Player> = 1)
			<pos> = ((0 - $x_offset_p2) * (1.0, 0.0))
		else
			if NOT ($devil_finish = 1)
				<pos> = ($x_offset_p2 * (1.0, 0.0))
			else
				<pos> = (1000.0, 0.0)
			endif
		endif
		<scale> = (1.0, 1.0)
	endif
	<Container_pos> = (<pos> + (0.0, 720.0))
	formatText Checksumname = container_id 'gem_container%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = containerElement
		Id = <container_id>
		PARENT = root_window
		pos = <Container_pos>
		just = [Left top]
		scale = <scale>
		z_priority = 0
	}
	hpos = ((640.0 - ($highway_top_width / 2.0)) * (1.0, 0.0))
	hDims = ($highway_top_width * (1.0, 0.0))
	<highway_material> = ($<player_status>.highway_material)
	formatText Checksumname = highway_name 'Highway_2D%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <highway_name>
		PARENT = <container_id>
		clonematerial = <highway_material>
		rgba = $highway_normal
		pos = <hpos>
		Dims = <hDims>
		just = [Left Left]
		z_priority = 0.1
	}
	highway_speed = (0.0 - ($gHighwayTiling / ($<player_status>.scroll_time - $destroy_time)))
	Printf "Setting highway speed to: %h" H = <highway_speed>
	Set2DHighwaySpeed speed = <highway_speed> Id = <highway_name> player_status = <player_status>
	fe = ($highway_playline - $highway_height)
	fs = (<fe> + $highway_fade)
	Set2DHighwayFade Start = <fs> End = <fe> Id = <highway_name> Player = <Player>
	pos = ((640 * (1.0, 0.0)) + ($highway_playline * (0.0, 1.0)))
	now_scale = (($nowbar_scale_x * (1.0, 0.0)) + ($nowbar_scale_y * (0.0, 1.0)))
	lpos = (($sidebar_x * (1.0, 0.0)) + ($sidebar_y * (0.0, 1.0)))
	langle = ($sidebar_angle)
	rpos = ((((640.0 - $sidebar_x) + 640.0) * (1.0, 0.0)) + ($sidebar_y * (0.0, 1.0)))
	rangle = (0.0 - ($sidebar_angle))
	scale = (($sidebar_x_scale * (1.0, 0.0)) + ($sidebar_y_scale * (0.0, 1.0)))
	rscale = (((0 - $sidebar_x_scale) * (1.0, 0.0)) + ($sidebar_y_scale * (0.0, 1.0)))
	formatText Checksumname = cont 'sidebar_container_left%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = containerElement
		Id = <cont>
		PARENT = <container_id>
		pos = <lpos>
		Rot_Angle = <langle>
		just = [Center Bottom]
		z_priority = 3
	}
	formatText Checksumname = Name 'sidebar_left%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_sidebar2D_sys_sidebar2D
		rgba = [255 255 255 255]
		pos = (0.0, 0.0)
		scale = <scale>
		just = [Center Bottom]
		z_priority = 3
	}
	Set2DGemFade Id = <Name> Player = <Player>
	formatText Checksumname = cont 'starpower_container_left%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = containerElement
		Id = <cont>
		PARENT = <container_id>
		pos = <lpos>
		Rot_Angle = <langle>
		just = [Center Bottom]
		z_priority = 3
	}
	starpower_pos = (((-55.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((55.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((1.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((1.1 * $starpower_fx_scale) * (0.0, 1.0)))
	formatText Checksumname = Name 'sidebar_left_glow%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Starpower_SDGLOW_sys_Starpower_SDGLOW
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		scale = <starpower_scale>
		just = [Center Bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((-0.5 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formatText Checksumname = Name 'sidebar_left_Lightning01%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Big_Bolt01_sys_Big_Bolt01
		rgba = [0 0 128 128]
		pos = <starpower_pos>
		Rot_Angle = (180)
		scale = <starpower_scale>
		just = [Center top]
		z_priority = 4
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formatText Checksumname = Name 'sidebar_left_Lightning02%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Big_Bolt01_sys_Big_Bolt01
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		Rot_Angle = (180)
		scale = <starpower_scale>
		just = [Center top]
		z_priority = 0.02
	}
	formatText Checksumname = cont 'sidebar_container_right%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = containerElement
		Id = <cont>
		PARENT = <container_id>
		pos = <rpos>
		Rot_Angle = <rangle>
		just = [Center Bottom]
		z_priority = 3
	}
	formatText Checksumname = Name 'sidebar_right%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_sidebar2D_sys_sidebar2D
		rgba = [255 255 255 255]
		pos = (0.0, 0.0)
		scale = <rscale>
		just = [Center Bottom]
		z_priority = 3
	}
	Set2DGemFade Id = <Name> Player = <Player>
	formatText Checksumname = cont 'starpower_container_right%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = containerElement
		Id = <cont>
		PARENT = <container_id>
		pos = <rpos>
		Rot_Angle = <rangle>
		just = [Center Bottom]
		z_priority = 3
	}
	starpower_pos = (((55.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((55.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((-1.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((1.1 * $starpower_fx_scale) * (0.0, 1.0)))
	formatText Checksumname = Name 'sidebar_Right_glow%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Starpower_SDGLOW_sys_Starpower_SDGLOW
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		scale = <starpower_scale>
		just = [Center Bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((0.5 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formatText Checksumname = Name 'sidebar_Right_Lightning01%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Big_Bolt01_sys_Big_Bolt01
		rgba = [0 0 128 128]
		pos = <starpower_pos>
		Rot_Angle = (180)
		scale = <starpower_scale>
		just = [Center top]
		z_priority = 4
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formatText Checksumname = Name 'sidebar_Right_Lightning02%p' P = <player_Text> AddToStringLookup = TRUE
	createScreenElement {
		Type = spriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Big_Bolt01_sys_Big_Bolt01
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		Rot_Angle = (180)
		scale = <starpower_scale>
		just = [Center top]
		z_priority = 0.02
	}
	formatText Checksumname = cont 'starpower_container_left%p' P = <player_Text> AddToStringLookup = TRUE
	DoScreenElementMorph Id = <cont> Alpha = 0
	formatText Checksumname = cont 'starpower_container_right%p' P = <player_Text> AddToStringLookup = TRUE
	DoScreenElementMorph Id = <cont> Alpha = 0
	getArraySize \{$gem_colors}
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	if structureContains Structure = ($button_up_models.<Color>) Name = Name
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = ($button_up_models.<Color>.left_pos_2d)
		else
			<pos2d> = ($button_up_models.<Color>.pos_2d)
		endif
		pos = (640.0, 643.0)
		formatText Checksumname = name_base '%s_base%p' S = ($button_up_models.<Color>.name_string) P = <player_Text> AddToStringLookup = TRUE
		formatText Checksumname = name_string '%s_string%p' S = ($button_up_models.<Color>.name_string) P = <player_Text> AddToStringLookup = TRUE
		formatText Checksumname = name_lip '%s_lip%p' S = ($button_up_models.<Color>.name_string) P = <player_Text> AddToStringLookup = TRUE
		formatText Checksumname = name_mid '%s_mid%p' S = ($button_up_models.<Color>.name_string) P = <player_Text> AddToStringLookup = TRUE
		formatText Checksumname = name_neck '%s_neck%p' S = ($button_up_models.<Color>.name_string) P = <player_Text> AddToStringLookup = TRUE
		formatText Checksumname = name_head '%s_head%p' S = ($button_up_models.<Color>.name_string) P = <player_Text> AddToStringLookup = TRUE
		<pos> = (((<pos2d>.(1.0, 0.0)) * (1.0, 0.0)) + (1024 * (0.0, 1.0)))
		if ($<player_status>.lefthanded_button_ups = 1)
			<playline_scale> = (((0 - <now_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<now_scale>.(0.0, 1.0) * (0.0, 1.0)))
		else
			<playline_scale> = <now_scale>
		endif
		createScreenElement {
			Type = containerElement
			Id = <name_base>
			PARENT = <container_id>
			pos = (0.0, 0.0)
			just = [Center Bottom]
			z_priority = 3
		}
		createScreenElement {
			Type = spriteElement
			Id = <name_lip>
			PARENT = <name_base>
			Material = ($button_up_models.<Color>.material_lip)
			rgba = [255 255 255 255]
			pos = <pos2d>
			scale = <playline_scale>
			just = [Center Bottom]
			z_priority = 3.9
		}
		createScreenElement {
			Type = spriteElement
			Id = <name_mid>
			PARENT = <name_base>
			Material = ($button_up_models.<Color>.material_mid)
			rgba = [255 255 255 255]
			pos = <pos2d>
			scale = <playline_scale>
			just = [Center Bottom]
			z_priority = 3.6
		}
		<y_scale> = ($neck_lip_add / $neck_sprite_size)
		<pos> = (<pos2d> - ($neck_lip_base * (0.0, 1.0)))
		<neck_scale> = (((<playline_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<y_scale> * (0.0, 1.0)))
		createScreenElement {
			Type = spriteElement
			Id = <name_neck>
			PARENT = <name_base>
			Material = ($button_up_models.<Color>.material_neck)
			rgba = [255 255 255 255]
			pos = <pos>
			scale = <neck_scale>
			just = [Center Bottom]
			z_priority = 3.7
		}
		createScreenElement {
			Type = spriteElement
			Id = <name_head>
			PARENT = <name_base>
			Material = ($button_up_models.<Color>.material_head)
			rgba = [255 255 255 255]
			pos = <pos2d>
			scale = <playline_scale>
			just = [Center Bottom]
			z_priority = 3.8
		}
		string_pos2d = ($button_up_models.<Color>.pos_2d)
		<string_scale> = (($string_scale_x * (1.0, 0.0)) + ($string_scale_y * (0.0, 1.0)))
		createScreenElement {
			Type = spriteElement
			Id = <name_string>
			PARENT = <container_id>
			Material = sys_String01_sys_String01
			rgba = [200 200 200 200]
			scale = <string_scale>
			Rot_Angle = ($button_models.<Color>.angle)
			pos = <string_pos2d>
			just = [Center Bottom]
			z_priority = 2
		}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Spawnscriptlater move_highway_2d Params = {<...>}
	create_highway_prepass <...>
	SetScreenElementLock \{Id = root_window On}
endscript

script destroy_highway 
	killspawnedScript \{Name = MoveGem}
	destroy_highway_prepass <...>
	formatText Checksumname = Name 'Highway_2D%p' P = <player_Text> AddToStringLookup = TRUE
	if ScreenelementExists Id = <Name>
		DestroyScreenelement Id = <Name>
	endif
	formatText Checksumname = Name 'gem_container%p' P = <player_Text> AddToStringLookup = TRUE
	if ScreenelementExists Id = <Name>
		DestroyScreenelement Id = <Name>
	endif
	formatText Checksumname = Name 'Gem_basebar%p' P = <player_Text> AddToStringLookup = TRUE
	if ScreenelementExists Id = <Name>
		DestroyScreenelement Id = <Name>
	endif
	getArraySize \{$gem_colors}
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	if structureContains Structure = ($button_up_models.<Color>) Name = name_string
		formatText Checksumname = Name '%s%p' S = ($button_up_models.<Color>.name_string) P = <player_Text> AddToStringLookup = TRUE
		if ScreenelementExists Id = <Name>
			DestroyScreenelement Id = <Name>
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript
prepass_camera_pos = (500.0, -100.0, -100.0)
prepass_border = 8

script calculate_prepass_poly_params \{x_offset = 0}
	prepass_mdl_top_width = 1
	prepass_mdl_bottom_width = 3.5
	prepass_mdl_height = 1
	w0 = ($highway_top_width)
	highway_slope = (<w0> * $widthOffsetFactor / $highway_height)
	highway_start = ($highway_playline - $highway_height)
	prepass_start = ($highway_fade + $prepass_border)
	prepass_top_width = (<w0> + <highway_slope> * <prepass_start> -2 * $prepass_border)
	tan_theta = 0.674
	prepass_z_offset = (<prepass_mdl_top_width> / (<tan_theta> * <prepass_top_width> / 640))
	prepass_y_offset = ((360 - (<highway_start> + <prepass_start>)) * <prepass_z_offset> * <tan_theta> / 640)
	prepass_x_offset = (<x_offset> * <prepass_z_offset> * <tan_theta> / 640)
	prepass_y_scale = ((<prepass_mdl_bottom_width> - <prepass_mdl_top_width>) / (<prepass_mdl_height> * <highway_slope>))
	return prepass_offset = (<prepass_z_offset> * (0.0, 0.0, 1.0) + <prepass_y_offset> * (0.0, 1.0, 0.0) + <prepass_x_offset> * (-1.0, 0.0, 0.0)) prepass_scale = ((1.0, 0.0, 1.0) + <prepass_y_scale> * (0.0, 1.0, 0.0))
endscript

script calculate_prepass_offset 
	getScreenElementProps Id = <screen_element>
	tan_theta = 0.674
	x_screen = (<pos>.(1.0, 0.0))
	y_screen = (360 - ($highway_playline - $highway_height + $highway_fade + $prepass_border + <pos>.(0.0, 1.0)))
	prepass_x_offset = (<x_screen> * <Distance> * <tan_theta> / 640)
	prepass_y_offset = (<y_screen> * <Distance> * <tan_theta> / 640)
	return prepass_offset = (<prepass_x_offset> * (-1.0, 0.0, 0.0) + <prepass_y_offset> * (0.0, 1.0, 0.0) + <Distance> * (0.0, 0.0, 1.0))
endscript

script update_prepass_position 
	<Obj> :Obj_GetPosition
	prepass_distance = (<pos>.(0.0, 0.0, 1.0) - $prepass_camera_pos.(0.0, 0.0, 1.0))
	calculate_prepass_offset screen_element = <elem> Distance = <prepass_distance>
	<Obj> :Obj_SetPosition Position = (<prepass_offset> + $prepass_camera_pos)
	<Obj> :Obj_UpdateModel
endscript

script update_highway_prepass 
	if compositeObjectexists \{highway_prepassp1}
		update_prepass_position \{Obj = highway_prepassp1 elem = gem_containerp1}
	endif
	if compositeObjectexists \{highway_prepassp2}
		update_prepass_position \{Obj = highway_prepassp2 elem = gem_containerp2}
	endif
endscript

script create_highway_prepass_object \{roty = 0}
	formatText Checksumname = highway_prepass_name 'highway_prepass%p' P = <player_Text> AddToStringLookup = TRUE
	formatText Checksumname = container_id 'gem_container%p' P = <player_Text> AddToStringLookup = TRUE
	calculate_prepass_poly_params <...>
	CreateCompositeObjectInstance {
		Priority = $COIM_Priority_Permanent
		Heap = Generic
		components = [
			{component = model lightGroup = Highway}
		]
		Params = {
			Name = <highway_prepass_name>
			model = 'Props\\highway\\highway_prepass\\highway_prepass.mdl'
			pos = (<cam_pos> + <prepass_offset>)
			SuspendDistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
			object_type = Highway
			profilebudget = 20
		}
	}
	<highway_prepass_name> :Obj_SetOrientation Y = 180
	<highway_prepass_name> :Obj_EnableScaling
	<highway_prepass_name> :Obj_ApplyScaling scale = <prepass_scale>
	<highway_prepass_name> :Obj_SetBoundingSphere 1000.0
	<highway_prepass_name> :Obj_SetNoSizeCull
endscript

script create_highway_prepass 
	<cam_pos> = ($prepass_camera_pos)
	if ($current_num_players = 1)
		<style> = highway_prepass_rendering_1p
		create_highway_prepass_object <...>
	else
		<style> = highway_prepass_rendering_1p
		if (<Player> = 1)
			create_highway_prepass_object <...> player_Text = 'p1' x_offset = (<Container_pos>.(1.0, 0.0))
		else
			create_highway_prepass_object <...> player_Text = 'p2' x_offset = (<Container_pos>.(1.0, 0.0))
		endif
	endif
	if (<Player> = 1)
		<highway_cam> = {
			lockto = World
			pos = <cam_pos>
			Facing = (0.0, 0.0, 1.0)
			fov = 68.0
		}
		texture = highway_prepass_texture
		ExtendCrc <texture> <player_Text> out = texture
		AddPrepassViewport viewport = Bg_Viewport style = <style>
		formatText Checksumname = Camera 'highway_prepass_camera%p' P = <player_Text> AddToStringLookup = TRUE
		CreateCompositeObjectInstance {
			Priority = $COIM_Priority_Permanent
			Heap = Generic
			components = [
				{
					component = CinematicCamera
					UpdateWhenCameraInactive = TRUE
					Enabled = TRUE
				}
				{
					component = Camera
				}
			]
			Params = {
				Name = <Camera>
				object_type = Highway
				profilebudget = 20
				use_jq
			}
		}
		SetPrepassViewportCamera viewport = Bg_Viewport Id = <Camera> prepass = (<Player> - 1)
		<Camera> :Unpause
		<Camera> :CCam_DoMorph <highway_cam>
		<Camera> :obj_forceupdate
		enable_highway_prepass
	endif
endscript

script destroy_highway_prepass 
	if (<Player> = 1)
		RemovePrepassViewport \{viewport = Bg_Viewport}
	endif
	formatText Checksumname = Name 'highway_prepass%p' P = <player_Text> AddToStringLookup = TRUE
	if compositeObjectexists Name = <Name>
		<Name> :DIE
	endif
	formatText Checksumname = Name 'highway_prepass_camera%p' P = <player_Text> AddToStringLookup = TRUE
	if compositeObjectexists Name = <Name>
		<Name> :DIE
	endif
	setviewportproperties \{viewport = Bg_Viewport clear_colorbuffer = TRUE}
	setviewportproperties \{viewport = Bg_Viewport clear_depthstencilbuffer = TRUE}
endscript

script disable_highway_prepass 
	GetDisplaySettings
	if (<widescreen> = TRUE)
		if ViewportExists \{Id = Bg_Viewport}
			if PrepassViewportExists \{viewport = Bg_Viewport}
				setviewportproperties \{viewport = Bg_Viewport clear_colorbuffer = TRUE}
				setviewportproperties \{viewport = Bg_Viewport clear_depthstencilbuffer = TRUE}
				setviewportproperties \{viewport = Bg_Viewport prepass = 0 Active = FALSE}
				setviewportproperties \{viewport = Bg_Viewport prepass = 1 Active = FALSE}
			endif
		endif
	endif
endscript

script enable_highway_prepass 
	GetDisplaySettings
	if (<widescreen> = TRUE)
		if ViewportExists \{Id = Bg_Viewport}
			if PrepassViewportExists \{viewport = Bg_Viewport}
				setviewportproperties \{viewport = Bg_Viewport clear_colorbuffer = FALSE}
				setviewportproperties \{viewport = Bg_Viewport clear_depthstencilbuffer = FALSE}
				setviewportproperties \{viewport = Bg_Viewport prepass = 0 Active = TRUE}
				setviewportproperties \{viewport = Bg_Viewport prepass = 1 Active = TRUE}
			endif
		endif
	endif
endscript
start_2d_move = 0

script move_highway_2d 
	Change \{start_2d_move = 0}
	begin
	if ($start_2d_move = 1)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	highway_start_y = 720
	pos_start_orig = 0
	pos_add = -720
	elapsed_time = 0.0
	begin
	<pos> = (((<Container_pos>.(1.0, 0.0)) * (1.0, 0.0)) + (<highway_start_y> * (0.0, 1.0)))
	setScreenElementProps Id = <container_id> pos = <pos>
	GetDeltaTime \{ignore_slomo}
	<elapsed_time> = (<elapsed_time> + <delta_time>)
	<scaled_time> = (<elapsed_time> / 1.3)
	if (<scaled_time> > 1.0)
		<scaled_time> = 1.0
	endif
	ln (1.005 - <scaled_time>)
	<speed_modifier> = ((<ln> * 0.25) + 1.0)
	if (<speed_modifier> < 0.05)
		<speed_modifier> = 0.05
	endif
	<highway_start_y> = (<highway_start_y> + (<pos_add> * <delta_time> * <speed_modifier>))
	if (<highway_start_y> <= <pos_start_orig>)
		<pos> = (((<Container_pos>.(1.0, 0.0)) * (1.0, 0.0)) + (<pos_start_orig> * (0.0, 1.0)))
		setScreenElementProps Id = <container_id> pos = <pos>
		break
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script move_highway_camera_to_default \{Player = 1}
	Change \{start_2d_move = 1}
endscript

script disable_bg_viewport_properties 
	setviewportproperties \{viewport = Bg_Viewport clear_colorbuffer = TRUE}
	setviewportproperties \{viewport = Bg_Viewport clear_depthstencilbuffer = TRUE}
	if PrepassViewportExists \{viewport = Bg_Viewport}
		setviewportproperties \{viewport = Bg_Viewport prepass = 0 Active = FALSE}
		setviewportproperties \{viewport = Bg_Viewport prepass = 1 Active = FALSE}
	endif
endscript

script disable_highway 
	if ScreenelementExists \{Id = gem_containerp1}
		DoScreenElementMorph \{Id = gem_containerp1 Alpha = 0}
	endif
	if ScreenelementExists \{Id = gem_containerp2}
		DoScreenElementMorph \{Id = gem_containerp2 Alpha = 0}
	endif
	if ScreenelementExists \{Id = HUD_2D_Containerp1}
		DoScreenElementMorph \{Id = HUD_2D_Containerp1 Alpha = 0}
	endif
	if ScreenelementExists \{Id = HUD_2D_Containerp2}
		DoScreenElementMorph \{Id = HUD_2D_Containerp2 Alpha = 0}
	endif
	if ScreenelementExists \{Id = battle_alert_containerp1}
		DoScreenElementMorph \{Id = battle_alert_containerp1 Alpha = 0}
	endif
	if ScreenelementExists \{Id = battle_alert_containerp2}
		DoScreenElementMorph \{Id = battle_alert_containerp2 Alpha = 0}
	endif
endscript

script disable_bg_viewport 
	disable_highway <...>
	kill_dummy_bg_camera
	ui_clip_root :SetProps \{Hide}
	disable_bg_viewport_properties
	SetActiveCamera \{Id = viewer_cam viewport = Bg_Viewport}
endscript

script enable_bg_viewport_properties 
	if PrepassViewportExists \{viewport = Bg_Viewport}
		setviewportproperties \{viewport = Bg_Viewport clear_colorbuffer = FALSE}
		setviewportproperties \{viewport = Bg_Viewport clear_depthstencilbuffer = FALSE}
		setviewportproperties \{viewport = Bg_Viewport no_resolve_depthstencilbuffer = TRUE}
		setviewportproperties \{viewport = Bg_Viewport no_resolve_colorbuffer = TRUE}
		setviewportproperties \{viewport = Bg_Viewport prepass = 0 Active = TRUE}
		setviewportproperties \{viewport = Bg_Viewport prepass = 1 Active = TRUE}
	else
		setviewportproperties \{viewport = Bg_Viewport clear_colorbuffer = TRUE}
		setviewportproperties \{viewport = Bg_Viewport clear_depthstencilbuffer = TRUE}
		setviewportproperties \{viewport = Bg_Viewport no_resolve_depthstencilbuffer = TRUE}
		setviewportproperties \{viewport = Bg_Viewport no_resolve_colorbuffer = TRUE}
	endif
	TOD_Proxim_Update_LightFX_Viewport \{fxParam = $Default_tod_manager viewport = Bg_Viewport Time = 0}
endscript

script enable_highway 
	if ScreenelementExists \{Id = gem_containerp1}
		DoScreenElementMorph \{Id = gem_containerp1 Alpha = 1}
	endif
	if ScreenelementExists \{Id = gem_containerp2}
		DoScreenElementMorph \{Id = gem_containerp2 Alpha = 1}
	endif
	if ScreenelementExists \{Id = HUD_2D_Containerp1}
		DoScreenElementMorph \{Id = HUD_2D_Containerp1 Alpha = 1}
	endif
	if ScreenelementExists \{Id = HUD_2D_Containerp2}
		DoScreenElementMorph \{Id = HUD_2D_Containerp2 Alpha = 1}
	endif
	if ScreenelementExists \{Id = battle_alert_containerp1}
		DoScreenElementMorph \{Id = battle_alert_containerp1 Alpha = 1}
	endif
	if ScreenelementExists \{Id = battle_alert_containerp2}
		DoScreenElementMorph \{Id = battle_alert_containerp2 Alpha = 1}
	endif
endscript

script enable_bg_viewport 
	enable_highway <...>
	enable_bg_viewport_properties
	ui_clip_root :SetProps \{Unhide}
endscript

script destroy_bg_viewport 
	kill_dummy_bg_camera
	if ScreenelementExists \{Id = ui_clip_root}
		DestroyScreenelement \{Id = ui_clip_root}
	endif
	SetScreenMode \{one_camera}
	setviewportproperties \{viewport = 0 clear_colorbuffer = TRUE}
	setviewportproperties \{viewport = 0 no_resolve_depthstencilbuffer = FALSE}
endscript
Highway_Fader_Params = {
	style = highway_fader
	rt_size = (1280.0, 720.0)
	rt_offset = (0.0, 0.0)
	clip_dims = (256.0, 256.0)
	clip_offset = (0.0, -64.0)
	mask_dims = (512.0, 200.0)
}
Highway_Fader_Params_2p = {
	style = highway_fader_2p
	rt_size = (1280.0, 720.0)
	rt_offset = (0.0, 0.0)
	clip_dims = (1024.0, 200.0)
	clip_offset = (0.0, 0.0)
	mask_dims = (1280.0, 200.0)
}
Highway_Fader_Params_ps3 = {
	style = highway_fader_ps3
	rt_size = (1280.0, 720.0)
	rt_offset = (0.0, 0.0)
	clip_dims = (256.0, 256.0)
	clip_offset = (0.0, -64.0)
	mask_dims = (512.0, 200.0)
}
Highway_Fader_Params_2p_ps3 = {
	style = highway_fader_2p_ps3
	rt_size = (1280.0, 720.0)
	rt_offset = (0.0, 0.0)
	clip_dims = (832.0, 200.0)
	clip_offset = (0.0, 0.0)
	mask_dims = (1040.0, 200.0)
}

script setup_bg_viewport 
	Printf \{"Setting bg viewport"}
	destroy_bg_viewport
	if isxenon
		if ($current_num_players = 1)
			addparams \{$Highway_Fader_Params}
		else
			addparams \{$Highway_Fader_Params_2p}
		endif
	else
		if ($current_num_players = 1)
			addparams \{$Highway_Fader_Params_ps3}
		else
			addparams \{$Highway_Fader_Params_2p_ps3}
		endif
	endif
	pos = (2000.0, 300.0)
	pos = (<pos> + <clip_offset>)
	mask_pos = (<clip_dims> * 0.5 - <clip_offset>)
	bg_pos = (<clip_dims> * 0.5 - <pos> + <rt_offset>)
	if NOT ScreenelementExists \{Id = ui_clip_root}
		createScreenElement {
			PARENT = root_window
			Type = WindowElement
			Id = ui_clip_root
			just = [Center Center]
			pos = <pos>
			Dims = <clip_dims>
		}
		CreateMaskedScreenElements {
			z_priority = -10
			mask_element = {
				Id = viewport_mask_sprite
				PARENT = ui_clip_root
				Type = spriteElement
				pos = <mask_pos>
				just = [Center Center]
				Dims = <mask_dims>
				rgba = [255 255 255 255]
				Alpha = 1
				z_priority = 110
				texture = white2
				Rot_Angle = -180
			}
			Elements = [
				{
					PARENT = ui_clip_root
					Type = ViewportElement
					Id = Bg_Viewport
					texture = viewport0
					pos = <bg_pos>
					just = [Left top]
					Dims = <rt_size>
					rgba = [128 128 128 255]
					Alpha = 1
					has_shadow = TRUE
					draw_debug_lines = TRUE
					show_lightvolumes = TRUE
					style = <style>
				}
			]
		}
	endif
	enable_bg_viewport_properties
	Printf \{"Setting bg viewport end"}
endscript
highway_pulse_p1 = 0
highway_pulse_p2 = 0

script highway_pulse_multiplier_loss \{player_Text = 'p1' Multiplier = 1}
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	Time = 0.1
	switch <Multiplier>
		case 1
		push_pos = (0.0, 3.0)
		case 2
		push_pos = (0.0, 4.0)
		case 3
		push_pos = (0.0, 10.0)
		case 4
		push_pos = (0.0, 15.0)
		Time = 0.11
		default
		push_pos = (0.0, 3.0)
	endswitch
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_career) || ($game_mode = p2_coop))
		<push_pos> = (<push_pos> * 0.6)
	endif
	if (<player_Text> = 'p1')
		highway_pulse = $highway_pulse_p1
	else
		highway_pulse = $highway_pulse_p2
	endif
	if (<highway_pulse> = 0)
		Change \{highway_pulse = 1}
		formatText Checksumname = container_id 'gem_container%p' P = <player_Text> AddToStringLookup = TRUE
		GetScreenElementPosition Id = <container_id>
		original_position = <ScreenELementPos>
		GetRandomValue \{Name = random_x A = -7 B = 7 Integer}
		DoScreenElementMorph {Id = <container_id> pos = (<original_position> + <push_pos> + ((1.0, 0.0) * <random_x>)) just = [Center Bottom] Time = <Time>}
		Wait <Time> Seconds
		GetRandomValue \{Name = random_x A = -7 B = 7 Integer}
		DoScreenElementMorph {Id = <container_id> pos = (<original_position> - (<push_pos> * 0.7) + ((1.0, 0.0) * <random_x>)) just = [Center Bottom] Time = <Time>}
		Wait <Time> Seconds
		GetRandomValue \{Name = random_x A = -5 B = 5 Integer}
		DoScreenElementMorph {Id = <container_id> pos = (<original_position> + (<push_pos> * 0.4) + ((1.0, 0.0) * <random_x>)) just = [Center Bottom] Time = <Time>}
		Wait <Time> Seconds
		GetRandomValue \{Name = random_x A = -5 B = 5 Integer}
		DoScreenElementMorph {Id = <container_id> pos = (<original_position> - (<push_pos> * 0.3) + ((1.0, 0.0) * <random_x>)) just = [Center Bottom] Time = <Time>}
		Wait <Time> Seconds
		GetRandomValue \{Name = random_x A = -3 B = 3 Integer}
		DoScreenElementMorph {Id = <container_id> pos = (<original_position> + (<push_pos> * 0.2) + ((1.0, 0.0) * <random_x>)) just = [Center Bottom] Time = <Time>}
		Wait <Time> Seconds
		DoScreenElementMorph {Id = <container_id> pos = <original_position> just = [Center Bottom] Time = <Time>}
	endif
	Change \{highway_pulse = 0}
endscript

script highway_visible 
	Change \{highwayvisible = On}
endscript

script highway_invisible 
	Change \{highwayvisible = OFF}
endscript
