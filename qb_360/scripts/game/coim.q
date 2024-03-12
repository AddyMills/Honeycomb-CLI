coim_priority_permanent = 0
coim_priority_permanentcleanup = 1
COIM_Priority_NonPermanent = 2
coim_priority_droppedweapons = 3
COIM_Priority_PedLife_Actor = 4
COIM_Priority_PedLife = 5
COIM_Priority_PedlifeDead = 10
coim_priority_effects = 20
Generic_COIM_Size = 524288
Career_PedLife_COIM_Size = 0
NonCareer_PedLife_COIM_Size = 0
Career_PedLife_XBOX_COIM_Size = 256819
NonCareer_PedLife_XBOX_COIM_Size = 856064
Generic_COIM_BlockAlign = 8192
Generic_XBox_COIM_BlockAlign = 4096
ClassicMode_ReservedCOIMBlocksForPermObjects = 250
coim_max_offscreen_seconds = 0.5
coim_perm_max_offscreen_seconds = 0.5
coim_min_offscreen_dist = 25.0
COIM_Vehicle_Min_Offscreen_Dist = 32.0
coim_min_scratch_blocks = 9
Generic_COIM_Params = {
	coim_max_peds_remove_atonce = 2
	coim_kill_relevance = 0.0
	coim_max_distance = 200.0
	coim_kill_priority = $COIM_Priority_NonPermanent
	coim_initial_num_perm_objects = 36
	coim_permanent_cleanup_relevance = 0.5
	coim_type_id = generic
}
Spawner_Cleanup_Relevance_Amount = 0.4
Spawner_Cleanup_Min_Count = 2

script COIM_PreAllocate 
	<blocks> = (<size> / $Generic_COIM_BlockAlign)
	if GameModeEquals \{is_classic}
		ReserveCOIMBlocksForPermObjects (<blocks> / 3)
	else
		ReserveCOIMBlocksForPermObjects \{$ClassicMode_ReservedCOIMBlocksForPermObjects}
	endif
endscript
