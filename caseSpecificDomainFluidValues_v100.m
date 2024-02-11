function [   fluid_rho , fluid_nu , fluid_R , fluid_gamma , ...
    Lx , Lz , x_Pref , case_stepPosition ] = ...
caseSpecificDomainFluidValues_v100( which_case )


if strcmpi(which_case,'BFS')
    fluid_rho           = 1 ;
    fluid_nu            = 1/5100 ;
    x_Pref              = -5.2 ;
    Lz                  = 4 ;
    case_stepPosition   = [0 0];
    Lx                  = [];
    fluid_R             = [];
    fluid_gamma         = [];
    
elseif strcmpi(which_case,'OFchannel')
    fluid_rho           = 1 ;
    fluid_nu            = 4e-05 ;
    x_Pref              = 0 ;
    Lz                  = 3 ;
    Lx                  = 10 ;
    case_stepPosition   = [Lx/2 0] ;
    fluid_R             = [];
    fluid_gamma         = [];
    
elseif strcmpi(which_case,'LES20000_v010')
    fluid_rho           = 1 ;
    fluid_nu            = 1e-04 ;
    x_Pref              = 0 ;
    Lz                  = 3 ;
    Lx                  = 10 ;
    case_stepPosition   = [Lx/2 0] ;
    fluid_R             = [];
    fluid_gamma         = [];
    
elseif strcmpi(which_case,'hybridWMLES200k')
    fluid_rho           = 1 ;
    fluid_nu            = 0.00000500 ;
    fluid_R             = 2.85714 ;
    fluid_gamma         = 1.4 ;
    x_Pref              = 0 ;
    Lz                  = 5 ;
    Lx                  = 13 ;
    case_stepPosition   = [Lx/2 0] ;
    
elseif strcmpi(which_case,'hybridWMLES250k') || strcmpi( which_case , 'LES_ReTau5200' )
    fluid_rho           = 1 ;
    fluid_nu            = 0.00000800 ;
    fluid_R             = 17.8571 ;
    fluid_gamma         = 1.4 ;
    x_Pref              = 0 ;
    Lz                  = 3 ;
    Lx                  = 10 ;
    case_stepPosition   = [Lx/2 0] ;
    
elseif strcmpi( which_case , 'jan-erik' )
    fluid_rho           = 1 ;
    fluid_nu            = 0.00000800 ;
    fluid_R             = 2.8571 ;
    fluid_gamma         = 1.4 ;
    x_Pref              = 0 ;
    Lz                  = 4.8 ;
    Lx                  = 12.8 ;
    case_stepPosition   = [Lx/2 0] ;
    
    
elseif strcmpi(which_case,'hybridDNS')
    if which_grid==395
        fluid_rho           = 1 ;
        fluid_nu            = 0.00015 ;
        fluid_R             = 7.9365 ;
        fluid_gamma         = 1.4 ;
        x_Pref              = 0 ;
        Lz                  = 4 ;
        Lx                  = 12 ;
    end
    case_stepPosition   = [Lx/2 0] ;
    
elseif strcmpi(which_case,'hybridLES')
    fluid_rho           = 1 ;
    fluid_nu            = 0.0000666667 ;
    fluid_R             = 1.1161 ;
    fluid_gamma         = 1.4 ;
    x_Pref              = 0 ;
    Lz                  = 3 ;
    Lx                  = 10 ;
    case_stepPosition   = [Lx/2 0] ;
    
elseif strcmpi(which_case,'hybridLES20000')
    if which_grid==30000+96*60*96+6 || which_grid==30000+96*60*96+2
        fluid_rho           = 1 ;
        fluid_nu            = 0.0000666667 ;
        fluid_R             = 1.1161 ;
        fluid_gamma         = 1.4 ;
        x_Pref              = 0 ;
        Lz                  = 3 ;
        Lx                  = 10 ;
        case_stepPosition   = [Lx/2 0] ;
    end
    if strcmpi(which_setup,'Re20000M04') || strcmpi(which_setup,'Re20000M013') || strcmpi(which_setup,'Re20000M02')
        fluid_rho           = 1 ;
        fluid_nu            = 0.0001 ;
        fluid_gamma         = 1.4 ;
        x_Pref              = 0 ;
        Lz                  = 3 ;
        Lx                  = 10 ;
        case_stepPosition   = [Lx/2 0] ;
    end
    
    if strcmpi(which_setup,'Re20000M04')
        fluid_R             = 4.4642857 ;
    elseif strcmpi(which_setup,'Re20000M02')
        fluid_R             = 4.4642857 * 4 ;
    elseif strcmpi(which_setup,'Re20000M013')
        fluid_R             = 4.4642857 * 9 ;
    end
    
elseif strcmpi(which_case,'LES20000M02_v010') || strcmpi(which_case,'LES20000M02_v030') || ...
        strcmpi(which_case,'LES20000M02_v030_2nd') || strcmpi(which_case,'LES20000M02_v030_H2a3') || ...
        strcmpi(which_case,'LES20000M02_v040_H2') || strcmpi(which_case,'LES20000M02_v030_H2a2b3') || ...
        strcmpi(which_case,'LES20000M02_v030_H2a2b2_equivAnDX') || strcmpi(which_case,'LES20000M02_v030_H2a2b5') || ...
        strcmpi(which_case,'LES20000M02_v060_H2a2b5') || strcmpi(which_case,'LES20000M02_v061_H2a2b5') || ...
        strcmpi(which_case,'LES20000M02_v062_H6a2b5') || strcmpi(which_case,'LES20000M02_v062_H6a2b5_vreman') || ...
        strcmpi(which_case,'LES20000M02_v062_H6a2b5_noSGS') || strcmpi( which_case ,'LES20000M02_v062_H6a2b5_verification' ) || ...
        strcmpi(which_case,'LES20000M02_v062_H6a2b5_WALE')
    fluid_rho           = 1 ;
    fluid_nu            = 0.0001 ;
    fluid_gamma         = 1.4 ;
    fluid_R             = 4.4642857 * 4 ;
    x_Pref              = 0 ;
    Lz                  = 3 ;
    Lx                  = 10 ;
    case_stepPosition   = [Lx/2 0] ;
end