function Vars_wholeDomain = OF_BFS_addGhostsValuesAtWalls_v101( Vars_wholeDomain , indWallPoints,indWallAdjacentPoints,addedWalls )

if ~isempty(addedWalls)
    for i=1:length(indWallPoints)
        
        %% Ui = -Ui for all velocity components to satisfy the no-slip no-penetration condition
        %% dp/dn = 0
        %% nuSgs = -nuSgs so that the mean is zero at the walls
        Vars_wholeDomain(indWallPoints{i},1:3)  = - Vars_wholeDomain(indWallAdjacentPoints{i},1:3);
        Vars_wholeDomain(indWallPoints{i},4)    =   Vars_wholeDomain(indWallAdjacentPoints{i},4);
        if size(Vars_wholeDomain,2)>4
            Vars_wholeDomain(indWallPoints{i},5)  	= - Vars_wholeDomain(indWallAdjacentPoints{i},5) ;
        end
    end
end