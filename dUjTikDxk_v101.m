function dUjTikDxk = dUjTikDxk_v101( U , T , divOperator )

%%
indTik = [  [1,2,3] ; ...
            [2,4,5] ; ...
            [3,5,6] ] ;

%%
dUjTikDxk = zeros( size(U,1) , 9 , size(U,3) );
for k=1:size(U,3)
    for i=1:3
        for j = 1:3
            UjTik  = U(:,j,k) .* T(:, indTik(i,:) ,k) ;
            dUjTikDxk(:, (i-1)*3+j ,k) = divOperator * reshape( UjTik , [],1) ;
        end
    end
end