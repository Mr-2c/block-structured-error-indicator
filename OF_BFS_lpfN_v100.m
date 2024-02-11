function [ Vars_lpfX_upstream , Vars_lpfY_upstream , Vars_lpfZ_upstream ] = ...
    OF_BFS_lpfN_v100( Vars_upstream , ...
    Vars_hpfX_upstream , Vars_hpfY_upstream , Vars_hpfZ_upstream )

Vars_lpfX_upstream = Vars_upstream - Vars_hpfX_upstream ;
Vars_lpfY_upstream = Vars_upstream - Vars_hpfY_upstream ;
Vars_lpfZ_upstream = Vars_upstream - Vars_hpfZ_upstream ;