cash_deduction_types = [
	{
		desc = "CARS, SET FIRE TO"
		val = 2500
	}
	{
		desc = "WALL ART, STOLEN"
		val = 80
	}
	{
		desc = "GREEN ROOM, TRASHED"
		val = 210
	}
	{
		desc = "NOISE VIOLATIONS, PAID"
		val = 550
	}
	{
		desc = "HOTEL ROOM, TRASHED"
		val = 330
	}
	{
		desc = "DRINKS, CONSUMED"
		val = 300
	}
]
review_string_3star = "Mediocre 3-star review. Here's your cut."
review_string_4star = "Good 4-star review. Here's your cut."
review_string_5star = "Killer 5-star review. Here's your cut."
base_deduction_index_array = [
	0
	1
	2
	3
	4
	5
]

script create_cash_reward_menu 
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle)
			exclusive_mp_controllers = [0 , 0]
			setarrayelement Arrayname = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
			setarrayelement Arrayname = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	createScreenElement {
		Type = containerElement
		PARENT = root_window
		Id = cash_reward_container
		pos = (-90.0, 0.0)
		Rot_Angle = 6
		exclusive_device = <exclusive_device>
	}
	STARS = ($player1_status.STARS)
	song_cash = ($player1_status.new_cash)
	Change \{StructureName = player1_status new_cash = 0}
	Venue_Name = (($levelzones.($current_level)).title)
	GetUppercaseString <Venue_Name>
	createScreenElement \{Type = spriteElement PARENT = cash_reward_container texture = Newspaper_BG_2P pos = (640.0, 360.0) just = [Center Center] Dims = (1280.0, 720.0) z_priority = -100}
	create_menu_backdrop \{texture = Cash_reward_bg}
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		scale = (1.1, 0.9)
		pos = (660.0, 0.0)
		Text = <UppercaseString>
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Center top]
		z_priority = 3
	}
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		scale = (1.8, 1.3)
		pos = (660.0, 40.0)
		Text = "GIG MONEY"
		font = ($cash_reward_font)
		rgba = [150 60 35 255]
		just = [Center top]
		z_priority = 3
	}
	getScreenElementDims Id = <Id>
	if (<width> > 600)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((600.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	formatText Checksumname = review_text 'review_string_%vstar' v = <STARS>
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		scale = 0.7
		pos = (355.0, 110.0)
		Text = (<review_text>)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Left top]
		z_priority = 3
	}
	getScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((530.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = 0.7 start_y_scale = 0.7
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		scale = 0.7
		pos = (355.0, 140.0)
		Text = "Go buy yourself somethin' pretty."
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Left top]
		z_priority = 3
	}
	getScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((530.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = 0.7 start_y_scale = 0.7
	create_deductions_list pos = (340.0, 195.0) Dims = (550.0, 500.0) scale = (0.9, 0.7) received = <song_cash>
	create_you_get_text pos = (890.0, 400.0) scale = (2.0, 1.5) Value = <song_cash>
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		scale = 0.8
		pos = (880.0, 460.0)
		Text = "Spend your hard-earned"
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Right top]
		z_priority = 3
	}
	getScreenElementDims Id = <Id>
	if (<width> > 510)
		fit_text_in_rectangle Id = <Id> Dims = ((510.0, 0.0) + ((0.0, 1.0) * <Height>)) start_x_scale = 0.8 start_y_scale = 0.8
	endif
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		scale = 0.8
		pos = (880.0, 495.0)
		Text = "cash at the store."
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Right top]
		z_priority = 3
	}
	button_font = buttonsxenon
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		scale = 0.6
		pos = (410.0, 560.0)
		Text = "\\m0"
		font = <button_font>
		rgba = [255 255 255 255]
		just = [Left top]
		z_priority = 3
	}
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		Id = continue_button
		scale = 0.7
		pos = (435.0, 572.0)
		Text = "CONTINUE"
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		z_priority = 3
		just = [Left Center]
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {action = Continue}}
		]
	}
	displaySprite \{PARENT = cash_reward_container tex = Sponsored_Pill pos = (390.0, 580.0) rgba = [0 0 0 255] just = [Left Center]}
	getScreenElementDims \{Id = continue_button}
	setScreenElementProps Id = <Id> Dims = (<width> * (1.0, 0.0) + (64.0, 96.0))
	launchevent \{Type = focus Target = continue_button}
endscript

script destroy_cash_reward_menu 
	destroy_menu \{menu_id = cash_reward_container}
	destroy_menu_backdrop
endscript
cash_reward_font = text_a4

script create_deductions_list \{pos = (200.0, 200.0) scale = 1 Dims = (400.0, 400.0) received = 1200}
	dl_width = ((1.0, 0.0).<Dims>)
	dl_height = ((0.0, 1.0).<Dims>)
	createScreenElement {
		Type = containerElement
		PARENT = cash_reward_container
		Id = deductions_container
		pos = <pos>
	}
	pay = <received>
	deduction_count = 4
	PermuteArray Array = ($base_deduction_index_array) NewArrayName = perm_deduction_array
	Index = 0
	begin
	perm_index = (<perm_deduction_array> [<Index>])
	<pay> = (<pay> + $cash_deduction_types [<perm_index>].val)
	<Index> = (<Index> + 1)
	repeat <deduction_count>
	formatText Textname = gross_pay_text "$%d" D = <pay>
	createScreenElement {
		Type = textElement
		PARENT = deductions_container
		pos = ((1.0, 0.0) * <dl_width>)
		scale = <scale>
		Text = <gross_pay_text>
		font = ($cash_reward_font)
		rgba = [15 70 0 255]
		just = [Right top]
		z_priority = 3
	}
	createScreenElement {
		Type = textElement
		PARENT = deductions_container
		Id = cd_pay_text
		pos = (15.0, 0.0)
		scale = <scale>
		Text = "PAY"
		font = ($cash_reward_font)
		rgba = [15 70 0 255]
		just = [Left top]
		z_priority = 3
	}
	getScreenElementDims \{Id = cd_pay_text}
	separation_height = (<Height> * 0.9)
	createScreenElement {
		Type = textElement
		PARENT = deductions_container
		pos = (((0.0, 1.0) * <separation_height>) + (15.0, 0.0))
		scale = (<scale> * 0.95)
		Text = "MINUS DEDUCTIONS"
		font_spacing = 4
		font = ($cash_reward_font)
		rgba = [150 60 35 255]
		just = [Left top]
		z_priority = 3
	}
	Index = 0
	begin
	perm_index = (<perm_deduction_array> [<Index>])
	deduction_string = ($cash_deduction_types [<perm_index>].desc)
	formatText Textname = deduction_value "-$%v" v = ($cash_deduction_types [<perm_index>].val)
	createScreenElement {
		Type = textElement
		PARENT = deductions_container
		pos = (((0.0, 1.0) * (<separation_height> * (<Index> + 2))) + (15.0, 0.0))
		scale = (<scale> * 0.95)
		Text = <deduction_string>
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Left top]
		z_priority = 3
	}
	getScreenElementDims Id = <Id>
	if (<width> > 400)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((400.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		PARENT = deductions_container
		pos = ((1.0, 0.0) * <dl_width> + (0.0, 1.0) * (<separation_height> * (<Index> + 2)))
		scale = (<scale> * 0.95)
		Text = <deduction_value>
		font = ($cash_reward_font)
		rgba = [150 60 35 255]
		just = [Right top]
		z_priority = 3
	}
	<Index> = (<Index> + 1)
	repeat <deduction_count>
endscript

script create_you_get_text \{Value = 1200 scale = 1 pos = (630.0, 320.0)}
	formatText Textname = payment_text "$%v" v = <Value>
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		Id = payment_text_id
		scale = <scale>
		Text = <payment_text>
		font = ($cash_reward_font)
		pos = (<pos> - (0.0, 15.0))
		rgba = [15 70 0 255]
		just = [Right top]
		z_priority = 3
	}
	createScreenElement {
		Type = textElement
		PARENT = cash_reward_container
		Id = you_get_id
		scale = (<scale> * 0.65000004)
		Text = "You Get:"
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Right top]
		z_priority = 3
	}
	Soundevent \{Event = Cash_Sound}
	getScreenElementDims \{Id = payment_text_id}
	you_get_pos = (<pos> - (1.0, 0.0) * (<width> * 1.1))
	setScreenElementProps Id = you_get_id pos = <you_get_pos>
endscript
