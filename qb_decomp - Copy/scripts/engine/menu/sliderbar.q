
script sliderbar_rescale_to_bar 
	<Target1> = ((<Value> - <Min>) / (<MAX> - <Min>))
	<target2> = (<Right> - <Left>)
	<target3> = (<Target1> * <target2>)
	<rescaled_value> = (<target3> + <Left>)
	return x_val = <rescaled_value>
endscript

script sliderbar_add_item \{tab = tab1 font = text_A1 icon_rgba = [127 102 0 128] icon_scale = 0 icon_pos = (22.0, 9.0) text_just = [Center Center] text_pos = (0.0, 0.0) arrow_pos_up = (0.0, 8.0) arrow_pos_down = (0.0, -8.0) arrow_rgba = [100 90 80 255] up_arrow_texture = up_arrow down_arrow_texture = down_arrow Dims = (0.0, 20.0)}
	if gotParam \{is_enabled_script}
		<is_enabled_script>
		if (<success> = 0)
			return
		endif
	endif
	switch <tab>
		case tab1
		<bar_scale> = (0.91999996, 1.2)
		case tab2
		<bar_scale> = (0.85, 1.2)
		case tab3
		<bar_scale> = (0.78, 1.2)
		<font> = dialog
	endswitch
	SetScreenElementLock \{Id = current_menu OFF}
	if NOT gotParam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	if gotParam \{Index}
		if gotParam \{pad_choose_params}
			<pad_choose_params> = (<pad_choose_params> + {parent_index = <Index>})
		else
			<pad_choose_params> = {parent_index = <Index>}
		endif
	endif
	<z_priority> = 300
	createScreenElement {
		Type = containerElement
		PARENT = current_menu
		Id = <anchor_id>
		Dims = <Dims>
		event_handlers = [{focus <focus_script> Params = <focus_params>}
			{unfocus <unfocus_script> Params = <unfocus_params>}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
		]
		<NOT_FOCUSABLE>
		z_priority = <z_priority>
	}
	<parent_id> = <Id>
	if gotParam \{Index}
		setScreenElementProps {
			Id = <parent_id>
			tags = {tag_grid_x = <Index>}
		}
	endif
	if gotParam \{NOT_FOCUSABLE}
		<rgba> = [60 60 60 100]
	else
		rgba = [128 128 128 240]
	endif
	createScreenElement {
		Type = textElement
		PARENT = <parent_id>
		font = text_A1
		Text = <Text>
		scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = <text_just>
		pos = <text_pos>
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (1.0, 1.0)
		Replace_Handlers
		<NOT_FOCUSABLE>
	}
	highlight_angle = 0
	createScreenElement {
		Type = spriteElement
		PARENT = <parent_id>
		texture = DE_highlight_bar
		pos = (-25.0, -7.0)
		rgba = [0 0 0 0]
		just = [Center Center]
		scale = (1.9, 0.7)
		z_priority = (3 -1)
		Rot_Angle = <highlight_angle>
	}
	<pos> = (-9.0, 0.0)
	if gotParam \{bar_pos}
		<pos> = <bar_pos>
	endif
	bar_rgba = [100 90 80 255]
	createScreenElement {
		Type = spriteElement
		PARENT = <parent_id>
		z_priority = 1
		pos = <pos>
		scale = (8.0, 0.75)
		texture = roundbar_middle
		rgba = <bar_rgba>
	}
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = 0
	createScreenElement {
		Type = containerElement
		PARENT = <anchor_id>
		just = [Center Bottom]
		Dims = {200 , 200}
		pos = <arrow_pos_down>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <Id>
		Id = <down_arrow_id>
		texture = <down_arrow_texture>
		rgba = <arrow_rgba>
		scale = 0.0
	}
	createScreenElement {
		Type = containerElement
		PARENT = <anchor_id>
		just = [Center top]
		Dims = {200 , 200}
		pos = <arrow_pos_up>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <Id>
		Id = <up_arrow_id>
		texture = <up_arrow_texture>
		rgba = <arrow_rgba>
		scale = 0.0
	}
	if gotParam \{child_texture}
		createScreenElement {
			Type = spriteElement
			PARENT = <parent_id>
			texture = <child_texture>
			pos = <icon_pos>
			rgba = <icon_rgba>
			scale = <icon_scale>
			Id = <icon_id>
		}
	endif
	SetScreenElementLock \{Id = current_menu On}
endscript

script sliderbar_add_text_item 
	SetScreenElementLock \{Id = current_menu OFF}
	createScreenElement {
		Type = containerElement
		PARENT = current_menu
		event_handlers = [{focus sliderbar_focus_text_item Params = <focus_params>}
			{unfocus sliderbar_unfocus_text_item}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
		]
		Dims = (0.0, 20.0)
	}
	<parent_id> = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <parent_id>
		font = text_A1
		Text = <Text>
		scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = [Center top]
		pos = (-6.0, -6.0)
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (1.0, 1.0)
	}
	bar_rgba = [100 90 80 255]
	createScreenElement {
		Type = spriteElement
		PARENT = <parent_id>
		z_priority = 1
		scale = (8.0, 0.75)
		pos = (-34.0, 2.0)
		texture = roundbar_middle
		rgba = <bar_rgba>
	}
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = 0
	SetScreenElementLock \{Id = current_menu On}
endscript

script sliderbar_focus_text_item 
	create_helper_text helper_pos = <helper_pos> $generic_helper_text_cas_z scale = 0.9
	Obj_Getid
	Id = <objId>
	on_color = [128 123 20 255]
	setScreenElementProps {
		Id = {<Id> child = 0}
		rgba = [90 80 70 255]
		shadow_rgba = [0 , 0 , 0 , 0]
	}
	DoScreenElementMorph Id = {<Id> child = 1} Alpha = 1 Time = 0
endscript

script sliderbar_unfocus_text_item 
	Obj_Getid
	Id = <objId>
	setScreenElementProps {
		Id = {<Id> child = 0}
		rgba = [110 110 110 255]
		shadow_rgba = $UI_text_shadow_color
	}
	DoScreenElementMorph Id = {<Id> child = 1} Alpha = 0 Time = 0
endscript
