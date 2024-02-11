function [ Vars_hpfX_upstream , Vars_hpfY_upstream , Vars_hpfZ_upstream ] = ...
    OF_BFS_hpfN_v100( Vars_upstream , dX_original_up , ...
    D2x_operator_up,D2y_operator_up,D2z_operator_up )


D2Vars_Dx2_upstream = D2x_operator_up * Vars_upstream ; 
D2Vars_Dy2_upstream = D2y_operator_up * Vars_upstream ; 
D2Vars_Dz2_upstream = D2z_operator_up * Vars_upstream ; 
    
% [ D2Vars_Dx2_upstream , D2Vars_Dy2_upstream , D2Vars_Dz2_upstream ] = ...
%         OF_BFS_Vars2ndDerivative_v100( Vars_upstream , D2x_operator_up,D2y_operator_up,D2z_operator_up , ...
%         XYZ_neighbors_up , iIndwoN_up ) ;

Vars_hpfX_upstream = -dX_original_up(:,1).^2/4 .* D2Vars_Dx2_upstream ;
Vars_hpfY_upstream = -dX_original_up(:,2).^2/4 .* D2Vars_Dy2_upstream ;
Vars_hpfZ_upstream = -dX_original_up(:,3).^2/4 .* D2Vars_Dz2_upstream ;
    