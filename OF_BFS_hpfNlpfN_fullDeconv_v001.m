function [ Vars_hpfX_upstream , Vars_lpfX_upstream ] = ...
    OF_BFS_hpfNlpfN_fullDeconv_v001( Vars_upstream , filtXoperator_all  )

%%
Vars_lpfX_upstream = filtXoperator_all\Vars_upstream ;
Vars_hpfX_upstream = Vars_upstream - Vars_lpfX_upstream ;
