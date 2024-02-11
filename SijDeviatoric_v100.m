function SijD_upstream = SijDeviatoric_v100( Sij_upstream )

%%
Sij_trace = sum( Sij_upstream(:,[1,4,6]) , 2 );

%%
SijD_upstream = Sij_upstream ;
SijD_upstream(:,[1,4,6]) = SijD_upstream(:,[1,4,6]) - 1/3*Sij_trace ;
