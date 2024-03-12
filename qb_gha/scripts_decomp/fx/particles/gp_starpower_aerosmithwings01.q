GP_StarPower_AerosmithWings01 = {
	Pos = (0.35688803, 40.385303, -0.91016203)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = v
	active
	createdatstart
	attach
	bone = Bone_Pelvis
	emitrangedims = (0.7, 0.7, 0.7)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 1.0
	perparticlewind
	emittervelocityweight = 0.0
	radiate
	elevspread = (90.0, 90.0)
	sweepspread = (0.0, 360.0)
	liferange = (2.0, 2.5)
	emit_rate = 2.0
	max = 0
	timeseed = 0.5
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.7, 0.1)
		(0.2, 0.1)
	]
	depthrange = (0.2, 0.2)
	speedrange = (0.5, 1.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	History = 2
	historylistcoordinatespace = world
	align_to = (0.0, 1.0, 0.0)
	color = -1
	novisibilitytest
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = JOW_StarPower_AerosmithWings01
		specularpower = 0
		twoside
		alphacutoff = 48
		BlendMode = Blend
		burn
		burnvalue = 0.3
		quadanimationfps = 15
	}
	knot = [
		(-5.710207, 0.0, -0.28551)
		(-5.710207, 0.0, -0.28551)
		(-5.3715625, 0.0, -0.26898497)
		(-5.032917, 0.0, -0.25246102)
		(-4.694272, 0.0, -0.235936)
		(-2.1073966, 0.0, -0.109706)
		(0.479479, 0.0, 0.016524997)
		(3.066355, 0.0, 0.142755)
		(3.9952242, 0.0, 0.142755)
		(4.9240932, 0.0, 0.142755)
		(5.852962, 0.0, 0.142755)
		(5.852962, 0.0, 0.142755)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-1
		-1
		-256
		-256
	]
	vertexweight = [
		0.08788499
		0.759228
		1.0
	]
	updatescript = starPower_Butterflies
	params = {
		sMinW = 1.0
		sMaxW = 0.4
		eMinW = 0.2
		eMaxW = 0.1
		sMinH = 0.05
		sMaxH = 0.5
		eMinH = 0.02
		eMaxH = 0.1
		cycleTime = 0.5
		updateTime = 0.05
	}
}
