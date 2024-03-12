NX_SignInComplete = 0
NX_SignedIn = 0

script StartNetworkPlatform 
	if IsPS3
		printf \{"--- StartNetworkPlatform ---"}
		if NOT CheckForSignin
			DisplayNetplatformWarning
			begin
			if (1 = $NX_SignInComplete)
				printf \{"--- Sign in is complete ---"}
				break
			endif
			wait \{1 frame}
			repeat
			if (1 = $NX_SignedIn)
				change \{NX_SignInComplete = 0}
				change \{NX_SignedIn = 0}
				printf \{"We are signed in"}
				return \{TRUE}
			else
				change \{NX_SignInComplete = 0}
				change \{NX_SignedIn = 0}
				printf \{"We are not signed in"}
				return \{FALSE}
			endif
		endif
	endif
endscript

script networkplatformcomplete 
	printf \{"NetworkPlatformComplete"}
	change \{NX_SignInComplete = 1}
	if GotParam \{signedin}
		change \{NX_SignedIn = 1}
	endif
endscript
