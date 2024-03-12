
script testsongmode_startup 
	begin
	WaitForEvent \{type = hit_notes}
	if ControllerMake \{l2}
		if ControllerPressed \{l1}
			SoundEvent \{event = Improv_Pentatonic_Chord_D5_G5}
			stopsoundevent \{Improv_Pentatonic_Single_Note_G7}
			stopsoundevent \{Improv_Pentatonic_Single_Note_B5}
		else
			SoundEvent \{event = Improv_Pentatonic_Single_Note_G7}
		endif
		printf \{'L2'}
	endif
	if ControllerMake \{l1}
		if ControllerPressed \{l2}
			SoundEvent \{event = Improv_Pentatonic_Chord_D5_G5}
			stopsoundevent \{Improv_Pentatonic_Single_Note_G7}
			stopsoundevent \{Improv_Pentatonic_Single_Note_B5}
		else
			if ControllerPressed \{r1}
				SoundEvent \{event = Improv_Pentatonic_Chord_D7_G7}
				stopsoundevent \{Improv_Pentatonic_Single_Note_B5}
				stopsoundevent \{Improv_Pentatonic_Single_Note_B8}
			else
				SoundEvent \{event = Improv_Pentatonic_Single_Note_B5}
			endif
		endif
		printf \{'L1'}
	endif
	if ControllerMake \{r1}
		if ControllerPressed \{l1}
			SoundEvent \{event = Improv_Pentatonic_Chord_D7_G7}
			stopsoundevent \{Improv_Pentatonic_Single_Note_B5}
			stopsoundevent \{Improv_Pentatonic_Single_Note_B8}
		else
			if ControllerPressed \{r2}
				SoundEvent \{event = Improv_Pentatonic_Chord_B5_EE5}
				stopsoundevent \{Improv_Pentatonic_Single_Note_B8}
				stopsoundevent \{Improv_Pentatonic_Single_Note_EE5}
			else
				SoundEvent \{event = Improv_Pentatonic_Single_Note_B8}
			endif
		endif
		printf \{'R1'}
	endif
	if ControllerMake \{r2}
		if ControllerPressed \{r1}
			SoundEvent \{event = Improv_Pentatonic_Chord_B5_EE5}
			stopsoundevent \{Improv_Pentatonic_Single_Note_B8}
			stopsoundevent \{Improv_Pentatonic_Single_Note_EE5}
		else
			if ControllerPressed \{x}
				SoundEvent \{event = Improv_Pentatonic_Chord_B8_EE8}
				stopsoundevent \{Improv_Pentatonic_Single_Note_EE5}
				stopsoundevent \{Improv_Pentatonic_Single_Note_EE8}
			else
				SoundEvent \{event = Improv_Pentatonic_Single_Note_EE5}
			endif
		endif
		printf \{'R2'}
	endif
	if ControllerMake \{x}
		if ControllerPressed \{r2}
			SoundEvent \{event = Improv_Pentatonic_Chord_B8_EE8}
			stopsoundevent \{Improv_Pentatonic_Single_Note_EE5}
			stopsoundevent \{Improv_Pentatonic_Single_Note_EE8}
		else
			SoundEvent \{event = Improv_Pentatonic_Single_Note_EE8}
			if ($current_song = testsong)
				printf \{'%a' a = current_song}
			endif
		endif
		printf \{'X'}
	endif
	wait \{1 frame}
	if NOT ControllerPressed \{l2}
		stopsoundevent \{Improv_Pentatonic_Single_Note_G7}
	endif
	if NOT ControllerPressed \{l1}
		stopsoundevent \{Improv_Pentatonic_Single_Note_B5}
	endif
	if NOT ControllerPressed \{r1}
		stopsoundevent \{Improv_Pentatonic_Single_Note_B8}
	endif
	if NOT ControllerPressed \{r2}
		stopsoundevent \{Improv_Pentatonic_Single_Note_EE5}
	endif
	if NOT ControllerPressed \{x}
		stopsoundevent \{Improv_Pentatonic_Single_Note_EE8}
	endif
	repeat
endscript
