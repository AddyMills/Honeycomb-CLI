numPlywoodSmall = 0
maxPlywoodSmall = 4

script Contact_Settle_Die 
	settags \{CONTACT_MADE}
	Contact_TerrainEffects <...>
endscript

script Deactivate_Settle_Die 
	gettags
	if GotParam \{CONTACT_MADE}
		removetags \{[CONTACT_MADE]}
		RemoveParameter \{CONTACT_MADE}
	endif
	wait RandomRange (2.0, 4.0) seconds
	gettags
	if NOT GotParam \{CONTACT_MADE}
		Die
	endif
endscript

script Deactivate_PlywoodSmall 
	gettags
	if GotParam \{CONTACT_MADE}
		removetags \{[CONTACT_MADE]}
		RemoveParameter \{CONTACT_MADE}
	endif
	wait RandomRange (2.0, 4.0) seconds
	gettags
	if NOT GotParam \{CONTACT_MADE}
		change numPlywoodSmall = ($numPlywoodSmall -1)
		Die
	endif
endscript

script Contact_GO_Cafe_Chair 
	if (<SkaterCollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<objid1> :obj_getvelocity
	NormalizeVector <vel>
	if (<Length> > 7)
		<objid1> :obj_getposition
		GetUniqueCompositeObjectID \{preferredid = GO_Cafe_Chair_Bits}
		CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_HO_Cafe_Chair_Bits
		GetUniqueCompositeObjectID \{preferredid = GO_Cafe_Chair_Dust}
		CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_HO_Cafe_Chair_Dust
		GetUniqueCompositeObjectID \{preferredid = ChairExplodeSound}
		if CreateCompositeObject priority = COIM_Priority_Sound heap = gameobj oldheap = com Components = [{Component = sound}] params = {
				name = <uniqueid>
				Pos = <Pos>
			}
			SoundEvent event = Chair_Break_SFX object = <uniqueid>
		endif
		wait \{1 frame}
		Die
	endif
endscript

script Contact_Plywood 
	Contact_TerrainEffects <...>
	<objid1> :obj_getvelocity
	NormalizeVector <vel>
	if (<Length> > 7)
		if NOT getsingletag \{PLYWOOD_BREAK}
			settags \{PLYWOOD_BREAK}
			if (<SkaterCollision> = TRUE)
				newtarget = (-1 * <norm>)
			else
				newtarget = <norm>
			endif
			<objid1> :obj_getposition
			GetUniqueCompositeObjectID \{preferredid = PlywoodBits}
			CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_Plywood_Bits01
			if IsCreated <uniqueid>
				orient object = <uniqueid> relativeto = <objid1> Offset = (0.0, 1.0, 0.0)
			endif
			GetUniqueCompositeObjectID \{preferredid = PlywoodDust}
			CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_Plywood_Dust01
			if IsCreated <uniqueid>
				orient object = <uniqueid> relativeto = <objid1> Offset = (0.0, 1.0, 0.0)
			endif
			if ($numPlywoodSmall < $maxPlywoodSmall)
				begin
				GetUniqueCompositeObjectID \{preferredid = PlywoodSmall01}
				CreateFromStructure {
					name = <uniqueid>
					Pos = (<Pos> + RandomRange (-1.0, 1.0) * (1.0, 0.0, 0.0) + RandomRange (-1.0, 1.0) * (0.0, 1.0, 0.0) + RandomRange (-1.0, 1.0) * (0.0, 0.0, 1.0))
					angles = (RandomRange (-3.1399999, 3.1399999) * (1.0, 0.0, 0.0) + RandomRange (-3.1399999, 3.1399999) * (0.0, 1.0, 0.0) + RandomRange (-3.1399999, 3.1399999) * (0.0, 0.0, 1.0))
					class = gameobject
					type = GO_Plywood_Small_Piece
					bouncy
					profile = $profile_GO_Plywood_Small_Piece
				}
				if IsCreated <uniqueid>
					<uniqueid> :rigidbody_linearimpulse impulse = (2.5 * <Length> * (<newtarget> + (0.0, 0.25, 0.0)))
					change numPlywoodSmall = ($numPlywoodSmall + 1)
					if NOT ($numPlywoodSmall < $maxPlywoodSmall)
						break
					endif
				endif
				repeat RandomRange (1.0, 2.0)
			endif
			GetUniqueCompositeObjectID \{preferredid = ShortPottedPlantExplodeSound}
			if CreateCompositeObject priority = COIM_Priority_Sound heap = gameobj oldheap = com Components = [{Component = sound}] params = {
					name = <uniqueid>
					Pos = <Pos>
				}
				SoundEvent event = Plywood_Break_SFX object = <uniqueid>
			endif
			wait \{1 frame}
			Die
		endif
	endif
endscript

script Contact_PottedPlant_Short 
	if (<SkaterCollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<objid1> :obj_getvelocity
	NormalizeVector <vel>
	if (<Length> > 7)
		<objid1> :obj_getposition
		GetUniqueCompositeObjectID \{preferredid = PottedPlant_Dirt}
		CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_Pot_Dust01
		if IsCreated <uniqueid>
			orient object = <uniqueid> relativeto = <objid1> Offset = (0.0, 0.5, 0.0)
		endif
		GetUniqueCompositeObjectID \{preferredid = PottedPlant_Dirt}
		CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_Pot_Bits01
		GetUniqueCompositeObjectID \{preferredid = PottedPlant_Leaves}
		CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_Leaves_Short01
		if IsCreated <uniqueid>
			orient object = <uniqueid> relativeto = <objid1> Offset = (0.0, 1.0, 0.0)
		endif
		GetUniqueCompositeObjectID \{preferredid = ShortPottedPlantExplodeSound}
		if CreateCompositeObject priority = COIM_Priority_Sound heap = gameobj oldheap = com Components = [{Component = sound}] params = {
				name = <uniqueid>
				Pos = <Pos>
			}
			SoundEvent event = PottedPlant_Explode_SFX object = <uniqueid>
		endif
		wait \{1 frame}
		Die
	endif
endscript

script Contact_PottedPlant_Tall 
	if (<SkaterCollision> = TRUE)
		return
	endif
	Contact_TerrainEffects <...>
	<objid1> :obj_getvelocity
	NormalizeVector <vel>
	if (<Length> > 7)
		<objid1> :obj_getposition
		GetUniqueCompositeObjectID \{preferredid = PottedPlant_Dirt}
		CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_Pot_Dust01
		if IsCreated <uniqueid>
			orient object = <uniqueid> relativeto = <objid1> Offset = (0.0, 0.7, 0.0)
		endif
		GetUniqueCompositeObjectID \{preferredid = PottedPlant_Dirt}
		CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_Pot_Bits01
		GetUniqueCompositeObjectID \{preferredid = PottedPlant_Leaves}
		CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = $GP_Leaves_Tall01
		if IsCreated <uniqueid>
			orient object = <uniqueid> relativeto = <objid1> Offset = (0.0, 2.0, 0.0)
		endif
		GetUniqueCompositeObjectID \{preferredid = ShortPottedPlantExplodeSound}
		if CreateCompositeObject priority = COIM_Priority_Sound heap = gameobj oldheap = com Components = [{Component = sound}] params = {
				name = <uniqueid>
				Pos = <Pos>
			}
			SoundEvent event = PottedPlant_Explode_SFX object = <uniqueid>
		endif
		wait \{1 frame}
		Die
	endif
endscript

script Contact_TerrainEffects 
	if (<SkaterCollision> = TRUE)
		return
	endif
	<objid1> :obj_getvelocity
	NormalizeVector <vel>
	if (<Length> < 3)
		return
	endif
	terrain1 = (($terrain_types [<terrain1>]).checksum)
	terrain2 = (($terrain_types [<terrain2>]).checksum)
	GetTerrainTypeParam param = treadActions terrain = <terrain2>
	begin
	if GetNextArrayElement (<treadActions>.SkaterJumpLandParticleParms)
		GetUniqueCompositeObjectID \{preferredid = BounceTerrain01}
		if ((<element>.type) = NewFlat)
			CreateGlobalFastParticleSystem name = <uniqueid> params_script = <element> Pos = <Pos>
		else
			CreateGlobalFlexParticlesystem name = <uniqueid> params_script = <element> Pos = <Pos>
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
			case terrain_default
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
			case TERRAIN_CONCSMOOTH
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
			GetUniqueCompositeObjectID \{preferredid = BouncySparks01}
			CreateGlobalFlexParticlesystem name = <uniqueid> Pos = <Pos> params_script = {$GP_Bouncy_Sparks01 emit_target = ((-1 * <norm>) + (0.0, 0.25, 0.0))}
		endswitch
	endswitch
endscript
