function UiUjUk = nonlin3vvvS_v100( UiUjUk_tmp , U , UiUj )

%%
indUtripple = [ 1,1,1 , 1,1,1 , 2,2 , 2 , 3 ; ...
                1,1,1 , 2,2,3 , 2,2 , 3 , 3 ; ...
                1,2,3 , 2,3,3 , 2,3 , 3 , 3 ] ;
            
indUiRjk    = [ 1,1,1 , 1,1,1 , 2,2 , 2 , 3 ; ...
                1,2,3 , 4,5,6 , 4,5 , 6 , 6 ] ;  
            
indUjRik    = [ 1,1,1 , 2,2,3 , 2,2 , 3 , 3 ; ...
                1,2,3 , 2,3,3 , 4,5 , 5 , 6 ] ; 
            
indUkRij    = [ 1,2,3 , 2,3,3 , 2,3 , 3 , 3 ; ...
                1,1,1 , 2,2,3 , 4,4 , 5 , 6 ] ; 
            
%%
Utripple = U(:,indUtripple(1,:),:) .* U(:,indUtripple(2,:),:) .* U(:,indUtripple(3,:),:) ;

UiRjk = U(:,indUiRjk(1,:),:) .* UiUj(:,indUiRjk(2,:),:) ;
UjRik = U(:,indUjRik(1,:),:) .* UiUj(:,indUjRik(2,:),:) ;
UkRij = U(:,indUkRij(1,:),:) .* UiUj(:,indUkRij(2,:),:) ;

%%
UiUjUk = UiUjUk_tmp - Utripple - UiRjk - UjRik - UkRij ;