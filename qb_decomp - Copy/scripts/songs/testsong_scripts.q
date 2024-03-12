
script testsongmode_startup 
	begin
	WaitForEvent \{Type = hit_notes}
	if ControllerMake \{L2}
		if controllerpressed \{L1}
			Soundevent \{Event = Improv_Pentatonic_Chord_D5_G5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_G7}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
		else
			Soundevent \{Event = Improv_Pentatonic_Single_Note_G7}
		endif
		Printf \{'L2'}
	endif
	if ControllerMake \{L1}
		if controllerpressed \{L2}
			Soundevent \{Event = Improv_Pentatonic_Chord_D5_G5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_G7}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
		else
			if controllerpressed \{R1}
				Soundevent \{Event = Improv_Pentatonic_Chord_D7_G7}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
			else
				Soundevent \{Event = Improv_Pentatonic_Single_Note_B5}
			endif
		endif
		Printf \{'L1'}
	endif
	if ControllerMake \{R1}
		if controllerpressed \{L1}
			Soundevent \{Event = Improv_Pentatonic_Chord_D7_G7}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
		else
			if controllerpressed \{R2}
				Soundevent \{Event = Improv_Pentatonic_Chord_B5_EE5}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
			else
				Soundevent \{Event = Improv_Pentatonic_Single_Note_B8}
			endif
		endif
		Printf \{'R1'}
	endif
	if ControllerMake \{R2}
		if controllerpressed \{R1}
			Soundevent \{Event = Improv_Pentatonic_Chord_B5_EE5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
		else
			if controllerpressed \{X}
				Soundevent \{Event = Improv_Pentatonic_Chord_B8_EE8}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_EE8}
			else
				Soundevent \{Event = Improv_Pentatonic_Single_Note_EE5}
			endif
		endif
		Printf \{'R2'}
	endif
	if ControllerMake \{X}
		if controllerpressed \{R2}
			Soundevent \{Event = Improv_Pentatonic_Chord_B8_EE8}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_EE8}
		else
			Soundevent \{Event = Improv_Pentatonic_Single_Note_EE8}
			if ($current_song = testsong)
				Printf \{'%a' A = current_song}
			endif
		endif
		Printf \{'X'}
	endif
	Wait \{1 Frame}
	if NOT controllerpressed \{L2}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_G7}
	endif
	if NOT controllerpressed \{L1}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
	endif
	if NOT controllerpressed \{R1}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
	endif
	if NOT controllerpressed \{R2}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
	endif
	if NOT controllerpressed \{X}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_EE8}
	endif
	repeat
endscript
