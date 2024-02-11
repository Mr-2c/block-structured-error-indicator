function nuSgs = OF_BFS_nuSgsGDSLilly_v100( cS , Sij ,filterWidth )

Sij_contracted  = SijSijContraction_v100( Sij );

nuSgs           = cS .* (filterWidth.^2) .* sqrt( 2*Sij_contracted ) ;