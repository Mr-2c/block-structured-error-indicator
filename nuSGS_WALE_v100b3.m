function [ nuSGS_WALE , delta_LES ] = nuSGS_WALE_v100b3( gradU_wholeDomain , An_wholeDomain , dX , which_lengthScale )

nuSGS_WALE_velScale_wholeDomain = nuSGS_WALE_velScale_v100b1( gradU_wholeDomain )  ;


if strcmpi( which_lengthScale , 'lsq' )
    delta_LES = lengthScale_LSQ_v100b1( gradU_wholeDomain , dX ) ;
elseif strcmpi( which_lengthScale , 'vol' )
    delta_LES = prod(dX,2).^(1/3) ;
elseif strcmpi( which_lengthScale , 'max' )
    delta_LES = max( dX , [] , 2 ) ;
elseif strcmpi( which_lengthScale , 'omegaTilde' )
    delta_LES = lengthScale_omegaTilde_v100b1( gradU_wholeDomain , dX ) ;
elseif strcmpi( which_lengthScale , 'An' )
    delta_LES = lengthScale_An_v100b1( An_wholeDomain , dX ) ;
else
    warning([ which_lengthScale , ' is not defined as a length scale!']) ;
    disp('I am returning cube root of the cell volume as length scale, just so the code keeps running...')
    delta_LES = prod(dX,2).^(1/3) ;
end

nuSGS_WALE = (.4 * delta_LES).^2 .* nuSGS_WALE_velScale_wholeDomain ;