function  VkSik = nonlin2vNStC_v100( Vk , Sik )

indSik = [  1 , 2 , 3 ;
            4 , 5 , 6 ;
            7 , 8 , 9 ] ;
        
%%
for i=1:3
    VkSik(:,i) = sum( Vk .* Sik(:, indSik(i,:) ) , 2 ) ;
end
