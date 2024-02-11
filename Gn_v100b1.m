function ...
    [ AnTx_upstream , Gn_DSM_upstream , Gn_vreman_upstream , Gn_noSGS_upstream , AnTxTotalCommercial_upstream , AnTxTotalAdd_upstream , nuSGS_vreman_wholeDomain ] = ...
Gn_v100b1( ...
    Vars_upstream , RS_tmp_upstream ,  Vars_lpfX_upstream , ...
    tauSgs_upstream , Sij_upstream , gradU_wholeDomain , ...
    dX_original_up , dxyz_vreman_original , dxyz_vreman_filtered , D2x_operator_up , ...
    Dx_operator_up,Dy_operator_up,Dz_operator_up , divOperator_up, ...
    filterSizeRatio )

%% terms from deviatoric Leonard stress comming from nonlinear convective
[ ~ , LijFirst_upstream ] = ...
        OF_BFS_hpfNlpfN_v100( RS_tmp_upstream , dX_original_up , D2x_operator_up ) ;
    
LijSecond_upstream   = nonlin2vvS_tmp_v100( Vars_lpfX_upstream(:,1:3) , Vars_lpfX_upstream(:,1:3) );

Lij_upstream = LijFirst_upstream - LijSecond_upstream ;

LijD_upstream = SijDeviatoric_v100( Lij_upstream );

%% terms from filtered tauij
[ ~ , tauSgsTn_upstream ] = OF_BFS_hpfNlpfN_v100( tauSgs_upstream , dX_original_up , D2x_operator_up ) ;

%% terms from Tij
Sij_contracted_upstream = SijSijContraction_v100( Sij_upstream );

tauKKsgs_wholeDomain            =  2 *  Vars_upstream(:,5) .* sqrt( 2 * Sij_contracted_upstream ) ;
tauSgsTotal_upstream            =       tauSgs_upstream     + 2/3 * tauKKsgs_wholeDomain .* [1 0 0 1 0 1] ;
[ ~ , tauSgsTotalTn_upstream ]  = OF_BFS_hpfNlpfN_v100( tauSgsTotal_upstream , dX_original_up , D2x_operator_up ) ;


[ SijLpfX_upstream , gradULpfX_upstream ]        = OF_BFS_SijGradU_v100( Vars_lpfX_upstream , Dx_operator_up,Dy_operator_up,Dz_operator_up );
SijLpfX_contracted_upstream     = SijSijContraction_v100( SijLpfX_upstream );

nuTx_upstream = Vars_upstream(:,5) .* ( filterSizeRatio^2 ) .* ...
    sqrt( SijLpfX_contracted_upstream ./ max( Sij_contracted_upstream , 1e-9) ) ;

tauSgsLpfX_upstream         = -2 * nuTx_upstream .* SijLpfX_upstream ;
tauKKsgsLpfX_wholeDomain    =  2 * nuTx_upstream .* sqrt( 2 * SijLpfX_contracted_upstream ) ;
tauSgsLpfTotal_upstream     = tauSgsLpfX_upstream + 2/3 * tauKKsgsLpfX_wholeDomain .* [1 0 0 1 0 1] ;

%%
nuSGS_vreman_wholeDomain        = nuSGS_vreman_v100b1( gradU_wholeDomain , dxyz_vreman_original ) ;
nuVremanTn_upstream_surrogate   = nuSGS_vreman_v100b1( gradULpfX_upstream , dxyz_vreman_filtered ) ;

nuTvreman_upstream = Vars_upstream(:,5) .* ...
    nuVremanTn_upstream_surrogate ./ max( nuSGS_vreman_wholeDomain , 1e-9) ;

tauSgsLpfX_vreman_upstream         = -2 * nuTvreman_upstream .* SijLpfX_upstream ;
tauKKsgsLpfX_vreman_wholeDomain    =  2 * nuTvreman_upstream .* sqrt( 2 * SijLpfX_contracted_upstream ) ;
tauSgsLpfTotal_vreman_upstream     = tauSgsLpfX_vreman_upstream + 2/3 * tauKKsgsLpfX_vreman_wholeDomain .* [1 0 0 1 0 1] ;


%% EijX is symmetric, since all others are
EijX_upstream               = LijD_upstream + tauSgsTn_upstream         - tauSgsLpfX_upstream ;
EijXtotal_upstream          = Lij_upstream  + tauSgsTotalTn_upstream    - tauSgsLpfTotal_upstream ;
EijXNum_upstream            = Lij_upstream  - LijD_upstream  ;

EijXtotal_vreman_upstream   = Lij_upstream  + tauSgsTotalTn_upstream    - tauSgsLpfTotal_vreman_upstream ;

%% Fi is a forcing term in NS which produces the difference
divLijX_upstream        = dSijDxj_v100( divOperator_up , Lij_upstream ) ;
divEijX_upstream        = dSijDxj_v100( divOperator_up , EijX_upstream ) ;
divEijXtotal_upstream  	= dSijDxj_v100( divOperator_up , EijXtotal_upstream ) ;
divEijXNum_upstream   	= dSijDxj_v100( divOperator_up , EijXNum_upstream ) ;

FiTotal_vreman_upstream = dSijDxj_v100( divOperator_up , EijXtotal_vreman_upstream ) ;

Fi_upstream         = divEijX_upstream; 
FiTotal_upstream    = divEijXtotal_upstream; 
FiNoSGS_upstream    = divLijX_upstream ;
FiTotalAdd_upstream = sqrt( divEijX_upstream.^2 + divEijXNum_upstream.^2 ) ;

%%
AnTx_upstream                   = sum( Fi_upstream.^2 , 2 ) ;
Gn_DSM_upstream                 = sum( FiTotal_upstream.^2 , 2 ) ;
Gn_noSGS_upstream               = sum( FiNoSGS_upstream.^2 , 2 ) ;
AnTxTotalAdd_upstream           = sum( FiTotalAdd_upstream.^2 , 2 ) ;
AnTxTotalCommercial_upstream    = SijSijContraction_v100( EijXtotal_upstream );

Gn_vreman_upstream              = sum( FiTotal_vreman_upstream.^2 , 2 ) ;
