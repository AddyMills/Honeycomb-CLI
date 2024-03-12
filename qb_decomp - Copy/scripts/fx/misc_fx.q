jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	Printf \{"*******************************************************************"}
	Printf <...>
	Printf \{"*******************************************************************"}
endscript

script safeGetUniqueCompositeObjectID \{PreferredId = safeFXID01}
	if NOT gotParam \{objId}
		GetUniqueCompositeobjectID PreferredId = <PreferredId>
		return UniqueId = <UniqueId>
	endif
	I = 0
	formatText Textname = Index '%i' I = <I>
	ExtendCrc <PreferredId> <Index> out = PreferredId
	begin
	MangleChecksums A = <PreferredId> B = <objId>
	if NOT ObjectExists Id = <mangled_ID>
		return UniqueId = <PreferredId>
	else
		I = (<I> + 1)
		formatText Textname = Index '%i' I = <I>
		ExtendCrc <PreferredId> <Index> out = PreferredId
	endif
	repeat
endscript
