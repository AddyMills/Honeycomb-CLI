button_array = [
	"0"
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
	"a"
	"b"
	"c"
	"d"
	"e"
	"f"
	"g"
	"h"
	"i"
	"j"
	"k"
	"l"
]
meta_array = [
	"0"
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
	"a"
	"b"
	"c"
	"d"
	"e"
	"f"
	"g"
	"h"
	"i"
	"j"
	"k"
	"l"
	"m"
	"n"
	"o"
	"p"
	"q"
	"r"
	"s"
	"t"
	"u"
	"v"
]

script debug_show_buttons \{scale = 0.8 z_priority = 100 padding_scale = 1.5}
	SetScreenElementLock \{OFF Id = root_window}
	if ScreenelementExists \{Id = button_container}
		DestroyScreenelement \{Id = button_container}
		return
	endif
	createScreenElement \{Type = containerElement PARENT = root_window Id = button_container pos = (320.0, 240.0) Dims = (640.0, 480.0) event_handlers = [{pad_back debug_kill_buttons Params = {}}]}
	createScreenElement \{Type = spriteElement PARENT = button_container texture = white2 rgba = [0 0 0 100] scale = (80.0, 30.0) pos = (320.0, 210.0)}
	createScreenElement \{Type = textElement PARENT = button_container Text = "buttons" font = text_A1 scale = 1 pos = (320.0, 120.0) z_priority = 101}
	createScreenElement {
		Type = HMenu
		PARENT = button_container
		Id = debug_buttons
		pos = (320.0, 160.0)
		just = [Center Bottom]
		internal_just = [Left Center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		scale = <scale>
		z_priority = <z_priority>
	}
	getArraySize \{button_array}
	Index = 0
	begin
	formatText Textname = Text "%i" I = (button_array [<Index>])
	formatText Textname = button "\\b%i" I = (button_array [<Index>])
	create_debug_button_item Text = <Text> button = <button> PARENT = debug_buttons
	Index = (<Index> + 1)
	repeat <array_Size>
	createScreenElement \{Type = textElement PARENT = button_container Text = "meta chars" font = text_A1 scale = 1 pos = (320.0, 200.0) z_priority = 101}
	createScreenElement {
		Type = HMenu
		PARENT = button_container
		Id = debug_meta1
		pos = (320.0, 240.0)
		just = [Center Bottom]
		internal_just = [Left Center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		scale = <scale>
		z_priority = <z_priority>
	}
	getArraySize \{meta_array}
	Index = 0
	begin
	formatText Textname = Text "%i" I = (meta_array [<Index>])
	formatText Textname = button "\\m%i" I = (meta_array [<Index>])
	create_debug_button_item Text = <Text> button = <button> PARENT = debug_meta1
	Index = (<Index> + 1)
	repeat 16
	createScreenElement {
		Type = HMenu
		PARENT = button_container
		Id = debug_meta2
		pos = (320.0, 280.0)
		just = [Center Bottom]
		internal_just = [Left Center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		scale = <scale>
		z_priority = <z_priority>
	}
	begin
	formatText Textname = Text "%i" I = (meta_array [<Index>])
	formatText Textname = button "\\m%i" I = (meta_array [<Index>])
	create_debug_button_item Text = <Text> button = <button> PARENT = debug_meta2
	Index = (<Index> + 1)
	repeat (<array_Size> -16)
	launchevent \{Type = focus Target = button_container}
endscript

script create_debug_button_item 
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		pos = (0.0, 0.0)
		Dims = (20.0, 20.0)
		internal_just = [Center Center]
		just = [Center Center]
	}
	parent_id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <parent_id>
		Text = <Text>
		font = text_A1
		pos = (0.0, 0.0)
		just = [Center Center]
	}
	createScreenElement {
		Type = textElement
		PARENT = <parent_id>
		Text = <button>
		font = text_A1
		pos = (0.0, 15.0)
		just = [Center Center]
	}
	getScreenElementDims Id = <Id>
	if gotParam \{width}
		if (<width> > 30)
			setScreenElementProps Id = <parent_id> Dims = (55.0, 20.0)
			setScreenElementProps Id = <Id> pos = (15.0, 15.0)
		endif
	endif
endscript

script debug_kill_buttons 
	if ScreenelementExists \{Id = button_container}
		DestroyScreenelement \{Id = button_container}
	endif
endscript

script rebuild_panel_stuff 
	destroy_panel_stuff
	create_panel_stuff
endscript
