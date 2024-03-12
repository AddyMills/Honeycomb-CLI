splat_critical_remaining_polys_pcnt = 0.5
splat_alpha_degen_rate = 8

script PreAllocSplats 
	printf \{"Initializing SplatHeap"}
	PreAllocTextureSplat \{name = 'JOW_Grit01' material = sys_BloodSplat01_sys_BloodSplat01}
	PreAllocTextureSplat \{name = 'JOW_Puff01' material = sys_BloodSplat02_sys_BloodSplat02}
	PreAllocTextureSplat \{name = 'skidtrail' material = sys_skidmark_sys_skidmark}
endscript
