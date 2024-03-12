
script StartFSMExample 
	RegisterMyTestStates
	SetupMyStateMachine
endscript

script RegisterMyTestStates 
	printf \{"//\\\\//\\\\ registering state structure"}
	RegisterState \{name = Bv_MyTestState transitions = [{events = [Enter_State MyChildScriptTrigger] responses = [{replacement = child state = Bv_MyScriptChild params = [{name = param1 ref = input_param}{name = param2 val = my_param_2}{name = param3 val = my_param_3}]}]}{events = [ChildTrigger] responses = [{replacement = child state = Bv_Message params = [{name = message val = "ChildTrigger fired!"}]}]}{events = [RecurTrigger] recur = TRUE responses = [{replacement = child2 state = Bv_Message params = [{name = message val = "RecurTrigger fired!"}]}]}]}
endscript

script SetupMyStateMachine 
	printf \{"//\\\\//\\\\ setup state machine"}
	CreateCompositeObject \{params = {name = MyStateMachine permanent} Components = [{Component = eventcache}{Component = statemachinemanager}] heap = frontend}
	MyStateMachine :fsm_set \{state = Bv_MyTestState params = {input_param = my_input_param}}
endscript

script Bv_MyTestStateInScript 
	printf \{"//\\\\//\\\\ Bv_MyTestStateInScript"}
	fsm_set state = Bv_MyScriptChild params = {param1 = <input_param> param2 = my_param_2 param3 = <input_param>}
	begin
	blockuntilevent \{anytypes = [MyChildScriptTrigger ChildTrigger RecurTrigger]}
	switch <type>
		case MyChildScriptTrigger
		fsm_set state = Bv_MyScriptChild replacement = child params = {param1 = <input_param> param2 = my_param_2 param3 = my_param_3}
		case ChildTrigger
		fsm_set \{state = Bv_Message replacement = child params = {message = "ChildTrigger fired!"}}
		case RecurTrigger
		fsm_set \{state = Bv_Message replacement = child2 params = {message = "RecurTrigger fired!"}}
	endswitch
	repeat
endscript

script Bv_MyScriptChild 
	printf \{"//\\\\//\\\\ MyScriptChild Fired"}
	printstruct <...>
	begin
	blockuntilevent \{anytypes = [ScriptChildEvent1 ScriptChildEvent2]}
	switch <type>
		case ScriptChildEvent1
		printf \{"//\\\\//\\\\ MyScriptChildLoop1"}
		fsm_set state = Bv_MessageLoop replacement = mess1 params = {message = "MyScriptChildLoop1" event = <type>}
		case ScriptChildEvent2
		printf \{"//\\\\//\\\\ MyScriptChildLoop2"}
		fsm_set state = Bv_MessageLoop replacement = mess2 params = {message = "MyScriptChildLoop2" event = <type>}
	endswitch
	wait \{1 frame}
	repeat
endscript

script Bv_MessageLoop 
	begin
	printf <message>
	wait \{10 frames}
	repeat
endscript
