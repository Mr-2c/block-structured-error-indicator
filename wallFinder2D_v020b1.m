function ...
    [ wall2D , indWall2D , indWallNeighbor2D ] = ...
wallFinder2D_v020b1( ...
    XYZ_original_all    , indWallStillThere_all , ...
    XY_averagable_all   , XY_neighbors_all      , ...
    addedWalls_all )

%%
if ~isempty(addedWalls_all)
    for i=1:length(addedWalls_all)
        if addedWalls_all(i)==1 || addedWalls_all(i)==3
            ind = 1 ;
            nNormal = 2 ;
        elseif addedWalls_all(i)==-1
            ind = 1 ;
            nNormal = 1.5 ;
        elseif addedWalls_all(i)==2
            ind = 2 ;
            nNormal = 1 ;
        end

        %%
        [ ~, ind2] = unique( XYZ_original_all( indWallStillThere_all{i} , ind ) ) ;
        wall2D{i} = XYZ_original_all( indWallStillThere_all{i}(ind2) , 1:2 );

        %%
        [~,~, indWall2D{i} ] = intersect( wall2D{i} , XY_averagable_all , 'rows' ) ;
        indWallNeighbor2D{i} = XY_neighbors_all( indWall2D{i} , 2*nNormal );

    end

else
    wall2D              = {};
    indWall2D           = {};
    indWallNeighbor2D   = {};
end
