function  VkSik = nonlin2vtC_v100( Vk , Sik )

indSik = [  1 , 2 , 3 ;
            2 , 4 , 5 ;
            3 , 5 , 6 ] ;
        
%%
for i=1:3
    VkSik(:,i) = sum( Vk .* Sik(:, indSik(i,:) ) , 2 ) ;
end
