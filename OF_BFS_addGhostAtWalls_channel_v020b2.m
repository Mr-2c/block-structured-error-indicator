function [ XYZ_original , indWallPoints , indWallAdjacentPoints , addedWalls ] = ...
    OF_BFS_addGhostAtWalls_channel_v020b2( XYZ_original , x_bounds )

%%
nOriginal   = length(XYZ_original);
indPoints   = (1:nOriginal)' ;
addedWalls  = [] ;

%%
indWallPoints{1}    = XYZ_original(:,2)==-1 & XYZ_original(:,1)>=x_bounds(1) & XYZ_original(:,1)<=x_bounds(2) ;
indWallPoints{2}    = XYZ_original(:,2)==1  & XYZ_original(:,1)>=x_bounds(1) & XYZ_original(:,1)<=x_bounds(2)  ;

%% convert to linear index to save memory!
for i=1:2
    indWallPoints{i} = indPoints( indWallPoints{i} ) ;
end

%% conditional statement to see if the wall points already exist
if ~isempty(indWallPoints{1}) && ~isempty(indWallPoints{2}) && ~isempty(indWallPoints{3})
    warning('the data already had wall points in it. returning the same set of points.')
    return
end

%%
iRegion1    = XYZ_original(:,2) == min(XYZ_original(:,2)) & XYZ_original(:,1)>=x_bounds(1) & XYZ_original(:,1)<=x_bounds(2) ;
iRegion2    = XYZ_original(:,2) == max(XYZ_original(:,2)) & XYZ_original(:,1)>=x_bounds(1) & XYZ_original(:,1)<=x_bounds(2) ;

Region1 = sortrows( XYZ_original( iRegion1 , : ) , [1 2 3] ) ;
Region2 = sortrows( XYZ_original( iRegion2 , : ) , [1 2 3] ) ;

%% 
if isempty(indWallPoints{1})
    [ ~ ,iw1 ]   = unique( Region1(:,[1,3]) , 'rows' ) ;
    
    adjacent_wall1_tmp  = Region1(iw1,:);
    adjacent_wall1    	= adjacent_wall1_tmp ;
    
    wall1       = adjacent_wall1;
    wall1(:,2)  = -2 - wall1(:,2) ;
    
    nWall1              = length( wall1 );
    
    indWallPoints{1}    = ( nOriginal + 1                    ):(     nOriginal + nWall1 ) ;
    disp('added points for the wall at y=-1')
    addedWalls = [ addedWalls , 1 ] ;
    [~,~,indWallAdjacentPoints{1}] = intersect( adjacent_wall1 , XYZ_original ,'rows') ;
else
    nWall1  = 0 ;
    wall1   = [];
end

%% 
if isempty(indWallPoints{2})
    [ ~ ,iw2 ]   = unique( Region2(:,[1,3]) , 'rows' ) ;
    
    adjacent_wall2_tmp  = Region2(iw2,:);
    adjacent_wall2    	= adjacent_wall2_tmp ;
    
    wall2       = adjacent_wall2;
    wall2(:,2)  = 2 - wall2(:,2) ;
    
    nWall2              = length( wall2 );
    
    indWallPoints{2}    = ( nOriginal + nWall1 + 1           ):(     nOriginal + nWall1 + nWall2 ) ;
    disp('added points for the wall at y=1')
    addedWalls = [ addedWalls , -1 ] ;
    [~,~,indWallAdjacentPoints{2}] = intersect( adjacent_wall2 , XYZ_original ,'rows') ;
else
    nWall2  = 0 ;
    wall2   = [];
end

%%
XYZ_original    = [ XYZ_original ; wall1 ; wall2 ] ;
