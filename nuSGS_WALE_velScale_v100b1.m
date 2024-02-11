function nuSGS_WALE_velScale_wholeDomain = nuSGS_WALE_velScale_v100b1( gradU_wholeDomain ) 

%%
gij2                    = zeros(length(gradU_wholeDomain),3,3);
for i=1:3
    for j=1:3
        gij2(:,i,j)     = sum( permute( gradU_wholeDomain(:,i,:) , [1 3 2] ) .* ...
                                        gradU_wholeDomain(:,:,j) , 2 ) ;
    end
end

mathcalSijd             = .5 * ( gij2 + permute(gij2,[1 3 2]) ) ;
mathcalSij_trace        = gij2(:,1,1) + gij2(:,2,2) + gij2(:,3,3) ;

for i=1:3
    mathcalSijd(:,i,i)  = mathcalSijd(:,i,i) - mathcalSij_trace/3 ;
end


%%
Sij                             = .5 * ( gradU_wholeDomain + permute(gradU_wholeDomain,[1 3 2]) );
for i=1:3
    Sij(:,i,i)  = Sij(:,i,i) - (Sij(:,1,1)+Sij(:,2,2)+Sij(:,3,3))/3 ;
end
% warning('This is the inconsistnt formulation!!')

%%
mathcalSijd_mathcalSijd         = sum( sum( mathcalSijd.^2 , 3 ) , 2);
SijSij                          = sum( sum( Sij.^2 , 3 ) , 2);

%%
% nuSGS_WALE_velScale_wholeDomain = mathcalSijd_mathcalSijd.^(3/2) ./ ( SijSij.^(5/2) + mathcalSijd_mathcalSijd.^(5/4) + 100*eps ) ;        
nuSGS_WALE_velScale_wholeDomain = mathcalSijd_mathcalSijd.^(3/2) ./ ( SijSij.^(5/2) + mathcalSijd_mathcalSijd.^(5/4) + 1e-6 ) ;        




% %% because of Vreman's definition of alphaIJ 
% alphaIJ = permute( gradU_wholeDomain , [1 3 2] ) ;
% 
% %%
% AijAij = sum( sum( alphaIJ.^2 , 3 ) , 2 ) ;
% 
% %%
% for i=1:3
%     for j=1:3
%         betaIJ(:,i,j) = sum( dX_original_up.^2 .* alphaIJ(:,:,i) .* alphaIJ(:,:,j) , 2) ;
%     end
% end
% 
% %%
% B_beta =    betaIJ(:,1,1) .* betaIJ(:,2,2) - betaIJ(:,1,2).^2 + ...
%             betaIJ(:,1,1) .* betaIJ(:,3,3) - betaIJ(:,1,3).^2 + ...
%             betaIJ(:,2,2) .* betaIJ(:,3,3) - betaIJ(:,2,3).^2 ;
%         
% %%
% nuSGS_vreman_wholeDomain = 0.07 * sqrt( B_beta ./ AijAij ) ;