GP_Party_LightSparks02 = {
	pos = (0.201091, 3.5249019, 0.95153)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	emit_Target = (0.2, -0.5, 1.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -4.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 120.0
	BounceHeight = 0.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (1.0, 3.0)
	Emit_Rate = 100.0
	MAX = 0
	TimeSeed = 0.1
	lifeTime = 0.0
	emitNum = 24
	FollowEmitter = 0.0
	EmitFunction = constant
	emitPeriod = 1.0
	sizeRange = [
		(0.07, 0.1)
		(0.0, 0.1)
	]
	SpeedRange = (1.5, 3.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	emitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.07
	history = 2
	HistoryListCoordinateSpace = World
	Color = -7064577
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		alphaCutoff = 16
		blendmode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.46765104, 0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
		(-0.155884, 0.0, -0.0)
		(0.155884, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
	]
	VertexWeight = [
		1.0
	]
}
