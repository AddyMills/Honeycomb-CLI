GP_StarPower_BatsSwirl01 = {
	pos = (0.35688803, -13.652906, 0.071377)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = textureribbontrail
	Active
	CreatedAtStart
	Attach
	Bone = BONE_PELVIS
	EmitRangeDims = (0.7, 0.7, 0.7)
	emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 1.0
	PerParticleWind
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (90.0, 90.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (1.5, 2.0)
	Emit_Rate = 12.0
	MAX = 0
	TimeSeed = 0.5
	lifeTime = 0.0
	emitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	emitPeriod = 1.0
	sizeRange = [
		(0.1, 0.1)
		(0.0, 0.0)
	]
	SpeedRange = (1.0, 2.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	emitDelayStart = 0.0
	PathFollowTime = 0.2
	history = 20
	HistoryListCoordinateSpace = World
	Color = 1042856959
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		alphaCutoff = 128
		blendmode = BLEND
		Burn
		BurnValue = 0.5
		QuadAnimationFPS = 18
	}
	Knot = [
		(-5.710207, 0.0, -0.28551)
		(-5.710207, 0.0, -0.28551)
		(-2.784687, 0.0, -0.142755)
		(0.14083399, 0.0, -0.0)
		(3.066355, 0.0, 0.142755)
		(3.9952242, 0.0, 0.142755)
		(4.9240932, 0.0, 0.142755)
		(5.852962, 0.0, 0.142755)
		(5.852962, 0.0, 0.142755)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		0.759227
		1.0
	]
}
