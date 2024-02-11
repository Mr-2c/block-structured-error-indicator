function Mij_upstream = OF_BFS_tauIJdiff_v100( Sij_upstream , Vars_lpf_upstream , ...
    dX_original_up , D2_operator_up , Dx_operator_up,Dy_operator_up,Dz_operator_up , ...
    filterSize , filterRatio )

%% terms from tauij
Sij_contracted_upstream = SijSijContraction_v100( Sij_upstream );

fromOnceFiltered = sqrt( 2*Sij_contracted_upstream ) .* Sij_upstream ;

%% terms from filtered tauij
[ ~ , SijShitBar_upstream ] = ...
        OF_BFS_HpfLpfIso_v100( fromOnceFiltered , dX_original_up , D2_operator_up ) ;

%% terms from Tij
[ SijLpf_upstream , ~ ] = OF_BFS_SijGradU_v100( Vars_lpf_upstream , Dx_operator_up,Dy_operator_up,Dz_operator_up );
SijLpf_contracted_upstream = SijSijContraction_v100( SijLpf_upstream );

SijShitTwiceFiltered = sqrt( 2*SijLpf_contracted_upstream ) .* SijLpf_upstream ;

%%
Mij_upstream = 2 * filterSize.^2 .* ( SijShitBar_upstream - filterRatio.^2 .* SijShitTwiceFiltered ) ;

