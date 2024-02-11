function [ Vars_hpfX_upstream , Vars_lpfX_upstream ] = ...
    OF_BFS_hpfNlpfN_v100( Vars_upstream , dX_original_up , D2x_operator_up )

%%
D2Vars_Dx2_upstream = D2x_operator_up * Vars_upstream ; 
Vars_hpfX_upstream = -dX_original_up.^2/4 .* D2Vars_Dx2_upstream ;
Vars_lpfX_upstream = Vars_upstream - Vars_hpfX_upstream ;