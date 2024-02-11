function [SFoperatorE , SFoperatorW] = OF_SFoperator_v100( XYZ_neighbors , indPoints )

%%
Ntot = length( XYZ_neighbors ) ;
iIndwoNe = (XYZ_neighbors(:,2)==0) ;
iIndwoNw = (XYZ_neighbors(:,1)==0) ;
% iIndwoN = (XYZ_neighbors(:,1)==0) | (XYZ_neighbors(:,2)==0) ;
NwNe = sum(~iIndwoNe);
NwNw = sum(~iIndwoNw);

%%
iCe = indPoints( ~iIndwoNe ) ;
iCw = indPoints( ~iIndwoNw ) ;

iE = XYZ_neighbors( ~iIndwoNe , 2 ) ;
iW = XYZ_neighbors( ~iIndwoNw , 1 ) ;

%%
vE = ones(NwNe,1) ;
vCe = -ones(NwNe,1) ;
vCw = -ones(NwNw,1) ;
vW = ones(NwNw,1) ;

%%
SFoperatorE1 = sparse( [iCe;iCe] , [iCe;iE] , [vCe;vE] , Ntot,Ntot );
SFoperatorW1 = sparse( [iCw;iCw] , [iCw;iW] , [vCw;vW] , Ntot,Ntot );

%%
iPe = [ iCe ; indPoints(XYZ_neighbors(:,2)==0) ] ;
iCorrectE = [ iCe ; XYZ_neighbors( XYZ_neighbors(:,2)==0 , 1 ) ] ;
vCorrectE = ones(Ntot,1) ;

CorrectorE = sparse( iPe , iCorrectE , vCorrectE , Ntot,Ntot );

%%
iPw = [ iCw ; indPoints(XYZ_neighbors(:,1)==0) ] ;
iCorrectW = [ iCw ; XYZ_neighbors( XYZ_neighbors(:,1)==0 , 2 ) ] ;
vCorrectW = ones(Ntot,1) ;

CorrectorW = sparse( iPw , iCorrectW , vCorrectW , Ntot,Ntot );

%%
SFoperatorE = CorrectorE * SFoperatorE1 ;
SFoperatorW = CorrectorW * SFoperatorW1 ;
