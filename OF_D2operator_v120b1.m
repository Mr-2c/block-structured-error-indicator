%% v1.10:       bug fix:    fixed for boundary points using the Correcter matrix

function D2_operator = OF_D2operator_v120b1( XYZ_neighbors , XYZ_distance , indPoints , ...
    do_extrapolateFirstDerivs , indWallStillThere_all , indPressure1_all )

%%
Ntot = length( XYZ_neighbors ) ;
iIndwoN = (XYZ_neighbors(:,1)==0) | (XYZ_neighbors(:,2)==0) ;

%%
alpha = XYZ_distance( ~iIndwoN , 2 ) ./ XYZ_distance( ~iIndwoN , 1 ) ;

%%
iC = indPoints( ~iIndwoN ) ;
iE = XYZ_neighbors( ~iIndwoN , 2 ) ;
iW = XYZ_neighbors( ~iIndwoN , 1 ) ;

%%
dXw = XYZ_distance( ~iIndwoN , 1 ) ;

%%
vE = 1./(alpha.*(alpha+1)/2 .* dXw.^2 ) ;
vC = -(alpha+1) .* vE ;
vW = alpha .* vE ;

%%
D2_operator1st = sparse( [iC;iC;iC] , [iW;iC;iE] , [vW;vC;vE] , Ntot,Ntot );

%% 
iP = [ iC ; indPoints(XYZ_neighbors(:,1)==0) ; indPoints(XYZ_neighbors(:,2)==0) ] ;
iCorrect = [ iC ; XYZ_neighbors( XYZ_neighbors(:,1)==0 , 2 ) ; XYZ_neighbors( XYZ_neighbors(:,2)==0 , 1 ) ] ;
vCorrect = ones(Ntot,1) ;

Correcter = sparse( iP , iCorrect , vCorrect , Ntot,Ntot );

%%
D2_operator = Correcter * D2_operator1st ;

%%
if strcmpi( do_extrapolateFirstDerivs , 'yes' )
    indAll          = (1:Ntot)';
    indWall_all     = [];
    indAdjacent_all = [];
    
    for i=1:length(indWallStillThere_all)
        indWall_all     = [ indWall_all ; indWallStillThere_all{i} ] ;
        indAdjacent_all = [ indAdjacent_all ; indPressure1_all{i} ];
    end
    [indWall_all,iA] = unique(indWall_all);
    indAdjacent_all = indAdjacent_all(iA) ;
    indNonWall = setdiff( indAll , indWall_all ) ;
    correctionMatrix = sparse( [ indNonWall ; indWall_all ] , [ indNonWall ; indAdjacent_all ] , ones(Ntot,1) );
    
    %%
    D2_operator = correctionMatrix * D2_operator ;
end