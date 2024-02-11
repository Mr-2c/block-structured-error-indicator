function TikDujDxk = TikDujDxk_v101( gradU , T )

%%
ind629 = [  1,2,3 ; ...
            2,4,5 ; ...
            3,5,6 ];
indGrad = [ 1,4,7 ; ...
            2,5,8 ; ...
            3,6,9 ] ;
        
%%
TikDujDxk = zeros( size(T,1) , 9 , size(T,3) );
for i=1:3
    for j=1:3
        TikDujDxk(:, (i-1)*3+j ,:) = sum( gradU(:,indGrad(j,:),:) .* T(:,ind629(i,:),:)   , 2 ) ;
    end
end

