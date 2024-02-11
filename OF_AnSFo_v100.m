%% accounts for the boundary points using the forward and backward schemes
%% note that forward and backward first derivatives are different from just an extrapolation (like second derivatives)
%% v1.01:       bug fix:        backward differencing is now fixed.

function AnSFm = OF_AnSFo_v100( UVW , SFoperatorE,SFoperatorW )

%% SS: signed square root, it is just the velocity difference
SFeSS = SFoperatorE * UVW(:,1:3) ;
SFwSS = SFoperatorW * UVW(:,1:3) ;

%%
AnSFe = sum( SFeSS.^2 , 2) ;
AnSFw = sum( SFwSS.^2 , 2) ;

%%
AnSFm = ( AnSFe + AnSFw ) / 2 ;