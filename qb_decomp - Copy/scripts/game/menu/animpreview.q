
script ReloadAnimation 
	AllowAssetLoading \{On}
	UpdateAnimCache \{CLEAR}
	PushAssetContext
	ReloadAnim FileName = <FileName> Anim = <animName>
	PopAssetContext
	AllowAssetLoading \{OFF}
endscript
