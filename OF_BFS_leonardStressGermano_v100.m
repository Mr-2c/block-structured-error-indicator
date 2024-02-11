function [ Lij_upstream , LijD_upstream ] = OF_BFS_leonardStressGermano_v100( Vars_lpf_upstream ,  RS_tmp_upstream , ...
    dX_original_up , D2_operator_up)

%% terms from deviatoric Leonard stress comming from nonlinear convective
[ ~ , LijFirst_upstream ] = ...
        OF_BFS_HpfLpfIso_v100( RS_tmp_upstream , dX_original_up , D2_operator_up ) ;
    
LijSecond_upstream   = nonlin2vvS_tmp_v100( Vars_lpf_upstream(:,1:3) , Vars_lpf_upstream(:,1:3) );

Lij_upstream = LijFirst_upstream - LijSecond_upstream ;

LijD_upstream = SijDeviatoric_v100( Lij_upstream );