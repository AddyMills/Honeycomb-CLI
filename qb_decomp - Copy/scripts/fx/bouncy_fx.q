numPlywoodSmall = 0
maxPlywoodSmall = 4

script Contact_Settle_Die 
	SetTags \{CONTACT_MADE}
	Contact_TerrainEffects <...>
endscript

script Deactivate_Settle_Die 
	getTags
	if gotParam \{CONTACT_MADE}
		Removetags \{[CONTACT_MADE]}
		removeParameter \{CONTACT_MADE}
	endif
	Wait RandomRange (2.0, 4.0) Seconds
	getTags
	if NOT gotParam \{CONTACT_MADE}
		DIE
	endif
endscript

script Deactivate_PlywoodSmall 
	getTags
	if gotParam \{CONTACT_MADE}
		Removetags \{[CONTACT_MADE]}
		removeParameter \{CONTACT_MADE}
	endif
	Wait RandomRange (2.0, 4.0) Seconds
	getTags
	if NOT gotParam \{CONTACT_MADE}
		Change numPlywoodSmall = ($numPlywoodSmall -1)
		DIE
	endif
endscript

script Contact_GO_Cafe_Chair 
	if (<skatercollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<ObjID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<ObjID1> :Obj_GetPosition
		GetUniqueCompositeobjectID \{PreferredId = GO_Cafe_Chair_Bits}
		CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_HO_Cafe_Chair_Bits
		GetUniqueCompositeobjectID \{PreferredId = GO_Cafe_Chair_Dust}
		CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_HO_Cafe_Chair_Dust
		GetUniqueCompositeobjectID \{PreferredId = ChairExplodeSound}
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM components = [{component = Sound}] Params = {
				Name = <UniqueId>
				pos = <pos>
			}
			Soundevent Event = Chair_Break_SFX Object = <UniqueId>
		endif
		Wait \{1 Frame}
		DIE
	endif
endscript

script Contact_Plywood 
	Contact_TerrainEffects <...>
	<ObjID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		if NOT GetSingleTag \{PLYWOOD_BREAK}
			SetTags \{PLYWOOD_BREAK}
			if (<skatercollision> = TRUE)
				NewTarget = (-1 * <norm>)
			else
				NewTarget = <norm>
			endif
			<ObjID1> :Obj_GetPosition
			GetUniqueCompositeobjectID \{PreferredId = PlywoodBits}
			CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_Plywood_Bits01
			if iscreated <UniqueId>
				Orient Object = <UniqueId> relativeTo = <ObjID1> offset = (0.0, 1.0, 0.0)
			endif
			GetUniqueCompositeobjectID \{PreferredId = PlywoodDust}
			CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_Plywood_Dust01
			if iscreated <UniqueId>
				Orient Object = <UniqueId> relativeTo = <ObjID1> offset = (0.0, 1.0, 0.0)
			endif
			if ($numPlywoodSmall < $maxPlywoodSmall)
				begin
				GetUniqueCompositeobjectID \{PreferredId = PlywoodSmall01}
				createfromstructure {
					Name = <UniqueId>
					pos = (<pos> + RandomRange (-1.0, 1.0) * (1.0, 0.0, 0.0) + RandomRange (-1.0, 1.0) * (0.0, 1.0, 0.0) + RandomRange (-1.0, 1.0) * (0.0, 0.0, 1.0))
					Angles = (RandomRange (-3.1399999, 3.1399999) * (1.0, 0.0, 0.0) + RandomRange (-3.1399999, 3.1399999) * (0.0, 1.0, 0.0) + RandomRange (-3.1399999, 3.1399999) * (0.0, 0.0, 1.0))
					Class = GameObject
					Type = GO_Plywood_Small_Piece
					Bouncy
					Profile = $profile_GO_Plywood_Small_Piece
				}
				if iscreated <UniqueId>
					<UniqueId> :RigidBody_LinearImpulse Impulse = (2.5 * <length> * (<NewTarget> + (0.0, 0.25, 0.0)))
					Change numPlywoodSmall = ($numPlywoodSmall + 1)
					if NOT ($numPlywoodSmall < $maxPlywoodSmall)
						break
					endif
				endif
				repeat RandomRange (1.0, 2.0)
			endif
			GetUniqueCompositeobjectID \{PreferredId = ShortPottedPlantExplodeSound}
			if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM components = [{component = Sound}] Params = {
					Name = <UniqueId>
					pos = <pos>
				}
				Soundevent Event = Plywood_Break_SFX Object = <UniqueId>
			endif
			Wait \{1 Frame}
			DIE
		endif
	endif
endscript

script Contact_PottedPlant_Short 
	if (<skatercollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<ObjID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<ObjID1> :Obj_GetPosition
		GetUniqueCompositeobjectID \{PreferredId = PottedPlant_Dirt}
		CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_Pot_Dust01
		if iscreated <UniqueId>
			Orient Object = <UniqueId> relativeTo = <ObjID1> offset = (0.0, 0.5, 0.0)
		endif
		GetUniqueCompositeobjectID \{PreferredId = PottedPlant_Dirt}
		CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_Pot_Bits01
		GetUniqueCompositeobjectID \{PreferredId = PottedPlant_Leaves}
		CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_Leaves_Short01
		if iscreated <UniqueId>
			Orient Object = <UniqueId> relativeTo = <ObjID1> offset = (0.0, 1.0, 0.0)
		endif
		GetUniqueCompositeobjectID \{PreferredId = ShortPottedPlantExplodeSound}
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM components = [{component = Sound}] Params = {
				Name = <UniqueId>
				pos = <pos>
			}
			Soundevent Event = PottedPlant_Explode_SFX Object = <UniqueId>
		endif
		Wait \{1 Frame}
		DIE
	endif
endscript

script Contact_PottedPlant_Tall 
	if (<skatercollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<ObjID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<ObjID1> :Obj_GetPosition
		GetUniqueCompositeobjectID \{PreferredId = PottedPlant_Dirt}
		CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_Pot_Dust01
		if iscreated <UniqueId>
			Orient Object = <UniqueId> relativeTo = <ObjID1> offset = (0.0, 0.7, 0.0)
		endif
		GetUniqueCompositeobjectID \{PreferredId = PottedPlant_Dirt}
		CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_Pot_Bits01
		GetUniqueCompositeobjectID \{PreferredId = PottedPlant_Leaves}
		CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = $GP_Leaves_Tall01
		if iscreated <UniqueId>
			Orient Object = <UniqueId> relativeTo = <ObjID1> offset = (0.0, 2.0, 0.0)
		endif
		GetUniqueCompositeobjectID \{PreferredId = ShortPottedPlantExplodeSound}
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM components = [{component = Sound}] Params = {
				Name = <UniqueId>
				pos = <pos>
			}
			Soundevent Event = PottedPlant_Explode_SFX Object = <UniqueId>
		endif
		Wait \{1 Frame}
		DIE
	endif
endscript

script Contact_TerrainEffects 
	if (<skatercollision> = TRUE)
		return
	endif
	<ObjID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> < 3)
		return
	endif
	terrain1 = (($Terrain_Types [<terrain1>]).Checksum)
	terrain2 = (($Terrain_Types [<terrain2>]).Checksum)
	GetTerrainTypeParam param = TreadActions Terrain = <terrain2>
	begin
	if GetNextArrayElement (<TreadActions>.SkaterJumpLandParticleParms)
		GetUniqueCompositeobjectID \{PreferredId = BounceTerrain01}
		if ((<Element>.Type) = NewFlat)
			CreateGlobalFastParticleSystem Name = <UniqueId> params_Script = <Element> pos = <pos>
		else
			CreateGlobalFlexParticleSystem Name = <UniqueId> params_Script = <Element> pos = <pos>
		endif
	else
		break
	endif
	repeat
	switch <terrain1>
		case TERRAIN_METALCAR
		case TERRAIN_METAL
		case TERRAIN_METALPOLE
		case TERRAIN_METALTIN
		case TERRAIN_METALLOCKERS
		case TERRAIN_METALTHIN
		case TERRAIN_METALPIPELARGE
		case TERRAIN_MAILBOX
		case TERRAIN_METALGRATE
		switch <terrain2>
			case TERRAIN_DEFAULT
			case TERRAIN_ASPHALT
			case TERRAIN_ASPHALTROUGH
			case TERRAIN_ASPHALTSMOOTH
			case TERRAIN_ASPHALTSMOOTH_HF
			case TERRAIN_BRICK
			case TERRAIN_BRICK_1FT
			case TERRAIN_BRICK_2FT
			case TERRAIN_BRICK_4FT
			case TERRAIN_BRICK_6IN
			case TERRAIN_COBBLESTONE
			case terrain_concsmooth
			case TERRAIN_CONCROUGH
			case TERRAIN_GOLDCOINS
			case TERRAIN_HIGHFRICTION
			case TERRAIN_MAILBOX
			case TERRAIN_METALCAR
			case TERRAIN_METAL
			case TERRAIN_METALGRATE
			case TERRAIN_METALLOCKERS
			case TERRAIN_METALPIPELARGE
			case TERRAIN_METALPOLE
			case TERRAIN_METALTHIN
			case TERRAIN_METALTIN
			case TERRAIN_SHINGLESTILE
			case TERRAIN_SIDEWALK_1FT
			case TERRAIN_SIDEWALK_2FT
			case TERRAIN_SIDEWALK_4FT
			case TERRAIN_SIDEWALK_4FT_HF
			case TERRAIN_SIDEWALK_8FT
			case TERRAIN_TILE_2FT
			case TERRAIN_TILE_4FT
			case TERRAIN_TILE_6IN
			GetUniqueCompositeobjectID \{PreferredId = BouncySparks01}
			CreateGlobalFlexParticleSystem Name = <UniqueId> pos = <pos> params_Script = {$GP_Bouncy_Sparks01 emit_Target = ((-1 * <norm>) + (0.0, 0.25, 0.0))}
		endswitch
	endswitch
endscript
