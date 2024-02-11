function [ Sij_upstream , gradU_upstream ] = OF_BFS_SijGradU_v100( Vars_upstream , Dx_operator_up,Dy_operator_up,Dz_operator_up )

%%
DVars_Dx_upstream   = Dx_operator_up * Vars_upstream ;
DVars_Dy_upstream   = Dy_operator_up * Vars_upstream ;
DVars_Dz_upstream   = Dz_operator_up * Vars_upstream ;
    
%%
gradU_upstream  = cat(3,DVars_Dx_upstream(:,1:3),DVars_Dy_upstream(:,1:3),DVars_Dz_upstream(:,1:3));

%%
Sij_upstream    = 1/2 * ( gradU_upstream + permute(gradU_upstream , [1,3,2] ) ) ;
Sij_upstream    = reshape( Sij_upstream , [] ,9 ) ;
Sij_upstream    = Sij_upstream( : , [1,2,3,5,6,9] ) ;
    