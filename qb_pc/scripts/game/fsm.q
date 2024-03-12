
script fsm_set \{replacement = child}
	fsm_replace {
		hierarchy = current
		replacement = <replacement>
		state = <state>
		params = <params>
	}
endscript

script Register_Fsm_States 
	RegisterState \{name = State_TestFsm Task = {name = Task_Debug params = {label = State_Message message = 'Fsm Test State'}} transitions = [{events = [enter_behavior] responses = [{replacement = this behavior = State_TestFsm2}]}]}
	RegisterState \{name = State_TestFsm2 Task = {name = Task_Debug params = {label = State_Message message = 'Fsm Test State 2'}}}
endscript
