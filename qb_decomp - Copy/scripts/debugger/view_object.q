mousezoomfactor = 0.2
mouseyoffsetupdownfactor = 0.02
mouserotationupdownfactor = -0.013332999
mouserotationleftrightfactor = 0.01
hi_def_object_viewer_globalscale = 0.3
low_def_object_viewer_globalscale = 0.45000002
object_viewer_yoffset = 34
object_viewer_globalscale = 0.6
object_viewer_num_lines = 12

script enableobjviewer 
	if ($highdefviewer = 1)
		Change \{object_viewer_globalscale = $hi_def_object_viewer_globalscale}
	endif
	if ($highdefviewer = 0)
		Change \{object_viewer_globalscale = $low_def_object_viewer_globalscale}
	endif
	if NOT ScreenelementExists \{Id = view_dot}
		SetScreenElementLock \{Id = root_window OFF}
		createScreenElement \{Id = view_dot Type = spriteElement texture = White rgba = [255 0 0 128] scale = 1.0 pos = (320.0, 240.0) PARENT = root_window}
	endif
	if ScreenelementExists \{Id = obj_viewer_anchor}
		DestroyScreenelement \{Id = obj_viewer_anchor}
	endif
	SetScreenElementLock \{Id = root_window OFF}
	createScreenElement \{Type = containerElement PARENT = root_window Id = obj_viewer_anchor pos = (20.0, 250.0) just = [Center Center] internal_just = [Left Center]}
	scale = ($object_viewer_yoffset * $object_viewer_globalscale)
	posoffset = ((0.0, 1.0) * <scale>)
	pos0 = ((0.0, 200.0) - (<posoffset> * ($object_viewer_num_lines + 1)))
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text1
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [60 60 100 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text2
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text11
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text12
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text3
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text4
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text5
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text6
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text7
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text8
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text9
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createScreenElement {
		Type = textElement
		PARENT = obj_viewer_anchor
		Id = view_obj_text10
		pos = <pos0>
		Text = "None"
		font = text_A1
		rgba = [58 108 58 255]
		just = [Left Center]
		scale = $object_viewer_globalscale
	}
endscript
default_obj_viewer_display = 1

script updateobjviewer 
	if ($default_obj_viewer_display = 1)
		setScreenElementProps Id = view_obj_text2 Text = <objname>
		setScreenElementProps Id = view_obj_text1 Text = <objtype>
		setScreenElementProps Id = view_obj_text11 Text = <polystat8>
		setScreenElementProps Id = view_obj_text12 Text = <polystat9>
		setScreenElementProps Id = view_obj_text3 Text = <polystat0>
		setScreenElementProps Id = view_obj_text4 Text = <polystat1>
		setScreenElementProps Id = view_obj_text5 Text = <polystat2>
		setScreenElementProps Id = view_obj_text6 Text = <polystat3>
		setScreenElementProps Id = view_obj_text7 Text = <polystat4>
		setScreenElementProps Id = view_obj_text8 Text = <polystat5>
		setScreenElementProps Id = view_obj_text9 Text = <polystat6>
		setScreenElementProps Id = view_obj_text10 Text = <polystat7>
		hide_ai_debug
	else
		setScreenElementProps \{Id = view_obj_text2 Text = ""}
		setScreenElementProps \{Id = view_obj_text1 Text = ""}
		setScreenElementProps \{Id = view_obj_text11 Text = ""}
		setScreenElementProps \{Id = view_obj_text12 Text = ""}
		setScreenElementProps \{Id = view_obj_text3 Text = ""}
		setScreenElementProps \{Id = view_obj_text4 Text = ""}
		setScreenElementProps \{Id = view_obj_text5 Text = ""}
		setScreenElementProps \{Id = view_obj_text6 Text = ""}
		setScreenElementProps \{Id = view_obj_text7 Text = ""}
		setScreenElementProps \{Id = view_obj_text8 Text = ""}
		setScreenElementProps \{Id = view_obj_text9 Text = ""}
		setScreenElementProps \{Id = view_obj_text10 Text = ""}
	endif
	if gotParam \{objId}
		if compositeObjectexists Name = <objId>
			if <objId> :containscomponent Name = agent
				<objId> :agent_updateviewed
			endif
		endif
	endif
endscript

script disableobjviewer 
	if ScreenelementExists \{Id = view_dot}
		DestroyScreenelement \{Id = view_dot}
	endif
	if ScreenelementExists \{Id = view_obj_text1}
		DestroyScreenelement \{Id = view_obj_text1}
	endif
	if ScreenelementExists \{Id = view_obj_text2}
		DestroyScreenelement \{Id = view_obj_text2}
	endif
	if ScreenelementExists \{Id = view_obj_text3}
		DestroyScreenelement \{Id = view_obj_text3}
	endif
	if ScreenelementExists \{Id = view_obj_text4}
		DestroyScreenelement \{Id = view_obj_text4}
	endif
	if ScreenelementExists \{Id = view_obj_text5}
		DestroyScreenelement \{Id = view_obj_text5}
	endif
	if ScreenelementExists \{Id = view_obj_text6}
		DestroyScreenelement \{Id = view_obj_text6}
	endif
	if ScreenelementExists \{Id = view_obj_text7}
		DestroyScreenelement \{Id = view_obj_text7}
	endif
	if ScreenelementExists \{Id = view_obj_text8}
		DestroyScreenelement \{Id = view_obj_text8}
	endif
	if ScreenelementExists \{Id = view_obj_text9}
		DestroyScreenelement \{Id = view_obj_text9}
	endif
	if ScreenelementExists \{Id = view_obj_text10}
		DestroyScreenelement \{Id = view_obj_text10}
	endif
	if ScreenelementExists \{Id = view_obj_text11}
		DestroyScreenelement \{Id = view_obj_text11}
	endif
	if ScreenelementExists \{Id = view_obj_text12}
		DestroyScreenelement \{Id = view_obj_text12}
	endif
	if ScreenelementExists \{Id = view_obj_ai}
		DestroyScreenelement \{Id = view_obj_ai}
	endif
endscript
