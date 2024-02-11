function [ indPressure1,indPressure2  , indVelocity , dxPressure1,dxPressure2,alphaPressure ] = ...
    OF_BFS_wallPressureCalculator_v120b1( indWallStillThere_all , addedWalls_all , XYZ_neighbors_all , XYZ_distance_all )

%%
if ~isempty(addedWalls_all)
    for i = 1 : length( indWallStillThere_all )
        if addedWalls_all(i)==1 || addedWalls_all(i)==3
            indPressure1{i}  = XYZ_neighbors_all( indWallStillThere_all{i} , 4 ) ;
            indPressure2{i}  = XYZ_neighbors_all( indPressure1{i} , 4 ) ;
            
            dxPressure1{i}   = XYZ_distance_all( indWallStillThere_all{i} , 4 ) ;
            dxPressure2{i}   = XYZ_distance_all( indPressure1{i} , 4 ) ;
            alphaPressure{i} = dxPressure2{i} ./ dxPressure1{i} ;
            
            indVelocity{i}  = indWallStillThere_all{i} ;
            
        elseif addedWalls_all(i)==2
            indPressure1{i}  = XYZ_neighbors_all( indWallStillThere_all{i} , 2 ) ;
            indPressure2{i}  = XYZ_neighbors_all( indPressure1{i} , 2 ) ;
            
            dxPressure1{i}   = XYZ_distance_all( indWallStillThere_all{i} , 2 ) ;
            dxPressure2{i}   = XYZ_distance_all( indPressure1{i} , 2 ) ;
            alphaPressure{i} = dxPressure2{i} ./ dxPressure1{i} ;
            
            indVelocity{i}  = indWallStillThere_all{i} ;
            
        elseif addedWalls_all(i)==-1
            indPressure1{i}  = XYZ_neighbors_all( indWallStillThere_all{i} , 3 ) ;
            indPressure2{i}  = XYZ_neighbors_all( indPressure1{i} , 3 ) ;
            
            dxPressure1{i}   = XYZ_distance_all( indWallStillThere_all{i} , 3 ) ;
            dxPressure2{i}   = XYZ_distance_all( indPressure1{i} , 3 ) ;
            alphaPressure{i} = dxPressure1{i} ./ dxPressure2{i} ;
            
            indVelocity{i}  = indWallStillThere_all{i} ;
            
        else
            error('do you know what you are doing? wall should be one of these: 1) approaching BL, 2) BFS, 3) downstream BL')
        end
    end
    
else
    indPressure1    = {};
    indPressure2    = {};
    indVelocity     = {};
    dxPressure1     = {};
    dxPressure2     = {};
    alphaPressure   = {};
    
end