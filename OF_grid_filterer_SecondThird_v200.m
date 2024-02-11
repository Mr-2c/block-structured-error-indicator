%% v2.00:   new feature:       eliminate points without any or enough neighbors at a single iteration.

function XYZ_original = OF_grid_filterer_SecondThird_v200(XYZ_original , max_dist )

%%
XYZ_original_tmp = XYZ_original ;

%%
sumElim = 1 ;
k=0;
while sumElim~=0
    
    k=k+1;
    disp(['filtering the grid for points without enough neighbors: iteration ',num2str(k)])
    
    %%
    Xtmp = unique(XYZ_original_tmp(:,1));
    Ytmp = unique(XYZ_original_tmp(:,2));
    Ztmp = unique(XYZ_original_tmp(:,3));

    %%
    [ XYZ_available , XYZVector2Matrix , iX,iY,iZ ] = ...
        OF_originalGridFinder_v100( XYZ_original_tmp , Xtmp,Ytmp,Ztmp ) ;

    [ XYZ_neighbors , ~ ] = ...
        OF_neighborDistance_finder_v101( XYZ_available , XYZVector2Matrix , Xtmp,Ytmp,Ztmp  , iX,iY,iZ ,max_dist );

    %%
    iIndwoN = XYZ_neighbors==0 ; 
    indPoints = (1:size(XYZ_neighbors,1))' ;

    %% three point stencils, can be generalized to longer stencils.
    for i=1:3
        %% points without left OR right neighbors
        a1 = indPoints( iIndwoN( : , (i-1)*2+1 ) );
        a2 = indPoints( iIndwoN( : , (i-1)*2+2 ) );
        
        aP = intersect(a1,a2);
        iIndwoAN{i} = aP ;
        
        a1 = setdiff(a1,aP);
        a2 = setdiff(a2,aP);
        
        %% points without a left neighbor, whose right neghbors do not have a right neighbor (less than three points, which means an stencil cannot be fit.)
        b1 = XYZ_neighbors( a1 , (i-1)*2+2 );
        c1 = XYZ_neighbors( b1 , (i-1)*2+2 ) ;
        d1 = (c1==0);
        iIndwoEN{(i-1)*2+1,1} = [a1(d1);b1(d1)];

        %% points without a right neighbor, whose left neghbors do not have a left neighbor
        b2 = XYZ_neighbors( a2 , (i-1)*2+1 );
        c2 = XYZ_neighbors( b2 , (i-1)*2+1 ) ;
        d2 = (c2==0);
        iIndwoEN{(i-1)*2+2,1} = [a2(d2);b2(d2)];
    end
    
    %%
    iIndwoANTot = [] ;
    for i=1:3
        iIndwoANTot = [ iIndwoANTot ; iIndwoAN{i} ] ;
    end
    iIndwoANTot = unique(iIndwoANTot) ;
    
    %%
    iIndwoENTot = [] ;
    for i=1:6
        iIndwoENTot = [ iIndwoENTot ; iIndwoEN{i,1} ] ;
    end
    iIndwoENTot = unique(iIndwoENTot) ;
    
    %%
    iEliminate = [ iIndwoANTot ; iIndwoENTot ] ;
    iEliminate = unique(iEliminate);
    
    %%
    sumElim = length(iEliminate) ;
    
    %%
    if sumElim~=0
        XYZ_original_tmp(iEliminate,:) = [] ;
        XYZ_original_tmp = intersect(XYZ_original , XYZ_original_tmp , 'rows');

        disp(['A total of ',num2str(sumElim) , ' points did not have enough neighbor points and were eliminated in this iteration...'])
        
    end
    
    %% avoid infinite loops
    if k>20
        warning('grid filtering passed the maximum number of iterations and got terminated!')
        break
    end
    
end

%%
XYZ_original = XYZ_original_tmp ;