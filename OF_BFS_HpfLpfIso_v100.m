function [ Vars_hpf_upstream , Vars_lpf_upstream ] = ...
    OF_BFS_HpfLpfIso_v100( Vars_upstream , dX_original_up , ...
    D2_operator_up )

%%
Vars_lpf_upstream = Vars_upstream ;

%%
for i=1:3
    D2VarsBar_Dx2_upstream = D2_operator_up{i} * Vars_lpf_upstream ; 
    Vars_hpfTmp_upstream = -dX_original_up(:,i).^2/4 .* D2VarsBar_Dx2_upstream ;
    Vars_lpf_upstream = Vars_lpf_upstream - Vars_hpfTmp_upstream ;
end

%%
Vars_hpf_upstream = Vars_upstream - Vars_lpf_upstream ;