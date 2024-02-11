function [ numMajorBatch , numMinorBatch , snapPerMinorBatch ] = ...
    case_minorMajorNumbers_v200b1( which_case , which_grid )


if strcmpi(which_case,'BFS')
if ~ischar(which_case)
    %%
    if which_grid==0
        numMajorBatch       = 4 ;
        numMinorBatch       = 20 ;
        snapPerMinorBatch   = 100 ;
    elseif which_grid==31 || which_grid==32 || which_grid==41
        numMajorBatch       = 1 ;
        numMinorBatch       = 5 ;
        snapPerMinorBatch   = 40 ;
    elseif which_grid==312000
        numMajorBatch       = 2 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 8 ;

    elseif which_grid==3122540
        numMajorBatch       = 2 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 9 ;

    % elseif which_grid==3122541
    %     numMajorBatch       = 2 ;
    %     numMinorBatch       = 4 ;
    %     snapPerMinorBatch   = 50 ;
    elseif which_grid==3122030
        numMajorBatch       = 1 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 47 ;

    elseif which_grid==312101
        numMajorBatch       = 2 ;
        numMinorBatch       = 10 ;
        snapPerMinorBatch   = 39 ;
    elseif which_grid==312103
        numMajorBatch       = 2 ;
        numMinorBatch       = 6 ;
        snapPerMinorBatch   = 63 ;
    elseif which_grid==312104 
        numMajorBatch       = 2 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 70 ;

    % elseif which_grid==1803
    %     numMajorBatch       = 2 ;
    %     numMinorBatch       = 4 ;
    %     snapPerMinorBatch   = 50 ;

    elseif which_grid==1501 || which_grid==1502
        numMajorBatch       = 1 ;
        numMinorBatch       = 1 ;
        snapPerMinorBatch   = 40 ;

    elseif which_grid==1201
        numMajorBatch       = 2 ;
        numMinorBatch       = 8 ;
        snapPerMinorBatch   = 40 ;
    % elseif which_grid==1304
    %     numMajorBatch       = 2 ;
    %     numMinorBatch       = 4 ;
    %     snapPerMinorBatch   = 36 ;


    % elseif which_grid==1502
    %     numMajorBatch       = 2 ;
    %     numMinorBatch       = 6 ;
    %     snapPerMinorBatch   = 50 ;
    % elseif which_grid==1702
    %     numMajorBatch       = 2 ;
    %     numMinorBatch       = 4 ;
    %     snapPerMinorBatch   = 50 ;
    elseif which_grid==31210001
        numMajorBatch       = 1 ;
        numMinorBatch       = 1 ;
        snapPerMinorBatch   = 205 ;
    elseif which_grid==312001202
        numMajorBatch       = 2 ;
        numMinorBatch       = 8 ;
        snapPerMinorBatch   = 40 ;
        
    elseif which_grid==3132031
        numMajorBatch       = 1 ;
        numMinorBatch       = 1 ;
        snapPerMinorBatch   = 400 ;
        
    elseif which_grid>=312*10^12
        numMajorBatch       = 1 ;
        numMinorBatch       = 1 ;
        snapPerMinorBatch   = 40 ;
            
    else
        numMajorBatch       = 2 ;
        numMinorBatch       = 10 ;
        snapPerMinorBatch   = 40 ;
    end
else
    if strcmpi( which_grid(8) , 'l' )
        numMajorBatch       = 4 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 250 ;
    elseif strcmpi( which_grid , 'BFSv320m_Gn07fDNS')
        numMajorBatch       = 1 ;
        numMinorBatch       = 7 ;
        snapPerMinorBatch   = 2 ;
    elseif strcmpi( which_grid(8) , 'm' )
        if strcmpi( which_grid , 'BFSv320m_LES01b' )
            numMajorBatch       = 4 ;
            numMinorBatch       = 8 ;
            snapPerMinorBatch   = 1 ;
        else
            numMajorBatch       = 4 ;
            numMinorBatch       = 20 ;
            snapPerMinorBatch   = 1 ;
        end
    elseif strcmpi( which_grid , 'BFSv312_LES04fb' ) || strcmpi( which_grid , 'BFSv312_DNS37m') 
        numMajorBatch       = 1 ;
        numMinorBatch       = 1 ;
        snapPerMinorBatch   = 400 ;
%     elseif strcmpi( which_grid(end-1) , '6' ) || strcmpi( which_grid(end-2) , '6' ) || ...
%            strcmpi( which_grid(end-1) , '7' ) || strcmpi( which_grid(end-2) , '7' ) || ...
%            strcmpi( which_grid(end-1) , '8' ) || strcmpi( which_grid(end-2) , '8' )
%         numMajorBatch       = 2 ;
%         numMinorBatch       = 2 ;
%         snapPerMinorBatch   = 200 ;
    else %if strcmpi( which_grid(end-1) , '5' ) 
        numMajorBatch       = 4 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 100 ;
%     else
%         numMajorBatch       = 2 ;
%         numMinorBatch       = 10 ;
%         snapPerMinorBatch   = 40 ;
    end
end

    
elseif strcmpi(which_case,'OFchannel') || strcmpi(which_case,'LES20000_v010')
    numMajorBatch       = 2 ;
    numMinorBatch       = 10 ;
    snapPerMinorBatch   = 40 ;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
elseif strcmpi(which_case,'hybridWMLES200k')
    
    if which_grid == 52*32*20
        numMajorBatch       = 1 ;
        numMinorBatch       = 5 ;
        snapPerMinorBatch   = 40 ;
    elseif which_grid == 104*16*40
        numMajorBatch       = 1 ;
        numMinorBatch       = 2 ;
        snapPerMinorBatch   = 40 ;
    elseif which_grid == 10^12
        numMajorBatch       = 1 ;
        numMinorBatch       = 5 ;
        snapPerMinorBatch   = 40 ;
    elseif which_grid == 10^12+1
        numMajorBatch       = 1 ;
        numMinorBatch       = 2 ;
        snapPerMinorBatch   = 40 ;
    end
    
elseif strcmpi(which_case,'hybridWMLES250k') 
    numMajorBatch       = 4 ;
    numMinorBatch       = 16 ;
    snapPerMinorBatch   = 46 ;

elseif strcmpi( which_case , 'jan-erik' )
    numMajorBatch       = 2 ;
    numMinorBatch       = 2 ;
    snapPerMinorBatch   = 1 ;
    
elseif strcmpi(which_case,'hybridDNS')
    if which_grid==395
        numMajorBatch       = 1 ;
        numMinorBatch       = 1 ;
        snapPerMinorBatch   = 7 ;
    end
 
    
elseif strcmpi( which_case , 'LES_ReTau5200' )
    numMajorBatch       = 4 ;
    numMinorBatch       = 16 ;
    snapPerMinorBatch   = 62 ;
    
elseif strcmpi(which_case,'LES20000M02_v010') || strcmpi(which_case,'LES20000M02_v030') || ...
        strcmpi(which_case,'LES20000M02_v030_2nd') || strcmpi(which_case,'LES20000M02_v030_H2a3') || ...
        strcmpi(which_case,'LES20000M02_v040_H2') || strcmpi(which_case,'LES20000M02_v030_H2a2b3') || ...
        strcmpi(which_case,'LES20000M02_v030_H2a2b2_equivAnDX') || strcmpi(which_case,'LES20000M02_v030_H2a2b5') || ...
        strcmpi(which_case,'LES20000M02_v060_H2a2b5') || strcmpi(which_case,'LES20000M02_v061_H2a2b5') || ...
        strcmpi(which_case,'LES20000M02_v062_H6a2b5') || strcmpi(which_case,'LES20000M02_v062_H6a2b5_vreman') || ...
        strcmpi(which_case,'LES20000M02_v062_H6a2b5_noSGS') || strcmpi( which_case ,'LES20000M02_v062_H6a2b5_verification' ) || ...
        strcmpi(which_case,'LES20000M02_v062_H6a2b5_WALE')
    
    if strcmpi( which_grid(end-2:end) , 'DNS' ) || strcmpi( which_grid(end-1:end) , '6s' )  || ...
           strcmpi( which_grid(end-1:end) , '7s' )  || strcmpi( which_grid(end-1:end) , '8s' )
        numMajorBatch       = 4 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 100 ;
    else
        numMajorBatch       = 4 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 100 ;
    end
    
    
    
elseif strcmpi(which_case,'hybridLES')
    numMajorBatch       = 1 ;
    numMinorBatch       = 1 ;
    snapPerMinorBatch   = 20 ;
    
elseif strcmpi(which_case,'hybridLES20000')
    if which_grid==20000+75*38*42
        numMajorBatch       = 1 ;
        numMinorBatch       = 1 ;
        snapPerMinorBatch   = 20 ;
    elseif which_grid==20000+40*8*12 || which_grid==20000+50*10*15 || which_grid==20000+0.13+160*52*160
        numMajorBatch       = 2 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 100 ;
    elseif which_grid==20000+160*52*160 || which_grid==20000+0.13+ 160*52*160 +2
        numMajorBatch       = 2 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 100 ;
    elseif which_grid==20000+160*52*160+2 || which_grid==20000+0.4+ 160*52*160 +2
        numMajorBatch       = 2 ;
        numMinorBatch       = 4 ;
        snapPerMinorBatch   = 100 ;
%     elseif which_grid==20000+0.4+ 160*52*160 +2
%         numMajorBatch       = 1 ;
%         numMinorBatch       = 1 ;
%         snapPerMinorBatch   = 12 ;
        
    else
        numMajorBatch       = 1 ;
        numMinorBatch       = 1 ;
        snapPerMinorBatch   = 500 ;
    end
end

