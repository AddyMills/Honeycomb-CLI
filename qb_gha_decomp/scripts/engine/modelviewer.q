viewerobj_components = [
	{
		Component = viewerobj
	}
	{
		Component = Suspend
	}
	{
		Component = motion
	}
	{
		Component = sound
	}
	{
		Component = stream
	}
]
viewerobj_AnimTree = {
	type = modelviewer
	id = ModelViewerNode
	[
		{
			type = Cycle
			id = CycleNode
			anim = param_anim
			enable_anim_events
			[
				{
					type = source
					id = SourceNode
					anim = param_anim
				}
			]
		}
	]
}

script viewerobj_set_anim 
	anim_uninittree
	if NOT anim_animexists anim = <AnimName>
		printf "Bad anim name: %a" a = <AnimName>
		anim_getdefaultanimname
		if anim_animexists anim = <defaultanimname>
			AnimName = <defaultanimname>
		endif
	endif
	printf "Set anim: %a" a = <AnimName>
	anim_inittree {
		tree = $viewerobj_AnimTree
		nodeiddeclaration = [
			ModelViewerNode
			CycleNode
			SourceNode
		]
		params = {
			param_anim = <AnimName>
		}
	}
endscript

script viewerobj_set_anim_speed 
	anim_command \{command = modelviewer_play target = ModelViewerNode}
	anim_command command = timer_setspeed target = CycleNode params = {Speed = <Speed>}
endscript

script viewerobj_reload_anim 
	printstruct <...>
	anim_uninittree
	ReloadAnim filename = <filename> anim = <AnimName>
	viewerobj_set_anim <...>
endscript

script viewerobj_step_frame 
	anim_command \{command = timer_setspeed target = CycleNode params = {Speed = 1.0}}
	anim_command command = modelviewer_step target = ModelViewerNode params = <...>
endscript

script viewer_obj_get_panel_info 
	anim_command \{command = source_getanimname target = SourceNode}
	if anim_command \{command = modelviewer_isstopped target = ModelViewerNode}
		Speed = 0.0
	else
		anim_command \{command = timer_getspeed target = CycleNode}
	endif
	anim_command \{command = timer_getcurrentanimtime target = CycleNode}
	anim_command \{command = timer_getanimduration target = CycleNode}
	FormatText textname = line1 "NAME: %n" n = <AnimName> DontAssertForChecksums
	FormatText textname = line2 "SPEED: %s" s = <Speed>
	FormatText textname = line3 "TIME: %t of %d" t = <currenttime> d = <duration>
	currenttime = ((<currenttime> * 60) + 1)
	duration = (<duration> * 60)
	CastToInteger \{currenttime}
	CastToInteger \{duration}
	FormatText textname = line4 "FRAME: %t of %d" t = <currenttime> d = <duration>
	return <...>
endscript
generic_model_anim_tree = {
	type = degenerateblend
	id = RootNode
}
generic_model_anim_branch = {
	type = param_timer_type
	id = TimerNode
	Speed = param_speed
	start = param_start
	anim = param_anim
	[
		{
			type = source
			id = SourceNode
			anim = param_anim
		}
	]
}
generic_model_anim_branch_flipped = {
	type = flip
	id = FlipNode
	[
		{
			generic_model_anim_branch
		}
	]
}

script ModelViewer_InitAnimTree 
	anim_uninittree
	anim_inittree \{tree = $generic_model_anim_tree nodeiddeclaration = [RootNode TimerNode SourceNode FlipNode]}
endscript

script ModelViewer_PlayAnim \{anim = 0
		target = RootNode
		tree = $generic_model_anim_branch
		Flipped = 0}
	timer_type = play
	if GotParam \{Cycle}
		timer_type = Cycle
	endif
	if (<Flipped> = 1)
		<tree> = generic_model_anim_branch_flipped
	endif
	anim_command {
		target = <target>
		command = degenerateblend_addbranch
		params = {
			blendduration = <BlendPeriod>
			tree = <tree>
			params = {
				param_timer_type = <timer_type>
				param_anim = <anim>
				param_speed = <Speed>
				param_start = <start>
			}
		}
	}
endscript

script ModelViewer_WaitAnimFinished \{timer = TimerNode}
	anim_command target = <timer> command = timer_wait
endscript
