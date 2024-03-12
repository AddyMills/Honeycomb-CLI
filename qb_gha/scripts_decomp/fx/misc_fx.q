jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	printf \{"*******************************************************************"}
	printf <...>
	printf \{"*******************************************************************"}
endscript

script SafeGetUniqueCompositeObjectID \{preferredid = safeFXID01}
	if NOT GotParam \{ObjID}
		GetUniqueCompositeObjectID preferredid = <preferredid>
		return uniqueid = <uniqueid>
	endif
	i = 0
	FormatText textname = index '%i' i = <i>
	extendcrc <preferredid> <index> out = preferredid
	begin
	MangleChecksums a = <preferredid> b = <ObjID>
	if NOT ObjectExists id = <mangled_id>
		return uniqueid = <preferredid>
	else
		i = (<i> + 1)
		FormatText textname = index '%i' i = <i>
		extendcrc <preferredid> <index> out = preferredid
	endif
	repeat
endscript

script LoseFX_GuitarSmoke_01 
	obj_getid
	GetUniqueCompositeObjectID \{preferredid = FX_LoseSmoke_01}
	CreateParticleSystem name = <uniqueid> ObjID = <ObjID> bone = Bone_Guitar_Body params_script = $GP_FX_LoseSmoke_01
endscript

script LoseFX_GuitarSparks_01 
	obj_getid
	GetUniqueCompositeObjectID \{preferredid = FX_LoseSparks_01}
	CreateParticleSystem name = <uniqueid> ObjID = <ObjID> bone = Bone_Guitar_Body params_script = $GP_FX_LoseSparks_01
endscript

script SetLightIntensityOverTime \{i = 1.0 time = 2.0 stepTime = 0.05}
	targetI = <i>
	GetLightIntensity name = <name>
	numsteps = (<time> / <stepTime>)
	CastToInteger \{numsteps}
	stepSize = ((<targetI> - <i>) / <numsteps>)
	begin
	i = (<i> + <stepSize>)
	SetLightIntensity name = <name> intensity = <i>
	wait <stepTime> seconds
	repeat (<numsteps> -1)
	SetLightIntensity name = <name> intensity = <targetI>
endscript
