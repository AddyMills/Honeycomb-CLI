
script timer_callback_script 
	if ($input_mode = play)
		playback_timer
	endif
endscript

script script_callback_script 
	script_callback_script_cfunc
endscript

script script_postcallback_script 
	UpdateGuitarFuncs
	if NOT GameIsPaused
		GetDeltaTime
		update2dparticlesystems delta_time = <delta_time>
		RunQueuedPulseEvents
		CheckBossCutoff
		if ($output_gpu_log = 1)
			if IsPS3
				GetProfileData \{cpu = 2 name = gpu}
			else
				GetProfileData \{cpu = 6 name = gpu}
			endif
			milliseconds = (<microseconds> / 1000.0)
			GetSongTime
			FormatText textname = text "GPU Time; %s; %m" s = <songtime> m = <milliseconds> DontAssertForChecksums
			TextOutput text = <text>
		endif
	endif
endscript

script screenelement_postcallback_script 
	update_highway_prepass
endscript
