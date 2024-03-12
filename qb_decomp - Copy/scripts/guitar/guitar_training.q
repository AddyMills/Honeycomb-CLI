fake_training_script = [
	{
		call = print_random_carp
	}
	{
		Time = 5000
		call = print_random_carp
	}
	{
		rel_time = 2000
		call = training_waste_time_test
	}
	{
		call = print_random_carp
	}
	{
		rel_time = 2000
		call = print_random_carp
	}
]

script training_waste_time_test 
	Printf \{"From waste time test"}
	print_random_carp
	Wait \{10 Seconds}
endscript

script print_random_carp 
	Printf "I'm a random carp and the training system time is %t ms" T = ($current_training_time)
endscript
current_training_script = fake_training_script
current_training_step = 0
current_training_time = 0
last_training_call_time = 0

script set_training_script 
	Change current_training_script = <Name>
endscript

script run_training_script 
	if NOT gotParam \{Name}
		Name = ($current_training_script)
	endif
	Change current_training_script = <Name>
	Change \{current_training_time = 0}
	Change \{last_training_call_time = 0}
	training_script = ($current_training_script)
	call_script = ((<training_script> [0]).call)
	<call_script>
	Change \{current_training_step = 1}
	if gotParam \{Restart_Lesson}
		create_training_pause_handler
		search_step = 1
		begin
		getArraySize (<training_script>)
		if (<search_step> = <array_Size>)
			Change \{training_last_lesson = 1}
			break
		endif
		training_struct = (<training_script> [<search_step>])
		if structureContains Structure = (<training_struct>) lesson
			if ((<training_struct>.lesson) = $training_last_lesson)
				Change current_training_step = <search_step>
				break
			endif
		endif
		search_step = (<search_step> + 1)
		repeat
	else
		Change \{training_last_lesson = 1}
	endif
	Spawnscriptlater \{training_script_update}
endscript

script training_script_update 
	begin
	training_script = ($current_training_script)
	getArraySize (<training_script>)
	if (($current_training_step) = <array_Size>)
		SpawnScriptNOw \{kill_training_script_system}
	endif
	GetDeltaTime
	ms_elapsed = (<delta_time> * 1000)
	Change current_training_time = (($current_training_time) + <ms_elapsed>)
	training_struct = (<training_script> [($current_training_step)])
	if structureContains Structure = (<training_struct>) Time
		time_to_fire = (<training_struct>.Time)
		if (($current_training_time) > <time_to_fire>)
			call_script = (<training_struct>.call)
			SpawnScriptNOw <call_script> Id = training_spawned_script
			Change current_training_step = (($current_training_step) + 1)
			Change last_training_call_time = ($current_training_time)
		endif
		elseif structureContains Structure = (<training_struct>) rel_time
		time_gap = ($current_training_time - $last_training_call_time)
		time_to_fire = (<training_struct>.rel_time)
		if (<time_gap> > <time_to_fire>)
			call_script = (<training_struct>.call)
			SpawnScriptNOw <call_script> Id = training_spawned_script
			Change current_training_step = (($current_training_step) + 1)
			Change last_training_call_time = ($current_training_time)
		endif
	else
		old_training_struct = (<training_script> [($current_training_step - 1)])
		old_script = (<old_training_struct>.call)
		if NOT Scriptisrunning <old_script>
			if structureContains Structure = (<training_struct>) lesson
				Change training_last_lesson = (<training_struct>.lesson)
			endif
			call_script = (<training_struct>.call)
			SpawnScriptNOw <call_script> Id = training_spawned_script
			Change current_training_step = (($current_training_step) + 1)
			Change last_training_call_time = ($current_training_time)
		endif
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script kill_training_script_system 
	killspawnedScript \{Name = training_script_update}
	killspawnedScript \{Id = training_spawned_script}
endscript

script debugstruct 
	Printf "%d" D = <N>
	printStruct <...>
endscript
