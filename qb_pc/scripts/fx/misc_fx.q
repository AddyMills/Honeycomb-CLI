jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	printf \{"*******************************************************************"}
	printf <...>
	printf \{"*******************************************************************"}
endscript

script SafeGetUniqueCompositeObjectID \{preferredid = safeFXID01}
	if NOT GotParam \{ObjID}
		GetUniqueCompositeObjectID preferredid = <preferredid>
		return uniqueid = <uniqueid>
	endif
	i = 0
	FormatText textname = index '%i' i = <i>
	extendcrc <preferredid> <index> out = preferredid
	begin
	MangleChecksums a = <preferredid> b = <ObjID>
	if NOT ObjectExists id = <mangled_id>
		return uniqueid = <preferredid>
	else
		i = (<i> + 1)
		FormatText textname = index '%i' i = <i>
		extendcrc <preferredid> <index> out = preferredid
	endif
	repeat
endscript
