
script ReloadAnimation 
	AllowAssetLoading \{on}
	UpdateAnimCache \{Clear}
	PushAssetContext
	ReloadAnim filename = <filename> anim = <AnimName>
	PopAssetContext
	AllowAssetLoading \{Off}
endscript
