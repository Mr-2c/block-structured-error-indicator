function SijLpfX_contracted_upstream = SijSijContraction_v100( SijLpfX_upstream )

%%
SijLpfX_contracted_upstream = ...
    (   sum( SijLpfX_upstream(:,[1,4,6]).^2 , 2 ) + ...     % diagonals
    2 * sum( SijLpfX_upstream(:,[2,3,5]).^2 , 2 ) ) ;       % off-diagonals