%% This function reads and filters the grid

%% v1.02:       new modification (bug fix):     first filter is now taking absolute values (Nplanes_min)
%%              function modification:          grid_filterer_v100 is replaced by grid_filterer_first_v100
%%              new output:                     XYZ_available (to be used in averaging)
%% v1.03:       new output:                     XYZVector2Matrix (to be used in averaging)
%% v1.10:       new feature:                    thrid filter to remove points with only one neighbor in each direction
%%              new function:                   OF_grid_filterer_SecondThird_v100
%% v1.20:       new function:                   OF_grid_filterer_SecondThird_v200. filter in less iterations
%%
%% v2.00b1:     major new feature:              capable of handling both hybrid grids and OpenFOAM grids 

function [ XYZ_original , XYZ_neighbors,XYZ_distance,XYZ_available,XYZVector2Matrix , X,Y,Z, iXYZ , indWallStillThere_all,indWallPoints,indWallAdjacentPoints,addedWalls ] = ...
    OF_BFS_gridReadFilter_v300b1( which_code , which_flow , gridFileName , Nplanes_min , filter_maxDist , x_bounds)

if strcmpi(which_code,'OF') || strcmpi(which_code,'OpenFOAM')
    
    %% Reading in the grid
    XYZ_original = OF_BFS_readGridOriginal_v100(gridFileName) ;
    
    %% potentially adding the walls
    if strcmpi(which_flow , 'BFS' )
        [ XYZ_original , indWallPoints , indWallAdjacentPoints , addedWalls ] = OF_BFS_addGhostAtWalls_v020b2( XYZ_original , x_bounds  , filter_maxDist ) ;
    elseif strcmpi(which_flow , 'Channel' )
        [ XYZ_original , indWallPoints , indWallAdjacentPoints , addedWalls ] = OF_BFS_addGhostAtWalls_channel_v020b2( XYZ_original , x_bounds ) ;
    end
    
    %%
    Iinbound = (XYZ_original(:,1)>=min(x_bounds)) & (XYZ_original(:,1)<=max(x_bounds)) ;
    XYZ_original_tmp = XYZ_original(Iinbound,:) ; 

    %%
    XYZ_original_tmp = sortrows( unique(XYZ_original_tmp,'rows') , [1 2 3] );
    
%     %% First filter: droping the x-, y-, or z-planes with a number of points less than filter_ratio*maimumNumPoints in other such planes
%     disp('Filtering the grid...')
%     XYZ_original_tmp = grid_filterer_first_v100( XYZ_original_tmp , Nplanes_min ) ;
% 
%     %%
%     XYZ_original_tmp = sortrows( XYZ_original_tmp , [1 2 3] );

    %% first filter: 
    %% Second filter: droping the points without any neighbors in x, y, or z. 
    %% distances larger than the skeletal grid are considered filtered
    XYZ_original_tmp = OF_grid_filterer_FirstSecondThird_v200b1(XYZ_original_tmp , filter_maxDist , Nplanes_min ) ;

    %%
    XYZ_original_tmp = sortrows( XYZ_original_tmp , [1 2 3] );

    %% sorting the grid and finding the corresponding indices of the points left for use when reading in variables
    [XYZ_original,iXYZ,~] = intersect( XYZ_original , XYZ_original_tmp , 'rows' ) ;
    X = unique( XYZ_original(:,1) ) ;
    Y = unique( XYZ_original(:,2) ) ;
    Z = unique( XYZ_original(:,3) ) ;

    %%
    if ~isempty(addedWalls)
        for i=1:length(indWallPoints)
            [~, indWallStillThere_all{i} ,~] = intersect( iXYZ , indWallPoints{i} );
        end
    end
    
    %% finding the neighbors of each point and their coresponding distance
    disp('finding the neighbors of each point and their distances...')
    [ XYZ_available , XYZVector2Matrix , iX_up,iY_up,iZ_up ] = ...
        OF_originalGridFinder_v100( XYZ_original , X,Y,Z ) ;

    [ XYZ_neighbors , XYZ_distance ] = ...
        OF_neighborDistance_finder_v101( XYZ_available , XYZVector2Matrix , X,Y,Z  , iX_up,iY_up,iZ_up ,filter_maxDist );

    
    
elseif  strcmpi(which_code,'hybrid') 
    %% Reading in the grid
    [~,X,Y,Z,~,~,~,~] = hybridReadRestart(gridFileName);
    Y = [-1;Y;1];
    [ XX , YY , ZZ ] = ndgrid(X,Y,Z);
    XYZ_original = cat( 2 , reshape( XX , [],1 ) , reshape( YY , [],1 ) , reshape( ZZ , [],1 ) ) ;
    
    %%
    XYZ_available = true( size(XX) );
    
    %%
    iXYZ = (1:length(XYZ_original))';
    XYZVector2Matrix = reshape(iXYZ , length(X) , length(Y) , length(Z) ) ;
    
    %%
    [ XYZ_neighbors , XYZ_distance ] = ...
        OF_neighborDistance_replicaForChannel_v100b1( XYZVector2Matrix , X,Y,Z) ; 
    
    %%
    indWallPoints           = {} ; 
    indWallAdjacentPoints   = {}; 
    indWallStillThere_all   = {} ;
    addedWalls              = [];
    
end




