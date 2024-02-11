function wall1 = wallNeighborFilter( wall1_tmp , whichWall , wallCoord)

%%
if whichWall==1 || whichWall==3
    normalDirection = 2 ;
else
    normalDirection = 1 ;
end

%%
isConverged = 0 ;
while isConverged~=1
    
    k=0 ;
    for i=1:length(wall1_tmp)
        ptCoor = wall1_tmp(i,:) ;
        ptCoor(normalDirection) = wallCoord ;
        
        dis2wallNormal = ( wall1_tmp(:,1) - ptCoor(1) ).^2 + ( wall1_tmp(:,2) - ptCoor(2) ).^2 + ( wall1_tmp(:,3) - ptCoor(3) ).^2 ;
        [ ~ ,iMin ] = min(dis2wallNormal);
        if iMin~=i
            k=k+1;
            indDrop(k) = i ;
        end
    end
    
    if k==0
        isConverged = 1;
    else
        wall1_tmp(indDrop,:) = [];
    end
    
end

%%
wall1 = wall1_tmp ;