%% OF_BFS_v*.m:     OpenFOAM Backward Facing Step
%% Written by:      Siavash Toosi
%% Description:     Reads in binary snapshots of the BFS or channel flow and computes statistics
%% Limitations:     1- multi-block structure
%%                  2- Cartesian hexahedral cells
%%                  3- statistically stationary flowfield
%%                  4- statistically homogeneous in the spanwise direction 
%% NOTE:            code nomenclature, history and others are moved to the end of the script

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear, clc, close all

main_codeVer            = 9.20 ;

debugMode               = 'no' ;    
superMinimalistic       = 'yes' ;   % only a few error indicators. suggested for start
override_lowSnapsNum    = 'yes' ;   % whether there are only a few snapshots, disables batching or changes the number of batches
override_numberOfBatch  = 'no' ;    % whether to overwrite the default number of batches 
desired_numberOfBatch   = 4 ;       % deisred number of batch if override_numberOfBatch is set as 'yes'

%% specify case setup
% which_case:           flow type:                    hybridWMLES200k | BFS | hybridDNS
% which_code:           code used for simulations:    hybrid/OF
% which_flow:           channel or backward facing step, there is an overlap with which_case: BFS/channel
% which_simulationType: LES/DNS/WENO/WMLES
% which_setup:          setup name


% which_case                  = 'hybridLES20000' ; % hybridWMLES200k | BFS | hybridDNS
% which_case                  = 'BFS' ; % hybridWMLES200k | BFS | hybridDNS
% which_case                  = 'LES20000_v010' ;
% which_case                  = 'LES20000M02_v030_H2a2b3' ;
% which_case                  = 'LES20000M02_v040_H2' ;
which_code                  = 'hybrid' ;                % hybrid/OF
which_flow                  = 'Channel' ;           % BFS/channel
which_simulationType        = 'LES' ;               % LES/DNS/WENO/WMLES
which_setup                 = 'Re20000M02_2nd' ;  
% which_grid                  = 'smQij02cf_H2a3' ;
% which_grid                  = 'modQij04c_H2a3' ;

% which_case                  = 'LES20000M02_v030_H2a2b3' ;
% which_grid                  = 'smQij02c_H2a2b3' ;

% which_case                  = 'LES20000M02_v030_H2a2b2_equivAnDX' ;
% which_grid                  = 'smQij02c_H2a2b2' ;

% which_case                  = 'LES20000M02_v030_H2a2b5' ;
% which_grid                  = 'modQij03sa_H2a2b5' ;

% which_case                  = 'LES20000M02_v061_H2a2b5' ;
% which_grid                  = 'CHv061_Gn05s' ;

which_case                  = 'LES20000M02_v062_H6a2b5' ;
% % which_grid                  = 'Re20000_M02_v062_H6a2b5_noSGSDSM_Gn03s';
% % which_grid                  = 'Re20000_M02_v062_H6a2b5_VremanDSM_An08s';
% % which_grid                  = 'TGT_baseV02' ;
% which_grid                  = 'LES01c' ;
% which_grid                  = 'CHv062_newModQijnmT04c' ;
which_grid                  = 'CHv062_Gn05s' ;
% % % % which_grid                  = 'CHv061_An03s' ;
% % % % which_grid                  = 'An04s_H2a2b5' ;
% % % % which_grid                  = 'pAn03s_H2a2b5' ;

% which_case                  =  'LES20000M02_v062_H6a2b5_vreman';
% % % which_grid                  = 'LES01b_vreman' ;
% % which_grid                  = 'CHv062_vreman_Gn06s' ;
% % % which_grid                  = 'test_vreman_H2' ;
% % which_grid                  = 'CHv062_trueVreman_Gn08s' ;
% % which_grid                  = 'CHv062_noSGSVreman_Gn08s' ;
% % which_grid                  = 'CHv062_hyperVreman_Gn06s' ; 
% % which_grid                  = 'CHv062_hyperVreman_C0078125_DSM04s';
% which_grid                  = 'CHv062_hyperVreman_C012_DSM04s';
% % which_grid                  = 'CHv062_hyperVreman_C012_Gn03rs';
% % which_grid                  = 'CHv062_hyperVreman_C012_DSM03f';
% % which_grid                  = 'CHv062_hyperVreman_DSM_Gn07c';
% which_deltaHratio           = 1.6 ;
% % which_eddyVisCoeffRatio     = 1/4 ;



% which_case                  =  'LES20000M02_v062_H6a2b5_WALE' ;
% % % which_grid                  = 'CHv062_WALEvol03_base1';
% % % which_grid                  = 'CHv062_WALEvol_base5';
% % which_grid                  = 'CHv062_WALEvol05_base1_refZ4';
% % which_grid                  = 'CHv062_WALEomegaTilde_base1' ;
% which_grid                  = 'CHv062_WALEmax_base1_refX' ;

% which_case                  =  'LES20000M02_v062_H6a2b5_verification';
% % which_grid                  = 'CHv062_mWALE_gVr02s' ; 
% which_grid                  = 'CHv062_mAnEddy_gDSM05s' ;

% which_case                  =  'LES20000M02_v062_H6a2b5_noSGS' ;
% which_grid                  = 'CHv062_noSGS_Gn04s' ;

% % which_grid                  = 31200204 ;
% % which_grid                  = 31200251 ;
% % which_grid                  = 20000+160*52*160 ;
% which_grid                  = 'GnC03s' ;
% which_grid                  = 50*10*15;
% which_grid                  = 'BFS_v312_Gn2s' ;

% which_case                  = 'BFS' ;
% which_code                  = 'OF' ;                % hybrid/OF
% which_flow                  = 'BFS' ;           % BFS/channel
% which_simulationType        = 'LES' ;               % LES/DNS/WENO/WMLES
% % which_setup                 = 'v312' ;      
% % which_grid                  = 31200251 ;
% which_setup                 = 'v320' ; 
% % which_grid                  = 'BFSv320l_newModQijnmT02rs' ;
% which_grid                  = 'BFSv320_Gn04sec' ;
% % which_grid                  = 'BFSv320_cafAn05rs' ;
% % which_grid                  = 'BFSv320l_LES01b' ;
% % % which_grid                  = 'BFSv312_DNS37m' ;
% % which_grid                  = 'BFSv312_equiDist_An03s' ;

% which_case                  = 'hybridWMLES250k' ;
% which_code                  = 'hybrid' ;                % hybrid/OF
% which_flow                  = 'channel' ;           % BFS/channel
% which_simulationType        = 'LES' ;               % LES/DNS/WENO/WMLES
% which_setup                 = 'v01' ; 
% % which_grid                  = 'WMLES01b' ;
% which_grid                  = 'WMLES_Re250k_M02_uncorWMLES06s' ;
% which_deltaHratio           = 1 ;

% which_case                  = 'LES_ReTau5200' ;
% which_code                  = 'hybrid' ;                % hybrid/OF
% which_flow                  = 'channel' ;           % BFS/channel
% which_simulationType        = 'LES' ;               % LES/DNS/WENO/WMLES
% which_setup                 = 'v01' ; 
% which_grid                  = 'LES_ReTau5200_Gn10s' ;

which_case                  =  'LES20000M02_v062_H6a2b5_vreman';
which_grid                  = 'hyperVreman_c003_DSM04s';


% filter to grid size ratio
which_deltaHratio           = 1 ;

case_doGridFilterAgain      = 'yes' ;   % whether to prcoess the mesh at rerun, usually set as 'no' unless needed
case_doOperatorsAgain       = 'yes' ;   % whether to construct derivative operators again
do_allBudgetsAndSave        = 'no' ;    % whether to compute all RS budgets and save
do_unimportantStuff         = 'no' ;    % whether to compute and save additional quantities

automatic_1st2ndSwitch      = 'no' ;    % do 1st/2nd order switching at block boundaries
maxAcceptableDis2Wall       = .1 ;      % don't recall what this was
do_upwindAtBoundaries       = 'yes' ;   % do upwind/downwind at boundaries
do_extrapolateFirstDerivs   = 'no' ;    % extrapolate first derivatives

case_timeDerivative     = 'no' ;        % compute time derivatives (if snapshots are back to back)

run_on_cluster  = 'no' ;                % run in terminal on a remote cluster. only changes some paths, etc. Does not launch a remote MATLAB
do_graphics     = 'no' ;                % activate/deatvie figures
lovelyColorMao  = 'no' ;                % an X-ray color map
same_folder     = 'no' ;                % whether the files are in the same folder as matlab code

%% adding paths to some directories contatining additional scripts
if strcmpi( run_on_cluster , 'no' )
    addpath('~/Documents/MATLAB/OpenFOAM/MainRequiredScripts_v900','-end')
else
    addpath('~/supportingScripts_MATLAB')
end

if strcmpi( superMinimalistic , 'yes' )
    do_allBudgetsAndSave = 'no' ;
end
    
%% get flow properties from a prespecified set of values based on which_case
[   fluid_rho , fluid_nu , fluid_R , fluid_gamma , ...
    Lx , Lz , x_Pref , case_stepPosition ] = ...
    caseSpecificDomainFluidValues_v100( which_case );

%% 
filterSizeRatio     = 2^(1/3) ;             % filter size ratio of the full 3D filter between directionally filtered and original 
                                            % v_filer = 2*dx*dy*dz, v_original = dx*dy*dz => delta_filter/delta_original = (v_filer/v_original)^(1/3) = 2^(1/3)
filterSizeRatioIso  = filterSizeRatio^3 ;   % filter size ratio of isotropic filter
cSmagorisnky = 0.1 ;                        % smagorisnky constant

%%
case_saveSuperSmall = 'yes' ;       % minimal save
case_saveBigFile    = 'no' ;        % save a large file with everything
x_storable          = [] ;          % save an x-normal plane

%%
plot_xProfiles          = -17:2:-3; % x profiles to be plotted.
plot_xLocation_report   = -3 ;      % location to report BL quantities

%% some more setup
if strcmpi(run_on_cluster,'yes')
    do_graphics     = 'no';
    same_folder     = 'yes';
end

if strcmpi( case_doGridFilterAgain ,'yes') || strcmpi(which_case,'BFS') || strcmpi(which_case,'OFchannel')
    case_doOperatorsAgain = 'yes' ;
end

%% even more setup
if strcmpi(do_graphics,'yes')
    if strcmpi(lovelyColorMao,'yes')
        load('spine','map')
        plot_colorMap = map ; 
        clear map
    else
        plot_colorMap = parula ;
    end
    plot_scrsz = get(groot,'ScreenSize');
    [ plot_LineSpec , plot_Marker , plot_Color , plot_Line_Color_Comb , plot_Color_names , plot_Line_names ] = RGB_LineSpec_2014b_v200();
    
    plot_boundsColor        = 'k' ;
    
    if strcmpi( which_flow , 'BFS' )
        draw_domainBound = @(c) draw_BFSbounds_v100(c) ;
    elseif strcmpi( which_flow , 'channel' )
        draw_domainBound = @(c) draw_WMLESchannelBounds_v100(c,Lx) ;
    end
end

%% get case directory, file names, and other quantities for different cases.
[ case_dirName,case_filenames , numVars , dt ]                          = case_fileDirName_v200b1( which_case , which_grid , same_folder );
[ numMajorBatch,numMinorBatch , snapPerMinorBatch ]                     = case_minorMajorNumbers_v200b1( which_case , which_grid ) ;
[ Nmin_up,Nmin_down , Nz_averagable , gridFilter_maxDist , x_bounds ]   = case_gridFilterParams_v200b1(which_case , which_grid) ;

%% total number of snapshots
L               = numMinorBatch * snapPerMinorBatch ;

%% get the snapshots files
cd(case_dirName)

if strcmpi(which_code,'OF') || strcmpi(which_code,'OpenFOAM') 
    if which_grid==0
        case_gridFileNames  = dir([case_filenames,'.xyz']);
        case_datFileNames   = dir([case_filenames,'*.dat']);
    else
        case_gridFileNames  = dir([case_filenames,'.xyz.original']);
        case_datFileNames   = dir([case_filenames,'*original.dat']);
    end
    
elseif strcmpi(which_case,'OFchannel')
    case_gridFileNames  = dir([case_filenames,'.xyz']);
    case_datFileNames   = dir([case_filenames,'*.dat']);
elseif strcmpi(which_case,'hybridWMLES200k') || strcmpi(which_case,'hybridWMLES250k')
    case_datFileNames   = dir([case_filenames,'*.full']);
    case_gridFileNames  = case_datFileNames(1);
elseif strcmpi(which_case,'hybridDNS')
    case_datFileNames   = dir([case_filenames,'*.prim']);
    case_gridFileNames  = case_datFileNames(1);
elseif strcmpi(which_case,'hybridLES') || strcmpi(which_case,'hybridLES20000') ...
    case_datFileNames   = dir([case_filenames,'*.res']);
    if isempty(case_datFileNames)
        case_datFileNames   = dir([case_filenames,'*.full']);
    end
    if isempty(case_datFileNames)
        case_datFileNames   = dir([case_filenames,'*.full']);
    end
    case_gridFileNames  = case_datFileNames(1);
% elseif strcmpi(which_case,'LES20000M02_v010') || strcmpi(which_case,'LES20000M02_v030') || ...
%        strcmpi(which_case,'LES20000M02_v030_2nd') || strcmpi(which_case,'LES20000M02_v030_H2a3') || ...
%        strcmpi(which_case,'LES20000M02_v040_H2') || strcmpi(which_case,'LES20000M02_v030_H2a2b3') || ...
%        strcmpi(which_case,'LES20000M02_v030_H2a2b2_equivAnDX') || strcmpi(which_case,'LES20000M02_v030_H2a2b5') || ...
%        strcmpi(which_case,'LES20000M02_v060_H2a2b5') || strcmpi(which_case,'LES20000M02_v061_H2a2b5') || ...
%        strcmpi(which_case,'LES20000M02_v062_H6a2b5') || strcmpi(which_case,'LES20000M02_v062_H6a2b5_vreman') || ...
%        strcmpi(which_case,'LES20000M02_v062_H6a2b5_noSGS') || strcmpi( which_case ,'LES20000M02_v062_H6a2b5_verification' ) || ...
%        strcmpi( which_case , 'LES_ReTau5200' ) || strcmpi(which_case,'LES20000M02_v062_H6a2b5_WALE')
else
    case_datFileNames   = dir([case_filenames,'*.full']);
    case_gridFileNames  = case_datFileNames(1);
end

%% some stuff related to batching 
if ~strcmpi( debugMode , 'yes' )
    if length(case_datFileNames)<L
        warning('come on! picking more snapshots than what you really have?')
        Nf = length(case_datFileNames);
        nB = floor(Nf/40) ;
        if nB==0
            if ~strcmpi( override_lowSnapsNum , 'yes' )
                error('You have less than 40 snapshots. So I did not bother running the script. Everything is gonna be inaccurate anyways, so do not bother!')
            else
                warning('Low number of snapshots! overruled by the user...')
                numMajorBatch = 1 
                numMinorBatch = 1 

                if strcmpi(override_numberOfBatch,'yes')
                    numMajorBatch = desired_numberOfBatch
                    numMinorBatch = numMajorBatch
                end
            end
        else
            warning('But, do not worry buddy! I am on it!')
            disp('This is your new batch configuration')
            if strcmpi(override_numberOfBatch,'yes')
                numMajorBatch = desired_numberOfBatch
                numMinorBatch = numMajorBatch
            elseif nB>=16
                numMajorBatch = 4
                numMinorBatch = 16
            elseif nB>=12
                numMajorBatch = 4
                numMinorBatch = 12
            elseif nB>=8
                numMajorBatch = 4
                numMinorBatch = 8
            elseif nB>=6
                numMajorBatch = 6
                numMinorBatch = 6
            elseif nB>3
                numMajorBatch = 4
                numMinorBatch = 4
            else
                numMajorBatch       = 1 
                numMinorBatch       = 1 
            end

        end
        L = length(case_datFileNames) ;
    end
    
    snapPerMinorBatch   = floor(L/numMinorBatch) 
    numMajorBatch
    minorPerMajor       = numMinorBatch / numMajorBatch

    L                   = numMinorBatch * snapPerMinorBatch ;

else
    disp('running in the debug mode...')
    numMajorBatch = 2
    numMinorBatch = 4
    L             = 8 ;
    
    snapPerMinorBatch   = floor(L/numMinorBatch) 
    minorPerMajor       = numMinorBatch / numMajorBatch
end

snapshotIndex       = 1:L ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% grid related stuff
if strcmpi( case_doGridFilterAgain , 'yes' )
    
tic
% read the grid, filter it to remove non-hex cells, find the neighbors, and additional stuff
[ XYZ_original_all , XYZ_neighbors_all,XYZ_distance_all,XYZ_available_all,XYZVector2Matrix_all , X_all,Y_all,Z_all, iXYZ_all , ...
    indWallStillThere_all,indWallPointsRaw_all,indWallAdjacentPointsRaw_all,addedWalls_all ] = ...
    OF_BFS_gridReadFilter_v300b1( which_code , which_flow , case_gridFileNames.name , Nmin_up , gridFilter_maxDist , [-20 25]);

% some grid point indices
[indPoints_all , iIndwoN_all , iIndwoNx_all,iIndwoNy_all,iIndwoNz_all] = ...
    OF_BFS_Inds_v100(XYZ_neighbors_all);

% find the index of points for pressure extrapolation
[ indPressure1_all,indPressure2_all  , indVelocity_all , dxPressure1_all,dxPressure2_all , alphaPressure_all ] = ...
    OF_BFS_wallPressureCalculator_v120b1( indWallStillThere_all , addedWalls_all , XYZ_neighbors_all , XYZ_distance_all ) ;

% compute grid resolutions
dX_original_all = OF_BFS_gridResolution_v100( XYZ_distance_all , XYZ_neighbors_all , iIndwoN_all );

% find the mapping in the spanwise direction to perform averaging there
[XY_averagable_all , IndZ_averagable_all] = Zavergaing_primer_v010(XYZ_available_all,XYZVector2Matrix_all , X_all,Y_all , Nz_averagable);

% doing the same for the 2D mapped grid 
[ XY_available_all , XYVector2Matrix_all , iX2D_all,iY2D_all ] = ...
    OF_originalGridFinder2D_v100( XY_averagable_all , X_all,Y_all ) ;
[ XY_neighbors_all , XY_distance_all ] = ...
    OF_neighborDistance_finder2D_v101( XY_available_all , XYVector2Matrix_all , X_all,Y_all , iX2D_all,iY2D_all ,gridFilter_maxDist );
[indPoints2D_all , iIndwoN2D_all , iIndwoNx2D_all,iIndwoNy2D_all] = OF_BFS_Inds2D_v100(XY_neighbors_all);

% find the wall point indices
[ wall2D_all , indWall2D_all , indWallNeighbor2D_all ] = wallFinder2D_v020b1( ...
    XYZ_original_all    , indWallStillThere_all , ...
    XY_averagable_all   , XY_neighbors_all      , ...
    addedWalls_all ) ;

% find the mapping in x for avergaing in channel
if ~strcmpi(which_case , 'BFS' )
    IndX_averagable_all = Xavergaing_primer_v010(XY_available_all,XYVector2Matrix_all , Nz_averagable);
end

toc

%% 
disp('saving grid related stuff for future use...')
save([case_filenames,'_filteredGrid_v',num2str(main_codeVer),'.mat'],...
    '*_all','gridFilter_maxDist','Nz_averagable')

elseif strcmpi( case_doOperatorsAgain , 'yes')
%     warning('fix it using the length of the case name.')
    tic
    allGridFiles = dir([case_filenames,'_filteredGrid_v*.mat']) ;
    for i=1:length(allGridFiles)
        nameHere = allGridFiles(i).name ;
        vGridFiles(i,1) = str2double( nameHere((16+length(case_filenames)):end-4) ) ;
    end
    [~,iMax] = max(vGridFiles);
    if sum(isnan(vGridFiles))~=0
        iMax = length(allGridFiles) ;
    end
    
    disp(['loading grid related stuff to save time...'])
    disp(['file: ' , allGridFiles(iMax).name])
    load( allGridFiles(iMax).name )
%     load([case_filenames,'_filteredGrid_v',num2str(main_codeVer),'.mat'])
    toc
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
for i=1:length(x_storable)
    
    i_storable{i} = ( XYZ_original_all(:,1)      ==  x_storable(i) ) ;
    YZ_storable{i} = XYZ_original_all( i_storable{i} , 2:3 );
    L_storable(i) = sum( i_storable{i} ) ;
end

%%
for i=1:length(x_storable)
    Omega_storable{i}   = zeros(L_storable(i),3,L);
    An_storable{i}      = zeros(L_storable(i),3,L);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% constructing the second-derivative operators
% all operators are constructed as global sparse matrices over the whole mesh
if strcmpi( case_doOperatorsAgain , 'yes')
disp('constructing the operators...')

%%
disp('second derivatives...')
tic
D2x_operator_all = OF_D2operator_v120b1( XYZ_neighbors_all(:,1:2) , XYZ_distance_all(:,1:2) , indPoints_all , ...
    do_extrapolateFirstDerivs , indWallStillThere_all , indPressure1_all );
D2y_operator_all = OF_D2operator_v120b1( XYZ_neighbors_all(:,3:4) , XYZ_distance_all(:,3:4) , indPoints_all , ...
    do_extrapolateFirstDerivs , indWallStillThere_all , indPressure1_all );
D2z_operator_all = OF_D2operator_v120b1( XYZ_neighbors_all(:,5:6) , XYZ_distance_all(:,5:6) , indPoints_all , ...
    do_extrapolateFirstDerivs , indWallStillThere_all , indPressure1_all );
toc

%%
disp('first derivatives...')
tic
Dx_operator_all = OF_Doperator_v200b2( XYZ_neighbors_all(:,1:2) , XYZ_distance_all(:,1:2) , indPoints_all , ...
    do_extrapolateFirstDerivs , indWallStillThere_all , indPressure1_all , ...
    do_upwindAtBoundaries , automatic_1st2ndSwitch , maxAcceptableDis2Wall ) ;
Dy_operator_all = OF_Doperator_v200b2( XYZ_neighbors_all(:,3:4) , XYZ_distance_all(:,3:4) , indPoints_all , ...
    do_extrapolateFirstDerivs , indWallStillThere_all , indPressure1_all , ...
    do_upwindAtBoundaries , automatic_1st2ndSwitch , maxAcceptableDis2Wall ) ;
Dz_operator_all = OF_Doperator_v200b2( XYZ_neighbors_all(:,5:6) , XYZ_distance_all(:,5:6) , indPoints_all , ...
    do_extrapolateFirstDerivs , indWallStillThere_all , indPressure1_all , ...
    do_upwindAtBoundaries , automatic_1st2ndSwitch , maxAcceptableDis2Wall ) ;
toc

%%
disp('structure function operators...')
tic
[SFoperatorXE_all , SFoperatorXW_all] = OF_SFoperator_v100( XYZ_neighbors_all(:,1:2) , indPoints_all ) ;
[SFoperatorYE_all , SFoperatorYW_all] = OF_SFoperator_v100( XYZ_neighbors_all(:,3:4) , indPoints_all ) ;
[SFoperatorZE_all , SFoperatorZW_all] = OF_SFoperator_v100( XYZ_neighbors_all(:,5:6) , indPoints_all ) ;
SFoperatorE_all      = { SFoperatorXE_all , SFoperatorYE_all , SFoperatorZE_all } ;
SFoperatorW_all      = { SFoperatorXW_all , SFoperatorYW_all , SFoperatorZW_all } ;

clear SFoperatorX* SFoperatorY* SFoperatorZ*
toc


% %%
% N = size(D2x_operator_all,1);
% 
% filtXoperator_all = speye( N,N ) - sparse( 1:N , 1:N , which_deltaHratio * dX_original_all(:,1).^2/4 , N , N ) * D2x_operator_all ;
% filtYoperator_all = speye( N,N ) - sparse( 1:N , 1:N , which_deltaHratio * dX_original_all(:,2).^2/4 , N , N ) * D2y_operator_all ;
% filtZoperator_all = speye( N,N ) - sparse( 1:N , 1:N , which_deltaHratio * dX_original_all(:,3).^2/4 , N , N ) * D2z_operator_all ;
% 
% filtNoperator_allT = { filtXoperator_all , filtYoperator_all , filtZoperator_all };

%%
disp('saving grid related stuff and operators for future use...')
tic
if ~strcmpi(which_case , 'BFS' )
    save([case_filenames,'_filteredGridWithOperators_v',num2str(main_codeVer),'.mat'],...
        '*_all','gridFilter_maxDist','Nz_averagable')
end
toc

else
    warning('fix this usng the length of the case file name')
    tic
    allGridFiles = dir([case_filenames,'_filteredGridWithOperators_v*.mat']) ;
    for i=1:length(allGridFiles)
        nameHere = allGridFiles(i).name ;
        vGridFiles(i,1) = str2double( nameHere((length(case_filenames)+28):end-4) ) ;
    end
    [~,iMax] = max(vGridFiles);
    if sum(isnan(vGridFiles))~=0
        iMax = length(allGridFiles) ;
    end
    
    disp(['loading grid related stuff with operators to save time...'])
    disp(['file: ' , allGridFiles(iMax).name])
    load( allGridFiles(iMax).name )
    toc
    
end

%%
disp('2D first derivatives...')
tic
Dx_operator2D_all = OF_Doperator_v200b3( XY_neighbors_all(:,1:2) , XY_distance_all(:,1:2) , indPoints2D_all , ...
    do_extrapolateFirstDerivs , indWall2D_all , indWallNeighbor2D_all , ...
    do_upwindAtBoundaries , automatic_1st2ndSwitch , maxAcceptableDis2Wall ) ;
Dy_operator2D_all = OF_Doperator_v200b3( XY_neighbors_all(:,3:4) , XY_distance_all(:,3:4) , indPoints2D_all , ...
    do_extrapolateFirstDerivs , indWall2D_all , indWallNeighbor2D_all , ...
    do_upwindAtBoundaries , automatic_1st2ndSwitch , maxAcceptableDis2Wall ) ;
Dz_operator2D_all = sparse(length(XY_neighbors_all),length(XY_neighbors_all));

divOperator2D_all    = [Dx_operator2D_all,Dy_operator2D_all,Dz_operator2D_all];
toc

%%
disp('2D second derivatives...')
tic
D2x_operator2D_all = OF_D2operator_v120b1( XY_neighbors_all(:,1:2) , XY_distance_all(:,1:2) , indPoints2D_all , ...
    do_extrapolateFirstDerivs , indWall2D_all , indWallNeighbor2D_all );
D2y_operator2D_all = OF_D2operator_v120b1( XY_neighbors_all(:,3:4) , XY_distance_all(:,3:4) , indPoints2D_all , ...
    do_extrapolateFirstDerivs , indWall2D_all , indWallNeighbor2D_all );
D2z_operator2D_all = sparse(length(XY_neighbors_all),length(XY_neighbors_all));

laplacianOperator2D_all = D2x_operator2D_all + D2y_operator2D_all + D2z_operator2D_all ;
toc

%%
disp('divergence, gradient and laplacian operators...')
tic
D2operators_allT         = {D2x_operator_all , D2y_operator_all , D2z_operator_all};
divOperator_all          = [ Dx_operator_all      , Dy_operator_all    , Dz_operator_all ] ;
gradOperator_all         = [ Dx_operator_all      ; Dy_operator_all    ; Dz_operator_all ] ;
laplacianOperator_all    = D2x_operator_all   + D2y_operator_all   + D2z_operator_all ;
toc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% delat = volume^(1/3)
filterSize_all = prod( dX_original_all ,2).^(1/3) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
disp('initializing variables...')
tic
if ~strcmpi(superMinimalistic,'yes')
    averagableFields_mainNames1 = { 'Vars'  , 'modVars' , 'DVars_Dx' , 'DVars_Dy' , 'DVars_Dz' } ;
    averagableFields_mainDim1   = [ numVars ,  numVars  ,   numVars  ,   numVars  ,   numVars  ] ;

    averagableFields_mainNames1p = { 'gradU' , 'Sij' , 'Oij' , 'tauSgs' , 'tauKKsgs' , 'modTauSgs' , 'divTauSgs' , 'divModTauSgs' , 'Vorticity'  , 'divUiUj'  , 'gradP' , 'gradModP' , 'laplacianUi' , 'enstrophy' , 'divU' , 'absDivU' , 'UkDUiDxK' , 'skewSymmetric' , 'DClarksTauij' , 'MDClarksTauij' , 'ClarksTauij' , 'Sbar' } ;
    averagableFields_mainDim1p   = [    9    ,   6   ,   6   ,     6    ,      1     ,      6      ,      3      ,        3       ,      3       ,     3      ,    3    ,      3     ,        3      ,      1      ,    1   ,      1    ,      3     ,         3       ,        6       ,         6       ,        6      ,    1   ] ;

    averagableFields_mainNames1pp = {'meanMomentumDivForm_diff2zero' , 'meanMomentumConvForm_diff2zero' , 'meanMomentumSkewForm_diff2zero' , 'divDClarksTauij' , 'divMDClarksTauij' , 'divClarksTauij' };
    averagableFields_mainDim1pp   = 3 * ones( size(averagableFields_mainNames1pp) ) ;

    averagableFields_mainNames1ppp = { 'OmegaMag' , 'gradMag' , 'nuSgsFilteredSmagorinsky' , 'nuSgsVreman' , 'bBeta' , 'nuSgsSmagorinsky' , 'nuSGS_vreman' } ;
    averagableFields_mainDim1ppp   = [      1     ,      1    ,             1              ,        1      ,    1    ,         1          ,        1       ] ;

    averagableFields_mainNames2 = { 'An' , 'AnSF' , 'AnTauR' , 'AnOmega' , 'GnTotal' , 'GnVreman' , 'GnNoSGS' , 'GnTotalAdd' , 'GnTotalCommercial' } ;
    averagableFields_mainDim2   = [   3  ,    3   ,     3    ,     3     ,     3     ,      3     ,     3     ,       3      ,           3         ] ;


    % WARNING: ONLY variable with _tmp. the code uses this later on
    averagableFields_mainNames3 = { 'RS_tmp', 'modRS_tmp' , 'UiDtauJKdxK_tmp' , 'UiDmodTauJKdxK_tmp' , 'UiUjUk_tmp' , 'UiP_tmp' , 'PgradU_tmp' , 'epsilon_tmp' , 'TikDujDxk_tmp' , 'dUjTikDxk_tmp' , 'dUjmodTikDxk_tmp' } ;
    averagableFields_mainDim3   = [    6    ,      6      ,         9         ,            9         ,      10      ,     3     ,       9      ,       6       ,        9        ,         9       ,         9          ] ;

    averagableFields_mainNames3p = { 'RSeq_tmp_convProdTurbTrans' , 'RSeq_tmp_altConvProdTurbTrans' , 'RSeq_tmp_allPressure' , 'RSeq_tmp_allViscous' , 'RSeq_tmp_diff2zero' , 'RSeq_tmp_diff2zeroAlt' , 'modRSeq_tmp_allPressure' , 'allSGS_ClarksTauij' , 'allSGS_DClarksTauij' , 'allSGS_MDClarksTauij' , 'allSGS_codeTauij' , 'sgsDissipation_MDClarks' , 'sgsDissipation_DClarks' , 'sgsDissipation_code' , 'sgsDissipation_Clarks' } ;
    averagableFields_mainDim3p   = 9 * ones( size(averagableFields_mainNames3p) ) ;

    averagableFields_mainNames  = [ averagableFields_mainNames1 , averagableFields_mainNames1p , averagableFields_mainNames1pp , averagableFields_mainNames1ppp , averagableFields_mainNames2 , averagableFields_mainNames3 , averagableFields_mainNames3p ];
    averagableFields_mainDim    = [  averagableFields_mainDim1  ,  averagableFields_mainDim1p  ,  averagableFields_mainDim1pp  ,  averagableFields_mainDim1ppp  ,  averagableFields_mainDim2  ,  averagableFields_mainDim3  ,  averagableFields_mainDim3p  ];

else
    averagableFields_mainNames  = { 'Vars'  , 'modVars' ,  'RS_tmp', 'modRS_tmp' , 'tauSgs' , 'tauKKsgs' ,  'An' , 'AnSF' , 'AnTauR' , 'GnTotal' , 'GnVreman' , 'GnNoSGS' } ;
    averagableFields_mainDim    = [ numVars ,  numVars  ,     6    ,      6      ,     6    ,      1     ,    3  ,    3   ,     3    ,     3     ,      3     ,     3     ] ;
end

%%
if strcmpi(case_timeDerivative , 'yes' )
    averagableFields_mainNames  = [ averagableFields_mainNames , 'dVarsDt' , 'dUiUjDt' ] ;
    averagableFields_mainDim    = [  averagableFields_mainDim  ,  numVars  ,      6    ] ; 
end

if strcmpi(which_code,'hybrid')
    averagableFields_mainNames = [ averagableFields_mainNames , 'rho' , 'mu' ] ;
    averagableFields_mainDim   = [  averagableFields_mainDim  ,   1   ,  1   ] ; 
end

if strcmpi( do_unimportantStuff , 'yes' )
    %%
    averagableFields_mainNames4s    = { 'instantRes' , 'absInstantResidual' , 'AnRE' , 'AnSFo' , 'AnGiso' , 'RiUj_tmp' , 'UiGj_tmp' , 'absUiGj_tmp' } ;
    averagableFields_mainDim4s      = [      3       ,           3          ,    3   ,    3    ,     1    ,     9      ,      9     ,        9      ] ;
    
    averagableFields_mainNames4 = { 'nuSgsSmagorinsky' , 'nuSgsGermanoLilly' ,  'csGermanoLilly' , 'errorNewGDP' , 'delTauSgs' , 'Lij' , 'LijD' , 'Fi' , 'absFi' , 'kSgs' } ;
    averagableFields_mainDim4   = [          1         ,          1          ,          1        ,        1      ,       6     ,   6   ,    6   ,  3   ,    3    ,    1   ] ;

    averagableFields_mainNames5 = { 'D2Vars_Dx2' , 'D2Vars_Dy2' , 'D2Vars_Dz2' , 'absVars' } ;
    averagableFields_mainDim5   = [   numVars    ,   numVars    ,   numVars    ,   numVars ] ;
    
    %%
    averagableFields_mainNames  = [ averagableFields_mainNames , averagableFields_mainNames4s , averagableFields_mainNames4  , averagableFields_mainNames5 ] ;
    averagableFields_mainDim    = [  averagableFields_mainDim  ,  averagableFields_mainDim4s  ,  averagableFields_mainDim4   ,  averagableFields_mainDim5  ] ;
    
end

%%
for i=1:length(averagableFields_mainNames)
    allVars_nameInstant{i} = [ averagableFields_mainNames{i} , '_wholeDomain' ] ;
end

%%
averagableFields_tailNames      = { 'TMean_minorBatches_Vec'  };
averagableFields_tailDim        = [       numMinorBatch       ];
averagableFields_xyzUp_Dim      = [  length(XYZ_original_all)  ];


for i=1:length(averagableFields_mainNames)
    for j=1:length(averagableFields_tailNames)
        eval([averagableFields_mainNames{i},'_wholeDomain_',averagableFields_tailNames{j} , ...
            '=zeros(',num2str(averagableFields_xyzUp_Dim(j)),',',num2str(averagableFields_mainDim(i)),',',num2str(averagableFields_tailDim(j)),');'])
    end
end

toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
AA = table( averagableFields_mainNames' , averagableFields_mainDim' , 'VariableNames' , {'name','dimension'});
writetable(AA,'allVariables.csv')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
disp('starting the main loop...'), disp(' ')

if strcmpi( superMinimalistic ,'yes')
    disp('running in the super minimalistic setup...')
end

%%
tic
for iMainLoop = snapshotIndex
    
    disp(['reading snapshot ',num2str(iMainLoop),' of a total of ', num2str(L),' snapshpts ...'])
    
    %%
    iSnapshot = iMainLoop ;
    if strcmpi(case_timeDerivative,'yes')
        iSnapshot = 2*iMainLoop-1;
    end
    
    %% read points and add ghost cells
    if strcmpi(which_code,'OF') || strcmpi(which_code,'OpenFOAM')
        Vars_wholeDomain    = OF_BFS_readVarsOriginalGeneral_v100(case_datFileNames(iSnapshot).name , numVars) ;
        Vars_wholeDomain    = OF_BFS_addGhostsValuesAtWalls_v100( Vars_wholeDomain , ...
            indWallPointsRaw_all,indWallAdjacentPointsRaw_all,addedWalls_all ) ;
        
        Vars_wholeDomain  	= Vars_wholeDomain( iXYZ_all , : ) ;
        
    elseif strcmpi(which_code,'hybrid')
        [ Vars_wholeDomain , rho_wholeDomain , mu_wholeDomain ]  = ...
            hybridReadFile_OFreplica_v110b1(case_datFileNames(iSnapshot).name,iXYZ_all,fluid_R,fluid_gamma,fluid_nu);
        % for consistency mu is called nu in the code
    end
    
    %% computes Ui*Uj for Reynolds stress calculation
    RS_tmp_wholeDomain      = nonlin2vvS_tmp_v100( Vars_wholeDomain(:,1:3) , Vars_wholeDomain(:,1:3) );
    
    
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if strcmpi(case_timeDerivative , 'yes' )
        
        %%
        if strcmpi(which_code,'OF') || strcmpi(which_code,'OpenFOAM')
            
            Vars_wholeDomain_Next   = OF_BFS_readVarsOriginalGeneral_v100(case_datFileNames(iSnapshot+1).name , numVars) ;
            Vars_wholeDomain_Next  	= OF_BFS_addGhostsValuesAtWalls_v100( Vars_wholeDomain_Next , ...
                indWallPointsRaw_all,indWallAdjacentPointsRaw_all,addedWalls_all ) ;
            
            Vars_wholeDomain_Next  	= Vars_wholeDomain_Next( iXYZ_all , : ) ;
            
        elseif strcmpi(which_code,'hybrid')
            [ Vars_wholeDomain_Next , rho_wholeDomain_Next , mu_wholeDomain_Next ] 	=  ...
                hybridReadFile_OFreplica_v110b1(case_datFileNames(iSnapshot+1).name,iXYZ_all,fluid_R,fluid_gamma,fluid_nu);
            % for consistency mu is called nu in the code
        end
        
        %%
        RS_tmp_wholeDomain_Next     = nonlin2vvS_tmp_v100( Vars_wholeDomain_Next(:,1:3) , Vars_wholeDomain_Next(:,1:3) );
        
        %%
        dVarsDt_wholeDomain    = ( Vars_wholeDomain_Next - Vars_wholeDomain ) / dt ;
        
        %%
        dUiUjDt_wholeDomain    = ( RS_tmp_wholeDomain_Next - RS_tmp_wholeDomain ) / dt ;
        
        %%
        clear *_Next
        
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % some budgets
    if ~strcmpi(superMinimalistic,'yes')
        %%
        UiP_tmp_wholeDomain   = nonlin2sv_tmp_v100( Vars_wholeDomain(:,4) , Vars_wholeDomain(:,1:3) );

        %%
        UiUjUk_tmp_wholeDomain     = nonlin3vvvS_tmp_v100(Vars_wholeDomain(:,1:3),Vars_wholeDomain(:,1:3),Vars_wholeDomain(:,1:3));
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% first derivatives
    DVars_Dx_wholeDomain   = Dx_operator_all * Vars_wholeDomain ;
    DVars_Dy_wholeDomain   = Dy_operator_all * Vars_wholeDomain ;
    DVars_Dz_wholeDomain   = Dz_operator_all * Vars_wholeDomain ;
    
    %% gradUtmp(:,i,j) = dUi/dXj 
    gradU_wholeDomain       = cat(3,DVars_Dx_wholeDomain(:,1:3),DVars_Dy_wholeDomain(:,1:3),DVars_Dz_wholeDomain(:,1:3));
    
    %% 
    if ~strcmpi(superMinimalistic,'yes')
        gradNu_wholeDomain       = cat(2,DVars_Dx_wholeDomain(:,5),DVars_Dy_wholeDomain(:,5),DVars_Dz_wholeDomain(:,5));
    
        %%
        divU_wholeDomain       = gradU_wholeDomain(:,1,1) + gradU_wholeDomain(:,2,2) + gradU_wholeDomain(:,3,3) ;
        absDivU_wholeDomain    = abs(divU_wholeDomain);
    end
    
    %% not very memory efficient
    %% Sij(:,i,j) = 1/2*( gradUtmp(:,i,j) + gradUtmp(:,j,i) ) = 1/2*(dUi/dXj+dUj/dXi)
    Sij_wholeDomain    = 1/2 * ( gradU_wholeDomain + permute(gradU_wholeDomain , [1,3,2] ) ) ;
    Sij_wholeDomain    = reshape( Sij_wholeDomain , [] ,9 ) ;
    Sij_wholeDomain    = Sij_wholeDomain( : , [1,2,3,5,6,9] ) ;
    
    Sbar_wholeDomain    = SijSijContraction_v100( Sij_wholeDomain );
    
    %% omega
    if ~strcmpi(superMinimalistic,'yes')
        Oij_wholeDomain    = 1/2 * ( gradU_wholeDomain - permute(gradU_wholeDomain , [1,3,2] ) ) ;
        Oij_wholeDomain    = reshape( Oij_wholeDomain , [] ,9 ) ;
        Oij_wholeDomain    = Oij_wholeDomain( : , [1,2,3,5,6,9] ) ;
    end
    
    %% tauSgs(:,i,j) = -2*nuSgs * S(:,i,j)
    tauSgs_wholeDomain      = -2 * Vars_wholeDomain(:,5) .* Sij_wholeDomain ;
    tauKKsgs_wholeDomain    =  2 * Vars_wholeDomain(:,5) .* sqrt( 2 * Sbar_wholeDomain ) ;
    modTauSgs_wholeDomain   = tauSgs_wholeDomain + 1/3 * tauKKsgs_wholeDomain .* [1 0 0 1 0 1] ;
    
    %% mofified pressure
    modP                    = Vars_wholeDomain(:,4) - 1/3 * fluid_rho * tauKKsgs_wholeDomain ;
    
    %% 
    if ~strcmpi(superMinimalistic,'yes')
        Vorticity_wholeDomain      = Vorticity_v100( DVars_Dx_wholeDomain(:,1:3) , DVars_Dy_wholeDomain(:,1:3) , DVars_Dz_wholeDomain(:,1:3) );
        OmegaMag_wholeDomain       = sum( Vorticity_wholeDomain.^2 , 2 );

        %%
        enstrophy_wholeDomain      = sum( Vorticity_wholeDomain.^2 , 2) ;

        %%
        epsilon_tmp_wholeDomain    = nonlin2ttC_tmp_v100( gradU_wholeDomain ) ;

        %%
        nuSgsSmagorinsky_wholeDomain    = OF_BFS_nuSgsGDSLilly_v100( cSmagorisnky^2 , Sij_wholeDomain ,filterSize_all ) ;

        %%
        ClarksTauij_wholeDomain = .5 * abs(prod(dX_original_all,2)).^(2/3) .* epsilon_tmp_wholeDomain ;

        DClarksTauij_wholeDomain = 2 * nonlin2ttC_tmp_v100( ...
            permute( dX_original_all, [1 3 2])/2 .* gradU_wholeDomain ) ;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Directionally filtered fields
    % high pass filtered
    [ Vars_hpfN_wholeDomainT(:,:,1) , Vars_hpfN_wholeDomainT(:,:,2) , Vars_hpfN_wholeDomainT(:,:,3) ] = ...
        OF_BFS_hpfN_v100(   Vars_wholeDomain   , which_deltaHratio * dX_original_all    , ...
                            D2x_operator_all , D2y_operator_all   , D2z_operator_all );
    Vars_hpfNsum_wholeDomainT = sum( Vars_hpfN_wholeDomainT , 3 ) ;
    
    
    %% low pass filtered velocities
    [ Vars_lpfN_wholeDomainT{1} , Vars_lpfN_wholeDomainT{2} , Vars_lpfN_wholeDomainT{3} ] = ...
        OF_BFS_lpfN_v100(   Vars_wholeDomain , ...
                            Vars_hpfN_wholeDomainT(:,:,1)  , Vars_hpfN_wholeDomainT(:,:,2)    , Vars_hpfN_wholeDomainT(:,:,3) );
                        
    %% low pass filtered Leonard stresses
    [ UiUj_hpfN_wholeDomainT(:,:,1) , UiUj_hpfN_wholeDomainT(:,:,2) , UiUj_hpfN_wholeDomainT(:,:,3) ] = ...
        OF_BFS_hpfN_v100(   RS_tmp_wholeDomain   , which_deltaHratio * dX_original_all    , ...
                            D2x_operator_all , D2y_operator_all   , D2z_operator_all );
                        
    UiUj_hpfN_wholeDomainT = sum( UiUj_hpfN_wholeDomainT , 3 );
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Anisotropic error indicator: differential directional filter
    % A(n) of Computers & Fluids 2017
    for iAn=1:3
        An_wholeDomain(:,iAn) = sum( Vars_hpfN_wholeDomainT(:,1:3,iAn).^2 , 2 ) ;
    end
    
    %% Anisotropic error indicator: differential approximation to directional structure functions
    % A'(n) of Computers & Fluids 2017
    AnSF_wholeDomain(:,1) = ( which_deltaHratio * dX_original_all(:,1) ).^2 .* sum( DVars_Dx_wholeDomain(:,1:3).^2 , 2 ) ;
    AnSF_wholeDomain(:,2) = ( which_deltaHratio * dX_original_all(:,2) ).^2 .* sum( DVars_Dy_wholeDomain(:,1:3).^2 , 2 ) ;
    AnSF_wholeDomain(:,3) = ( which_deltaHratio * dX_original_all(:,3) ).^2 .* sum( DVars_Dz_wholeDomain(:,1:3).^2 , 2 ) ;
    
    %% Anisotropic error indicator: vorticity based, basically that of the Silvis's length scale
    % some other test error indicator, not used
    if ~strcmpi(superMinimalistic,'yes')
        for iAn=1:3
            indVort = setdiff(1:3,iAn);
            AnOmega_wholeDomain(:,iAn) = ( which_deltaHratio * dX_original_all(:,iAn) ).^2 .* sum( Vorticity_wholeDomain(:,indVort).^2 , 2 );
        end
    end
    
    %%
    % G(x,n) of Computers & Fluids 2020
    for iAn=1:3
        
        dxyz = dX_original_all ;
        dxyz(:,iAn) = filterSizeRatio * dxyz(:,iAn) ;
        
        %% accurate formulation
        % GnTotal_wholeDomain is the relevant one
%         tic
        [ AnTauR_wholeDomain(:,iAn) , GnTotal_wholeDomain(:,iAn) , GnVreman_wholeDomain(:,iAn) , GnNoSGS_wholeDomain(:,iAn) , GnTotalCommercial_wholeDomain(:,iAn) , GnTotalAdd_wholeDomain(:,iAn) , nuSGS_vreman_wholeDomain ] = ...
            Gn_v100b1( Vars_wholeDomain , RS_tmp_wholeDomain ,  Vars_lpfN_wholeDomainT{iAn} , ...
            tauSgs_wholeDomain , Sij_wholeDomain , gradU_wholeDomain , ...
            which_deltaHratio * dX_original_all(:,iAn) , which_deltaHratio *  dX_original_all , which_deltaHratio * dxyz , D2operators_allT{iAn} , ...
            Dx_operator_all,Dy_operator_all,Dz_operator_all , divOperator_all, ...
            filterSizeRatio ) ;
%         toc
        
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % none of the following is important
    if ~strcmpi(superMinimalistic,'yes')
        %% gradUtmp = [dudx,dvdx,dwdx,dudy,dvdy,...] 
        gradU_wholeDomain       = reshape(gradU_wholeDomain,[],9);
        gradMag_wholeDomain     = sum( gradU_wholeDomain.^2 , 2 );

        %%
        betaIJ                  = 2*DClarksTauij_wholeDomain ;
        bBeta_wholeDomain       = SijSecondInvarient_v100( betaIJ ) ;

        nuSgsVreman_wholeDomain = .025 * sqrt( bBeta_wholeDomain ./ gradMag_wholeDomain ) ;

        clear betaIJ

        %%
        PgradU_tmp_wholeDomain    = Vars_wholeDomain(:,4)   .* gradU_wholeDomain ;
        modPgradU_tmp_wholeDomain = modP                    .* gradU_wholeDomain ;

        %% divUiUj = ddX * tauSgs(:,i,1) + ddY * tauSgs(:,i,2) + ddZ * tauSgs(:,i,3)
        divUiUj_wholeDomain    = dSijDxj_v100( divOperator_all    , RS_tmp_wholeDomain ) ;

        %% 
        UkDUiDxK_wholeDomain   = nonlin2vNStC_v100( Vars_wholeDomain(:,1:3) , reshape( permute( reshape( gradU_wholeDomain , [],3,3 ) , [1 3 2] ) ,[],9 ) );

        %%
        skewSymmetric_wholeDomain      = ( divUiUj_wholeDomain + UkDUiDxK_wholeDomain ) /2 ;

        %%
        gradP_wholeDomain       = reshape( gradOperator_all   * Vars_wholeDomain(:,4)   ,[],3 ) ;
        gradModP_wholeDomain    = reshape( gradOperator_all   * modP   ,[],3 ) ;

        %%
        laplacianUi_wholeDomain    = laplacianOperator_all      * Vars_wholeDomain(:,1:3) ;

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% divTauSgs = nuR * laplacianUi + dNu/dxJ * S_ij
        divTauSgs_wholeDomain      =   - Vars_wholeDomain(:,5) .* laplacianUi_wholeDomain - ...
                                   - 2 * nonlin2vtC_v100( gradNu_wholeDomain , Sij_wholeDomain );

        divModTauSgs_wholeDomain   = divTauSgs_wholeDomain + 1/3 * dSijDxj_v100( divOperator_all    , tauKKsgs_wholeDomain .* [1 0 0 1 0 1] ) ; 

        %% UiDtauJKdxKtmp(:,i,j) = U(:,i) * divTauSgs(:,j)
        %% order: (i,j) = (1,1), (1,2), (1,3), (2,1), (2,2), ... 
        UiDtauJKdxK_tmp_wholeDomain     = nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3) , divTauSgs_wholeDomain );
        UiDmodTauJKdxK_tmp_wholeDomain  = nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3) , divModTauSgs_wholeDomain );

        %%
        TikDujDxk_tmp_wholeDomain       = TikDujDxk_v101( gradU_wholeDomain , tauSgs_wholeDomain );
        modTikDujDxk_tmp_wholeDomain    = TikDujDxk_v101( gradU_wholeDomain , modTauSgs_wholeDomain );

        
        dUjTikDxk_tmp_wholeDomain       = dUjTikDxk_v101( Vars_wholeDomain(:,1:3) , tauSgs_wholeDomain , divOperator_all ) ;
        dUjmodTikDxk_tmp_wholeDomain    = dUjTikDxk_v101( Vars_wholeDomain(:,1:3) , modTauSgs_wholeDomain , divOperator_all ) ;

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




        %% modified Clark residual stress or something like that (don't remember)
        MDClarksTauij_wholeDomain = ...
            symmetricTensor_9cTO6c_v100( ...
            nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3) , Vars_hpfNsum_wholeDomainT(:,1:3) ) + ...
            nonlin2vvA_tmp_v101( Vars_hpfNsum_wholeDomainT(:,1:3) , Vars_wholeDomain(:,1:3) ) ) - ...
            UiUj_hpfN_wholeDomainT ;

        %%
        divClarksTauij_wholeDomain      = dSijDxj_v100( divOperator_all    , ClarksTauij_wholeDomain ) ;
        divDClarksTauij_wholeDomain     = dSijDxj_v100( divOperator_all    , DClarksTauij_wholeDomain ) ;
        divMDClarksTauij_wholeDomain    = dSijDxj_v100( divOperator_all    , MDClarksTauij_wholeDomain ) ;

        %% a negative sign is skipped in all
        allSGS_codeTauij_wholeDomain        = RSeqSymmetrizer_vec_v100( UiDtauJKdxK_tmp_wholeDomain ) ;
        allSGS_codeModTauij_wholeDomain     = RSeqSymmetrizer_vec_v100( UiDmodTauJKdxK_tmp_wholeDomain ) ;
        allSGS_ClarksTauij_wholeDomain      = RSeqSymmetrizer_vec_v100( nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3) , divClarksTauij_wholeDomain ) );
        allSGS_DClarksTauij_wholeDomain     = RSeqSymmetrizer_vec_v100( nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3) , divDClarksTauij_wholeDomain ) );
        allSGS_MDClarksTauij_wholeDomain    = RSeqSymmetrizer_vec_v100( nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3) , divMDClarksTauij_wholeDomain ) );

        %% 
        sgsDissipation_code_wholeDomain         = allSGS_codeTauij_wholeDomain - ...
            RSeqSymmetrizer_vec_v100( dUjTikDxk_v101( Vars_wholeDomain(:,1:3) , tauSgs_wholeDomain , divOperator_all ) ) ;
        sgsDissipation_Clarks_wholeDomain      = allSGS_ClarksTauij_wholeDomain - ...
            RSeqSymmetrizer_vec_v100( dUjTikDxk_v101( Vars_wholeDomain(:,1:3) , ClarksTauij_wholeDomain , divOperator_all ) ) ;
        sgsDissipation_DClarks_wholeDomain      = allSGS_DClarksTauij_wholeDomain - ...
            RSeqSymmetrizer_vec_v100( dUjTikDxk_v101( Vars_wholeDomain(:,1:3) , DClarksTauij_wholeDomain , divOperator_all ) ) ;
        sgsDissipation_MDClarks_wholeDomain     = allSGS_MDClarksTauij_wholeDomain - ...
            RSeqSymmetrizer_vec_v100( dUjTikDxk_v101( Vars_wholeDomain(:,1:3) , MDClarksTauij_wholeDomain , divOperator_all ) ) ;



        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%
        meanMomentumDivForm_diff2zero_wholeDomain  = ...
                                + divUiUj_wholeDomain ...
                                + 1/fluid_rho * gradP_wholeDomain ...
                                - fluid_nu * laplacianUi_wholeDomain ...
                                + divTauSgs_wholeDomain ;

        meanMomentumConvForm_diff2zero_wholeDomain  = ...
                                + UkDUiDxK_wholeDomain ...
                                + 1/fluid_rho * gradP_wholeDomain ...
                                - fluid_nu * laplacianUi_wholeDomain ...
                                + divTauSgs_wholeDomain ;

        meanMomentumSkewForm_diff2zero_wholeDomain  = ...
                                + skewSymmetric_wholeDomain ...
                                + 1/fluid_rho * gradP_wholeDomain ...
                                - fluid_nu * laplacianUi_wholeDomain ...
                                + divTauSgs_wholeDomain ;

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% skewsymmetric: for both hybrid and OpenFOAM should use this 
        RSeq_tmp_convProdTurbTrans_wholeDomain   = nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3)     , divUiUj_wholeDomain      ) ;

        %%
        RSeq_tmp_altConvProdTurbTrans_wholeDomain   = nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3)     , skewSymmetric_wholeDomain      ) ;

        %%
        RSeq_tmp_allPressure_wholeDomain     = -1/fluid_rho * nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3)     , gradP_wholeDomain    ) ;
        modRSeq_tmp_allPressure_wholeDomain  = -1/fluid_rho * nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3)     , gradModP_wholeDomain    ) ;

        %%
        RSeq_tmp_allViscous_wholeDomain      = fluid_nu * nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3)     , laplacianUi_wholeDomain    ) ;

        %%
        RSeq_tmp_diff2zero_wholeDomain       ...
            = RSeq_tmp_convProdTurbTrans_wholeDomain ...
            - RSeq_tmp_allPressure_wholeDomain ...
            - RSeq_tmp_allViscous_wholeDomain ...
            + UiDtauJKdxK_tmp_wholeDomain ;


        %%
        RSeq_tmp_diff2zeroAlt_wholeDomain       ...
            = RSeq_tmp_altConvProdTurbTrans_wholeDomain ...
            - RSeq_tmp_allPressure_wholeDomain ...
            - RSeq_tmp_allViscous_wholeDomain ...
            + UiDtauJKdxK_tmp_wholeDomain ;
    end
    
    %% time derivative correction
    if strcmpi( case_timeDerivative , 'yes' )
        RSeq_tmp_diff2zero_wholeDomain = RSeq_tmp_diff2zero_wholeDomain + ...
            nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3) , dVarsDt_wholeDomain(:,1:3) ) ;
        
    end
    
    
    %% 
    modVars_wholeDomain = Vars_wholeDomain;

    % modified pressure
    modVars_wholeDomain(:,4) = modVars_wholeDomain(:,4) - ...
        4/3 * modVars_wholeDomain(:,5) .* Sbar_wholeDomain ;
    
    % modified Reynolds stresses as the sum of resolved and modelled
    modRS_tmp_wholeDomain = RS_tmp_wholeDomain - ...
        2 * modVars_wholeDomain(:,5) .* ...
        ( Sij_wholeDomain - 2/3 * Sbar_wholeDomain .* [1 0 0 1 0 1] );
    
    %%
    
    
    %% non important
    if strcmpi( do_unimportantStuff , 'yes' )
        
        %%
        absVars_wholeDomain    = abs( Vars_wholeDomain ) ;
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%
        D2Vars_Dx2_wholeDomain = D2x_operator_all * Vars_wholeDomain ; 
        D2Vars_Dy2_wholeDomain = D2y_operator_all * Vars_wholeDomain ; 
        D2Vars_Dz2_wholeDomain = D2z_operator_all * Vars_wholeDomain ; 
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Anisotropic error indicator: original formulation of directional structure functions
        for iAn=1:3
            AnSFo_wholeDomain(:,iAn)    = OF_AnSFo_v100( Vars_wholeDomain(:,1:3) , SFoperatorE_all{iAn},SFoperatorW_all{iAn} ) ;
        end

        %% Anisotropic error indicator: total energy due to existance of small scale motions
        for iAn=1:3
            AnRE_wholeDomain(:,iAn) = sum( 2 * Vars_wholeDomain(:,1:3) .* Vars_hpfN_wholeDomainT(:,1:3,iAn) - Vars_hpfN_wholeDomainT(:,1:3,iAn).^2 , 2);    
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Germano's dynamic procedure - Lilly
        [ Vars_hpf_wholeDomain , Vars_lpf_wholeDomain ] = ...
            OF_BFS_HpfLpfIso_v100( Vars_wholeDomain , dX_original_all , {D2x_operator_all,D2y_operator_all,D2z_operator_all} ) ;


        [ Lij_wholeDomain , LijD_wholeDomain ] = OF_BFS_leonardStressGermano_v100( Vars_lpf_wholeDomain , RS_tmp_wholeDomain , ...
                                                dX_original_all , {D2x_operator_all,D2y_operator_all,D2z_operator_all} ) ;

        Mij_wholeDomain = OF_BFS_tauIJdiff_v100( Sij_wholeDomain , Vars_lpf_wholeDomain , ...
                dX_original_all , {D2x_operator_all,D2y_operator_all,D2z_operator_all} , ...
                Dx_operator_all,Dy_operator_all,Dz_operator_all , ...
                filterSize_all , filterSizeRatioIso ) ;

        csGermanoLilly_wholeDomain = OF_BFS_csGDSLilly_v100( LijD_wholeDomain , Mij_wholeDomain ) ;

        nuSgsGermanoLilly_wholeDomain = OF_BFS_nuSgsGDSLilly_v100( csGermanoLilly_wholeDomain , Sij_wholeDomain , filterSize_all ) ;

        kSgs_wholeDomain       = .5 * sum( Vars_hpf_wholeDomain(:,1:3).^2 , 2 ) ;
        
        %%
        DUhpf_Dx_wholeDomain   = Dx_operator_all * Vars_hpf_wholeDomain(:,1:3) ;
        DUhpf_Dy_wholeDomain   = Dy_operator_all * Vars_hpf_wholeDomain(:,1:3) ;
        DUhpf_Dz_wholeDomain   = Dz_operator_all * Vars_hpf_wholeDomain(:,1:3) ;
    
        %% gradUtmp(:,i,j) = dUi/dXj 
        gradUhpf_wholeDomain       = cat(3,DUhpf_Dx_wholeDomain(:,1:3),DUhpf_Dy_wholeDomain(:,1:3),DUhpf_Dz_wholeDomain(:,1:3));

        %% Sij(:,i,j) = 1/2*( gradUtmp(:,i,j) + gradUtmp(:,j,i) ) = 1/2*(dUi/dXj+dUj/dXi)
        SijUhpf_wholeDomain    = 1/2 * ( gradUhpf_wholeDomain + permute(gradUhpf_wholeDomain , [1,3,2] ) ) ;
        SijUhpf_wholeDomain    = reshape( SijUhpf_wholeDomain , [] ,9 ) ;
        SijUhpf_wholeDomain    = SijUhpf_wholeDomain( : , [1,2,3,5,6,9] ) ;
    
        nuSgsFilteredSmagorinsky_wholeDomain    = OF_BFS_nuSgsGDSLilly_v100( .1^2 , SijUhpf_wholeDomain ,filterSize_all ) ;
        
        clear *Uhpf*
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Germano's dynamic procedure: error in the proposed equation
        errorNewGDP_wholeDomain = residual_proposedGDP_v100( csGermanoLilly_wholeDomain , LijD_wholeDomain , Mij_wholeDomain , divOperator_all ) ;
        errorNewGDP_wholeDomain    = errorNewGDP_wholeDomain.^2;
        
        %%
        clear Vars_lpf_*wholeDomain Vars_hpf_*wholeDomain Lij*wholeDomain Mij*wholeDomain

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%
        [ AnGiso_wholeDomain , Fi_wholeDomain , Lij_wholeDomain,LijD_wholeDomain , delTauSgs_wholeDomain ] = ...
            AnGiso_v102(  Vars_wholeDomain , RS_tmp_wholeDomain , ...
                                tauSgs_wholeDomain , Sij_wholeDomain , dX_original_all , ...
                                D2x_operator_all,D2y_operator_all,D2z_operator_all , ...
                                Dx_operator_all,Dy_operator_all,Dz_operator_all , divOperator_all, ...
                                filterSizeRatioIso );
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%               
        %%
        absFi_wholeDomain      = abs( Fi_wholeDomain ) ;
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%
        UiGj_tmp_wholeDomain = ...
        ( nonlin2vvA_tmp_v101( Vars_wholeDomain(:,1:3) , Fi_wholeDomain ) + ...
          nonlin2vvA_tmp_v101( Fi_wholeDomain , Vars_wholeDomain(:,1:3) ) )  ;

        absUiGj_tmp_wholeDomain = ...
        ( nonlin2vvA_tmp_v101( abs(Vars_wholeDomain(:,1:3)) , abs(Fi_wholeDomain) ) + ...
          nonlin2vvA_tmp_v101( abs(Fi_wholeDomain) , abs(Vars_wholeDomain(:,1:3)) ) )  ;
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% 
        instantRes_wholeDomain     = divUiUj_wholeDomain ...
            + 1/fluid_rho * gradP_wholeDomain ...
            - fluid_nu * laplacianUi_wholeDomain ...
            + divTauSgs_wholeDomain ;
        
        %%
        if strcmpi( case_timeDerivative , 'yes' )
            instantRes_wholeDomain     = instantRes_wholeDomain + dVarsDt_wholeDomain(:,1:3) ;
        end
        
        %%
        absInstantResidual_wholeDomain     = abs( instantRes_wholeDomain );
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%
        RiUj_tmp_wholeDomain   = nonlin2vvA_tmp_v101( instantRes_wholeDomain      , Vars_wholeDomain(:,1:3) );
    end
    
    
    %% instantaneous omega (vorticity) and A(n) to be stored at specified planes
    for i=1:length(x_storable)
        Omega_storable{i}(:,:,iMainLoop)    = Vorticity_wholeDomain( i_storable{i} , : );
        An_storable{i}(:,:,iMainLoop)       = An_wholeDomain( i_storable{i} , : );
    end
    
    %%
    clear gradNu_*
    
    %% compute batch means: minor batches
    allVars_instant    = who('*_wholeDomain') ;
    allVars_instant    = intersect( allVars_instant , allVars_nameInstant ) ; 
%     allVars_instant = allVars_wholeDomain_instant;
    
    for j=1:length(allVars_instant)
        lovelyNameHere = [allVars_instant{j},'_TMean_minorBatches_Vec(:,:,',num2str( ceil(iMainLoop/snapPerMinorBatch) ),')'] ;
        eval([lovelyNameHere , '=' , lovelyNameHere ,'+' ,allVars_instant{j},';'])
    end
    clear lovelyNameHere
    
    %%
    nonlinVars_wholeDomain_instant    = who('*_tmp_wholeDomain') ;
    
    %%
    clear *_wholeDomain *_downstream
end
toc
clear iMainLoop
clear modP 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% taking the average in time by dividing the sum by the number of snapshots
tic
disp('computing the time averages ...')
for j=1:length(allVars_instant)
    disp(['variable ', num2str(j) , ' of a total of ',num2str(length(allVars_instant)),' variables...'])
    eval( [allVars_instant{j},'_TMean_minorBatches_Vec = ' , ...
        allVars_instant{j},'_TMean_minorBatches_Vec / ',num2str(snapPerMinorBatch),';']);
end
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% adding the nonlinear terms
% for i=1:length(averagableFields_mainNames3)
%     averagableFields_mainNames4p{i} = averagableFields_mainNames3{i}(1:end-4);
% end
% averagableFields_mainDim4p   = averagableFields_mainDim3 ;

averagableFields_mainNames  = [ averagableFields_mainNames  , 'RS' , 'modRS' ] ;
averagableFields_mainDim    = [ averagableFields_mainDim    ,   6  ,    6    ] ;

%% initializing the spanswise-averaged fields to all-zero arrays
averagableFields_tailNames      = { 'ZTMean_minorBatches_Vec'  } ;
averagableFields_tailDim        = [       numMinorBatch        ] ;
averagableFields_xyzUp_Dim      = [  length(XY_averagable_all)  ] ;
% averagableFields_xyzDown_Dim    = [ length(XY_averagable_down) ] ;

for i=1:length(averagableFields_mainNames)
    for j=1:length(averagableFields_tailNames)
        eval([averagableFields_mainNames{i},'_wholeDomain_',averagableFields_tailNames{j} , ...
            '=zeros(',num2str(averagableFields_xyzUp_Dim(j)),',',num2str(averagableFields_mainDim(i)),',',num2str(averagableFields_tailDim(j)),');'])
    end
end

%% Taking the average in the spanwise direction
%% note that we are only taking the average of what we had inside the main loop
%% the nonlinear terms are added later
disp('taking the average of linear variables in the spanwise direction ...')
tic
for k=1:length(allVars_instant)
    disp(['variable ', num2str(k) , ' of a total of ',num2str(length(allVars_instant)),' variables...'])
    eval( [allVars_instant{k},'_ZTMean_minorBatches_Vec = zAveraging_v010( ',...
        allVars_instant{k},'_TMean_minorBatches_Vec , IndZ_averagable_all , numMinorBatch);'] )
    clear([ allVars_instant{k},'_TMean_minorBatches_Vec' ])
end

clear *_TMean_minorBatches_Vec

toc

%%
if ~strcmpi(which_case , 'BFS' )
    disp('taking the average in the streamwise direction ...')
    tic
    for k=1:length(allVars_instant)
        disp(['variable ', num2str(k) , ' of a total of ',num2str(length(allVars_instant)),' upstream variables...'])
        eval( [allVars_instant{k},'_ZTMean_minorBatches_Vec = xAveraging_v010( ',...
            allVars_instant{k},'_ZTMean_minorBatches_Vec , IndX_averagable_all , numMinorBatch);'] )
    end
    toc
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
disp('taking the average of nonlinear variables in the spanwise direction ...')

if ~strcmpi(superMinimalistic,'yes')
    tic
    nonlinZTMeanTermsTailName   = { '_minorBatches_Vec' };
    nonlinZTMeanTermsDomain     = { '_wholeDomain_ZTMean' }; %,  '_downstream_ZTMean' } ;

    if strcmpi(do_unimportantStuff,'yes')

        for i = 1 : length(nonlinZTMeanTermsTailName)
            for j = 1 : length(nonlinZTMeanTermsDomain)
                eval( [ '[ ',...
                        'RS'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDtauJKdxK'   , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjTikDxk'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'TikDujDxk'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiP'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiUjUk'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'PgradU'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'epsilon'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'RiUj'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiGj'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'absUiGj'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ...
                        ' ] = ' , ...
                        'OF_BFS_nonlinterms_v130( ' , ...
                        'RS_tmp'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDtauJKdxK_tmp'   , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjTikDxk_tmp'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'TikDujDxk_tmp'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiP_tmp'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiUjUk_tmp'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'PgradU_tmp'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'epsilon_tmp'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'RiUj_tmp'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiGj_tmp'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'absUiGj_tmp'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'Vars'              , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'gradU'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divTauSgs'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'tauSgs'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'instantRes'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'Fi'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'absFi'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'absVars'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divOperator2D_all' , ...
                        ' ) ; ' ] )
            end
        end

    else

        for i = 1 : length(nonlinZTMeanTermsTailName)
            for j = 1 : length(nonlinZTMeanTermsDomain)
                eval( [ '[ ',...
                        'RS'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDtauJKdxK'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDmodTauJKdxK'    , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjTikDxk'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjmodTikDxk'      , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'TikDujDxk'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiP'               , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiUjUk'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'PgradU'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'epsilon'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ...
                        ' ] = ' , ...
                        'OF_BFS_nonlinterms_v140nec( ' , ...
                        'RS_tmp'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDtauJKdxK_tmp'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDmodTauJKdxK_tmp'    , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjTikDxk_tmp'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjmodTikDxk_tmp'      , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'TikDujDxk_tmp'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiP_tmp'               , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiUjUk_tmp'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'PgradU_tmp'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'epsilon_tmp'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'Vars'                  , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'gradU'                 , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divTauSgs'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divModTauSgs'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'tauSgs'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'modTauSgs'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divOperator2D_all' , ...
                        ' ) ; ' ] )
            end
        end

    end

    for i = 1 : length(nonlinZTMeanTermsTailName)
        for j = 1 : length(nonlinZTMeanTermsDomain)
            eval( [ '[ ',...
                    'RSeq_convProdTurbTrans'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_altConvProdTurbTrans'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_allPressure'              , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'modRSeq_allPressure'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_allViscous'               , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_diff2zero'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_diff2zeroAlt'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ...
                    ' ] = ' , ...
                    'OF_BFS_RSeq_nonlin_v110( '     , ...
                    'RSeq_tmp_convProdTurbTrans'    , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_tmp_altConvProdTurbTrans' , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_tmp_allPressure'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'modRSeq_tmp_allPressure'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_tmp_allViscous'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'UiDtauJKdxK'                   , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'Vars'                          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'divUiUj'                       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'skewSymmetric'                 , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    '-1/fluid_rho * gradP'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    '-1/fluid_rho * gradModP'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'fluid_nu * laplacianUi'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ...
                    ' ) ; ' ] )
        end
    end

else
    RS_wholeDomain_ZTMean_minorBatches_Vec = nonlin2vvS_v100( RS_tmp_wholeDomain_ZTMean_minorBatches_Vec , Vars_wholeDomain_ZTMean_minorBatches_Vec(:,1:3,:) );
end
toc

%% the surrogate Reynolds stress, as defined in the write-up: newFormulation_v071
modRS_wholeDomain_ZTMean_minorBatches_Vec = ...
    RS_wholeDomain_ZTMean_minorBatches_Vec + ...
    tauSgs_wholeDomain_ZTMean_minorBatches_Vec + ...
    tauKKsgs_wholeDomain_ZTMean_minorBatches_Vec .* [1,0,0,1,0,1] * 2/3 ; 

%%
averagableFields_tailNames      = { 'ZTMean_majorBatches_Vec'  , 'ZTstDev_majorBatches_Vec' } ;
averagableFields_tailDim        = [        numMajorBatch       ,        numMajorBatch       ] ;
averagableFields_xyzUp_Dim      = [  length(XY_averagable_all)  ,  length(XY_averagable_all)  ] ;


for i=1:length(averagableFields_mainNames)
    for j=1:length(averagableFields_tailNames)
        eval([averagableFields_mainNames{i},'_wholeDomain_',averagableFields_tailNames{j} , ...
            '=zeros(',num2str(averagableFields_xyzUp_Dim(j)),',',num2str(averagableFields_mainDim(i)),',',num2str(averagableFields_tailDim(j)),');'])
    end
end

%% including the nonlinear terms is to have their standard deviation computed properly
tic

if ~strcmpi(superMinimalistic,'yes')
    allVars_instant_wNonlin = [allVars_instant ; ...
        'RS_wholeDomain' ; 'UiP_wholeDomain' ; 'UiUjUk_wholeDomain' ; ...
        'PgradU_wholeDomain' ; 'epsilon_wholeDomain' ; 'UiDtauJKdxK_wholeDomain' ; 'UiDmodTauJKdxK_wholeDomain'  ];
else
    allVars_instant_wNonlin = [allVars_instant ; 'RS_wholeDomain' ; 'modRS_wholeDomain' ];
end

for j=1:length(allVars_instant_wNonlin)
    for i=1:numMajorBatch
        eval( [allVars_instant_wNonlin{j},'_ZTMean_majorBatches_Vec(:,:,',num2str(i),') = mean(' , ...
            allVars_instant_wNonlin{j},'_ZTMean_minorBatches_Vec(:,:, ',num2str((i-1)*minorPerMajor+1),':',num2str(i*minorPerMajor),'),3);']);
        eval( [allVars_instant_wNonlin{j},'_ZTstDev_majorBatches_Vec(:,:,',num2str(i),') = std(' , ...
            allVars_instant_wNonlin{j},'_ZTMean_minorBatches_Vec(:,:, ',num2str((i-1)*minorPerMajor+1),':',num2str(i*minorPerMajor),'),0,3);']);
    end
end
toc

%%
tic
for j=1:length(allVars_instant_wNonlin)
    eval( [allVars_instant_wNonlin{j},'_ZTMean_Vec = mean(' , allVars_instant_wNonlin{j},'_ZTMean_majorBatches_Vec,3);']);
end
toc

%%
tic
if ~strcmpi(superMinimalistic,'yes')
    nonlinZTMeanTermsTailName   = { '_majorBatches_Vec' , '_Vec' };
    nonlinZTMeanTermsDomain     = { '_wholeDomain_ZTMean' }; %'_downstream_ZTMean' } ;

    if strcmpi(do_unimportantStuff,'yes')

        for i = 1 : length(nonlinZTMeanTermsTailName)
            for j = 1 : length(nonlinZTMeanTermsDomain)
                eval( [ '[ ',...
                        'RS'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDtauJKdxK'   , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjTikDxk'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'TikDujDxk'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiP'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiUjUk'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'PgradU'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'epsilon'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'RiUj'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiGj'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'absUiGj'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ...
                        ' ] = ' , ...
                        'OF_BFS_nonlinterms_v130( ' , ...
                        'RS_tmp'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDtauJKdxK_tmp'   , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjTikDxk_tmp'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'TikDujDxk_tmp'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiP_tmp'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiUjUk_tmp'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'PgradU_tmp'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'epsilon_tmp'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'RiUj_tmp'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiGj_tmp'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'absUiGj_tmp'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'Vars'              , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'gradU'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divTauSgs'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'tauSgs'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'instantRes'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'Fi'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'absFi'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'absVars'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divOperator2D_all' , ...
                        ' ) ; ' ] )
            end
        end

    else

        for i = 1 : length(nonlinZTMeanTermsTailName)
            for j = 1 : length(nonlinZTMeanTermsDomain)
                eval( [ '[ ',...
                        'RS'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDtauJKdxK'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDmodTauJKdxK'    , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjTikDxk'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjmodTikDxk'      , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'TikDujDxk'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiP'               , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiUjUk'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'PgradU'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'epsilon'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ...
                        ' ] = ' , ...
                        'OF_BFS_nonlinterms_v140nec( ' , ...
                        'RS_tmp'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDtauJKdxK_tmp'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiDmodTauJKdxK_tmp'    , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjTikDxk_tmp'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'dUjmodTikDxk_tmp'      , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'TikDujDxk_tmp'         , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiP_tmp'               , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'UiUjUk_tmp'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'PgradU_tmp'            , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'epsilon_tmp'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'Vars'                  , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'gradU'                 , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divTauSgs'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divModTauSgs'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'tauSgs'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'modTauSgs'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                        'divOperator2D_all' , ...
                        ' ) ; ' ] )
            end
        end

    end

    for i = 1 : length(nonlinZTMeanTermsTailName)
        for j = 1 : length(nonlinZTMeanTermsDomain)
            eval( [ '[ ',...
                    'RSeq_convProdTurbTrans'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_altConvProdTurbTrans'     , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_allPressure'              , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'modRSeq_allPressure'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_allViscous'               , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_diff2zero'                , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_diff2zeroAlt'             , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ...
                    ' ] = ' , ...
                    'OF_BFS_RSeq_nonlin_v110( '     , ...
                    'RSeq_tmp_convProdTurbTrans'    , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_tmp_altConvProdTurbTrans' , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_tmp_allPressure'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'modRSeq_tmp_allPressure'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'RSeq_tmp_allViscous'           , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'UiDtauJKdxK'                   , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'Vars'                          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'divUiUj'                       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'skewSymmetric'                 , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    '-1/fluid_rho * gradP'          , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    '-1/fluid_rho * gradModP'       , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ' , ' , ...
                    'fluid_nu * laplacianUi'        , nonlinZTMeanTermsDomain{j},nonlinZTMeanTermsTailName{i} , ...
                    ' ) ; ' ] )
        end
    end
else
    RS_wholeDomain_ZTMean_majorBatches_Vec  = nonlin2vvS_v100( RS_tmp_wholeDomain_ZTMean_majorBatches_Vec , Vars_wholeDomain_ZTMean_majorBatches_Vec(:,1:3,:) );
    RS_wholeDomain_ZTMean_Vec               = nonlin2vvS_v100( RS_tmp_wholeDomain_ZTMean_Vec , Vars_wholeDomain_ZTMean_Vec(:,1:3,:) );
    RS_wholeDomain_ZTstDev_Vec              = std(RS_wholeDomain_ZTMean_majorBatches_Vec,[],3) ;
end
toc

%% the surrogate Reynolds stress, as defined in the write-up: newFormulation_v071
modRS_wholeDomain_ZTMean_majorBatches_Vec = ...
    RS_wholeDomain_ZTMean_majorBatches_Vec + ...
    tauSgs_wholeDomain_ZTMean_majorBatches_Vec + ...
    tauKKsgs_wholeDomain_ZTMean_majorBatches_Vec  .* [1,0,0,1,0,1] * 2/3 ; 

modRS_wholeDomain_ZTMean_Vec = RS_wholeDomain_ZTMean_Vec + ...
    tauSgs_wholeDomain_ZTMean_Vec + ...
    tauKKsgs_wholeDomain_ZTMean_Vec  .* [1,0,0,1,0,1] * 2/3 ; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
disp('correcting wall values...')
tic
allVars_set2ZeroAtWall = [ who('RS*') ; who('AnTauR*') ; who('UiDtauJKdxK_*') ; who('divUiUj_*') ];
for i=1:length(allVars_set2ZeroAtWall)
    wallBC = 'zero' ;
    eval([ allVars_set2ZeroAtWall{i} , '=' ,...
        'hardFixValuesAtWalls_v010b1( ' , allVars_set2ZeroAtWall{i} , ',' , ...
        'indWall2D_all , indWallNeighbor2D_all , wallBC ) ;'] )
end

%%
allVars_set2NeighborAtWall = [ who('dUjTikDxk_*') ; who('divTauSgs_*') ; who('meanMomentum*') ];
for i=1:length(allVars_set2NeighborAtWall)
    wallBC = 'neighbor' ;
    eval([ allVars_set2NeighborAtWall{i} , '=' ,...
        'hardFixValuesAtWalls_v010b1( ' , allVars_set2NeighborAtWall{i} , ',' , ...
        'indWall2D_all , indWallNeighbor2D_all , wallBC ) ;'] )
end
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% finding the inside points without enough neighbors
if strcmpi(which_code , 'OF' ) || strcmpi(which_code , 'OpenFOAM' )
    
    indWall2d_altogether = [];
    for i=1:length(indWall2D_all)
        indWall2d_altogether = [indWall2d_altogether ; indWall2D_all{i}];
    end

    indAtLeastOneMissing = iIndwoNx2D_all | iIndwoNy2D_all ;
    indAtLeastOneMissing = indPoints2D_all(indAtLeastOneMissing);
    indVeryBadPoints = setdiff( indAtLeastOneMissing , indWall2d_altogether );

        indExcusedPoints = XY_averagable_all(indVeryBadPoints,1) <-19 | ...
            XY_averagable_all(indVeryBadPoints,1) >24 | XY_averagable_all(indVeryBadPoints,2) >4 ;

    indVeryBadPoints(indExcusedPoints)=[];

    %%
    XY_averagable_all_noBadPoint = XY_averagable_all ;
    XY_averagable_all_noBadPoint(indVeryBadPoints , :)=[];

    allVars_affectedByBadPoints = who('RSeq_altConvProdTurbTrans_wholeDomain*') ;
    for i=1:length(allVars_affectedByBadPoints)
        tmp = eval( allVars_affectedByBadPoints{i} ) ;
        tmp(indVeryBadPoints,:)=[];
    %     eval([ allVars_affectedByBadPoints{i} , '(indVeryBadPoints,:)=[];' ])

        for j=1:size( tmp ,2)
            Finterp = scatteredInterpolant( XY_averagable_all_noBadPoint , tmp(:,j) );
            eval([  allVars_affectedByBadPoints{i} , '(:,j)=Finterp(XY_averagable_all);'  ])
        end
    end
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% small caveat: did not change the variable name for consistency, but defining extra variables with useful names.
allVars_allTauSgs = who('UiDtauJKdxK_*');
allVars_allTauSgsTmp = who('UiDtauJKdxK_tmp_*');
allVars_allTauSgs = setdiff( allVars_allTauSgs , allVars_allTauSgsTmp ) ;
for i=1:length(allVars_allTauSgs)
    eval([ 'RSeq_allSGS' , allVars_allTauSgs{i}(12:end) , ' = -' , allVars_allTauSgs{i} , ';' ])
end

for i=1:length(allVars_allTauSgsTmp)
    eval([ 'RSeq_tmp_allSGS' , allVars_allTauSgsTmp{i}(16:end) , ' = -' , allVars_allTauSgsTmp{i} , ';' ])
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% for the sake of consistency in order of variables with previous versions
allVars_RS      = [ who('RS*') ; who('modRS*') ] ;
allVars_RSeq    = [ who('RSeq*') ; who('modRSeq*') ];
allVars_RS      = setdiff( allVars_RS , allVars_RSeq );
allVars_epsilon = who('epsilon*');
allVars_symTensor6 = [ allVars_RS ; allVars_epsilon ];
for i=1:length(allVars_symTensor6)
    eval( [ allVars_symTensor6{i},'=',allVars_symTensor6{i},'(:,[1,4,6,2,3,5],:);' ] )
end

allVars_UiUjUk  = who('UiUjUk*');
for i=1:length(allVars_UiUjUk)
    eval([ allVars_UiUjUk{i},'=',allVars_UiUjUk{i},'(:,',...
        '[ 1,2,3 , 2,4,5 , 3,5,6  , ' , ...
          '2,4,5 , 4,7,8 , 5,8,9  , ' , ...
          '3,5,6 , 5,8,9 , 6,9,10 ] , : ) ;' ])
end

allVars_Sij     = who('Sij*');
allVars_tauSgs  = who('tauSgs*');
allVars_symTensor9 = [ allVars_Sij ; allVars_tauSgs ];
for i=1:length(allVars_symTensor9)
    eval( [ allVars_symTensor9{i},'=',allVars_symTensor9{i},'(:,[1,2,3 , 2,4,5 , 3,5,6],:);' ] )
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
if strcmpi(which_flow,'BFS')
    iXY_up      =   XY_averagable_all(:,1) <= case_stepPosition(1) & ...
                    XY_averagable_all(:,2) >= case_stepPosition(2) ;
    iXY_down    =   XY_averagable_all(:,1) >= case_stepPosition(1) & ...
                    XY_averagable_all(:,2) >= -1 ;
    
    iXYZ_up     =   XYZ_original_all(:,1) <= case_stepPosition(1) & ...
                    XYZ_original_all(:,2) >= case_stepPosition(2) ;
    iXYZ_down   =   XYZ_original_all(:,1) >= case_stepPosition(1) & ...
                    XYZ_original_all(:,2) >= -1 ;
else
    iXY_up      =   XY_averagable_all(:,1) <= case_stepPosition(1) ;
    iXY_down    =   XY_averagable_all(:,1) >= case_stepPosition(1) ;
    
    iXYZ_up     =   XYZ_original_all(:,1) <= case_stepPosition(1) ;
    iXYZ_down   =   XYZ_original_all(:,1) >= case_stepPosition(1) ;
end

%%
XY_averagable_up    = XY_averagable_all( iXY_up , : );
X_up    = unique( XY_averagable_up(:,1) );
Y_up    = unique( XY_averagable_up(:,2) );
Z_up    = unique( XYZ_original_all(iXYZ_up,3) ) ;

XY_averagable_down  = XY_averagable_all( iXY_down , : );
X_down  = unique( XY_averagable_down(:,1) );
Y_down  = unique( XY_averagable_down(:,2) );
Z_down  = unique( XYZ_original_all(iXYZ_down,3) ) ;

nim = min(X_down);
X_up    = [ X_up(X_up<nim) ; nim ] ;

if strcmpi(which_case,'BFS')
    Y_up    = [  0 ; Y_up(Y_up>0)  ];
    X_down  = [  0 ; X_down(X_down>0) ];
    Y_down  = [ -1 ; Y_down(Y_down>-1) ];
elseif strcmpi(which_flow,'channel')
    Y_up    = [ -1 ; Y_up( Y_up>-1 & Y_up<1 )      ; 1  ];
    Y_down  = [ -1 ; Y_down(Y_down>-1 & Y_down<1)  ; 1  ];
end

%%
for i=1:length(averagableFields_mainNames)
    for j=1:length(averagableFields_tailNames)
        eval([averagableFields_mainNames{i},'_upstream_ZTMean = zeros(',num2str(length(X_up)),',',num2str(length(Y_up)),',',num2str(averagableFields_mainDim(i)),');'])
        eval([averagableFields_mainNames{i},'_upstream_ZTMean_majorBatches = zeros(',num2str(length(X_up)),',',num2str(length(Y_up)),',',num2str(averagableFields_mainDim(i)),',',num2str(numMajorBatch),');'])
        eval([averagableFields_mainNames{i},'_upstream_ZTstDev_majorBatches = zeros(',num2str(length(X_up)),',',num2str(length(Y_up)),',',num2str(averagableFields_mainDim(i)),',',num2str(numMajorBatch),');'])
        eval([averagableFields_mainNames{i},'_upstream_ZTMean_minorBatches = zeros(',num2str(length(X_up)),',',num2str(length(Y_up)),',',num2str(averagableFields_mainDim(i)),',',num2str(numMinorBatch),');'])
    end
end

for i=1:length(averagableFields_mainNames)
    for j=1:length(averagableFields_tailNames)
        eval([averagableFields_mainNames{i},'_downstream_ZTMean = zeros(',num2str(length(X_down)),',',num2str(length(Y_down)),',',num2str(averagableFields_mainDim(i)),');'])
        eval([averagableFields_mainNames{i},'_downstream_ZTMean_majorBatches = zeros(',num2str(length(X_down)),',',num2str(length(Y_down)),',',num2str(averagableFields_mainDim(i)),',',num2str(numMajorBatch),');'])
        eval([averagableFields_mainNames{i},'_downstream_ZTstDev_majorBatches = zeros(',num2str(length(X_down)),',',num2str(length(Y_down)),',',num2str(averagableFields_mainDim(i)),',',num2str(numMajorBatch),');'])
        eval([averagableFields_mainNames{i},'_downstream_ZTMean_minorBatches = zeros(',num2str(length(X_down)),',',num2str(length(Y_down)),',',num2str(averagableFields_mainDim(i)),',',num2str(numMinorBatch),');'])
    end
end


%%
disp('separating the domain to represent it on structured grids...')
tic
tailNames = { '_wholeDomain_ZTMean_Vec' , '_wholeDomain_ZTMean_majorBatches_Vec' , ...
    '_wholeDomain_ZTMean_minorBatches_Vec' , '_wholeDomain_ZTstDev_majorBatches_Vec' };
for i=1:length(tailNames)
    allVars_wholeDomain = who([ '*' , tailNames{i} ]);
    
%     allVars_wholeDomain = who([ 'RSeq_altConvProdTurbTrans*' , tailNames{i} ]);
    for j=1:length(allVars_wholeDomain)
        varName_here    = allVars_wholeDomain{j}(1:end-length(tailNames{i})) ;
        varHere         = eval( allVars_wholeDomain{j} );
        disp(['interpolating variable ' , num2str(j) , ' of a total of ' , num2str(length(allVars_wholeDomain)) , ' variables']) 
        disp( allVars_wholeDomain{j})
        for k=1:size(varHere,2)
            for l=1:size(varHere,3)
                Finterp = scatteredInterpolant( XY_averagable_all , varHere(:,k,l) , 'linear' ) ;
                eval( [     varName_here,'_upstream' , tailNames{i}(13:end-4) , '(:,:,k,l) = '  ,...
                    'Finterp({X_up,Y_up});' ] )
                eval( [     varName_here,'_downstream' , tailNames{i}(13:end-4) , '(:,:,k,l) = '  ,...
                    'Finterp({X_down,Y_down});' ] )
                clear Finterp
            end
        end
    end
end
toc

%%
allVars_iWantStDev = { 'RS' , 'modRS' , 'Vars' , 'modVars' } ;
for i=1:length(allVars_iWantStDev)
    eval([ allVars_iWantStDev{i} , '_upstream_ZTstDev   = std( ' , allVars_iWantStDev{i} , '_upstream_ZTMean_majorBatches ,[],4);' ])
    eval([ allVars_iWantStDev{i} , '_downstream_ZTstDev = std( ' , allVars_iWantStDev{i} , '_downstream_ZTMean_majorBatches ,[],4);' ])
end


%%
dXYZ_2D_all_Vec     = zeros( length(XY_averagable_all) , 3 )  ;
for i=1:length(XY_averagable_all)
    dXYZ_2D_all_Vec(i,:) = mean( dX_original_all(IndZ_averagable_all{i},:) , 1);
end

if ~strcmpi(which_case,'BFS')
    dXYZ_2D_all_Vec = xAveraging_v010(dXYZ_2D_all_Vec,IndX_averagable_all,1);
    iiU1 = XY_averagable_all(:,2)   ==  Y_up(end);
    iiU2 = XY_averagable_all(:,2)   ==  Y_up(end-1);
    dXYZ_2D_all_Vec(iiU1,2)         =   2*(Y_up(end)-Y_up(end-1));
    dXYZ_2D_all_Vec(iiU2,2)         =   2*(Y_up(end)-Y_up(end-1));
    
    iiL1 = XY_averagable_all(:,2)   ==  Y_up(1);
    iiL2 = XY_averagable_all(:,2)   ==  Y_up(2);
    dXYZ_2D_all_Vec(iiL1,2)         =   2*(Y_up(2)-Y_up(1));
    dXYZ_2D_all_Vec(iiL2,2)         =   2*(Y_up(2)-Y_up(1));
end

%%
tic
dXYZ_2D_up      = zeros(length(X_up),length(Y_up),3);
dXYZ_2D_down    = zeros(length(X_down),length(Y_down),3);
for i=1:3
    Finterp = scatteredInterpolant( XY_averagable_all , dXYZ_2D_all_Vec(:,i) , 'linear' ) ;
    dXYZ_2D_up(:,:,i)   = Finterp({X_up,Y_up});
    dXYZ_2D_down(:,:,i) = Finterp({X_down,Y_down});
    
    clear Finterp
end
toc

%%
if strcmpi(which_code,'OF') || strcmpi(which_code,'OpenFOAM')
    [ ~ , iPref ] = min(abs(X_up-x_Pref));
    Pref = Vars_upstream_ZTMean(iPref,1,4) ;
elseif strcmpi(which_code,'hybrid')
    Pref = 0 ;
end

%%
BL_dUdy = ( Vars_upstream_ZTMean(:,2,1) - Vars_upstream_ZTMean(:,1,1) )/(Y_up(2)-Y_up(1));
if strcmpi(which_case,'hybridWMLES200k') || ( strcmpi(which_case,'hybridWMLES250k') && ~strcmpi( which_grid , 'LES_Re250k_M02_uncorWMLES05s' ) ) 
    BL_tauWall = Vars_upstream_ZTMean(:,2,end) ;
else
    BL_tauWall = fluid_nu * BL_dUdy ;
end

BL_uTau = sqrt( BL_tauWall );
BL_deltaNu = fluid_nu ./ BL_uTau;
for i=1:length(X_up)
    if strcmpi(which_flow,'BFS')
    BL_delta95(i,1) = BL_finder_v100(Y_up,Vars_upstream_ZTMean(i,:,1),Vars_upstream_ZTMean(i,end,1),.95);
    BL_delta99(i,1) = BL_finder_v100(Y_up,Vars_upstream_ZTMean(i,:,1),Vars_upstream_ZTMean(i,end,1),.99);
    
    BL_delta95 = max( min(BL_delta95 , max(Y_up)) , min(Y_up) ) ;
    BL_delta99 = max( min(BL_delta99 , max(Y_up)) , min(Y_up) ) ;
    
    uUinf = Vars_upstream_ZTMean(i,:,1)/Vars_upstream_ZTMean(i,end,1) ;
    BL_theta(i,1) = trapz( Y_up , uUinf .* (1-uUinf) ) ;
    
    
    
    elseif strcmpi(which_flow,'channel')
        BL_delta95(i,1) =  0 ;
        BL_delta99(i,1) =  0 ;
        
        uUinf = Vars_upstream_ZTMean(i,:,1)/Vars_upstream_ZTMean(i,ceil(length(Y_up)/2),1) ;
        BL_theta(i,1) = trapz( Y_up(1:ceil(length(Y_up)/2)) , uUinf(1:ceil(length(Y_up)/2)) .* (1-uUinf(1:ceil(length(Y_up)/2))) ) ;
        
        BL_ReTau95  = 1 ./ BL_deltaNu ;
        BL_ReTau99  = 1 ./ BL_deltaNu ;
    end
    
    clear uUinf
end
clear i

if strcmpi(which_flow,'BFS')
    BL_ReTau95  = BL_delta95 ./ BL_deltaNu ;
    BL_ReTau99  = BL_delta99 ./ BL_deltaNu ;
    
    [~,iReTheta]=min(abs(X_up-plot_xLocation_report));
    disp(['Boundary layer \theta is ',num2str(BL_theta(iReTheta))])
    disp('Based on JD experiment \theta should be 0.12 at x=-3.')
    disp(['Re_\tau at x=-3 is: ',num2str(round(BL_ReTau99(iReTheta)))])
    BL_ReTheta = BL_theta(iReTheta) * Vars_upstream_ZTMean(iReTheta,end,1) *5100
    clear iReTheta
end

BL_cf       = 2 * BL_tauWall ;
BL_cp       = 2 * (Vars_upstream_ZTMean(:,1,4) - Pref) ;

%%
DN_dUdy = ( Vars_downstream_ZTMean(:,2,1) - Vars_downstream_ZTMean(:,1,1) )/(Y_down(2)-Y_down(1));
if strcmpi(which_case,'hybridWMLES200k')  || strcmpi(which_case,'hybridWMLES250k')
    DN_tauWall = Vars_downstream_ZTMean(:,2,end) ;
else
    DN_tauWall = fluid_nu * DN_dUdy ;
end
DN_uTau = sqrt( abs(DN_tauWall) );
DN_deltaNu = fluid_nu ./ DN_uTau;
for i=1:length(X_down)
    if strcmpi(which_case,'BFS')
        DN_delta95(i,1) = BL_finder_v100(Y_down,Vars_downstream_ZTMean(i,:,1),Vars_downstream_ZTMean(i,end,1),.95);
        DN_delta99(i,1) = BL_finder_v100(Y_down,Vars_downstream_ZTMean(i,:,1),Vars_downstream_ZTMean(i,end,1),.99);
        
        DN_delta95 = max( min(DN_delta95 , max(Y_down)) , min(Y_down) ) ;
        DN_delta99 = max( min(DN_delta99 , max(Y_down)) , min(Y_down) ) ;
    else
        DN_delta95(i,1) =  0 ;
        DN_delta99(i,1) =  0 ;
    end
    
    if strcmpi(which_case,'BFS')
        uUinf = Vars_downstream_ZTMean(i,:,1)/Vars_downstream_ZTMean(i,end,1) ;
        DN_theta(i,1) = trapz( Y_down , uUinf .* (1-uUinf) ) ;
    else
        uUinf = Vars_downstream_ZTMean(i,:,1)/Vars_downstream_ZTMean(i,ceil(length(Y_down)/2),1) ;
        DN_theta(i,1) = trapz( Y_down(1:ceil(length(Y_down)/2)) , uUinf(1:ceil(length(Y_down)/2)) .* (1-uUinf(1:ceil(length(Y_down)/2))) ) ;
    end
    
    
    clear uUinf
end
clear i
if strcmpi(which_case,'BFS')
    DN_ReTau95  = DN_delta95 ./ DN_deltaNu ;
    DN_ReTau99  = DN_delta99 ./ DN_deltaNu ;
else
    DN_ReTau95  = 1 ./ DN_deltaNu ;
    DN_ReTau99  = 1 ./ DN_deltaNu ;
end
DN_cf       = 2*DN_tauWall ;
DN_cp       = 2 * (Vars_downstream_ZTMean(:,1,4) - Pref) ;

%%
for i=1:numMajorBatch
    BL_dUdy_majorBatches(:,i)       = ( Vars_upstream_ZTMean_majorBatches(:,2,1,i) - Vars_upstream_ZTMean_majorBatches(:,1,1,i) ) / (Y_up(2) - Y_up(1));
        
    if strcmpi(which_case,'hybridWMLES200k')  || strcmpi(which_case,'hybridWMLES250k')
        BL_tauWall_majorBatches(:,i)    = Vars_upstream_ZTMean_majorBatches(:,2,end,i) ;
    else
        BL_tauWall_majorBatches(:,i)    = fluid_nu * BL_dUdy_majorBatches(:,i) ;
    end
    BL_uTau_majorBatches(:,i)       = sqrt( BL_tauWall_majorBatches(:,i) );
    BL_deltaNu_majorBatches(:,i)    = fluid_nu ./ BL_uTau_majorBatches(:,i);
    BL_cf_majorBatches(:,i)         = 2 * BL_tauWall_majorBatches(:,i) ;
    BL_cp_majorBatches(:,i)         = 2 * (Vars_upstream_ZTMean_majorBatches(:,1,4,i) - Pref) ;
        
    DN_dUdy_majorBatches(:,i)       = ( Vars_downstream_ZTMean_majorBatches(:,2,1,i) - Vars_downstream_ZTMean_majorBatches(:,1,1,i) )/(Y_down(2)-Y_down(1));        
    if strcmpi(which_case,'hybridWMLES200k')  || strcmpi(which_case,'hybridWMLES250k')
        DN_tauWall_majorBatches(:,i)    = Vars_downstream_ZTMean_majorBatches(:,2,end,i) ;
    else
        DN_tauWall_majorBatches(:,i)    = fluid_nu * DN_dUdy_majorBatches(:,i) ;
    end
    DN_uTau_majorBatches(:,i)       = sqrt( abs(DN_tauWall_majorBatches(:,i)) );
    DN_deltaNu_majorBatches(:,i)    = fluid_nu ./ DN_uTau_majorBatches(:,i);
    DN_cf_majorBatches(:,i)         = 2 * DN_tauWall_majorBatches(:,i) ;
    DN_cp_majorBatches(:,i)         = 2 * (Vars_downstream_ZTMean_majorBatches(:,1,4,i) - Pref) ;
end

%%
allVars_stDev = {'cp' , 'cf' , 'uTau' , 'deltaNu' , 'tauWall' } ;
for i=1:length(allVars_stDev)
    eval([ 'BL_' , allVars_stDev{i} , '_stDev = std( BL_' allVars_stDev{i} , '_majorBatches , [] , 2 ) ;' ])
    eval([ 'DN_' , allVars_stDev{i} , '_stDev = std( DN_' allVars_stDev{i} , '_majorBatches , [] , 2 ) ;' ])
end

%%
disp('finished with calculations, saving the data...')
tic
if strcmpi( case_saveBigFile , 'yes' )
    case_saveName = [case_filenames,'_smallFile_v',num2str(main_codeVer),'.mat'] ;
    if strcmpi( debugMode , 'yes' )
        case_saveName = [case_filenames,'_smallFile_v',num2str(main_codeVer),'_debug.mat'] ;
    end
    save( case_saveName,...
        'main_*','which_*','fluid_*','*_up','*_down','*_all','*_all_Vec','BL_*','DN_*','*_ZTMean','*_ZTMean_majorBatches','*_storable','*_ZTMean_Vec','*_ZTMean_majorBatches_Vec','*stream_ZTstDev','numMajorBatch' )
    save( case_saveName,...
        'main_*','which_*','fluid_*','*_up','*_down','*_all','*_all_Vec','BL_*','DN_*','*_ZTMean','*_majorBatches','*_storable','*_minorBatches','*_ZTMean_Vec','*_ZTMean_majorBatches_Vec','*stream_ZTstDev','numMajorBatch' ,'-v7.3')
elseif strcmpi( case_saveSuperSmall , 'yes' )
    case_saveName = [case_filenames,'_smallFile_v',num2str(main_codeVer),'.mat'] ;
    if strcmpi( debugMode , 'yes' )
        case_saveName = [case_filenames,'_smallFile_v',num2str(main_codeVer),'_debug.mat'] ;
    end
    save( case_saveName,...
        'main_*','which_*','fluid_*','*_up','*_down','*_all','*_all_Vec','BL_*','DN_*','*_ZTMean','*_storable','*_ZTMean_Vec','*stream_ZTstDev','numMajorBatch' )
else
    case_saveName = [case_filenames,'_semiSmallFile_v',num2str(main_codeVer),'.mat'] ;
    if strcmpi( debugMode , 'yes' )
        case_saveName = [case_filenames,'_semiSmallFile_v',num2str(main_codeVer),'_debug.mat'] ;
    end
    save( case_saveName,...
        'main_*','which_*','fluid_*','*_up','*_down','*_all','*_all_Vec','BL_*','DN_*','*_ZTMean','*_ZTMean_majorBatches','*_storable','*_ZTMean_Vec','*_ZTMean_majorBatches_Vec','*stream_ZTstDev','numMajorBatch' )
end
toc

%%
if strcmpi( do_allBudgetsAndSave , 'yes' )
    
    %%
    disp('Computing all the budgets and stuff. It will take quite a while ...')
    tic
    [ output_RANS , output_newRANS , output_smoothRANS , output_smoothUiUj , ...
        output_RS , output_modRS , output_newModRS , output_smoothModRS_linear , output_smoothModRS_natural , output_POIS , output_CONT , ...
        X,Y,XY , newX,newY,newXY , smoothX,smoothY,smoothXY ] = ...
            OF_BFS_sourceTerms_v362b1( case_saveName );
    toc
    
    %%
    disp('Saving the computed budgets...')
    tic
    save( ['outputGrid_',case_saveName(1:end-4),'_v362b1.mat'] , ...
        'output_RANS' , 'output_RS'  , 'output_modRS' , 'output_new*' , 'output_smooth*' , 'output_POIS' , 'output_CONT' , ...
        'X' , 'Y' , 'XY' , 'newX' , 'newY' , 'newXY' , 'smoothX' , 'smoothY' , 'smoothXY' )
    toc
    
    %%
    if strcmpi(do_graphics,'yes')
        
        disp('plotting the budgets and saving the figures for future use...')
        
%         %%
%         supLabelNames = { '$U$' , '$V$' , '$W$' };
%         plot_gridBudgets_v060b1(X,Y,output_RANS{2},output_RANS{3}, 'no',...
%             'no',supLabelNames, case_saveName(1:end-4) , ...
%             'no',[], .01 , 'RANS' )
% 
% %         savefig([ 'meanMomentumBudget_minimal_' , case_saveName(1:end-4) , '.fig'])
% 
%         %%
%         plot_gridBudgets_v060b1(X,Y,output_CONT{2},output_CONT{3}, 'no',...
%             'no',{''}, case_saveName(1:end-4) , ...
%             'no',[], .01 , 'CONT' )
% 
% %         savefig([ 'continuityBudget_minimal_' , case_saveName(1:end-4) , '.fig'])
% 
%         %%
%         plot_gridBudgets_v060b1(X,Y,output_POIS{2},output_POIS{3}, 'no',...
%             'no',{''}, case_saveName(1:end-4) , ...
%             'no',[], .01 , 'POIS' )
% 
% %         savefig([ 'poissonBudget_minimal_' , case_saveName(1:end-4) , '.fig'])

        %%
        supLabelNames = { '$U$' , '$V$' , '$W$' };
        plot_gridBudgets_v070b1(smoothX,smoothY,output_smoothRANS{2},output_smoothRANS{3}, 'no',...
            'no',supLabelNames, case_saveName(1:end-4) , ...
            'no',[], .01 , 'smoothRANS',which_flow )
        
        %%
        supLabelNames = {   '$R_{11}$' , '$R_{12}$' , '$R_{13}$' , ...
                            '$R_{21}$' , '$R_{22}$' , '$R_{23}$' , ... 
                            '$R_{31}$' , '$R_{32}$' , '$R_{33}$' };

        plot_gridBudgets_v070b1( X,Y , output_RS{2},output_RS{3} , 'yes' , ...
            'yes' , supLabelNames , case_saveName(1:end-4) , ...
            'no',[2 .05],.005,'RS',which_flow);
        drawnow

%         savefig([ 'TKEbudget_minimal_' , case_saveName(1:end-4) , '.fig'])

        %%
        supLabelNames = {   '$R_{11}$' , '$R_{12}$' , '$R_{13}$' , ...
                            '$R_{21}$' , '$R_{22}$' , '$R_{23}$' , ... 
                            '$R_{31}$' , '$R_{32}$' , '$R_{33}$' };

        plot_gridBudgets_v070b1( X,Y , output_modRS{2},output_modRS{3} , 'yes' , ...
            'yes' , supLabelNames , case_saveName(1:end-4) , ...
            'no',[2 .05],.005,'modRS',which_flow);
        drawnow
        
        %%
%         supLabelNames = {   '$R_{11}$' , '$R_{12}$' , '$R_{13}$' , ...
%                             '$R_{21}$' , '$R_{22}$' , '$R_{23}$' , ... 
%                             '$R_{31}$' , '$R_{32}$' , '$R_{33}$' };
% 
%         plot_gridBudgets_v060b1( smoothX,smoothY , output_smoothModRS_natural{2},output_smoothModRS_natural{3} , 'yes' , ...
%             'yes' , supLabelNames , case_saveName(1:end-4) , ...
%             'no',[2 .05],.005,'smoothModRS');
%         drawnow
% 
% %         savefig([ 'smoothModTKEbudget_minimal_natural_' , case_saveName(1:end-4) , '.fig'])
        
        %%
        supLabelNames = {   '$R_{11}$' , '$R_{12}$' , '$R_{13}$' , ...
                            '$R_{21}$' , '$R_{22}$' , '$R_{23}$' , ... 
                            '$R_{31}$' , '$R_{32}$' , '$R_{33}$' };

        plot_gridBudgets_v070b1( smoothX,smoothY , output_smoothModRS_linear{2},output_smoothModRS_linear{3} , 'yes' , ...
            'yes' , supLabelNames , case_saveName(1:end-4) , ...
            'no',[2 .05],.005,'smoothModRS',which_flow);
        drawnow

%         savefig([ 'smoothModTKEbudget_minimal_linear_' , case_saveName(1:end-4) , '.fig'])
    end
end

%% all the plots
for miomi=1
if strcmpi(do_graphics,'yes')
    
%%
for i=1:length(plot_xProfiles)
    [ ~ , plot_BL_xProfiles_Ind(i)] = min( abs( X_up - plot_xProfiles(i) ) ) ;
    plot_xProfiles(i) = X_up( plot_BL_xProfiles_Ind(i) ) ;
end
clear i
    
%%
if exist('numMajorBatch','var')
    if ischar(which_grid)
        plotTheShit = true ;
    elseif which_grid~=31 && which_grid~=32 && which_grid~=41 && numMajorBatch>1
        plotTheShit = true ;
    end
if plotTheShit
    
    %%
    figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
%     figure('Position',[ 1 1 15 10] , 'units','centimeter' ) 
    plot_titleNames={'Averaged streamwise velocity ($\langle U \rangle$)',...
        'Averaged wall-normal velocity ($\langle V \rangle$)',...
        'Averaged spanwise velocity ($\langle W \rangle$)',... 
        'Averaged pressure ($\langle p \rangle$)',...
        'Averaged subgrid eddy viscosity ($\langle \nu_{sgs} \rangle$)'};
    for i=1:5
        subplot( 'Position', subplotPosition_v110( 3,2,i , 'yes' ) )
%         subplot(3,2,i)
        colormap(plot_colorMap)
        draw_domainBound(plot_boundsColor);
        hold on
        pcolor( X_up , Y_up , (Vars_upstream_ZTMean_majorBatches(:,:,i,1)-Vars_upstream_ZTMean_majorBatches(:,:,i,2))' )
        hold on
        pcolor( X_down , Y_down , (Vars_downstream_ZTMean_majorBatches(:,:,i,1)-Vars_downstream_ZTMean_majorBatches(:,:,i,2))' )
        
        plot(X_up,BL_delta95,'-k','linewidth',2)
        plot(X_down,DN_delta95,'-k','linewidth',2)

        plot(X_up,BL_delta99,'--k','linewidth',2)
        plot(X_down,DN_delta99,'--k','linewidth',2)
    
        axis tight
        shading interp
        colorbar
        title(plot_titleNames{i},'interpreter','latex','fontsize',18)
    end
    mySuperLabel('Difference between major batches','t',22);

    %%
    plot_titleNames = {'$R_{11}$','$R_{22}$','$R_{33}$','$R_{12}$','$R_{13}$','$R_{23}$'};
    figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
    for i=1:6
%         subplot(3,2,i)
        subplot( 'Position', subplotPosition_v110( 3,2,i , 'yes' ) )
        colormap(plot_colorMap)
        draw_domainBound(plot_boundsColor);
        hold on
        pcolor( X_up , Y_up , (RS_upstream_ZTMean_majorBatches(:,:,i,1)-RS_upstream_ZTMean_majorBatches(:,:,i,2))' )
        hold on
        pcolor( X_down , Y_down , (RS_downstream_ZTMean_majorBatches(:,:,i,1)-RS_downstream_ZTMean_majorBatches(:,:,i,2))' )

        plot(X_up,BL_delta95,'-k','linewidth',2)
        plot(X_down,DN_delta95,'-k','linewidth',2)

        plot(X_up,BL_delta99,'--k','linewidth',2)
        plot(X_down,DN_delta99,'--k','linewidth',2)
    
    %     pcolor( X_up , Y_up , RS_upstream_ZTMean(:,:,i)' )
    %     hold on
    %     pcolor( X_down , Y_down , RS_downstream_ZTMean(:,:,i)' )
    %     axis equal
        axis tight
        shading interp
        colorbar
        colorbar('ticklabelinterpreter','latex')
        xlabel('$x$','interpreter','latex')
        ylabel('$y$','interpreter','latex')
        set(gca, 'fontsize',18)
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
        caxis([-.0005 .0005])
        title(plot_titleNames{i},'interpreter','latex','fontsize',18)
    end
    mySuperLabel('Difference between major batches','t',22);
    
end
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:3
%     subplot(3,1,i)
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor( X_up , Y_up , floor(log( dXYZ_2D_up(:,:,i)'/.1999 )/log(2) ) )
    hold on
    pcolor( X_down , Y_down , floor( log( dXYZ_2D_down(:,:,i)'/.1999 )/log(2) ) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis equal
    axis tight
    shading flat
    colorbar
end

%%
plot_titleNames={'Averaged streamwise velocity ($\langle U \rangle$)',...
    'Averaged wall-normal velocity ($\langle V \rangle$)',...
    'Averaged spanwise velocity ($\langle W \rangle$)',... 
    'Averaged pressure ($\langle p \rangle$)',...
    'Averaged subgrid eddy viscosity ($\langle \nu_{sgs} \rangle$)'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
isub = 0 ;
for i=[1,2,4,5]
    isub=isub+1;
%     subplot(2,2,isub)
    subplot( 'Position', subplotPosition_v110( 2,2,isub , 'yes' ) )
%     min1 = min(min(Vars_upstream_ZTMean(:,:,i)));
%     min2 = min(min(Vars_downstream_ZTMean(:,:,i)));
%     max1 = max(max(Vars_upstream_ZTMean(:,:,i)));
%     max2 = max(max(Vars_downstream_ZTMean(:,:,i)));
%     minU = min(min1 , min2);
%     maxU = max(max1 , max2);
    
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor(X_up,Y_up,Vars_upstream_ZTMean(:,:,i)');
    hold on
    pcolor(X_down,Y_down(1:end),Vars_downstream_ZTMean(:,1:end,i)');
    shading interp
    axis tight
%     caxis([minU maxU])
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     ylim([-1 5])
%     xlim([-20 25])
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    clear min1 min2 minU
    clear max1 max2 maxU
end

clear i plot_titleNames isub

%%
plot_titleNames = {'$R_{11}$','$R_{22}$','$R_{33}$','$R_{12}$','$R_{13}$','$R_{23}$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:6
%     subplot(2,3,i)
    subplot( 'Position', subplotPosition_v110( 2,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
    hold on
    pcolor( X_up , Y_up , RS_upstream_ZTMean(:,:,i)' )
    hold on
    pcolor( X_down , Y_down , RS_downstream_ZTMean(:,:,i)' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis tight
    shading interp
    colorbar
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    title(plot_titleNames{i},'interpreter','latex','fontsize',18)
end

%%
plot_titleNames = {'$R_{11}$','$R_{22}$','$R_{33}$','$R_{12}$','$R_{13}$','$R_{23}$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:6
%     subplot(2,3,i)
    subplot( 'Position', subplotPosition_v110( 2,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
    hold on
    pcolor( X_up , Y_up , modRS_upstream_ZTMean(:,:,i)' )
    hold on
    pcolor( X_down , Y_down , modRS_downstream_ZTMean(:,:,i)' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis tight
    shading interp
    colorbar
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    title(plot_titleNames{i},'interpreter','latex','fontsize',18)
end


%%
plot_titleNames={'Normalized averaged streamwise velocity',...
    'Normalized stremwise Reynolds stress',...
    'Normalized wall-normal Reynolds stress',...
    'Normalized spanwise Reynolds stress',...
    'Normalized shear Reynolds stress'};
plot_yLabels={'$\frac{\langle U \rangle}{u_\tau}$',...
    '$\frac{\langle u^{\prime} u^{\prime} \rangle}{u_\tau^2}$',...
    '$\frac{\langle v^{\prime} v^{\prime} \rangle}{u_\tau^2}$',...
    '$\frac{\langle w^{\prime} w^{\prime} \rangle}{u_\tau^2}$',...
    '$\frac{\langle u^{\prime} v^{\prime} \rangle}{u_\tau^2}$'};

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:length(plot_xProfiles)
    subplot(1,3,1)
%     subplot( 'Position', subplotPosition_v110( 1,2,1 ) )
%     plot( Y_up,...%/BL_deltaNu(plot_BL_xProfiles_Ind(i)) , ...
%         Vars_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,1),...%/BL_uTau( plot_BL_xProfiles_Ind(i) ) ,...   %k_upstream_Zmean( BL_xProfiles_Ind(i) , :),...%
%         'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)

    if strcmpi(which_case,'hybridWMLES200k')
        semilogx( (Y_up-Y_up(1))/BL_deltaNu(plot_BL_xProfiles_Ind(i)) , ...
                Vars_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,1)/BL_uTau( plot_BL_xProfiles_Ind(i) ) + Vars_upstream_ZTMean( plot_BL_xProfiles_Ind(i) ,7,end),...   %k_upstream_Zmean( BL_xProfiles_Ind(i) , :),...%
                'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)
    else
        semilogx( (Y_up-Y_up(1))/BL_deltaNu(plot_BL_xProfiles_Ind(i)) , ...
            Vars_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,1)/BL_uTau( plot_BL_xProfiles_Ind(i) ) ,...   %k_upstream_Zmean( BL_xProfiles_Ind(i) , :),...%
            'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)
    end
    
    hold on
    plot_legNames{i} = ['$x=',num2str(X_up(plot_BL_xProfiles_Ind(i))),'$'] ;
    if i==length(plot_xProfiles)
        semilogx( [1:15] , [1:15] , ':k' , 'linewidth',2)
        hold on
        semilogx( [10 max(BL_ReTau99)] , ...
            1/.41 * log( [10 max(BL_ReTau99)] ) + 5.2 ,...
            ':k' , 'linewidth',2)
        legend(plot_legNames,'interpreter','latex','fontsize',18,'location','northwest')%,'location','eastoutside')
    end
%     xlim([0 2000])
    xlim([.1 max(BL_ReTau99)])
    title(plot_titleNames{1},'interpreter','latex')
    ylabel(plot_yLabels{1},'interpreter','latex')
    xlabel('$y^+$','interpreter','latex')
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    set(gca,'fontsize',18)
    
    grid on
    
    for j=1:4
        subplot(4,3,3*(j-1)+2)
%         subplot( 'Position', subplotPosition_v110( 4,2,2*j , 'yes' ) )
            
        if strcmpi(which_case,'hybridWMLES200k')
            semilogx( (Y_up-Y_up(1))/BL_deltaNu(plot_BL_xProfiles_Ind(i)) , ...
                RS_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,j)/BL_uTau( plot_BL_xProfiles_Ind(i) )^2 ,...
                'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)
        else
            semilogx( (Y_up-Y_up(1))/BL_deltaNu(plot_BL_xProfiles_Ind(i)) , ...
                RS_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,j)/BL_uTau( plot_BL_xProfiles_Ind(i) )^2 ,...
                'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)
        end
        hold on
%         legend(plot_legNames,'interpreter','latex','fontsize',18)
        title(plot_titleNames{j+1},'interpreter','latex')
        ylabel(plot_yLabels{j+1},'interpreter','latex')
        xlabel('$y^+$','interpreter','latex')
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
        set(gca,'fontsize',18)
%         xlim([0 2000])
        xlim([1 max(BL_ReTau99)])
        grid on
    end
    
    
    
    
    for j=1:4
        subplot(4,3,3*j)
%         subplot( 'Position', subplotPosition_v110( 4,2,2*j , 'yes' ) )
            
        if strcmpi(which_case,'hybridWMLES200k')
            semilogx( (Y_up-Y_up(1))/BL_deltaNu(plot_BL_xProfiles_Ind(i)) , ...
                modRS_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,j)/BL_uTau( plot_BL_xProfiles_Ind(i) )^2 ,...
                'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)
        else
            semilogx( (Y_up-Y_up(1))/BL_deltaNu(plot_BL_xProfiles_Ind(i)) , ...
                modRS_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,j)/BL_uTau( plot_BL_xProfiles_Ind(i) )^2 ,...
                'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)
        end
        hold on
%         legend(plot_legNames,'interpreter','latex','fontsize',18)
        title(plot_titleNames{j+1},'interpreter','latex')
        ylabel(plot_yLabels{j+1},'interpreter','latex')
        xlabel('$y^+$','interpreter','latex')
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
        set(gca,'fontsize',18)
%         xlim([0 2000])
        xlim([1 max(BL_ReTau99)])
        grid on
    end
end
clear i j

%%
plot_titleNames={'Normalized averaged streamwise velocity',...
    'Normalized stremwise Reynolds stress',...
    'Normalized wall-normal Reynolds stress',...
    'Normalized spanwise Reynolds stress',...
    'Normalized shear Reynolds stress'};
plot_yLabels={'$\frac{\langle U \rangle}{u_\tau}$',...
    '$\frac{\langle u^{\prime} u^{\prime} \rangle}{u_\tau^2}$',...
    '$\frac{\langle v^{\prime} v^{\prime} \rangle}{u_\tau^2}$',...
    '$\frac{\langle w^{\prime} w^{\prime} \rangle}{u_\tau^2}$',...
    '$\frac{\langle u^{\prime} v^{\prime} \rangle}{u_\tau^2}$'};

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:length(plot_xProfiles)
    subplot(4,2,[1,3,5,7])
    plot( Y_up , Vars_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,1) , ...   %k_upstream_Zmean( BL_xProfiles_Ind(i) , :),...%
            'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)
    hold on
    plot_legNames{i} = ['$x=',num2str(X_up(plot_BL_xProfiles_Ind(i))),'$'] ;
    title(plot_titleNames{1},'interpreter','latex')
    ylabel(plot_yLabels{1},'interpreter','latex')
    xlabel('$y^+$','interpreter','latex')
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    set(gca,'fontsize',18)
    xlim([0 2])
    grid on
    
    if i==length(plot_xProfiles)
        legend(plot_legNames,'interpreter','latex','fontsize',18,'location','southeast')%,'location','eastoutside')
    end
    
    for j=1:4
        subplot(4,2,2*j)
        plot( Y_up , RS_upstream_ZTMean( plot_BL_xProfiles_Ind(i) , :,j) ,...
            'o-' , 'color' , plot_Color(i,:) , 'linewidth',2)
        hold on
%         legend(plot_legNames,'interpreter','latex','fontsize',18)
        title(plot_titleNames{j+1},'interpreter','latex')
        ylabel(plot_yLabels{j+1},'interpreter','latex')
        xlabel('$y^+$','interpreter','latex')
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
        set(gca,'fontsize',18)
        grid on
        axis tight
        xlim([0 1.5])
    end
end
clear i j


%%
if strcmpi(do_unimportantStuff,'yes')
plot_titleNames1={'$\mathcal{A}(\mathbf{n}_x)$',...
    '$\mathcal{A}(\mathbf{n}_y)$',...
    '$\mathcal{A}(\mathbf{n}_z)$'};

plot_titleNames2={'$\mathcal{A}^\prime(\mathbf{n}_x)$',...
    '$\mathcal{A}^\prime(\mathbf{n}_y)$',...
    '$\mathcal{A}^\prime(\mathbf{n}_z)$'};

plot_titleNames3={'$\mathcal{A}_{tot}(\mathbf{n}_x)$',...
    '$\mathcal{A}_{tot}(\mathbf{n}_y)$',...
    '$\mathcal{A}_{tot}(\mathbf{n}_z)$'};

plot_titleNames4={'$\mathcal{A}_\tau(\mathbf{n}_x)$',...
    '$\mathcal{A}_\tau(\mathbf{n}_y)$',...
    '$\mathcal{A}_\tau(\mathbf{n}_z)$'};

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:3
%     subplot(3,4,4*i-3)
    subplot( 'Position', subplotPosition_v110( 3,4,4*i-3 , 'yes' ) )
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , sqrt( abs( An_upstream_ZTMean(:,:,i)' )) )
    hold on
    pcolor( X_down , Y_down , sqrt( abs( An_downstream_ZTMean(:,:,i)' )) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp
    colorbar
    caxis([0 .01])
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames1{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )

    
    subplot( 'Position', subplotPosition_v110( 3,4,4*i-2 , 'yes' ) )
%     subplot(3,4,4*i-2)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , abs( AnSF_upstream_ZTMean(:,:,i)' ) )
    hold on
    pcolor( X_down , Y_down , abs( AnSF_downstream_ZTMean(:,:,i)' ) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp
    colorbar
    caxis([0 .01])
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames2{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    
    subplot( 'Position', subplotPosition_v110( 3,4,4*i-1 , 'yes' ) )
%     subplot(3,4,4*i-1)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , abs( AnRE_upstream_ZTMean(:,:,i)' ) )
    hold on
    pcolor( X_down , Y_down , abs( AnRE_downstream_ZTMean(:,:,i)' ) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp
    colorbar
    caxis([0 .01])
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames3{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    subplot( 'Position', subplotPosition_v110( 3,4,4*i , 'yes' ) )
%     subplot(3,4,4*i)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , sqrt( abs( AnTauR_upstream_ZTMean(:,:,i)' )) )
    hold on
    pcolor( X_down , Y_down , sqrt( abs( AnTauR_downstream_ZTMean(:,:,i)' )) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp
    colorbar
    caxis([0 .01])
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames4{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
if exist( 'Vorticity_upstream_ZTMean' , 'var' )
plot_titleNames={'$\omega_x$',...
    '$\omega_y$',...
    '$\omega_z$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:3
%     subplot(3,1,i)
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , Vorticity_upstream_ZTMean(:,:,i)'  )
    hold on
    pcolor( X_down , Y_down , Vorticity_downstream_ZTMean(:,:,i)' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis equal
    axis tight
    shading interp
    colorbar
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
% clear i
end

%%
if exist( 'epsilon_upstream_ZTMean' , 'var' )
plot_titleNames={'$\epsilon_{11}$','$\epsilon_{22}$','$\epsilon_{33}$','$\epsilon_{12}$','$\epsilon_{13}$','$\epsilon_{23}$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:6
%     subplot(2,3,i)
    subplot( 'Position', subplotPosition_v110( 2,3,i , 'yes' ) )
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , -2*fluid_nu * epsilon_upstream_ZTMean(:,:,i)'  )
    hold on
    pcolor( X_down , Y_down , -2*fluid_nu * epsilon_downstream_ZTMean(:,:,i)' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    if i==4
        caxis([-.002 .002])
    elseif i>=5
        caxis([-.001 .001])
    else
        caxis([-.002 .002])
    end
end
end

%%
plot_titleNames={'$\epsilon_{11}+\frac{\partial^2 R_{11}}{\partial x_k \partial x_k}$',...
    '$\epsilon_{22}+\frac{\partial^2 R_{22}}{\partial x_k \partial x_k}$',...
    '$\epsilon_{33}+\frac{\partial^2 R_{33}}{\partial x_k \partial x_k}$',...
    '$\epsilon_{12}+\frac{\partial^2 R_{12}}{\partial x_k \partial x_k}$',...
    '$\epsilon_{13}+\frac{\partial^2 R_{13}}{\partial x_k \partial x_k}$',...
    '$\epsilon_{23}+\frac{\partial^2 R_{23}}{\partial x_k \partial x_k}$'};
JJ= [ 1 , 5 , 9 , 2 , 3 , 6 ] ;
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:6
%     subplot(2,3,i)
    subplot( 'Position', subplotPosition_v110( 2,3,i , 'yes' ) )
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , RSeq_allViscous_upstream_ZTMean(:,:,JJ(i))'  )
    hold on
    pcolor( X_down , Y_down , RSeq_allViscous_downstream_ZTMean(:,:,JJ(i))' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    if i==4
        caxis([-.002 .002])
    elseif i>=5
        caxis([-.001 .001])
    else
        caxis([-.002 .002])
    end
end

%%
% plot_titleNames={'$\epsilon_{11}+\frac{\partial^2 R_{11}}{\partial x_k \partial x_k}$',...
%     '$\epsilon_{22}+\frac{\partial^2 R_{22}}{\partial x_k \partial x_k}$',...
%     '$\epsilon_{33}+\frac{\partial^2 R_{33}}{\partial x_k \partial x_k}$',...
%     '$\epsilon_{12}+\frac{\partial^2 R_{12}}{\partial x_k \partial x_k}$',...
%     '$\epsilon_{13}+\frac{\partial^2 R_{13}}{\partial x_k \partial x_k}$',...
%     '$\epsilon_{23}+\frac{\partial^2 R_{23}}{\partial x_k \partial x_k}$'};
plot_titleNames = {'$R_{11}$','$R_{22}$','$R_{33}$','$R_{12}$','$R_{13}$','$R_{23}$'};
JJ= [ 1 , 5 , 9 , 2 , 3 , 6 ] ;
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:6
    subplot( 'Position', subplotPosition_v110( 2,3,i , 'yes' ) )
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , RSeq_allViscous_upstream_ZTMean(:,:,JJ(i))' + RSeq_allSGS_upstream_ZTMean(:,:,JJ(i))'  )
    hold on
    pcolor( X_down , Y_down , RSeq_allViscous_downstream_ZTMean(:,:,JJ(i))' + RSeq_allSGS_downstream_ZTMean(:,:,JJ(i))' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    if i==4
        caxis([-.002 .002])
    elseif i>=5
        caxis([-.001 .001])
    else
        caxis([-.002 .002])
    end
end
mySuperLabel('combined effect of viscous and SGS terms','t',26);

%%
plot_titleNames={'$u^\prime_1 u^\prime_1 u^\prime_1$','$u^\prime_1 u^\prime_1 u^\prime_2$',...
    '$u^\prime_1 u^\prime_1 u^\prime_3$','$u^\prime_1 u^\prime_2 u^\prime_2$',...
    '$u^\prime_1 u^\prime_2 u^\prime_3$','$u^\prime_1 u^\prime_3 u^\prime_3$',...
    '$u^\prime_2 u^\prime_2 u^\prime_2$','$u^\prime_2 u^\prime_2 u^\prime_3$',...
    '$u^\prime_2 u^\prime_3 u^\prime_3$','$u^\prime_3 u^\prime_3 u^\prime_3$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
I = [1,2,3,5,6,9,14,15,18,27] ;
for i=1:10
%     subplot(5,2,i)
    subplot( 'Position', subplotPosition_v110( 5,2,i , 'yes' ) )
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , UiUjUk_upstream_ZTMean(:,:,I(i))'  )
    hold on
    pcolor( X_down , Y_down , UiUjUk_downstream_ZTMean(:,:,I(i))' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis equal
    axis tight
    shading interp
    colorbar
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    axis off
end

%%
plot_titleNames={'$p^\prime u_1^\prime$','$p^\prime u_2^\prime$','$p^\prime u_3^\prime$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:3
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
%     subplot(3,1,i)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , UiP_upstream_ZTMean(:,:,i)'  )
    hold on
    pcolor( X_down , Y_down , UiP_downstream_ZTMean(:,:,i)' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis equal
    axis tight
    shading interp
    colorbar
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
plot_titleNames={'$p^\prime \partial u_1^\prime /\partial x_1$',...
    '$p^\prime \partial u_1^\prime /\partial x_2$',...
    '$p^\prime \partial u_1^\prime /\partial x_3$',...
    '$p^\prime \partial u_2^\prime /\partial x_1$',...
    '$p^\prime \partial u_2^\prime /\partial x_2$',...
    '$p^\prime \partial u_2^\prime /\partial x_3$',...
    '$p^\prime \partial u_3^\prime /\partial x_1$',...
    '$p^\prime \partial u_3^\prime /\partial x_2$',...
    '$p^\prime \partial u_3^\prime /\partial x_3$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:9
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
%     subplot(3,3,i)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , PgradU_upstream_ZTMean(:,:,i)'  )
    hold on
    pcolor( X_down , Y_down , PgradU_downstream_ZTMean(:,:,i)' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp
    colorbar
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
plot_titleNames={'$\partial u_1 /\partial x_1$',...
    '$\partial u_1 /\partial x_2$',...
    '$\partial u_1 /\partial x_3$',...
    '$\partial u_2 /\partial x_1$',...
    '$\partial u_2 /\partial x_2$',...
    '$\partial u_2 /\partial x_3$',...
    '$\partial u_3 /\partial x_1$',...
    '$\partial u_3 /\partial x_2$',...
    '$\partial u_3 /\partial x_3$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:9
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
%     subplot(3,3,i)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , gradU_upstream_ZTMean(:,:,i)'  )
    hold on
    pcolor( X_down , Y_down , gradU_downstream_ZTMean(:,:,i)' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp
    colorbar
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end


%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
%     subplot(3,3,i)
    colormap(plot_colorMap)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
hold on
    pcolor(X_up,Y_up,Sij_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down,Sij_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$S_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up,tauSgs_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down,tauSgs_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$\tau^{sgs}_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:3
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
%     subplot(3,1,i)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor(X_up,Y_up,divTauSgs_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down,divTauSgs_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \nabla \cdot \tau^{sgs} )_',num2str(i) ,'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor(X_up,Y_up, UiDtauJKdxK_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, UiDtauJKdxK_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( u^\prime_i \partial_k \tau^\prime_{jk})_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     pcolor(X_up,Y_up, dUjTikDxk_tmp_upstream_ZTMean(:,:,i)')
%     hold on
%     pcolor(X_down,Y_down, dUjTikDxk_tmp_downstream_ZTMean(:,:,i)')
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, dUjTikDxk_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, dUjTikDxk_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$ \partial_k ( u^\prime_i \tau^\prime_{jk})_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     pcolor(X_up,Y_up, TikDujDxk_tmp_upstream_ZTMean(:,:,i)')
%     hold on
%     pcolor(X_down,Y_down, TikDujDxk_tmp_downstream_ZTMean(:,:,i)')
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, TikDujDxk_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, TikDujDxk_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \tau^\prime_{jk} \partial_k u^\prime_i )_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
if strcmpi(do_unimportantStuff,'yes')
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:3
%     subplot(3,1,i)
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
    colormap(plot_colorMap)
%     pcolor(X_up,Y_up, TikDujDxk_tmp_upstream_ZTMean(:,:,i)')
%     hold on
%     pcolor(X_down,Y_down, TikDujDxk_tmp_downstream_ZTMean(:,:,i)')
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
    pcolor(X_up,Y_up, instantRes_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, instantRes_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    caxis([-.01 .01])
    axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$\mathcal{R}_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
if strcmpi(do_unimportantStuff,'yes')
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:3
%     subplot(3,1,i)
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
    colormap(plot_colorMap)
%     pcolor(X_up,Y_up, TikDujDxk_tmp_upstream_ZTMean(:,:,i)')
%     hold on
%     pcolor(X_down,Y_down, TikDujDxk_tmp_downstream_ZTMean(:,:,i)')
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, absInstantResidual_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, absInstantResidual_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    caxis([0 .05])
    axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$\langle \vert \mathcal{R}_',num2str(i),'\vert \rangle$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
if strcmpi(do_unimportantStuff,'yes')
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, RiUj_tmp_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, RiUj_tmp_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \mathcal{R}_i U_j )_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
if strcmpi(do_unimportantStuff,'yes')
ppU = RiUj_tmp_upstream_ZTMean - instantRes_upstream_ZTMean(:,:,[1,1,1,2,2,2,3,3,3]) .* Vars_upstream_ZTMean(:,:,[1,2,3,1,2,3,1,2,3]) ;
ppD = RiUj_tmp_downstream_ZTMean - instantRes_downstream_ZTMean(:,:,[1,1,1,2,2,2,3,3,3]) .* Vars_downstream_ZTMean(:,:,[1,2,3,1,2,3,1,2,3]) ;
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, ppU(:,:,i)')
    hold on
    pcolor(X_down,Y_down, ppD(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \mathcal{R}^\prime_i U^\prime_j  )_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
if strcmpi(do_unimportantStuff,'yes')

pipi_up = RiUj_upstream_ZTMean + RiUj_upstream_ZTMean(:,:,[1,4,7,2,5,8,3,6,9]);
pipi_down = RiUj_downstream_ZTMean + RiUj_downstream_ZTMean(:,:,[1,4,7,2,5,8,3,6,9]);

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
%     subplot(3,3,i)
    colormap(plot_colorMap)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, pipi_up(:,:,i)')
    hold on
    pcolor(X_down,Y_down, pipi_down(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    caxis([-.001 .001])
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \mathcal{R}^\prime_i U^\prime_j  )_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
plot_titleNames={'$R_{11}$','$R_{12}$','$R_{13}$','$R_{21}$','$R_{22}$','$R_{23}$','$R_{31}$','$R_{32}$','$R_{33}$'};

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, RSeq_diff2zeroAlt_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, RSeq_diff2zeroAlt_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    caxis([-.003 .003])
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
mySuperLabel('difference to zero in the RS equation','t',26);

%%
plot_titleNames1={'$\mathcal{A}(\mathbf{n}_x)$',...
    '$\mathcal{A}(\mathbf{n}_y)$',...
    '$\mathcal{A}(\mathbf{n}_z)$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:3
%     subplot(3,1,i)
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , sqrt( abs( An_upstream_ZTMean(:,:,i)' )) )
    hold on
    pcolor( X_down , Y_down , sqrt( abs( An_downstream_ZTMean(:,:,i)' )) )
%     pcolor( X_up , Y_up , sqrt( abs( An_fullDeconv_upstream_ZTMean(:,:,i)' )) )
%     hold on
%     pcolor( X_down , Y_down , sqrt( abs( An_fullDeconv_downstream_ZTMean(:,:,i)' )) )
    
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis equal
    axis tight
    shading interp
    colorbar
%     caxis([0 .04])
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames1{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
plot_titleNames1={'$\mathcal{A}_{\Omega}(\mathbf{n}_x)$',...
    '$\mathcal{A}_{\Omega}(\mathbf{n}_y)$',...
    '$\mathcal{A}_{\Omega}(\mathbf{n}_z)$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:3
%     subplot(3,1,i)
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , AnOmega_upstream_ZTMean(:,:,i)' )
    hold on
    pcolor( X_down , Y_down , AnOmega_downstream_ZTMean(:,:,i)' )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    axis equal
    axis tight
    shading interp
    colorbar
    caxis([0 .04])
    
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames1{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

%%
plot_titleNames1={'$\mathcal{A}^\prime_{\nabla u}(\mathbf{n}_x)$',...
    '$\mathcal{A}^\prime_{\nabla u}(\mathbf{n}_y)$',...
    '$\mathcal{A}^\prime_{\nabla u}(\mathbf{n}_z)$'};

plot_titleNames2={'$\mathcal{A}^\prime_{\delta u}(\mathbf{n}_x)$',...
    '$\mathcal{A}^\prime_{\delta u}(\mathbf{n}_y)$',...
    '$\mathcal{A}^\prime_{\delta u}(\mathbf{n}_z)$'};

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:3
    if strcmpi(do_unimportantStuff,'yes')
%         subplot(3,2,2*i-1)
        subplot( 'Position', subplotPosition_v110( 3,2,2*i-1 , 'yes' ) )
    else
%         subplot(3,1,i)
        subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
    end
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , abs( AnSF_upstream_ZTMean(:,:,i)' ) )
    hold on
    pcolor( X_down , Y_down , abs( AnSF_downstream_ZTMean(:,:,i)' ) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    if ~strcmpi(do_unimportantStuff,'yes')
        axis equal
    end
    axis tight
    shading interp
    colorbar
    caxis([0 .01])
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames1{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    
    if strcmpi(do_unimportantStuff,'yes')
%         subplot(3,2,2*i)
        subplot( 'Position', subplotPosition_v110( 3,2,2*i , 'yes' ) )
%         plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
        draw_domainBound(plot_boundsColor);
        hold on
        colormap(plot_colorMap)
        pcolor( X_up , Y_up , abs( AnSFo_upstream_ZTMean(:,:,i)' ) )
        hold on
        pcolor( X_down , Y_down , abs( AnSFo_downstream_ZTMean(:,:,i)' ) )
        
        plot(X_up,BL_delta95,'-k','linewidth',2)
        plot(X_down,DN_delta95,'-k','linewidth',2)

        plot(X_up,BL_delta99,'--k','linewidth',2)
        plot(X_down,DN_delta99,'--k','linewidth',2)
        
        axis tight
        shading interp
        colorbar
        caxis([0 .01])
        colorbar('ticklabelinterpreter','latex')
        xlabel('$x$','interpreter','latex')
        ylabel('$y$','interpreter','latex')
        title(plot_titleNames2{i},'interpreter','latex')
        set(gca, 'fontsize',18)
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
    end
end

%%
plot_titleNames1={'$\mathcal{G}_{dev}(\mathbf{n}_x)$',...
    '$\mathcal{G}_{dev}(\mathbf{n}_y)$',...
    '$\mathcal{G}_{dev}(\mathbf{n}_z)$'};
plot_titleNames2={'$\mathcal{G}_{tot}(\mathbf{n}_x)$',...
    '$\mathcal{G}_{tot}(\mathbf{n}_y)$',...
    '$\mathcal{G}_{tot}(\mathbf{n}_z)$'};
plot_titleNames3={'$\mathcal{G}_{L^2}(\mathbf{n}_x)$',...
    '$\mathcal{G}_{L^2}(\mathbf{n}_y)$',...
    '$\mathcal{G}_{L^2}(\mathbf{n}_z)$'};
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
for i=1:3
    
    if exist( 'AnTauR_upstream_ZTMean' , 'var' )
    subplot( 'Position', subplotPosition_v110( 3,4,4*i-3 , 'yes' ) )
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , sqrt( abs( AnTauR_upstream_ZTMean(:,:,i)' )) )
    hold on
    pcolor( X_down , Y_down , sqrt( abs( AnTauR_downstream_ZTMean(:,:,i)' )) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading flat
    colorbar
    caxis([0 .01])
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames1{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    end
    
    if exist( 'GnTotal_upstream_ZTMean' , 'var' )
    subplot( 'Position', subplotPosition_v110( 3,4,4*i-2 , 'yes' ) )
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , sqrt( abs( GnTotal_upstream_ZTMean(:,:,i)' )) )
    hold on
    pcolor( X_down , Y_down , sqrt( abs( GnTotal_downstream_ZTMean(:,:,i)' )) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading flat
    colorbar
    caxis([0 .01])
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames2{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    end
    
    
    if exist( 'GnTotalCommercial_upstream_ZTMean' , 'var' )
    subplot( 'Position', subplotPosition_v110( 3,4,4*i-1 , 'yes' ) )
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , sqrt( abs( GnTotalCommercial_upstream_ZTMean(:,:,i)' )) )
    hold on
    pcolor( X_down , Y_down , sqrt( abs( GnTotalCommercial_downstream_ZTMean(:,:,i)' )) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading flat
    colorbar
    caxis([0 .005])
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title([ 'Commercial ' ,plot_titleNames2{i}],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    end
    
    if exist( 'GnTotalAdd_upstream_ZTMean' , 'var' )
    subplot( 'Position', subplotPosition_v110( 3,4,4*i , 'yes' ) )
    draw_domainBound(plot_boundsColor);
    hold on
    colormap(plot_colorMap)
    pcolor( X_up , Y_up , sqrt( abs( GnTotalAdd_upstream_ZTMean(:,:,i)' )) )
    hold on
    pcolor( X_down , Y_down , sqrt( abs( GnTotalAdd_downstream_ZTMean(:,:,i)' )) )
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
    axis tight
    shading flat
    colorbar
    caxis([0 .01])
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(plot_titleNames3{i},'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    end
end

%%
if strcmpi(do_unimportantStuff,'yes')
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
colormap(plot_colorMap)
pcolor( X_up , Y_up , sqrt( abs( AnGiso_upstream_ZTMean(:,:,1)' )) )
hold on
pcolor( X_down , Y_down , sqrt( abs( AnGiso_downstream_ZTMean(:,:,1)' )) )

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
axis tight
shading interp
colorbar
caxis([0 .05])
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title('$\mathcal{A}^\mathcal{G}_{iso}(\mathbf{n})$','interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )
end

%%
if strcmpi(do_unimportantStuff,'yes')
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
% subplot(3,1,1)
subplot( 'Position', subplotPosition_v110( 3,1,1 , 'yes' ) )
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
colormap(plot_colorMap)
pcolor( X_up , Y_up , csGermanoLilly_upstream_ZTMean' )
hold on
pcolor( X_down , Y_down , csGermanoLilly_downstream_ZTMean' )

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
axis tight
shading interp
colorbar
caxis([0 5e-3])
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title('$c_S$','interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )

% subplot(3,1,2)
subplot( 'Position', subplotPosition_v110( 3,1,2 , 'yes' ) )
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
colormap(plot_colorMap)
pcolor( X_up , Y_up , nuSgsGermanoLilly_upstream_ZTMean' )
hold on
pcolor( X_down , Y_down , nuSgsGermanoLilly_downstream_ZTMean' )

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     axis equal
axis tight
shading interp
colorbar
caxis([0 1/5100])
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title('$\nu_{GL}$','interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )

% subplot(3,1,3)
subplot( 'Position', subplotPosition_v110( 3,1,3 , 'yes' ) )
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
colormap(plot_colorMap)
pcolor( X_up , Y_up , Vars_upstream_ZTMean(:,:,5)' )
hold on
pcolor( X_down , Y_down , Vars_downstream_ZTMean(:,:,5)' )

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)

%     axis equal
axis tight
shading interp
colorbar
caxis([0 1/5100])
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title('$\nu_{OF}$','interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )

end

%%
if strcmpi(do_unimportantStuff,'yes')
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] )
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
colormap(plot_colorMap)
pcolor( X_up , Y_up , sqrt( abs( errorNewGDP_upstream_ZTMean ))' )
% hold on
pcolor( X_down , Y_down , sqrt( abs( errorNewGDP_downstream_ZTMean ))' )

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)

%     axis equal
axis tight
shading interp
colorbar
caxis([0 5e-2])
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title('$\mathcal{RES}({c_S})$','interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )
end

%%
if strcmpi(do_unimportantStuff,'yes')

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     pcolor(X_up,Y_up, TikDujDxk_tmp_upstream_ZTMean(:,:,i)')
%     hold on
%     pcolor(X_down,Y_down, TikDujDxk_tmp_downstream_ZTMean(:,:,i)')
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, UiGj_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, UiGj_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    caxis([-.001 .001])
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \mathcal{G}^\prime_i U^\prime_j  )_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
if strcmpi(do_unimportantStuff,'yes')

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:9
%     subplot(3,3,i)
    subplot( 'Position', subplotPosition_v110( 3,3,i , 'yes' ) )
    colormap(plot_colorMap)
%     pcolor(X_up,Y_up, TikDujDxk_tmp_upstream_ZTMean(:,:,i)')
%     hold on
%     pcolor(X_down,Y_down, TikDujDxk_tmp_downstream_ZTMean(:,:,i)')
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, absUiGj_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, absUiGj_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
%     caxis([0 .001])
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \mathcal{G}^\prime_i U^\prime_j  )_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
if strcmpi(do_unimportantStuff,'yes')

figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:3
%     subplot(3,2,2*i-1)
    subplot( 'Position', subplotPosition_v110( 3,2,2*i-1 , 'yes' ) )
    colormap(plot_colorMap)
%     pcolor(X_up,Y_up, TikDujDxk_tmp_upstream_ZTMean(:,:,i)')
%     hold on
%     pcolor(X_down,Y_down, TikDujDxk_tmp_downstream_ZTMean(:,:,i)')
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, Fi_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, Fi_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    caxis([-.001 .001])
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \mathcal{G}_i )_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end

for i=1:3
%     subplot(3,2,2*i)
    subplot( 'Position', subplotPosition_v110( 3,2,2*i , 'yes' ) )
    colormap(plot_colorMap)
%     pcolor(X_up,Y_up, TikDujDxk_tmp_upstream_ZTMean(:,:,i)')
%     hold on
%     pcolor(X_down,Y_down, TikDujDxk_tmp_downstream_ZTMean(:,:,i)')
%     plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, absFi_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, absFi_downstream_ZTMean(:,:,i)')
    
    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)
    
    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)
    
    caxis([-.001 .001])
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$( \mathcal{G}_i )_',num2str(i),'$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end
end

%%
if strcmpi(do_unimportantStuff,'yes')
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
% subplot(2,1,1)
subplot( 'Position', subplotPosition_v110( 2,1,1 , 'yes' ) )
colormap(plot_colorMap)
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
pcolor(X_up,Y_up, sqrt(abs( kSgs_upstream_ZTMean')))
hold on
pcolor(X_down,Y_down, sqrt(abs( kSgs_downstream_ZTMean')))

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
caxis([0 .04])
axis tight
shading interp
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title(['$\sqrt{ k_{sgs} }$'],'interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )

% subplot(2,1,2)
subplot( 'Position', subplotPosition_v110( 2,1,2 , 'yes' ) )
colormap(plot_colorMap)
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
pcolor(X_up,Y_up, sqrt(abs( sum( .5*An_upstream_ZTMean , 3 )))')
hold on
pcolor(X_down,Y_down, sqrt(abs( sum( .5*An_downstream_ZTMean , 3)))' )

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
caxis([0 .04])
axis tight
shading interp
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title(['$\sqrt{ \sum{ \mathcal{A}(n) } }$'],'interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
% subplot(2,1,1)
subplot( 'Position', subplotPosition_v110( 2,1,1 , 'yes' ) )
colormap(plot_colorMap)
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
pcolor(X_up,Y_up, sqrt(abs( tauKKsgs_upstream_ZTMean')))
hold on
pcolor(X_down,Y_down, sqrt(abs( tauKKsgs_downstream_ZTMean')))

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
caxis([0 .04])
axis tight
shading interp
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title(['$\sqrt{ \tau_{kk} }$'],'interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )

% subplot(2,1,2)
subplot( 'Position', subplotPosition_v110( 2,1,2 , 'yes' ) )
colormap(plot_colorMap)
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
pcolor(X_up,Y_up, sqrt(abs( sum( An_upstream_ZTMean , 3 )))')
hold on
pcolor(X_down,Y_down, sqrt(abs( sum( An_downstream_ZTMean , 3)))' )

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
caxis([0 .04])
axis tight
shading interp
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title(['$\sqrt{ \sum{ \mathcal{A}(n) } }$'],'interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )

%%
allVars_RSeq    = who('RSeq_*_upstream_ZTMean');
allVars_RSeqTmp = who('RSeq_tmp_*_upstream_ZTMean');
allVars_RSeq    = setdiff(allVars_RSeq , allVars_RSeqTmp);
plot_titleNames={'$R_{11}$','$R_{12}$','$R_{13}$','$R_{21}$','$R_{22}$','$R_{23}$','$R_{31}$','$R_{32}$','$R_{33}$'};
for i=[1,5,9,2,3,6]
    figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
    for j=1:length(allVars_RSeq)
%         subplot(2,3,j)
        subplot( 'Position', subplotPosition_v110( 3,3,j , 'yes' ) )
        colormap(plot_colorMap)
%         plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
        draw_domainBound(plot_boundsColor);
        hold on
        pcolor(X_up,Y_up, eval([allVars_RSeq{j},'(:,:,i)'])')
        hold on
        pcolor(X_down,Y_down, eval([allVars_RSeq{j}(1:end-15),'downstream_ZTMean(:,:,i)'])')
        
        plot(X_up,BL_delta95,'-k','linewidth',2)
        plot(X_down,DN_delta95,'-k','linewidth',2)

        plot(X_up,BL_delta99,'--k','linewidth',2)
        plot(X_down,DN_delta99,'--k','linewidth',2)
    
        caxis([-.002 .002])
        axis tight
        shading flat
        colorbar('ticklabelinterpreter','latex')
        xlabel('$x$','interpreter','latex')
        ylabel('$y$','interpreter','latex')
        title(allVars_RSeq{j}(6:end-16),'interpreter','latex')
        set(gca, 'fontsize',18)
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
    end
    mySuperLabel(plot_titleNames{i},'t',24);
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
% subplot(2,1,1)
subplot( 'Position', subplotPosition_v110( 2,1,1 , 'yes' ) )
colormap(plot_colorMap)
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
pcolor(X_up,Y_up, divU_upstream_ZTMean')
hold on
pcolor(X_down,Y_down, divU_downstream_ZTMean')

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
caxis([-.02 .02])
axis tight
shading interp
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title('$\langle \nabla \cdot u \rangle$','interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )

% subplot(2,1,2)
subplot( 'Position', subplotPosition_v110( 2,1,2 , 'yes' ) )
colormap(plot_colorMap)
% plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
draw_domainBound(plot_boundsColor);
hold on
pcolor(X_up,Y_up, absDivU_upstream_ZTMean')
hold on
pcolor(X_down,Y_down, absDivU_downstream_ZTMean')

plot(X_up,BL_delta95,'-k','linewidth',2)
plot(X_down,DN_delta95,'-k','linewidth',2)

plot(X_up,BL_delta99,'--k','linewidth',2)
plot(X_down,DN_delta99,'--k','linewidth',2)
    
caxis([0 .1])
axis tight
shading interp
colorbar('ticklabelinterpreter','latex')
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title('$\langle \vert \nabla \cdot u \vert \rangle$','interpreter','latex')
set(gca, 'fontsize',18)
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickLength' , [.02 .035] )

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
% subplot(2,1,1)
for i=1:3
    subplot( 'Position', subplotPosition_v110( 3,1,i , 'yes' ) )
    colormap(plot_colorMap)
    % plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, gradP_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, gradP_downstream_ZTMean(:,:,i)')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.02 .02])
    axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    title(['$\langle \partial p / \partial x_',num2str(i),' \rangle$'],'interpreter','latex')
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
end


%%
allVars_meanMomentumDiff2Zero  = who( 'meanMomentum*_diff2zero_upstream_ZTMean' );
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:3
    for j=1:3
        subplot( 'Position', subplotPosition_v110( 3,3, 3*(j-1)+i , 'yes' ) )
%         subplot(3,3,i)
        colormap(plot_colorMap)
        % plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
        draw_domainBound(plot_boundsColor);
        hold on
        pcolor(X_up,Y_up, eval([ allVars_meanMomentumDiff2Zero{i}(1:end-15) ,'upstream_ZTMean(:,:,j)'])')
        hold on
        pcolor(X_down,Y_down, eval([ allVars_meanMomentumDiff2Zero{i}(1:end-15) ,'downstream_ZTMean(:,:,j)'])')

        plot(X_up,BL_delta95,'-k','linewidth',2)
        plot(X_down,DN_delta95,'-k','linewidth',2)

        plot(X_up,BL_delta99,'--k','linewidth',2)
        plot(X_down,DN_delta99,'--k','linewidth',2)

        caxis([-.01 .01])
%         axis equal
        axis tight
        shading interp
        colorbar('ticklabelinterpreter','latex')
        xlabel('$x$','interpreter','latex')
        ylabel('$y$','interpreter','latex')
%         title([ allVars_meanMomentumDiff2Zero{i}(13:end-16) , '$^\prime$s difference to zero in $x_',num2str(i),'$'],'interpreter','latex')
        title([ allVars_meanMomentumDiff2Zero{i}(13:end-16) , ' in $x_',num2str(j),'$'],'interpreter','latex')
        set(gca, 'fontsize',18)
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
    end
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:3
    
    subplot( 'Position', subplotPosition_v110( 3,4, 4*(i-1)+1 ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, divClarksTauij_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, divClarksTauij_downstream_ZTMean(:,:,i)')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.01 .01])
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    if i==1
    title( 'divergence of the directional Clark$^\prime$s model' ,'interpreter','latex')
    end
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    
    
    
    subplot( 'Position', subplotPosition_v110( 3,4, 4*(i-1)+2 ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, divDClarksTauij_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, divDClarksTauij_downstream_ZTMean(:,:,i)')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.01 .01])
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    if i==1
    title( 'divergence of the directional Clark$^\prime$s model' ,'interpreter','latex')
    end
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    
    
    subplot( 'Position', subplotPosition_v110( 3,4, 4*(i-1)+3 ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, divMDClarksTauij_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, divMDClarksTauij_downstream_ZTMean(:,:,i)')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.01 .01])
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    if i==1
    title( 'divergence of the modified directional Clark$^\prime$s model' ,'interpreter','latex')
    end
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    
    
    
    
    subplot( 'Position', subplotPosition_v110( 3,4, 4*(i-1)+4 ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, divTauSgs_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, divTauSgs_downstream_ZTMean(:,:,i)')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.01 .01])
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    if i==1
    title( 'divergence of the code$^\prime$s model' ,'interpreter','latex')
    end
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
end

%%
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
JJ= [1,2,3,5,6,9];
for i=1:6
    
    subplot( 'Position', subplotPosition_v110( 6,4, 4*(i-1)+1 ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, ClarksTauij_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, ClarksTauij_downstream_ZTMean(:,:,i)')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.01 .01])
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    if i==1
    title( 'original Clark$^\prime$s model' ,'interpreter','latex')
    end
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    
    subplot( 'Position', subplotPosition_v110( 6,4, 4*(i-1)+2 ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, DClarksTauij_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, DClarksTauij_downstream_ZTMean(:,:,i)')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.01 .01])
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    if i==1
    title( 'directional Clark$^\prime$s model' ,'interpreter','latex')
    end
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    
    
    subplot( 'Position', subplotPosition_v110( 6,4, 4*(i-1)+3 ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, MDClarksTauij_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, MDClarksTauij_downstream_ZTMean(:,:,i)')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.01 .01])
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    if i==1
    title( 'modified directional Clark$^\prime$s model' ,'interpreter','latex')
    end
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
    
    
    
    
    subplot( 'Position', subplotPosition_v110( 6,4, 4*(i-1)+4 ) )
    colormap(plot_colorMap)
    draw_domainBound(plot_boundsColor);
    hold on
    pcolor(X_up,Y_up, tauSgs_upstream_ZTMean(:,:,i)')
    hold on
    pcolor(X_down,Y_down, tauSgs_downstream_ZTMean(:,:,JJ(i))')

    plot(X_up,BL_delta95,'-k','linewidth',2)
    plot(X_down,DN_delta95,'-k','linewidth',2)

    plot(X_up,BL_delta99,'--k','linewidth',2)
    plot(X_down,DN_delta99,'--k','linewidth',2)

    caxis([-.001 .001])
%     axis equal
    axis tight
    shading interp
    colorbar('ticklabelinterpreter','latex')
    xlabel('$x$','interpreter','latex')
    ylabel('$y$','interpreter','latex')
    if i==1
    title( 'code$^\prime$s model' ,'interpreter','latex')
    end
    set(gca, 'fontsize',18)
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'TickLength' , [.02 .035] )
    
end

%%
allVars_allSgs  = who( 'allSGS*_upstream_ZTMean' );
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:4
    JJ = [1,2,3,5,6,9];
    for j=1:6
        subplot( 'Position', subplotPosition_v110( 6,4, 4*(j-1)+i , 'yes' ) )
%         subplot(3,3,i)
        colormap(plot_colorMap)
        % plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
        draw_domainBound(plot_boundsColor);
        hold on
        pcolor(X_up,Y_up, eval([ allVars_allSgs{i}(1:end-15) ,'upstream_ZTMean(:,:,JJ(j))'])')
        hold on
        pcolor(X_down,Y_down, eval([ allVars_allSgs{i}(1:end-15) ,'downstream_ZTMean(:,:,JJ(j))'])')

        plot(X_up,BL_delta95,'-k','linewidth',2)
        plot(X_down,DN_delta95,'-k','linewidth',2)

        plot(X_up,BL_delta99,'--k','linewidth',2)
        plot(X_down,DN_delta99,'--k','linewidth',2)

        caxis([-.005 .005])
%         axis equal
        axis tight
        shading interp
        colorbar('ticklabelinterpreter','latex')
        xlabel('$x$','interpreter','latex')
        ylabel('$y$','interpreter','latex')
%         title([ allVars_meanMomentumDiff2Zero{i}(13:end-16) , '$^\prime$s difference to zero in $x_',num2str(i),'$'],'interpreter','latex')
        if j==1
        title(  allVars_allSgs{i}(8:end-16) ,'interpreter','latex')
        end
        set(gca, 'fontsize',18)
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
    end
end

%%
allVars_sgsDissipation  = who( 'sgsDissipation*_upstream_ZTMean' );
figure('OuterPosition',[ 1 1 plot_scrsz(3) plot_scrsz(4)] ) 
for i=1:4
    JJ = [1,2,3,5,6,9];
    for j=1:6
        subplot( 'Position', subplotPosition_v110( 6,4, 4*(j-1)+i , 'yes' ) )
%         subplot(3,3,i)
        colormap(plot_colorMap)
        % plot([-20 0 0 25] , [0 0 -1 -1] , 'b' , 'linewidth',4)
        draw_domainBound(plot_boundsColor);
        hold on
        pcolor(X_up,Y_up, eval([ allVars_sgsDissipation{i}(1:end-15) ,'upstream_ZTMean(:,:,JJ(j))'])')
        hold on
        pcolor(X_down,Y_down, eval([ allVars_sgsDissipation{i}(1:end-15) ,'downstream_ZTMean(:,:,JJ(j))'])')

        plot(X_up,BL_delta95,'-k','linewidth',2)
        plot(X_down,DN_delta95,'-k','linewidth',2)

        plot(X_up,BL_delta99,'--k','linewidth',2)
        plot(X_down,DN_delta99,'--k','linewidth',2)

        caxis([-.005 .005])
%         axis equal
        axis tight
        shading interp
        colorbar('ticklabelinterpreter','latex')
        xlabel('$x$','interpreter','latex')
        ylabel('$y$','interpreter','latex')
%         title([ allVars_meanMomentumDiff2Zero{i}(13:end-16) , '$^\prime$s difference to zero in $x_',num2str(i),'$'],'interpreter','latex')
        if j==1
        title( ['dissipation by ', allVars_sgsDissipation{i}(16:end-16) ] ,'interpreter','latex')
        end
        set(gca, 'fontsize',18)
        set(gca,'TickLabelInterpreter','latex')
        set(gca,'TickLength' , [.02 .035] )
    end
end


end

end





%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code nomencelature:
%%
%% Administration:
%%      main_*:                     information related to the code itself (like version, etc.)
%%      case_*:                     variables related to the case (filenames, dirctory, etc)
%%      allVars_*:                  name of fields (used when doing a common operation on all, like averaging)
%%      plot_*:                     variables related to figures and plots (title names, color RGBs, etc.)
%%      *_ups, *_downs:             related to case_* variables, for upstream and downstream portions
%%
%% Computation:
%%      *_up, *_down:               grid related or time-independent variables (point coordinates, grid resolution, etc.)
%%      *_uptream, *_downstream:    intsantaneous time dependent fields (velocity, pressure, derivatives, error measure, etc.)
%%      *_ZMean:                    averaged fields, in only the homogeneous z direction
%%      *_ZTMean:                   averaged fileds, in both the homogeneous z direction and time
%%      *_original:                 original uniterpolated data (original grid coordinates for example) 
%%      *_minorBatches:             mean fields, averaged over snapshots contained in a minor batch
%%      *_majorBatches:             mean fields, averaged over minor batches contained in a major batch
%%      *_storable:                 instantanoues fields to be sampled from the domain (e.g. vorticity, A(n), etc.) 
%%      *_ZTMean_Vec:               mean fields, averages over all major batches, in vector format.

%%      BL_*:                       related to the boundary layer upstream of the step
%%      DN_*:                       related to the boundary layer downstream of the step

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Required functions for run:
%%
%%      Reading in variables:
%%                              OF_BFS_readGridOriginal_v100
%%                              OF_BFS_readVarsOriginalGeneral_v100

%%      Grid filtering and handling:
%%                              dX_v100
%%                              grid_filterer_first_v100
%%                              OF_BFS_gridReadFilter_v120
%%                              OF_BFS_Inds_v100
%%                              OF_grid_filterer_SecondThird_v200
%%                              OF_neighborDistance_finder_v101
%%                              OF_originalGridFinder_v100

%%      Taking the derivatives:
%%                              OF_D2operator_v110
%%                              OF_Doperator_v101_1stB
%%                              OF_BFS_Vars2ndDerivative_v100

%%      Computing derived variables:
%%                              RSOriginal_v100
%%                              RStempOriginal_v100
%%                              UiRjk_v100
%%                              UiUjUk_tmp_v100
%%                              UiUjUk_v100
%%                              Vorticity_v100

%%      Averaging:
%%                              zAveraging_v010
%%                              Zavergaing_primer_v010

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code history
%% 
%% v1.21:   new feature:            reads in binary files
%% v1.30:   complement to myself:   properly structured, incredibly written
%% v1.40:           semi-unstructured differentiation should be added
%%                  there are no neighbors where the refined region begins or ends
%%                  derivatives are stored at each point, for all the times
%%                  after taking the time average, they are being interpolated onto structured grid.
%%                  after interpolation they are being averaged in z as well
%%                  A(n) should not be interpolated, since its relationship with derivatives is not linear
%%                  but seriously, who cares? philosophically interpolation of A(n) might be even better!
%%
%% v2.00:   big change:             reads in data on the unstructured grid, instead of v1.x which reads from structured
%% v2.01:   organization:           reading, filtering and finding neighbors and distances are included in the function OF_BFS_gridReadFilter
%%          minor bug fix:          derivative at the points without neighbors in y or z is computed if it has a neighbor in x, etc.
%% v2.02:
%% v2.03:   bug fix:                absolute values for planes to filter from the grid
%%          updated function:       OF_BFS_gridReadFilter_v102
%%          new variable:           XYZ_available (3D matrix which where the actual points are)
%% v2.20:   major change:           taking the mean using the original points
%%
%% v3.00:   
%% v3.10:   new variable:           first derivatives, vorticity
%%          new feature:            stores instantaneous vorticity at a certain x location.
%%          bug fix:                third filter to remove points with only one neighbor (otherwise makes first derivatives incalculable and second derivatives contaminated)
%%
%% v4.01:   bug fix:                second order derivatives include boundary points now
%%          new feature:            gets rid of some portions of the domain now specified by x_bounds
%%          new feature:            filter-related parameters are automatic now
%%          updated function:       OF_BFS_gridReadFilter_v111
%%          new outputs:            terms being used in residual study of mean momentum and RANS equations.
%%          minor fix:              more efficient in memory handling, crucial for larger cases
%%          multiple minor and major fixes here and there that I have lost track of
%%
%% v4.02:   new output:             major batches in vecotr format.
%%
%% v4.05:   new function:           OF_BFS_gridReadFilter_v120, improved speed and possibly filtering performance
%%          new function:           OF_Doperator_v101_1stB, replaced by the buggy OF_Doperator_v100
%%          bug fix:                first derivatives were set to at the boundaries, updated OF_Doperator_v101_1stB fixes that
%%          memory management:      slight improvement in memory requirement by clearing *_all variables before proceeding

%% v5.00:   new input:              eddy viscosity
%%          new outputs:            contribution of eddy viscosity term in mean momentum and RANS equations
%%          improved performance:   handling the tensors are improved
%%          memory management:      6 and 10 column storage for 2D and 3D symmetric tensors
%%          new functions:          for handling nonlinear terms and tensors
%%          bug fix:                all nonlinear variables are averaged propoerly at each stage
%%          new output:             eddy viscosity contribution to Reynolds stresses is decomposed into transport and redistribution
%%          new feature:            time derivative is added to the residual

%% v6.00:   new output:             AnSF_*: anisotropic error indicator based on structure functions (differential formulation)
%%          new output:             AnRE_*: anisotropic error indicator based on total contribution of small scales to energy
%%          new output (beta11):    AnTau_*: anisotropic error indicator based on stress tensor
%%          new output (beta12):    AnSFO_*: anisotropic error indicator based on structure functions (original formulation)
%%          new output (beta13):    AnTauR_*: revised version of AnTau_*
%%          new output (beta14):    AnGiso_*: isotropic error indicator based on Germano's identity

%%          new output (GDPbeta):   Smagorinsky coefficient from Germano's dynamic procedure - Lilly's formulation
%%          new output (GDPbeta):   eddy viscoisty from Germano's dynamic procedure - Lilly's formulation
%%          new output (GDPbeta):   error in the proposed equation for Germano's dynamic procedure

%%          new output (beta100):   Ui_*: error in Germano's identity in each momentum equation
%%          new output (beta100):   UiGj_*: <Fi'*Uj' + Fj'+Ui'>, as an estimate of error in the RS equations 
%%          new output (beta100):   absUiGj_*: <|Fi|'*|Uj|' + |Fj|'+|Ui|'>

%% v6.10:   IMPORTANT bug fix:      TikDujDxk_tmp_* and TikDujDxk_*

%% v7.00:   integrated with hybrid channel cases

%% v8.00:   does not separate upstream and downstream

%% v9.00: corrected variables
%%          correctedUi     = Ui
%%          correctedP      = P - 2/3 k
%%          correctedRij    = Rij - 2*nuR*Sij + 2/3 k DELTAij
%%          estimatedK      = 2*nu*|S|
%%          |S|             = sqrt( Sij Sij )

%% v9.01:       added feature:      handling OpenFOAM channel flows
%% v9.01b2:     bug fix:            definition of tauKKsgs
%% v9.01b3:     bug fix:            definition of GnTotal:  fixed by adding the tauKKsgs term
%%              new quantity:       GnTotalCommercial:      same as GnTotal but using all the none components of the tensor

%% v9.02b1:     new variable:       modRSeq_allPressure_wholeDomain_ZTMean_Vec


%% should be fixed before the alpha version:    incredibly inefficient for the added Smagorinsky stuff

%% Suggestions before going to the original version:
%%      1)  version consistency 
%%      3)  small bugs should be fixed, e.g. in plots, etc. (don't know what exactly)
%%      4)  version of the file should be removed from the filteredGrid* file
