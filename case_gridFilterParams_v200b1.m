function [ Nmin_up,Nmin_down , Nz_averagable , gridFilter_maxDist , x_bounds ] = ...
    case_gridFilterParams_v200b1(which_case , which_grid)

%%
if strcmpi(which_case,'BFS')

    %%
    x_bounds{1}                = [-20 , 0] ;
    x_bounds{2}                = [0 , 25] ;

    %%
    if ~ischar(which_grid)
    if (which_grid-300250)>=0  && (which_grid-300250)<10 
        Nmin_up             = [ 50 , 20 , 16 ] ;
        Nmin_down           = [ 50 , 24 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;

    elseif (which_grid-312250)>=0  && (which_grid-312250)<10 
        Nmin_up             = [ 10 , 5 , 16 ] ;
        Nmin_down           = [ 10 , 5 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;
        
    elseif (which_grid-313250)>=0  && (which_grid-313250)<10 
        Nmin_up             = [ 10 , 5 , 16 ] ;
        Nmin_down           = [ 10 , 5 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;
        
    elseif ( (which_grid-31200250)>=0  && (which_grid-31200250)<10 ) || which_grid==312002541 || which_grid==312002521
        Nmin_up             = [ 3 , 3 , 16 ] ;
        Nmin_down           = [ 3 , 3 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;

    elseif (which_grid-311250)>=0  && (which_grid-311250)<10 
        Nmin_up             = [ 50 , 20 , 16 ] ;
        Nmin_down           = [ 50 , 24 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;

    elseif (which_grid-310250)>=0  && (which_grid-310250)<10 
        Nmin_up             = [ 50 , 20 , 16 ] ;
        Nmin_down           = [ 50 , 24 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;
        
    elseif (which_grid-312001250)>=0  && (which_grid-312001250)<10 
        Nmin_up             = [ 50 , 20 , 16 ] ;
        Nmin_down           = [ 50 , 24 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;

%     elseif which_grid==312202
%         Nmin_up             = [ 50 , 20 , 15 ] ;
%         Nmin_down           = [ 50 , 25 , 15 ] ;
%         Nz_averagable       = 20 ;
%         gridFilter_maxDist  = .21 ;

    elseif (which_grid-312100)>=0  && (which_grid-312100)<10 
    %     Nmin_up             = [ 50 , 20 , 40 ] ;
    %     Nmin_down           = [ 50 , 20 , 40 ] ;
    %     Nz_averagable       = 40 ;
    %     gridFilter_maxDist  = .11 ;
        Nmin_up             = [ 20 , 10 , 30 ] ;
        Nmin_down           = [ 20 , 10 , 30 ] ;
        Nz_averagable       = 20 ;
        gridFilter_maxDist  = .11 ;

    elseif which_grid==3122541
        Nmin_up             = [ 50 , 20 , 16 ] ;
        Nmin_down           = [ 50 , 24 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;

    elseif which_grid==3122540
        Nmin_up             = [ 50 , 20 , 16 ] ;
        Nmin_down           = [ 50 , 24 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;

    elseif which_grid==1801 || which_grid==1802 || which_grid==1803
        Nmin_up             = [ 0 , 0 , 20 ] ;
        Nmin_down           = [ 0 , 0 , 20 ] ;
        Nz_averagable       = 20 ;
        gridFilter_maxDist  = .21 ;

    elseif which_grid>=312*10^12
        Nmin_up             = [ 10 , 5 , 16 ] ;
        Nmin_down           = [ 10 , 5 , 16 ] ;
        Nz_averagable       = 15 ;
        gridFilter_maxDist  = .26 ;
        
    else
    %     Nmin_up             = [ 50 , 25 , 20 ] ;
    %     Nmin_down           = [ 50 , 30 , 20 ] ;
    %     Nz_averagable       = 20 ;
    %     gridFilter_maxDist  = .21 ;

        Nmin_up             = [ 10 , 5 , 20 ] ;
        Nmin_down           = [ 10 , 5 , 20 ] ;
        Nz_averagable       = 19 ;
        gridFilter_maxDist  = .21 ;
    end
    
    else
        
        if strcmpi( which_grid(end) , 'b') || strcmpi( which_grid(end) , 's') || strcmpi( which_grid(end) , 'a') || ...
                strcmpi( which_grid(end-1:end) , 'sr') || strcmpi( which_grid(end-1:end) , 'ar')  || strcmpi( which_grid(end-1:end) , 'An') || ...
                strcmpi( which_grid , 'BFSv312_DNS37m')
            Nmin_up             = [ 10 , 5 , 20 ] ;
            Nmin_down           = [ 10 , 5 , 20 ] ;
            Nz_averagable       = 19 ;
            gridFilter_maxDist  = .21 ;
            
        elseif strcmpi( which_grid(end-1:end) , 'ec' )
            Nmin_up             = [ 5 , 5 , 20 ] ;
            Nmin_down           = [ 5 , 5 , 20 ] ;
            Nz_averagable       = 19 ;
            gridFilter_maxDist  = .81 ;
            
        elseif strcmpi( which_grid(end) , 'c') || strcmpi( which_grid(end-1:end) , 'cr')
            Nmin_up             = [ 10 , 5 , 16 ] ;
            Nmin_down           = [ 10 , 5 , 16 ] ;
            Nz_averagable       = 15 ;
            gridFilter_maxDist  = .26 ;
            
        end
    end

    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif strcmpi(which_case,'OFchannel')

    %%
    x_bounds{1}         = [-20 , 0] ;
    x_bounds{2}         = [0 , 25] ;
    Nmin_up             = [ 10 , 5 , 20 ] ;
    Nmin_down           = [ 10 , 5 , 20 ] ;
    Nz_averagable       = 19 ;
    gridFilter_maxDist  = .21 ;
        
    
elseif strcmpi(which_case,'LES20000_v010')
    %%
    x_bounds{1}         = [0 , 5] ;
    x_bounds{2}         = [5 , 10] ;
    Nmin_up             = [ 40 , 2 , 12 ] ;
    Nmin_down           = [ 40 , 2 , 12 ] ;
    Nz_averagable       = 11 ;
    gridFilter_maxDist  = .26 ;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
elseif strcmpi(which_case,'hybridWMLES200k')
    %%
    x_bounds{1}            = [0 , 13] ;
    x_bounds{2}            = [0 , 13] ;
    
    Nmin_up             = [ 0 , 0 , 0 ] ;
    Nmin_down           = [ 0 , 0 , 0 ] ;
    Nz_averagable       = 0 ;
    gridFilter_maxDist  = inf ;
    
elseif strcmpi(which_case,'hybridWMLES250k') || strcmpi( which_case , 'jan-erik' )
    %%
    x_bounds{1}            = [0 , 10] ;
    x_bounds{2}            = [0 , 10] ;
    
    Nmin_up             = [ 0 , 0 , 0 ] ;
    Nmin_down           = [ 0 , 0 , 0 ] ;
    Nz_averagable       = 0 ;
    gridFilter_maxDist  = inf ;
    
elseif strcmpi(which_case,'hybridDNS')
    if which_grid==395
        x_bounds{1}            = [0 , 12] ;
        x_bounds{2}            = [0 , 12] ;
    end
    Nmin_up             = [ 0 , 0 , 0 ] ;
    Nmin_down           = [ 0 , 0 , 0 ] ;
    Nz_averagable       = 0 ;
    gridFilter_maxDist  = inf ;
    
elseif strcmpi(which_case,'hybridLES') || strcmpi(which_case,'hybridLES20000') || ...
        strcmpi(which_case,'LES20000M02_v010') || strcmpi(which_case,'LES20000M02_v030') || ...
        strcmpi(which_case,'LES20000M02_v030_2nd') || strcmpi(which_case,'LES20000M02_v030_H2a3') || ...
        strcmpi(which_case,'LES20000M02_v040_H2') || strcmpi(which_case,'LES20000M02_v030_H2a2b3') || ...
        strcmpi(which_case,'LES20000M02_v030_H2a2b2_equivAnDX') || strcmpi(which_case,'LES20000M02_v030_H2a2b5') || ...
        strcmpi(which_case,'LES20000M02_v060_H2a2b5') || strcmpi(which_case,'LES20000M02_v061_H2a2b5') || ...
        strcmpi(which_case,'LES20000M02_v062_H6a2b5') || strcmpi(which_case,'LES20000M02_v062_H6a2b5_vreman') || ...
        strcmpi(which_case,'LES20000M02_v062_H6a2b5_noSGS') || strcmpi( which_case ,'LES20000M02_v062_H6a2b5_verification' ) || ...
        strcmpi( which_case , 'LES_ReTau5200' ) || strcmpi(which_case,'LES20000M02_v062_H6a2b5_WALE')
%     if which_grid==30000+220*270*80
        x_bounds{1}            = [0 , 10] ;
        x_bounds{2}            = [0 , 10] ;
%     end
    Nmin_up             = [ 0 , 0 , 0 ] ;
    Nmin_down           = [ 0 , 0 , 0 ] ;
    Nz_averagable       = 0 ;
    gridFilter_maxDist  = inf ;
end