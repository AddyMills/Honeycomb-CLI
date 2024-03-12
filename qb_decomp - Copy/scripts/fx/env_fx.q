DoUpdateLensFlare = 1
LensFlare_Morph_In = 0.15
LensFlare_Morph_Out = 0.1

script DisableSun 
	Change \{DoUpdateLensFlare = 0}
	MaybeHideLensFlare
	SetSunProps \{Size = 0}
endscript

script EnableSun 
	Change \{DoUpdateLensFlare = 1}
	UnHideLensFlare
	SetSunProps \{Size = 7332.0}
endscript

script CreateLensFlare 
	return
	SetScreenElementLock \{Id = root_window OFF}
	createScreenElement \{Type = containerElement PARENT = root_window Id = Lens_Flare_Container Dims = (640.0, 480.0) pos = (0.0, 0.0) Alpha = 0 just = [Left top]}
	getArraySize \{Lens_Flare_Data}
	Index = 0
	begin
	createScreenElement {
		Type = spriteElement
		PARENT = Lens_Flare_Container
		Id = (Lens_Flare_Data [<Index>].Id)
		scale = (Lens_Flare_Data [<Index>].scale)
		texture = (Lens_Flare_Data [<Index>].texture)
		rgba = (Lens_Flare_Data [<Index>].rgba)
		pos = (0.0, 0.0)
		BLEND = add
	}
	<Index> = (<Index> + 1)
	repeat <array_Size>
	SetScreenElementLock \{Id = root_window On}
endscript

script MaybeHideLensFlare \{morph_time = 0.0}
	if ScreenelementExists \{Id = Lens_Flare_Container}
		HideLensFlare <...>
	else
		CreateLensFlare
	endif
endscript
Lens_Flare_Data = [
	{
		Id = lf_sprite_1
		texture = APM_abberation02
		pos_scale = 0.8
		scale = 3.0
		rgba = [
			200
			128
			0
			16
		]
	}
	{
		Id = lf_sprite_2
		texture = APM_abberation02
		pos_scale = 0.7
		scale = 2.0
		rgba = [
			255
			128
			0
			20
		]
	}
	{
		Id = lf_sprite_3
		texture = APM_abberation01
		pos_scale = 0.65000004
		scale = 0.6
		rgba = [
			255
			128
			100
			32
		]
	}
	{
		Id = lf_sprite_4
		texture = flare1
		pos_scale = 0.63
		scale = 0.75
		rgba = [
			255
			128
			128
			32
		]
	}
	{
		Id = lf_sprite_5
		texture = flare1
		pos_scale = 0.58
		scale = 0.45000002
		rgba = [
			200
			128
			0
			32
		]
	}
	{
		Id = lf_sprite_6
		texture = APM_abberation01
		pos_scale = 0.57
		scale = 0.75
		rgba = [
			200
			128
			0
			32
		]
	}
	{
		Id = lf_sprite_7
		texture = flare1
		pos_scale = 0.49
		scale = 0.5
		rgba = [
			255
			128
			128
			64
		]
	}
	{
		Id = lf_sprite_8
		texture = APM_abberation02
		pos_scale = 0.45000002
		scale = 1.3
		rgba = [
			200
			128
			0
			20
		]
	}
	{
		Id = lf_sprite_9
		texture = flare1
		pos_scale = 0.43
		scale = 0.85
		rgba = [
			255
			128
			128
			32
		]
	}
	{
		Id = lf_sprite_10
		texture = APM_abberation01
		pos_scale = 0.120000005
		scale = 3.1
		rgba = [
			200
			128
			0
			12
		]
	}
	{
		Id = lf_sprite_11
		texture = APM_abberation02
		pos_scale = -0.45000002
		scale = 2.75
		rgba = [
			200
			128
			100
			16
		]
	}
	{
		Id = lf_sprite_12
		texture = APM_abberation02
		pos_scale = -0.48000002
		scale = 1.0
		rgba = [
			200
			128
			100
			32
		]
	}
]
Lens_Flare_Data1 = [
	{
		Id = lf_sprite_1
		texture = flare1
		pos_scale = 0.8
		scale = 1.0
		rgba = [
			128
			128
			196
			64
		]
	}
	{
		Id = lf_sprite_2
		texture = APM_abberation01
		pos_scale = 0.5
		scale = 0.75
		rgba = [
			128
			128
			0
			64
		]
	}
	{
		Id = lf_sprite_3
		texture = flare1
		pos_scale = 0.333
		scale = 0.5
		rgba = [
			128
			128
			128
			64
		]
	}
	{
		Id = lf_sprite_4
		texture = APM_abberation02
		pos_scale = 0.125
		scale = 2.0
		rgba = [
			128
			64
			128
			64
		]
	}
	{
		Id = lf_sprite_5
		texture = APM_abberation01
		pos_scale = -0.5
		scale = 0.85
		rgba = [
			196
			128
			128
			64
		]
	}
	{
		Id = lf_sprite_6
		texture = flare1
		pos_scale = -0.25
		scale = 0.75
		rgba = [
			128
			128
			128
			64
		]
	}
	{
		Id = lf_sprite_7
		texture = APM_abberation02
		pos_scale = -0.18180001
		scale = 0.85
		rgba = [
			128
			128
			128
			128
		]
	}
]
SunBurst_Out = 0.25
