%% computes nonlinear terms

function [ RS       , UiDtauJKdxK      , UiDmodTauJKdxK     , dUjTikDxk     , dUjmodTikDxk      , TikDujDxk     , UiP       , UiUjUk        , PgradU        , epsilon       ] = OF_BFS_nonlinterms_v140nec( ...
           RS_tmp   , UiDtauJKdxK_tmp  , UiDmodTauJKdxK_tmp , dUjTikDxk_tmp , dUjModTikDxk_tmp  , TikDujDxk_tmp , UiP_tmp   , UiUjUk_tmp    , PgradU_tmp    , epsilon_tmp   , ...
           Vars     , gradU            , divTauSgs          , divModTauSgs  , tauSgs            , modTauSgs , divOperator2D ) 
    
%%
RS      = nonlin2vvS_v100( RS_tmp , Vars(:,1:3,:) );

%%
UiP     = UiP_tmp       - Vars(:,4,:) .* Vars(:,1:3,:) ;
PgradU  = PgradU_tmp    - Vars(:,4,:) .* gradU ;

UiUjUk  = nonlin3vvvS_v100( UiUjUk_tmp , Vars(:,1:3,:) , RS );

%%
ferfer  = reshape(gradU, size(gradU,1),3,3,[]);
epsilon = epsilon_tmp - nonlin2ttC_tmp_v100(ferfer) ;

%%
UiDtauJKdxK     = nonlin2vvA_v100( UiDtauJKdxK_tmp      , Vars(:,1:3,:) , divTauSgs );
UiDmodTauJKdxK  = nonlin2vvA_v100( UiDmodTauJKdxK_tmp   , Vars(:,1:3,:) , divModTauSgs );

%%
dUjTikDxk       = dUjTikDxk_tmp     - dUjTikDxk_v101( Vars(:,1:3,:) , tauSgs    , divOperator2D ) ;
dUjmodTikDxk    = dUjModTikDxk_tmp  - dUjTikDxk_v101( Vars(:,1:3,:) , modTauSgs , divOperator2D ) ;

TikDujDxk   = TikDujDxk_tmp - TikDujDxk_v101( gradU , tauSgs ) ;
