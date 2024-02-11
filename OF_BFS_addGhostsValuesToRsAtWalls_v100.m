function RS_wholeDomain = OF_BFS_addGhostsValuesToRsAtWalls_v100( RS_wholeDomain , indWallPoints,indWallAdjacentPoints,addedWalls )

if ~isempty(addedWalls)
    for i=1:length(indWallPoints)
        
        %% Ui = -Ui for all velocity components to satisfy the no-slip no-penetration condition
        %% dp/dn = 0
        %% nuSgs = -nuSgs so that the mean is zero at the walls
        RS_wholeDomain(indWallPoints{i},:)  = - RS_wholeDomain(indWallAdjacentPoints{i},:);
    end
end