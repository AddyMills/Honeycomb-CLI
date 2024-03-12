DefaultLodDist1 = 20
DefautSuspendDistance = 65
DefaultRenderDistance = 65
human_creation_params = {
	SkeletonName = GH3_Ped
	suspenddistance = $DefautSuspendDistance
	lod_dist1 = $DefaultLodDist1
	lod_dist2 = $DefaultRenderDistance
	behavior_style = Bv_Agent
	agent_stats = stats_civilian
	targeting = $targeting_human
	navigation = $nav_ped
	char_collision = Agent
	char_collision_height = 1.8
	char_collision_radius = 0.3
	anim_class = human
	species = human
	inventory = $inventory_fist
	maxbonepriority = 9
	voice_profile = TeenMaleSkater1
	faction = $faction_human
	sex = Male
	notice_radius = 6.0
	animlodinterleave2 = 6
	ps3_animlodinterleave2 = 10
	xenon_animlodinterleave2 = 10
}
obj_testlevel_creation_params = {
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	zones = [
		global
	]
}
obj_security_creation_params = {
	SkeletonName = GH3_Ped
	tree = $GameObj_AnimTree
	animeventtablename = ped_animevents
	AnimTargets = [
		Body
		bodytimer
	]
	zones = [
		global
	]
}
obj_police_creation_params = {
	SkeletonName = GH3_Ped
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	zones = [
		global
	]
}
obj_hoop_creation_params = {
	SkeletonName = GH3_Ped
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	zones = [
		global
	]
}
obj_Ven_ArtDeco_Knight1_creation_params = {
	SkeletonName = Ven_ArtDeco_Knight1
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	animeventtablename = z_artdeco_animevents
	zones = [
		global
	]
}
obj_Ven_ArtDeco_Knight2_creation_params = {
	SkeletonName = Ven_ArtDeco_Knight2
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	animeventtablename = z_artdeco_animevents
	zones = [
		global
	]
}
obj_Ven_ArtDeco_Dragon_creation_params = {
	SkeletonName = Ven_ArtDeco_Dragon
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	animeventtablename = z_artdeco_animevents
	zones = [
		global
	]
}
obj_Ven_Prison_Gas_creation_params = {
	SkeletonName = Ven_Prison_Gas
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	animeventtablename = z_prison_animevents
	zones = [
		global
	]
}
obj_dancer_creation_params = {
	SkeletonName = GH3_Ped_Dancer
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	zones = [
		global
	]
}
obj_caged_creation_params = {
	SkeletonName = GH3_Ped_Dancer
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	zones = [
		global
	]
}
obj_devilgirl_creation_params = {
	SkeletonName = GH3_Ped_DevilGirl
	tree = $GameObj_RagdollAnimTree
	ragdollname = Ragdoll_DevilGirl
	accessory_bones = $DevilGirl_accessory_bones
	ragdollcollisiongroup = $RagdollCollisionGroups_DevilGirl
	initialize_empty = FALSE
	disable_collision_callbacks
	AnimTargets = [
		Body
		bodytimer
	]
	zones = [
		global
	]
}
obj_puppet_creation_params = {
	SkeletonName = GH3_Guitarist_Satan
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	zones = [
		global
	]
}
obj_Ven_Hell_Hammer_creation_params = {
	SkeletonName = Ven_Hell_Hammer
	tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		bodytimer
	]
	animeventtablename = Z_Hell_Animevents
	zones = [
		global
	]
}
