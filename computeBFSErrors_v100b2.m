function [ ...
    EintRef_tot  , sigma_EintRef_tot  , EintRef_pWeighted_tot  , EintRef_hypTest_tot  , sigma_EintRef_hypTest_tot  ,   ...
    epsTotal_ref , sigma_epsTotal_ref , epsTotal_pWeighted_ref , epsTotal_hypTest_ref , sigma_epsTotal_hypTest_ref ] = ...
computeBFSErrors_v100b2( ...
    Qref_upstream_interp , Qref_downstream_interp , cfRef_up_interp , cfRef_down_interp , cpRef_up_interp , cpRef_down_interp , ...
    Qref_upstream_std_interp , Qref_downstream_std_interp , cfRef_up_std_interp , cfRef_down_std_interp , cpRef_up_std_interp , cpRef_down_std_interp , ...
    Q_upstream_interp , Q_downstream_interp , BL_cf_interp , DN_cf_interp , BL_cp_interp , DN_cp_interp , ...
    Q_upstream_std_interp , Q_downstream_std_interp , BL_cf_std_interp , DN_cf_std_interp , BL_cp_std_interp , DN_cp_std_interp , ...
    nSamples_ref , nSamples_this , nullHypothesis_value , test_level , confidence_level , equalSigmas , ...
    Qbar_ref , xyArea_up , xyArea_down , Lx_up,Lx_down , ...
    X_up_int , Y_up_int , X_down_int , Y_down_int )

%%
if nullHypothesis_value ~= 0
    warning('You should really test with "nullHypothesis_value=0" only!')
    nullHypothesis_value = 0;
    warning('But no worries, I have set it to zero myself!');
end

p_CI = 1 - ( 1 - confidence_level ) /2 ;


%%
if strcmpi( equalSigmas , 'yes')
    Sp          = @(n1,n2,s1,s2) sqrt( (n1-1) * s1.^2 + (n2-1) * s2.^2 ) ./ sqrt(n1+n2-2) ;
    S_t         = @(n1,n2,s1,s2) Sp(n1,n2,s1,s2) * sqrt( 1/n1 + 1/n2 ) ;
    dof_t       = @(n1,n2,s1,s2) n1+n2 - 2 ;    % s1 and s2 are for the sake of consistency with the other dof_t
    
else
    S_t         = @(n1,n2,s1,s2) sqrt( (s1.^2)/n1 + (s2.^2)/n2 ) ;
    
    dof_t_num   = @(n1,n2,s1,s2) S_t(n1,n2,s1,s2).^2 ;
    dof_t_den   = @(n1,s1) (s1.^2/n1).^2 / (n1-1) ;
    dof_t_real  = @(n1,n2,s1,s2) dof_t_num(n1,n2,s1,s2) ./ ( dof_t_den(n1,s1) + dof_t_den(n2,s2) ) ;
    dof_t       = @(n1,n2,s1,s2) floor( dof_t_real(n1,n2,s1,s2) ) ;
end

theT            = @(n1,n2,s1,s2,xbar1,xbar2,d0) (xbar1-xbar2-d0) ./ S_t(n1,n2,s1,s2) ;
cdf_of_theT     = @(n1,n2,s1,s2,xbar1,xbar2,d0) tcdf( abs( theT(n1,n2,s1,s2,xbar1,xbar2,d0) ) , dof_t(n1,n2,s1,s2) ) ;
theP            = @(n1,n2,s1,s2,xbar1,xbar2,d0) 2 * ( 1 - cdf_of_theT(n1,n2,s1,s2,xbar1,xbar2,d0) ) ;
sigmaCoeff_t    = @(n1,n2,s1,s2)                tinv( p_CI , dof_t(n1,n2,s1,s2) ) ;

%%
% theT_Q_up       = theT( nSamples_ref,nSamples_this , Qref_upstream_std_interp , Q_upstream_std_interp , Qref_upstream_interp , Q_upstream_interp , nullHypothesis_value ) ;
% theT_cf_up      = theT( nSamples_ref,nSamples_this , cfRef_up_std_interp , BL_cf_std_interp , cfRef_up_interp , BL_cf_interp , nullHypothesis_value ) ;
% theT_cp_up      = theT( nSamples_ref,nSamples_this , cpRef_up_std_interp , BL_cp_std_interp , cpRef_up_interp , BL_cp_interp , nullHypothesis_value ) ;
% 
% theT_Q_down     = theT( nSamples_ref,nSamples_this , Qref_downstream_std_interp , Q_downstream_std_interp , Qref_downstream_interp , Q_downstream_interp , nullHypothesis_value ) ;
% theT_cf_down 	  = theT( nSamples_ref,nSamples_this , cfRef_down_std_interp , DN_cf_std_interp , cfRef_down_interp , DN_cf_interp , nullHypothesis_value ) ;
% theT_cp_down 	  = theT( nSamples_ref,nSamples_this , cpRef_down_std_interp , DN_cp_std_interp , cpRef_down_interp , DN_cp_interp , nullHypothesis_value ) ;

%%
dof_Q_up        = dof_t( nSamples_ref,nSamples_this , Qref_upstream_std_interp , Q_upstream_std_interp ) ;
dof_cf_up       = dof_t( nSamples_ref,nSamples_this , cfRef_up_std_interp , BL_cf_std_interp ) ;
dof_cp_up       = dof_t( nSamples_ref,nSamples_this , cpRef_up_std_interp , BL_cp_std_interp ) ;

dof_Q_down      = dof_t( nSamples_ref,nSamples_this , Qref_downstream_std_interp , Q_downstream_std_interp ) ;
dof_cf_down     = dof_t( nSamples_ref,nSamples_this , cfRef_down_std_interp , DN_cf_std_interp ) ;
dof_cp_down     = dof_t( nSamples_ref,nSamples_this , cpRef_down_std_interp , DN_cp_std_interp ) ;

%%
sigma_Q_up       = S_t( nSamples_ref,nSamples_this , Qref_upstream_std_interp , Q_upstream_std_interp ) ;
sigma_cf_up      = S_t( nSamples_ref,nSamples_this , cfRef_up_std_interp , BL_cf_std_interp ) ;
sigma_cp_up      = S_t( nSamples_ref,nSamples_this , cpRef_up_std_interp , BL_cp_std_interp ) ;

sigma_Q_down     = S_t( nSamples_ref,nSamples_this , Qref_downstream_std_interp , Q_downstream_std_interp ) ;
sigma_cf_down    = S_t( nSamples_ref,nSamples_this , cfRef_down_std_interp , DN_cf_std_interp ) ;
sigma_cp_down    = S_t( nSamples_ref,nSamples_this , cpRef_down_std_interp , DN_cp_std_interp ) ;

%%
sigmaCoeff_Q_up     = sigmaCoeff_t( nSamples_ref,nSamples_this , Qref_upstream_std_interp , Q_upstream_std_interp ) ;
sigmaCoeff_cf_up    = sigmaCoeff_t( nSamples_ref,nSamples_this , cfRef_up_std_interp , BL_cf_std_interp ) ;
sigmaCoeff_cp_up    = sigmaCoeff_t( nSamples_ref,nSamples_this , cpRef_up_std_interp , BL_cp_std_interp ) ;

sigmaCoeff_Q_down   = sigmaCoeff_t( nSamples_ref,nSamples_this , Qref_downstream_std_interp , Q_downstream_std_interp ) ;
sigmaCoeff_cf_down 	= sigmaCoeff_t( nSamples_ref,nSamples_this , cfRef_down_std_interp , DN_cf_std_interp ) ;
sigmaCoeff_cp_down 	= sigmaCoeff_t( nSamples_ref,nSamples_this , cpRef_down_std_interp , DN_cp_std_interp ) ;

sigmaCoeff_Q_up     = sigmaCoeff_Q_up   .* ones(size(Q_upstream_interp));
sigmaCoeff_Q_down   = sigmaCoeff_Q_down .* ones(size(Q_downstream_interp));

%%
theP_Q_up       = theP( nSamples_ref,nSamples_this , Qref_upstream_std_interp , Q_upstream_std_interp , Qref_upstream_interp , Q_upstream_interp , nullHypothesis_value ) ;
theP_cf_up      = theP( nSamples_ref,nSamples_this , cfRef_up_std_interp , BL_cf_std_interp , cfRef_up_interp , BL_cf_interp , nullHypothesis_value ) ;
theP_cp_up      = theP( nSamples_ref,nSamples_this , cpRef_up_std_interp , BL_cp_std_interp , cpRef_up_interp , BL_cp_interp , nullHypothesis_value ) ;

theP_Q_down     = theP( nSamples_ref,nSamples_this , Qref_downstream_std_interp , Q_downstream_std_interp , Qref_downstream_interp , Q_downstream_interp , nullHypothesis_value ) ;
theP_cf_down 	= theP( nSamples_ref,nSamples_this , cfRef_down_std_interp , DN_cf_std_interp , cfRef_down_interp , DN_cf_interp , nullHypothesis_value ) ;
theP_cp_down 	= theP( nSamples_ref,nSamples_this , cpRef_down_std_interp , DN_cp_std_interp , cpRef_down_interp , DN_cp_interp , nullHypothesis_value ) ;

%% at the walls where the velocity and RS are zero the probibilities are nan. 
%% This is a fix for those regions. I have added cp and cf with no real reason.
theP_Q_up( isnan(theP_Q_up) )   = 1 ;
theP_cf_up( isnan(theP_cf_up) ) = 1 ;
theP_cp_up( isnan(theP_cp_up) ) = 1 ;

theP_Q_down( isnan(theP_Q_down) )   = 1 ;
theP_cf_down( isnan(theP_cf_down) ) = 1 ;
theP_cp_down( isnan(theP_cp_down) ) = 1 ;

%%
delQ_up         = Q_upstream_interp - Qref_upstream_interp ;
delCf_up        = BL_cf_interp - cfRef_up_interp ;
delCp_up        = BL_cp_interp - cpRef_up_interp ;

delQ_down       = Q_downstream_interp - Qref_downstream_interp ;
delCf_down      = DN_cf_interp - cfRef_down_interp ;
delCp_down      = DN_cp_interp - cpRef_down_interp ;

%%
for j=1:size(Qref_upstream_interp,3)  
    
    Eref_up(:,:,j)     = abs( delQ_up(:,:,j) )   / Qbar_ref(j);
    Eref_down(:,:,j)   = abs( delQ_down(:,:,j) ) / Qbar_ref(j);
    
    sigma_Eref_up(:,:,j)    = abs( sigma_Q_up(:,:,j) )   / Qbar_ref(j);
    sigma_Eref_down(:,:,j)  = abs( sigma_Q_down(:,:,j) ) / Qbar_ref(j);
    
    
    EintRef_up(j)                   = trapz( X_up_int   , trapz( Y_up_int   , abs( Eref_up(:,:,j))   , 2 ) , 1 )/(xyArea_up+xyArea_down);
    EintRef_down(j)                 = trapz( X_down_int , trapz( Y_down_int , abs( Eref_down(:,:,j)) , 2 ) , 1 )/(xyArea_up+xyArea_down);
    
    sigma_EintRef_up(j)             = trapz( X_up_int   , trapz( Y_up_int   , abs( sigma_Eref_up(:,:,j))    .* sigmaCoeff_Q_up(:,:,j)   , 2 ) , 1 )/(xyArea_up+xyArea_down);
    sigma_EintRef_down(j)           = trapz( X_down_int , trapz( Y_down_int , abs( sigma_Eref_down(:,:,j))  .* sigmaCoeff_Q_down(:,:,j) , 2 ) , 1 )/(xyArea_up+xyArea_down);
    
    
    EintRef_pWeighted_up(j)         = trapz( X_up_int   , trapz( Y_up_int   , abs(Eref_up(:,:,j))     .* (1-theP_Q_up(:,:,j)) , 2 ) , 1 )/(xyArea_up+xyArea_down);
    EintRef_pWeighted_down(j)       = trapz( X_down_int , trapz( Y_down_int , abs(Eref_down(:,:,j))   .* (1-theP_Q_down(:,:,j)) , 2 ) , 1 )/(xyArea_up+xyArea_down);
    
    EintRef_hypTest_up(j)           = trapz( X_up_int   , trapz( Y_up_int   , abs(Eref_up(:,:,j))     .* ( theP_Q_up(:,:,j)   < test_level ) , 2 ) , 1 )/(xyArea_up+xyArea_down);
    EintRef_hypTest_down(j)         = trapz( X_down_int , trapz( Y_down_int , abs(Eref_down(:,:,j))   .* ( theP_Q_down(:,:,j) < test_level ) , 2 ) , 1 )/(xyArea_up+xyArea_down);
    
    sigma_EintRef_hypTest_up(j)    	= trapz( X_up_int   , trapz( Y_up_int   , abs( sigma_Eref_up(:,:,j))    .* sigmaCoeff_Q_up(:,:,j)   .* ( theP_Q_up(:,:,j)   < test_level ) , 2 ) , 1 )/(xyArea_up+xyArea_down);
    sigma_EintRef_hypTest_down(j)	= trapz( X_down_int , trapz( Y_down_int , abs( sigma_Eref_down(:,:,j))  .* sigmaCoeff_Q_down(:,:,j) .* ( theP_Q_down(:,:,j) < test_level ) , 2 ) , 1 )/(xyArea_up+xyArea_down);
    
end

%%
EintRef_up(7)               = trapz( X_up_int   , abs( delCf_up ) ) / Qbar_ref(7) / (Lx_up+Lx_down) ;
EintRef_down(7)             = trapz( X_down_int , abs( delCf_down ) ) / Qbar_ref(7) / (Lx_up+Lx_down) ;

sigma_EintRef_up(7)         = trapz( X_up_int   , abs( sigma_cf_up )   .* sigmaCoeff_cf_up   ) / Qbar_ref(7) / (Lx_up+Lx_down) ;
sigma_EintRef_down(7)      	= trapz( X_down_int , abs( sigma_cf_down ) .* sigmaCoeff_cf_down ) / Qbar_ref(7) / (Lx_up+Lx_down) ;

EintRef_pWeighted_up(7)     = trapz( X_up_int   , abs( delCf_up    ) .* (1-theP_cf_up)   ) / Qbar_ref(7) / (Lx_up+Lx_down) ;
EintRef_pWeighted_down(7)   = trapz( X_down_int , abs( delCf_down  ) .* (1-theP_cf_down) ) / Qbar_ref(7) / (Lx_up+Lx_down) ;

EintRef_hypTest_up(7)       = trapz( X_up_int   , abs( delCf_up   ) .* ( theP_cf_up   < test_level ) ) / Qbar_ref(7) / (Lx_up+Lx_down) ;
EintRef_hypTest_down(7)     = trapz( X_down_int , abs( delCf_down ) .* ( theP_cf_down < test_level ) ) / Qbar_ref(7) / (Lx_up+Lx_down) ;

sigma_EintRef_hypTest_up(7)         = trapz( X_up_int   , abs( sigma_cf_up )   .* sigmaCoeff_cf_up   .* ( theP_cf_up   < test_level ) ) / Qbar_ref(7) / (Lx_up+Lx_down) ;
sigma_EintRef_hypTest_down(7)      	= trapz( X_down_int , abs( sigma_cf_down ) .* sigmaCoeff_cf_down .* ( theP_cf_down < test_level ) ) / Qbar_ref(7) / (Lx_up+Lx_down) ;


%%
EintRef_up(8)               = trapz( X_up_int   , abs( delCp_up ) ) / Qbar_ref(8) / (Lx_up+Lx_down) ;
EintRef_down(8)             = trapz( X_down_int , abs( delCp_down ) ) / Qbar_ref(8) / (Lx_up+Lx_down) ;

sigma_EintRef_up(8)         = trapz( X_up_int   , abs( sigma_cp_up )   .* sigmaCoeff_cp_up   ) / Qbar_ref(8) / (Lx_up+Lx_down) ;
sigma_EintRef_down(8)      	= trapz( X_down_int , abs( sigma_cp_down ) .* sigmaCoeff_cp_down ) / Qbar_ref(8) / (Lx_up+Lx_down) ;

EintRef_pWeighted_up(8)     = trapz( X_up_int   , abs( delCp_up   ) .* (1-theP_cp_up) )   / Qbar_ref(8) / (Lx_up+Lx_down) ;
EintRef_pWeighted_down(8)   = trapz( X_down_int , abs( delCp_down ) .* (1-theP_cp_down) ) / Qbar_ref(8) / (Lx_up+Lx_down) ;

EintRef_hypTest_up(8)       = trapz( X_up_int   , abs( delCp_up   ) .* ( theP_cp_up   < test_level ) ) / Qbar_ref(8) / (Lx_up+Lx_down) ;
EintRef_hypTest_down(8)     = trapz( X_down_int , abs( delCp_down ) .* ( theP_cp_down < test_level ) ) / Qbar_ref(8) / (Lx_up+Lx_down) ;

sigma_EintRef_hypTest_up(8)     = trapz( X_up_int   , abs( sigma_cp_up )   .* sigmaCoeff_cp_up   .* ( theP_cp_up   < test_level ) ) / Qbar_ref(8) / (Lx_up+Lx_down) ;
sigma_EintRef_hypTest_down(8)   = trapz( X_down_int , abs( sigma_cp_down ) .* sigmaCoeff_cp_down .* ( theP_cp_down < test_level ) ) / Qbar_ref(8) / (Lx_up+Lx_down) ;


%%
EintRef_tot                 = EintRef_up + EintRef_down ;
epsTotal_ref                = ( mean( EintRef_tot(1:2) ) + mean( EintRef_tot(3:6) ) + mean( EintRef_tot(7:end) ) )/3 ;

sigma_EintRef_tot           = sigma_EintRef_up + sigma_EintRef_down ;
sigma_epsTotal_ref          = ( mean( sigma_EintRef_tot(1:2) ) + mean( sigma_EintRef_tot(3:6) ) + mean( sigma_EintRef_tot(7:end) ) )/3 ;


EintRef_pWeighted_tot       = EintRef_pWeighted_up + EintRef_pWeighted_down ;
epsTotal_pWeighted_ref      = ( mean( EintRef_pWeighted_tot(1:2) ) + mean( EintRef_pWeighted_tot(3:6) ) + mean( EintRef_pWeighted_tot(7:end) ) )/3 ;

EintRef_hypTest_tot         = EintRef_hypTest_up + EintRef_hypTest_down ;
epsTotal_hypTest_ref        = ( mean( EintRef_hypTest_tot(1:2) ) + mean( EintRef_hypTest_tot(3:6) ) + mean( EintRef_hypTest_tot(7:end) ) )/3 ;

sigma_EintRef_hypTest_tot   = sigma_EintRef_hypTest_up + sigma_EintRef_hypTest_down ;
sigma_epsTotal_hypTest_ref  = ( mean( sigma_EintRef_hypTest_tot(1:2) ) + mean( sigma_EintRef_hypTest_tot(3:6) ) + mean( sigma_EintRef_hypTest_tot(7:end) ) )/3 ;

