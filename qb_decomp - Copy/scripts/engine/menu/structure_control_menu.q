
script create_vmenu_with_title \{PARENT = root_window Text = "Default Title" vmenu_id = structure_control_vmenu scale = 1.8 padding_scale = 0.8 internal_scale = 0.5 pos = (50.0, 180.0) Dims = (200.0, 100.0) internal_just = [Left top] just = [Left top] title_color = [240 90 8 255] title_scale = 0.7}
	SetScreenElementLock Id = <PARENT> OFF
	createScreenElement {
		Type = VMenu
		PARENT = <PARENT>
		Id = <vmenu_id>
		font = text_A1
		just = [Left top]
		pos = <pos>
		scale = <scale>
		padding_scale = <padding_scale>
		internal_scale = <internal_scale>
		internal_just = <internal_just>
	}
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = text_A1
		Text = <Text>
		scale = <title_scale>
		rgba = <title_color>
		NOT_FOCUSABLE
	}
	AssignAlias Id = <vmenu_id> alias = current_menu
endscript

script structure_control_menu_create \{title_color = [240 90 8 255] label_color = [176 210 224 255] value_color = [255 255 255 255] run_callback_on_create = 0}
	create_vmenu_with_title <...>
	setScreenElementProps {
		Id = current_menu
		event_handlers = [
			{pad_back <pad_back_script> Params = <pad_back_params>}
			{pad_square structure_control_menu_toggle_link}
			{pad_choose structure_control_menu_toggle_step_speed}
		]
		Replace_Handlers
	}
	current_menu :SetTags label_color = <label_color> value_color = <value_color>
	structure_control_menu_toggle_link
	structure_control_menu_toggle_step_speed
	if NOT Globalexists Name = <Structure> Type = Structure
		Scriptassert "global structure '%s' does not exist!" S = <Structure>
	endif
	getArraySize \{control_items}
	I = 0
	begin
	structure_control_menu_add_item {
		menu_callback = <callback>
		menu_structure = <Structure>
		index_item_labels = <index_item_labels>
		(<control_items> [<I>])
	}
	I = (<I> + 1)
	repeat <array_Size>
	if gotParam \{choose_items}
		ForEachIn <choose_items> do = structure_control_menu_add_choose_item
	endif
	if (<run_callback_on_create> = 1)
		<callback> <Structure>
	endif
	launchevent \{Type = focus Target = current_menu}
endscript

script structure_control_menu_refresh \{Id = current_menu}
	if NOT ScreenelementExists Id = <Id>
		return
	endif
	getScreenElementChildren Id = <Id>
	getArraySize \{children}
	I = 0
	begin
	runScriptOnScreenElement Id = (<children> [<I>]) structure_control_menu_control_item_refresh
	I = (<I> + 1)
	repeat <array_Size>
endscript

script structure_control_menu_toggle_link 
	values_linked = 1
	current_menu :GetSingleTag \{values_linked}
	if (<values_linked> = 0)
		current_menu :SetTags \{values_linked = 1}
	else
		current_menu :SetTags \{values_linked = 0}
	endif
endscript

script structure_control_menu_toggle_step_speed 
	if current_menu :GetSingleTag \{choose_action_override}
		<choose_action_override> :structure_control_menu_choose_item_action
	else
		step_speed = 1
		current_menu :GetSingleTag \{step_speed}
		if (<step_speed> = 10)
			current_menu :SetTags \{step_speed = 1}
		else
			current_menu :SetTags \{step_speed = 10}
		endif
	endif
endscript

script structure_control_menu_verify_presence 
	if NOT structureContains Structure = (<Structure>) <param>
		Scriptassert \{"param does not exist in given structure! look above for details"}
	endif
	if Globalexists Name = <param>
		Scriptassert \{"you can't have a param name that conflicts with a global. this causes script interpreter errors"}
	endif
endscript

script structure_control_menu_add_item \{Text = "Default Param Name" Min = 1 MAX = 10 range_loop = 0 step = 1}
	if gotParam \{separator}
		createScreenElement \{Type = textElement PARENT = current_menu Text = " " font = text_A1 scale = 0.4 NOT_FOCUSABLE}
		return
	endif
	if NOT gotParam \{callback}
		callback = <menu_callback>
	endif
	if NOT gotParam \{Structure}
		Structure = <menu_structure>
	endif
	structure_control_menu_verify_presence Structure = <Structure> param = <param>
	if IsArray (<Structure>.<param>)
		getArraySize (<Structure>.<param>)
		I = 0
		begin
		if gotParam \{index_item_labels}
			sub = (<index_item_labels> [<I>])
		else
			sub = <I>
		endif
		formatText Textname = new_text "%s(%i)" S = <Text> I = <sub>
		MangleChecksums A = <param> B = <I>
		structure_control_menu_add_control_item {
			<...>
			array_param_index = <I>
			array_param_size = <array_Size>
			Text = <new_text>
			Id = <mangled_ID>
		}
		I = (<I> + 1)
		repeat <array_Size>
	else
		structure_control_menu_add_control_item {
			<...>
			Text = <Text>
			Id = <param>
		}
	endif
endscript

script structure_control_menu_add_choose_item \{Text = "Default Text"}
	current_menu :GetSingleTag \{label_color}
	createScreenElement {
		Type = textElement
		PARENT = current_menu
		local_id = <Id>
		Text = <Text>
		font = text_A1
		scale = 0.4
		rgba = <label_color>
		<focusable>
		event_handlers = [
			{focus structure_control_menu_choose_item_focus}
			{unfocus structure_control_menu_choose_item_unfocus}
		]
	}
	<Id> :SetTags {
		action = {
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
		}
	}
endscript

script structure_control_menu_add_control_item 
	control_params = <...>
	current_menu :GetSingleTag \{label_color}
	createScreenElement {
		Type = textElement
		PARENT = current_menu
		local_id = <Id>
		Text = <Text>
		font = text_A1
		scale = 0.4
		rgba = <label_color>
		event_handlers = [
			{focus structure_control_menu_control_item_focus}
			{unfocus structure_control_menu_control_item_unfocus}
		]
	}
	PARENT = <Id>
	<PARENT> :SetTags control_params = <control_params>
	current_menu :GetSingleTag \{value_color}
	createScreenElement {
		Type = textElement
		PARENT = <PARENT>
		local_id = value_display
		font = text_A1
		just = [Center top]
		pos = (450.0, 0.0)
		Text = " "
		rgba = <value_color>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <PARENT>
		local_id = left_arrow
		texture = left_arrow
		rgba = <label_color>
		pos = (375.0, 5.0)
		just = [Right top]
		scale = 0.75
		Alpha = 0
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <PARENT>
		local_id = right_arrow
		texture = right_arrow
		rgba = <label_color>
		pos = (525.0, 5.0)
		just = [Left top]
		scale = 0.75
		Alpha = 0
	}
	setScreenElementProps {
		Id = <PARENT>
		event_handlers = [{PAD_LEFT structure_control_menu_control_item_change Params = {Left}}
			{pad_right structure_control_menu_control_item_change Params = {Right}}
		]
		Replace_Handlers
	}
	<PARENT> :structure_control_menu_control_item_refresh
endscript

script structure_control_menu_find_existing_value_index 
	if gotParam \{values}
		getArraySize \{values}
		num_values = <array_Size>
		getArraySize \{value_labels}
		if NOT (<num_values> = <array_Size>)
			Scriptassert \{"Mismatch in size of values and value_labels!"}
		endif
		selection_index = -1
		I = 0
		begin
		if ((<values> [<I>]) = <Value>)
			selection_index = <I>
		endif
		I = (<I> + 1)
		repeat <num_values>
		if (<selection_index> < 0)
			Scriptassert \{"current param value not found in item options"}
		endif
		SetTags selection_index = <selection_index>
	endif
endscript

script structure_control_menu_control_item_change 
	Obj_Getid
	GetSingleTag \{control_params}
	current_menu :GetSingleTag \{step_speed}
	if gotParam \{Left}
		DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 1
		DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 0
		if structureContains \{Structure = control_params values}
			GetSingleTag \{selection_index}
			selection_index = (<selection_index> -1)
			getArraySize (<control_params>.values)
			if (<selection_index> < 0)
				if ((<control_params>.range_loop) = 1)
					selection_index = (<array_Size> -1)
					DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 1 Time = 0.3
				else
					selection_index = 0
				endif
			else
				if ((<selection_index> > 0) || ((<control_params>.range_loop) = 1))
					DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 1 Time = 0.3
				endif
			endif
			New_Value = (<control_params>.values [<selection_index>])
			SetTags selection_index = <selection_index>
		else
			New_Value = ((<control_params>.Value) - ((<control_params>.step) * <step_speed>))
			if NOT (<New_Value> > (<control_params>.Min))
				if ((<control_params>.range_loop) = 1)
					New_Value = ((<control_params>.MAX) + <New_Value>)
					DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 1 Time = 0.3
				else
					New_Value = (<control_params>.Min)
				endif
			else
				DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 1 Time = 0.3
			endif
		endif
	endif
	if gotParam \{Right}
		DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 0
		DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 1
		if structureContains \{Structure = control_params values}
			GetSingleTag \{selection_index}
			selection_index = (<selection_index> + 1)
			getArraySize (<control_params>.values)
			if NOT (<selection_index> < <array_Size>)
				if ((<control_params>.range_loop) = 1)
					selection_index = 0
					DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 1 Time = 0.3
				else
					selection_index = (<array_Size> -1)
				endif
			else
				if ((<selection_index> < (<array_Size> -1)) || ((<control_params>.range_loop) = 1))
					DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 1 Time = 0.3
				endif
			endif
			New_Value = (<control_params>.values [<selection_index>])
			SetTags selection_index = <selection_index>
		else
			New_Value = ((<control_params>.Value) + ((<control_params>.step) * <step_speed>))
			if NOT (<New_Value> < (<control_params>.MAX))
				if ((<control_params>.range_loop) = 1)
					New_Value = (<New_Value> - (<control_params>.MAX))
					DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 1 Time = 0.3
				else
					New_Value = (<control_params>.MAX)
				endif
			else
				DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 1 Time = 0.3
			endif
		endif
	endif
	structure_control_menu_change_structure New_Value = <New_Value>
endscript

script structure_control_menu_change_structure 
	GetSingleTag \{control_params}
	Structure = (<control_params>.Structure)
	param = (<control_params>.param)
	param_links = (<control_params>.param_links)
	Value = <New_Value>
	Index = (<control_params>.array_param_index)
	structure_control_menu_apply_param_change param {
		Structure = <Structure>
		param = <param>
		New_Value = <Value>
		Index = <Index>
	}
	current_menu :GetSingleTag \{values_linked}
	if (<values_linked> = 1)
		if gotParam \{Index}
			I = 0
			begin
			if NOT (<I> = <Index>)
				structure_control_menu_apply_param_change param {
					Structure = <Structure>
					param = <param>
					New_Value = <Value>
					Index = <I>
				}
			endif
			I = (<I> + 1)
			repeat (<control_params>.array_param_size)
		endif
		if gotParam \{param_links}
			I = 0
			getArraySize \{param_links}
			begin
			structure_control_menu_apply_param_change param {
				Structure = <Structure>
				param = (<param_links> [<I>])
				New_Value = <Value>
				Index = <Index>
			}
			I = (<I> + 1)
			repeat <array_Size>
		endif
	endif
	(<control_params>.callback) (<Structure>)
endscript

script structure_control_menu_apply_param_change 
	structure_control_menu_verify_presence Structure = <Structure> param = <param>
	Id = <param>
	if gotParam \{Index}
		array_value = (<Structure>.<param>)
		setarrayelement Arrayname = array_value Index = <Index> NewValue = <New_Value>
		Addparam Name = <param> structure_name = new_params Value = <array_value>
		MangleChecksums A = <param> B = <Index>
		Id = <mangled_ID>
	else
		Addparam Name = <param> structure_name = new_params Value = <New_Value>
	endif
	Change globalName = <Structure> NewValue = {(<Structure>) <new_params>}
	runScriptOnScreenElement Id = {current_menu child = <Id>} structure_control_menu_control_item_refresh
endscript

script structure_control_menu_control_item_refresh 
	Obj_Getid
	if NOT GetSingleTag \{control_params}
		return
	endif
	Structure = (<control_params>.Structure)
	param = (<control_params>.param)
	Index = (<control_params>.array_param_index)
	values = (<control_params>.values)
	structure_control_menu_verify_presence Structure = <Structure> param = <param>
	if gotParam \{Index}
		array_value = (<Structure>.<param>)
		New_Value = (<array_value> [<Index>])
	else
		New_Value = (<Structure>.<param>)
		if gotParam \{values}
			structure_control_menu_find_existing_value_index <control_params> Value = <New_Value>
		endif
	endif
	new_params = {<control_params> Value = <New_Value>}
	SetTags control_params = <new_params>
	control_params = <new_params>
	if gotParam \{values}
		GetSingleTag \{selection_index}
		display_value = (<control_params>.value_labels [<selection_index>])
	else
		formatText Textname = display_value "%v" v = (<control_params>.Value) DecimalPlaces = 2
	endif
	setScreenElementProps {
		Id = {<objId> child = value_display}
		Text = <display_value>
	}
endscript

script structure_control_menu_control_item_focus 
	Obj_Getid
	GetSingleTag \{control_params}
	if structureContains \{Structure = control_params values}
		GetSingleTag \{selection_index}
		getArraySize (<control_params>.values)
		if ((<selection_index> > 0) || ((<control_params>.range_loop) = 1))
			DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 1
		endif
		if ((<selection_index> < (<array_Size> -1)) || ((<control_params>.range_loop) = 1))
			DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 1
		endif
	else
		if (((<control_params>.Value) > (<control_params>.Min)) || ((<control_params>.range_loop) = 1))
			DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 1
		endif
		if (((<control_params>.Value) < (<control_params>.MAX)) || ((<control_params>.range_loop) = 1))
			DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 1
		endif
	endif
endscript

script structure_control_menu_control_item_unfocus 
	Obj_Getid
	DoScreenElementMorph Id = {<objId> child = right_arrow} Alpha = 0
	DoScreenElementMorph Id = {<objId> child = left_arrow} Alpha = 0
endscript

script structure_control_menu_choose_item_focus 
	GetProps
	SetTags old_rgba = <rgba>
	SetProps \{rgba = [255 208 0 200]}
	Obj_Getid
	current_menu :SetTags choose_action_override = <objId>
endscript

script structure_control_menu_choose_item_unfocus \{old_rgba = [176 210 244 255]}
	GetSingleTag \{old_rgba}
	SetProps rgba = <old_rgba>
	current_menu :Removetags \{[choose_action_override]}
endscript

script structure_control_menu_choose_item_action 
	GetSingleTag \{action}
	(<action>.pad_choose_script) (<action>.pad_choose_params)
endscript
