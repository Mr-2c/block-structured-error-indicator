function cS = OF_BFS_csGDSLilly_v100( LijD , Mij )

nuSgsNumerator      = SijSijContraction_v100( Mij .* LijD );
nuSgsDenomerator    = SijSijContraction_v100( Mij .* Mij  );

cS = nuSgsNumerator ./ nuSgsDenomerator ;

cS( abs(nuSgsNumerator)<1e-6 ) = 0 ;