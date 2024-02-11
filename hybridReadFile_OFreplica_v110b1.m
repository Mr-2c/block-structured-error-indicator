%% This function adds the wall values to the variables. Wall is not exported in the hybrid.

%% Variables have to be in this order: U,V,W,P,...
%% Nu should be next to P, although it is not required by this function the main script is written based on that

function [ Vars_upstream , rho , mu ] = hybridReadFile_OFreplica_v110b1(file_name,iXYZ_up,fluid_R,fluid_gamma,fluid_mu)

%%
[Vars_upstream_tmp,~,~,~,~,vars,~,~] = hybridReadRestart(file_name) ;

%%
kk=0;
for i=1:3
    kk = kk + ...
        ( ...
        sum(vars==(4+i))>=1 || ...
        ( sum(vars==i)>=1 && sum(vars==0)>=1 ) ...
        ) ;
end

if kk<3
    warning('snapshot did not contain velocity data! returning empty matrix...')
    Vars_upstream = [];
    return
end

%%
% kk=0
% for i=1:3
%     if sum( vars==i ) == 1 && sum( vars==0 ) == 1
%         kk=kk+1;
%     end
% end

%%
Vars_upstream_tmp2 = zeros( size(Vars_upstream_tmp,1) , size(Vars_upstream_tmp,2) , size(Vars_upstream_tmp,3) , 5 );

%%
for i=1:3
    [ ~,uvwInd ,~ ] = intersect( vars , 4+i ) ;
    if ~isempty(uvwInd)
        Vars_upstream_tmp2(:,:,:,i) = Vars_upstream_tmp(:,:,:,uvwInd) ;
    else
        [~,rhoInd,~] = intersect( vars , 0 ) ;
        [ ~,uvwInd ,~ ] = intersect( vars , i ) ;
        Vars_upstream_tmp2(:,:,:,i) = Vars_upstream_tmp(:,:,:,uvwInd)./Vars_upstream_tmp(:,:,:,rhoInd) ;
    end
end

%%
[~,pInd,~] = intersect( vars , 8 ) ;
if ~isempty(pInd)
    Vars_upstream_tmp2(:,:,:,4) = Vars_upstream_tmp(:,:,:,pInd) ;
elseif sum(vars==4)>=1 && sum(vars==0)>=1 % conserved internal energy
    [~,rhoInd,~] = intersect( vars , 0 ) ;
    [~,rhoeInd,~]      = intersect( vars , 4 ) ;
    Vars_upstream_tmp2(:,:,:,4)  = ...
        (fluid_gamma-1) * ( ...
        Vars_upstream_tmp(:,:,:,rhoeInd) - ...
        1/2 * sum( Vars_upstream_tmp(:,:,:,rhoInd) .* ...
        ( Vars_upstream_tmp2(:,:,:,1:3).^2 ) , 4 ) ...
        ) ;
    % p = (gamma-1) * ( rhoEtot - 1/2*rho*UkUk )
elseif sum(vars==9)>=1 && sum(vars==0)>=1 % temperature
    [~,rhoInd,~]    = intersect( vars , 0 ) ;
    [~,tInd,~]      = intersect( vars , 9 ) ;
    Vars_upstream_tmp2(:,:,:,4) = Vars_upstream_tmp(:,:,:,rhoInd) .* fluid_R .* Vars_upstream_tmp(:,:,:,tInd) ;
    % p = rho * R * T
else
    warning('no pressure data found! could not even back out pressure using other variables!! returning 0 for pressure...')
end

%%
[~,muInd,~] = intersect( vars , 22 ) ;
if ~isempty(muInd)
    Vars_upstream_tmp2(:,:,:,5) = Vars_upstream_tmp(:,:,:,muInd) ;
end

%%
[~,wallInd,~] = intersect( vars , 21 ) ;
if ~isempty(wallInd)
    Vars_upstream_tmp2(:,:,:,6) = Vars_upstream_tmp(:,:,:,wallInd) ;
end

%%
numVars = size(Vars_upstream_tmp2,4);

%%
VarsAddedHead = cat( 4 , ...
    zeros( size(Vars_upstream_tmp2,1) , 1 ,size(Vars_upstream_tmp2,3) ,3 ) , ...
    Vars_upstream_tmp2(:,1,:,4) , ...
    zeros( size(Vars_upstream_tmp2,1) , 1 ,size(Vars_upstream_tmp2,3) , numVars-4 ) ) ;
VarsAddedTail = cat( 4 , ...
    zeros( size(Vars_upstream_tmp2,1) , 1 ,size(Vars_upstream_tmp2,3) ,3 ) , ...
    Vars_upstream_tmp2(:,end,:,4) , ...
    zeros( size(Vars_upstream_tmp2,1) , 1 ,size(Vars_upstream_tmp2,3) , numVars-4 ) ) ;

%%
Vars_upstream_tmp2 = cat( 2 , VarsAddedHead , Vars_upstream_tmp2 , VarsAddedTail ) ;

%%
Vars_upstream = zeros( length(iXYZ_up) , numVars );

%%
for i=1:numVars
    Vars_upstream(:,i) = reshape( Vars_upstream_tmp2(:,:,:,i) , [] , 1 ) ;
end

%%
Vars_upstream       = Vars_upstream( iXYZ_up , : ) ;



%%
rhoW1 = Vars_upstream_tmp2(:,1,:,4) ./ fluid_R ; 
rhoW2 = Vars_upstream_tmp2(:,end,:,4) ./ fluid_R ; 


[~,rhoInd,~] = intersect( vars , 0 ) ;
if ~isempty(pInd)
    rho = Vars_upstream_tmp(:,:,:,rhoInd) ;
else
    rho = ones( size( Vars_upstream_tmp(:,:,:,1) ) );
end
rho = cat( 2 , rhoW1 , rho , rhoW2 ) ;

%%
T = Vars_upstream_tmp2(:,:,:,4) ./ ( rho * fluid_R ) ;
mu = fluid_mu * T.^(3/4) ;


%%
rho = reshape( rho , length(iXYZ_up) , 1 );
rho = rho(iXYZ_up , 1 ) ;

mu  = reshape( mu , length(iXYZ_up) , 1 );
mu  = mu(iXYZ_up , 1 ) ;
% %%
% Vars_upstream       = cat( 2 , Vars_upstream , zeros(length(Vars_upstream),1) ) ;

%%
clear Vars_upstream_tmp