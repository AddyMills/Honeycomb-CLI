string_ps2_BLAH = "BLAH"
string_ps2_WARNING = "WARNING"
string_ps2_CAUTION = "CAUTION"
string_ps2_CHECKING = "CHECKING..."
string_ps2_MEMORY_CARD_ERROR = "MEMORY CARD ERROR"
string_ps2_RETRY = "RETRY"
string_ps2_CONTINUE_WITHOUT_SAVING = "CONTINUE WITHOUT SAVING"
string_ps2_SAVE_NOT_FOUND = "SAVE NOT FOUND"
string_ps2_YES = "YES"
string_ps2_NO = "NO"
string_ps2_OK = "OK"
string_ps2_CANCEL = "CANCEL"
string_ps2_LOADING = "LOADING..."
string_ps2_LOAD_SUCCESSFUL = "LOAD SUCCESSFUL"
string_ps2_FORMATTING = "FORMATTING..."
string_ps2_FORMAT_SUCCESSFUL = "FORMAT SUCCESSFUL"
string_ps2_OVERWRITING = "OVERWRITING..."
string_ps2_OVERWRITE_SUCCESSFUL = "OVERWRITE SUCCESSFUL"
string_ps2_SAVING = "SAVING..."
string_ps2_SAVE_SUCCESSFUL = "SAVE SUCCESSFUL"
string_ps2_IN_THE_EVENT_OF_ROCK = "IN THE EVENT OF ROCK"
string_ps2_USING_THE_GUITAR_CONTROLLER = "USING THE GUITAR CONTROLLER"
string_ps2_PLUG_IN = "PLUG IN"
string_ps2_STRAP_ON = "STRAP ON"
string_ps2_BANG = "BANG"
string_ps2_HEAD = "HEAD"
string_ps2_START = "START"
string_ps2_BUTTON = "Button"
string_ps2_BACK = "BACK"
string_ps2_RED_BUTTON = "Red Button"
string_ps2_CONTINUE = "CONTINUE"
string_ps2_GREEN_BUTTON = "Green Button"
string_ps2_UP_DOWN = "UP/DOWN"
string_ps2_STRUM_BAR = "Strum Bar"
string_ps2_STAR_POWER = "STAR POWER"
string_ps2_TILT = "Tilt"
string_ps2_AS_MADE_FAMOUS_BY = "as made famous by"
string_ps2_LARGE_GEMS = "large gems"
string_ps2_STEREO = "STEREO"
string_ps2_MONO = "MONO"

script get_string_ps2 \{message = unknown}
	localized_string = ""
	switch <message>
		case loading
		if IsPAL
			localized_string = "Loading data. Do not remove the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		else
			localized_string = "Loading data. Do not remove the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		endif
		case saving
		if IsPAL
			localized_string = "Saving data. Do not remove the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		else
			localized_string = "Saving data. Do not remove the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		endif
		case autosaving
		if IsPAL
			localized_string = "Autosaving data. Do not remove the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		else
			localized_string = "Autosaving data. Do not remove the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		endif
		case overwriting
		if IsPAL
			localized_string = "Overwriting data. Do not remove the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		else
			localized_string = "Overwriting data. Do not remove the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		endif
		case formatting
		if IsPAL
			localized_string = "Formatting\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. Do not remove\\nMemory Card (8MB) (for PlayStation®2),\\ncontroller, or reset/switch off the console."
		else
			localized_string = "Formatting\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. Do not remove\\nmemory card (8MB)(for PlayStation®2),\\ncontroller, or reset/switch off the console."
		endif
		case load_successful
		localized_string = "Load Successful."
		case format_successful
		localized_string = "Format Successful."
		case save_successful
		localized_string = "Save Successful."
		case overwrite_successful
		localized_string = "Overwrite Successful."
		case boot_autosave_warning
		if IsPAL
			localized_string = "Guitar Hero III uses an autosave feature.\\nThe insertion or removal of a\\nMemory Card (8MB) (for PlayStation®2)\\nbeyond this point may cause data\\nto be overwritten."
		else
			localized_string = "Guitar Hero III uses an autosave feature.\\nThe insertion or removal of a\\nmemory card (8MB)(for PlayStation®2)\\nbeyond this point may cause data\\nto be overwritten."
		endif
		case check_memcard
		if IsPAL
			localized_string = "Checking Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. Do not remove\\nMemory Card (8MB) (for PlayStation®2) ,\\ncontroller, or reset/switch off the console."
		else
			localized_string = "Checking memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. Do not remove\\nmemory card (8MB)(for PlayStation®2) ,\\ncontroller, or reset/switch off the console."
		endif
		case no_memcard_boot
		if IsPAL
			localized_string = "No Memory Card (8MB) (for PlayStation®2)\\ninserted in MEMORY CARD slot 1. Guitar Hero III\\nuses an Autosave feature. Insertion of a\\nMemory Card (8MB) (for PlayStation®2) beyond\\nthis point may cause data to be overwritten.\\nInsert a Memory Card (8MB) (for PlayStation®2)\\nwith at least 325 KB of free space\\nto save game data."
		else
			localized_string = "No memory card (8MB)(for PlayStation®2)\\ninserted in MEMORY CARD slot 1. Guitar Hero III\\nuses an Autosave feature. Insertion of a\\nmemory card (8MB)(for PlayStation®2) beyond\\nthis point may cause data to be overwritten.\\nInsert a memory card (8MB)(for PlayStation®2)\\nwith at least 325 KB of free space\\nto save game data."
		endif
		case no_memcard_save_boot
		if IsPAL
			localized_string = "No Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1."
		else
			localized_string = "No memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1."
		endif
		case no_save_boot
		if IsPAL
			localized_string = "No Guitar Hero III save data present on\\nMemory Card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1. Guitar Hero III uses an\\nAutosave feature. 325 KB of space is required\\nto save game data. Do you want to create a save\\nfile now?"
		else
			localized_string = "No Guitar Hero III save data present on\\nmemory card (8MB)(for PlayStation®2) in\\nMEMORY CARD slot 1. Guitar Hero III uses an\\nAutosave feature. 325 KB of space is required\\nto save game data. Do you want to create a save\\nfile now?"
		endif
		case no_save_ingame
		if IsPAL
			localized_string = "No Guitar Hero III save data present on\\nMemory Card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1."
		else
			localized_string = "No Guitar Hero III save data present on\\nmemory card (8MB)(for PlayStation®2) in\\nMEMORY CARD slot 1."
		endif
		case save_failed
		if IsPAL
			localized_string = "Save failed!\\nCheck Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		else
			localized_string = "Save failed!\\nCheck memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		endif
		case overwrite_failed
		if IsPAL
			localized_string = "Overwrite failed!\\nCheck Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		else
			localized_string = "Overwrite failed!\\nCheck memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		endif
		case attempt_format
		if IsPAL
			localized_string = "Memory Card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1 is unformatted. Format\\nMemory Card (8MB) (for PlayStation®2)?"
		else
			localized_string = "memory card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1 is unformatted. Format\\nmemory card (8MB)(for PlayStation®2)?"
		endif
		case confirm_format
		if IsPAL
			localized_string = "Are you sure you wish to format\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1?"
		else
			localized_string = "Are you sure you wish to format\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1?"
		endif
		case already_formatted
		if IsPAL
			localized_string = "The Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 has already been\\nformatted! Please reinsert unformatted\\nMemory Card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1 and select retry."
		else
			localized_string = "The memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 has already been\\nformatted! Please reinsert unformatted\\nmemory card (8MB)(for PlayStation®2) in\\nMEMORY CARD slot 1 and select retry."
		endif
		case format_failed
		if IsPAL
			localized_string = "Format failed! Please check\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 and try again."
		else
			localized_string = "Format failed! Please check\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 and try again."
		endif
		case format_cancelled
		localized_string = "Format cancelled. Continue without saving?"
		case no_memcard_ingame
		if IsPAL
			localized_string = "No Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1."
		else
			localized_string = "No memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1."
		endif
		case load_failed
		if IsPAL
			localized_string = "Load failed!\\nCheck Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		else
			localized_string = "Load failed!\\nCheck memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		endif
		case overwrite_warning_boot
		if IsPAL
			localized_string = "Guitar Hero III uses an Autosave feature.\\nInsertion of a\\nMemory Card (8MB) (for PlayStation®2)\\nbeyond this point may cause data\\nto be overwritten. Continue without saving?"
		else
			localized_string = "Guitar Hero III uses an Autosave feature.\\nInsertion of a\\nmemory card (8MB)(for PlayStation®2)\\nbeyond this point may cause data\\nto be overwritten. Continue without saving?"
		endif
		case disable_autosave
		localized_string = "Autosave has been disabled.\\nAutosave can be re-enabled in the options menu."
		case overwrite_warning_ingame
		if IsPAL
			localized_string = "WARNING: Saving will overwrite any existing\\nGuitar Hero III data on the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1.\\nAre you sure you want to save?"
		else
			localized_string = "WARNING: Saving will overwrite any existing\\nGuitar Hero III data on the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1.\\nAre you sure you want to save?"
		endif
		case lose_progress_ingame
		if IsPAL
			localized_string = "WARNING: If you load data from a\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, you will lose your\\ncurrent game progress. Continue with load?"
		else
			localized_string = "WARNING: If you load data from a\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, you will lose your\\ncurrent game progress. Continue with load?"
		endif
		case insufficient_space_boot
		if IsPAL
			localized_string = "Insufficient free space on\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. Insert a\\nMemory Card (8MB) (for PlayStation®2)\\nwith at least 325 KB of free space, or create some\\nspace using the console's internal browser."
		else
			localized_string = "Insufficient free space on\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. Insert a\\nmemory card (8MB)(for PlayStation®2)\\nwith at least 325 KB of free space, or create some\\nspace using the console's internal browser."
		endif
		case insufficient_space_ingame
		if IsPAL
			localized_string = "Insufficient free space on\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. Guitar Hero III requires\\n325 KB of free space to save data."
		else
			localized_string = "Insufficient free space on\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. Guitar Hero III requires\\n325 KB of free space to save data."
		endif
		case corrupt_boot
		if IsPAL
			localized_string = "Corrupt data detected on\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. 325 KB of free\\nspace is required to save game data. Replace\\nthe corrupt file and create a new save file?"
		else
			localized_string = "Corrupt data detected on\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. 325 KB of free\\nspace is required to save game data. Replace\\nthe corrupt file and create a new save file?"
		endif
		case confirm_overwrite_boot
		localized_string = "Are you sure you wish to\\noverwrite the save file?"
		case new_memcard_ingame
		if IsPAL
			localized_string = "Data has changed! Do you wish to save to the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1?"
		else
			localized_string = "Data has changed! Do you wish to save to the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1?"
		endif
		case warning_480p
		localized_string = "Progressive Mode may not work on all televisions.\\nIf it doesn't work on yours, please wait 15 seconds\\nand we'll automatically switch back."
		case now_in_480p
		localized_string = "You are now in Progressive Mode.\\nDo you want to keep this display mode?"
		case widescreen_string
		localized_string = "Widescreen"
		case progressivescan_string
		localized_string = "Progressive Scan"
		default
		printf "No match, string %d not localized" d = <message>
		localized_string = "???"
	endswitch
	return localized_string = <localized_string>
endscript
string_ps2_fowlvis_blurb = "'Lil Elroy started banging on the ivories when he was 6. The neighborhood kids weren't too nice about his love for the keys telling him ''Sissy-boys play the piano!'' - it didn't take long for him to pick up the guitar after that. In a band since he was 12 - his love of the steel strings has never faltered.\\n\\nThen a producer gave him a steady studio job - until the day he met a legend in the flesh - he learned the chops from this idol of a by-gone era and soon he was handed his trademark massive golden belt-buckle. From that day on his motto has been:\\n\\n''Heavy Metal, Punk, Polka? It's all rock 'n' roll to Elroy baby.''"
string_ps2_fowlvis_outfit_style_1 = "Vegas"
string_ps2_fowlvis_outfit_style_2 = "Nashville"
string_ps2_fowlvis_outfit_style_3 = "Hawaii"
string_ps2_fowlvis_outfit_style_4 = "Tijuana"
string_ps2_robot_blurb = "Metalhead's lifecycle began as a self-guided Russian warhead. After the Cold War he was disarmed and hocked for spare parts. A few toasters, some vacuum tubes, a '57 roadster, and a cheese greater later, and Metalhead was the first fully autonomous robot. Thus began Metalhead's full-on assault against all things slow and lame. Far from his humble Soviet silo beginnings, Metalhead is ready to get on stage and drop the bomb!"
string_ps2_robot_outfit_style_1 = "Pure Metal"
string_ps2_robot_outfit_style_2 = "Marx"
string_ps2_robot_outfit_style_3 = "Super-Atomic"
string_ps2_robot_outfit_style_4 = "TV Head"
string_ps2_instrument_budcat_blurb = "This is the exact same guitar used by Bud in the intro - honestly, that's the only time it's ever been played. So, buyer beware..."
string_ps2_instrument_felvis_blurb = "Crafted from a 200 year old hunk of ash from the swamps of Mississippi and pressed with Elroy's first solid gold album this ''Gee-Tar'' as Elroy likes to refer to it as has pickups that are hand-wound to his elite specifications. The stop-bar and tail-piece is rumored to be crafted from ancient Spanish Doubloons - curse included.\\n\\nThe steel used for the frets were from the crankshaft of Elroy's old '55 land-barge. He always said - ''I loved that beast, just always wanted to take it with me.'' \\n\\nThe guitar has had so many attempts at its theft that Elroy employs a 24-hour security team to keep an eye on it."
string_ps2_instrument_controller_01_blurb = "Play the game about playing the game.  Just don't make their guitarist play with this instrument too, because then you would be playing the game about playing the game about playing the game."
string_ps2_instrument_controller_02_blurb = "Play the game about playing the game.  Just don't make their guitarist play with this instrument too, because then you would be playing the game about playing the game about playing the game."
string_ps2_instrument_rifle_blurb = "This guitar was a failed experimental laser cannon from Russia, with love.  When Metalhead saw it, he had to have it in his war against lameness.  The laser component had to be removed after a nasty lawsuit involving a cheap roadside motel, a weather balloon, and an ice-cream truck.  Metalhead voluntarily erased the specifics of the incident from his memory banks."
string_ps2_instrument_raygun_blurb = "This weapon was stolen from the Martian menace and used to bring down the flying saucers.  After that it had a brief stint in an off-Broadway play about the whole thing.  Now it sits in Metalhead's private collection."
string_ps2_loading_screen_tip_01 = "Having trouble?  Check out the tutorials in the training menu."
string_ps2_loading_screen_tip_02 = "Check out the store for new songs and cool outfits and styles."
string_ps2_loading_screen_tip_03 = "Wanna rock with a friend?  Start a new band in Co-op career."
string_ps2_loading_screen_tip_04 = "Going into practice can help you nail those tricky solos."
string_ps2_loading_screen_tip_05 = "If you haven't recorded on a 4-track, you aren't a real band."
string_ps2_loading_screen_tip_06 = "Make sure the crowd is willing to catch you before you stage dive."
string_ps2_loading_screen_tip_07 = "Do NOT use homemade pyrotechnics."
string_ps2_loading_screen_tip_08 = "Showing up 30 minutes late to practice is just tradition."
string_ps2_loading_screen_tip_09 = "Can I get a little less suck out of the monitors?"
string_ps2_loading_screen_tip_10 = "Never think you were the first band to wear all black on stage."
string_ps2_loading_screen_tip_11 = "Yes, the stage monitors are in fact, diving boards."
string_ps2_loading_screen_tip_12 = "Never ever leave the singer in charge of the mix."
string_ps2_loading_screen_tip_13 = "It can always be much louder."
string_ps2_loading_screen_tip_14 = "We're a real angry band, but that doesn't mean we don't believe in peace."
string_ps2_loading_screen_tip_15 = "20 minute free-form jazz odysseys are not O.K."
string_ps2_loading_screen_tip_16 = "People don't want to pay money to hear you jam."
string_ps2_loading_screen_tip_17 = "It takes a long time to look like you just woke up."
string_ps2_loading_screen_tip_18 = "Make sure someone in the band knows how to change a flat tire."
string_ps2_loading_screen_tip_19 = "Turn that amp up.  My ears are barely even bleeding."
string_ps2_loading_screen_tip_20 = "I used to freak out when my amp caught on fire.  Now I kinda dig the tone."
string_ps2_loading_screen_tip_21 = "Smashed guitars just seem to sound better than their unsmashed brethren."
string_ps2_loading_screen_tip_22 = "You're only as good as your last gig... which sucked."
string_ps2_loading_screen_tip_23 = "You played great.  I'm sure they were just booing your outfits."
string_ps2_loading_screen_tip_24 = "Maybe a drum machine would show up to practice on time."
string_ps2_loading_screen_tip_25 = "You seem to be having a problem with your bass amp.  I can hear it!"
string_ps2_loading_screen_tip_26 = "Go out there, rock hard and sell a bunch of t-shirts so we can eat."
string_ps2_loading_screen_tip_27 = "Let's open with our latest single.  That way we can get that piece of *&?#@! out of the way early!"
string_ps2_loading_screen_tip_28 = "I'm the drummer.  I don't get paid to understand any of this!"
string_ps2_loading_screen_tip_29 = "I swear officer, the dressing room TV just un-bolted itself from the wall and flew out the window!"
string_ps2_loading_screen_tip_30 = "Real guitarists don't sit on the couch while they play"
string_ps2_loading_screen_tip_31 = "If the police don't complain, you aren't playing loud enough"
string_ps2_loading_screen_tip_32 = "If you can hear the police complaining, you aren't playing loud enough"
string_ps2_loading_screen_tip_33 = "Don't assume the drinks are on the house"
string_ps2_loading_screen_tip_35 = "It's probably not a good idea to tackle your lead singer"
string_ps2_loading_screen_tip_36 = "Don't trash your instruments unless you can afford to replace them"
string_ps2_loading_screen_tip_37 = "All record companies are evil...except the one that offered you a contract"
string_ps2_loading_screen_tip_38 = "Whoever hits the button faster gets to play lead guitar"
string_ps2_loading_screen_tip_39 = "Good Luck"
