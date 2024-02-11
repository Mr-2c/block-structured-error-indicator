%% accounts for the boundary points using the forward and backward schemes
%% note that forward and backward first derivatives are different from just an extrapolation (like second derivatives)
%% v1.01:       bug fix:        backward differencing is now fixed.

function D_operator = OF_Doperator_v200b3( XYZ_neighbors , XYZ_distance , indPoints , ...
    do_extrapolateFirstDerivs , indWallStillThere_all , indPressure1_all , ...
    do_upwindAtBoundaries , automatic_1st2ndSwitch , maxAcceptableDis2Wall )

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
vE = 1./( alpha.*(alpha+1) .* dXw ) ;
vC = (alpha.^2-1) .* vE ;
vW = - alpha.^2 .* vE ;

% %%
% D_operator = sparse( [iC;iC;iC] , [iW;iC;iE] , [vW;vC;vE] , Ntot,Ntot );

%%
iIf = indPoints( XYZ_neighbors(:,1)==0 );
iI1f = XYZ_neighbors( iIf , 2 ) ;
iI2f = XYZ_neighbors( iI1f , 2 ) ;

%%
dXforward           = XYZ_distance(iI1f,1) ;
alphaForward        = XYZ_distance(iI1f,2) ./ XYZ_distance(iI1f,1) ;

%%
stencilSizeForward  = XYZ_distance(iI1f,2) +  XYZ_distance(iI1f,1) ;
if strcmpi( automatic_1st2ndSwitch , 'yes' )
    ind_2ndOrderStencil_forward = ( stencilSizeForward <= maxAcceptableDis2Wall ) ;
elseif strcmpi( do_upwindAtBoundaries , 'yes' )
    ind_2ndOrderStencil_forward = false( length(stencilSizeForward) , 1 ) ;
else
    ind_2ndOrderStencil_forward = true( length(stencilSizeForward) , 1 ) ;
end
ind_1stOrderStencil_forward = ~ind_2ndOrderStencil_forward;

%%
vI2f_2nd    = -1./( alphaForward.*(alphaForward+1) .* dXforward ) ;
vI1f_2nd    = -(1+alphaForward).^2 .* vI2f_2nd ;
vIf_2nd     = alphaForward.*(alphaForward+2) .* vI2f_2nd ;

vI1f_1st    = 1./dXforward ;
vIf_1st     = -1./dXforward ;

vI2f    = vI2f_2nd .* ind_2ndOrderStencil_forward ;
vI1f    = vI1f_2nd .* ind_2ndOrderStencil_forward + vI1f_1st .* ind_1stOrderStencil_forward ;
vIf     = vIf_2nd  .* ind_2ndOrderStencil_forward + vIf_1st  .* ind_1stOrderStencil_forward ;


%%
iIb = indPoints( XYZ_neighbors(:,2)==0 );
iI1b = XYZ_neighbors( iIb , 1 ) ;
iI2b = XYZ_neighbors( iI1b , 1 ) ;

%%
dXbackward          = XYZ_distance(iI1b,2) ;
alphaBackward       = XYZ_distance(iI1b,1) ./ XYZ_distance(iI1b,2) ;

%%
stencilSizeBackward  = XYZ_distance(iI1b,1) + XYZ_distance(iI1b,2) ;
if strcmpi( automatic_1st2ndSwitch , 'yes' )
    ind_2ndOrderStencil_backward = ( stencilSizeBackward <= maxAcceptableDis2Wall ) ;
elseif strcmpi( do_upwindAtBoundaries , 'yes' )
    ind_2ndOrderStencil_backward    = false( length(stencilSizeBackward) , 1 ) ;
else
    ind_2ndOrderStencil_backward    = true(  length(stencilSizeBackward) , 1 ) ;
end
ind_1stOrderStencil_backward = ~ind_2ndOrderStencil_backward;

%%
vI2b_2nd = 1./( alphaBackward.*(alphaBackward+1) .* dXbackward ) ;
vI1b_2nd = -(1+alphaBackward).^2 .* vI2b_2nd ;
vIb_2nd = alphaBackward.*(alphaBackward+2) .* vI2b_2nd ;

vI1b_1st    = -1./dXbackward ;
vIb_1st     = 1./dXbackward ;

vI2b    = vI2b_2nd .* ind_2ndOrderStencil_backward ;
vI1b    = vI1b_2nd .* ind_2ndOrderStencil_backward + vI1b_1st .* ind_1stOrderStencil_backward ;
vIb     = vIb_2nd  .* ind_2ndOrderStencil_backward + vIb_1st  .* ind_1stOrderStencil_backward ;

%%
if strcmpi( do_upwindAtBoundaries , 'yes' )
    D_operator = sparse(    [ iC;iIf;iIb   ; iC;iIf;iIb ; iC ] , ...
                            [ iW;iI1f;iI1b ; iC;iIf;iIb ; iE ] , ...
                            [ vW;vI1f;vI1b ; vC;vIf;vIb ; vE ] , ...
                            Ntot , Ntot );
else
    D_operator = sparse(    [ iC;iIf;iIb   ; iC;iIf;iIb ; iC;iIf;iIb ] , ...
                            [ iW;iI1f;iI1b ; iC;iIf;iIb ; iE;iI2f;iI2b ] , ...
                            [ vW;vI1f;vI1b ; vC;vIf;vIb ; vE;vI2f;vI2b ] , ...
                            Ntot , Ntot );
end
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
    D_operator = correctionMatrix * D_operator ;
end

