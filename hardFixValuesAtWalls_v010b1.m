function Vars_minorBatches = hardFixValuesAtWalls_v010b1( Vars_minorBatches , indWall2D , indWallNeighbor2D , which_condition )

%%
for k=1:size(Vars_minorBatches,3)
    for j=1:size(Vars_minorBatches,2)
        for i=1:length(indWall2D)
            if strcmpi( which_condition , 'zero' )
                Vars_minorBatches(indWall2D{i},j,k) = - Vars_minorBatches(indWallNeighbor2D{i},j,k) ;
            else
                Vars_minorBatches(indWall2D{i},j,k) =   Vars_minorBatches(indWallNeighbor2D{i},j,k) ;
            end
        end
    end
end