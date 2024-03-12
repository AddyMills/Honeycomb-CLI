
script element3d_add_components 
	if gotParam \{skeletonName}
		PushMemProfile \{'Element3d Skeletons'}
		CreateComponentFromStructure component = Skeleton <...> Skeleton = <skeletonName>
		PopMemProfile
	endif
	if gotParam \{animName}
		CreateComponentFromStructure component = model lightGroup = NONE max_scene_lights = 0 <...> scale = 1
		CreateComponentFromStructure \{component = animtree}
	else
		CreateComponentFromStructure component = model <...> scale = 1 lightGroup = NONE
	endif
endscript

script element3d_init_model 
	if gotParam \{animName}
		if gotParam \{blackout_model}
			SetLightAmbientColor \{R = 0 G = 0 B = 0}
			SetLightDiffuseColor \{Index = 0 R = 0 G = 0 B = 0}
			SetLightDiffuseColor \{Index = 1 R = 0 G = 0 B = 0}
			SetLightAmbientColor \{R = 0 G = 0 B = 0}
			SetLightDiffuseColor \{Index = 0 R = 0 G = 0 B = 0}
			SetLightDiffuseColor \{Index = 1 R = 0 G = 0 B = 0}
		else
			SetLightAmbientColor \{R = 128 G = 128 B = 128}
			SetLightDiffuseColor \{Index = 0 R = 110 G = 125 B = 155}
			SetLightDiffuseColor \{Index = 1 R = 10 G = 3 B = 5}
		endif
		obj_forceupdate
	endif
endscript
