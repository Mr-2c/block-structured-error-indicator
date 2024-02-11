%% OpenFOAM Backward Facing Step

%% WARNING: written for fields reported at cell boundary points
%% WARNING: step position could be adjusted, it is at (x,y)=(0,0) right now!
%% WARNING: for unstructured grids the data should be first interpolated onto a structured configuration.

%% v0.11:   fatal bug fix:      p0 is introduced for pressure value correction
%% v0.20:   new feature:        filter meaningless points using the functiongrid_filterer_v100

clear, clc, close all
addpath('/Users/siavashtoosi/Documents/MATLAB/OpenFOAM/MainRequiredScripts_v900','-end')

%%
domainBounds    = [ -20 , 25];
Step_position   = [ 0 , 0 ] ;

starting_snapshot   = 1 ;
distance_snapshots  = 1 ;
howManySnapshot     = 400 ;
startNumber         = 1 ;

do_legalDomain      = 'yes';
do_separateUpDown   = 'no' ;
% delete_simoul       = 'yes' ;

%%
% case_dir        = '/Volumes/My_Passport_for_Mac/BFS_binary/BFS_v320_Gn/BFS_v320_Gn05s' ;
% filenames       = 'BFSv320_Gn05s' ;
% dump_name       = 'BFSv320_Gn05s' ;
% 
% case_dir        = '/Volumes/My_Passport_for_Mac/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT07An' ;
% filenames       = 'BFSv320_newModQijnmT07An' ;
% dump_name       = 'BFSv320_newModQijnmT07An' ;

% case_dir        = '/Volumes/My_Passport_for_Mac/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04ff/' ;
% case_dir        = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04ff/' ;
% case_dir        = '/Volumes/4TB/tmp' ;
% filenames       = 'BFSv312_LES04ff' ;
% dump_name       = 'BFSv312_LES04ff' ;

% case_dir        = 'nuSgs_testDir' ;

% case_dir        = '/Volumes/My_Passport_for_Mac/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04f/' ;
% filenames       = 'BFS_LES04f' ;
% dump_name       = 'BFS_LES04f' ;

case_dir        = '/Volumes/My_Passport_for_Mac/BFS_binary/BFS_v320_An/BFS_v320_An05s_rev/' ;
filenames       = 'BFSv320_An05rs' ;
dump_name       = 'BFSv320_An05rs' ;

% case_dir        = '/Volumes/My_Passport_for_Mac/BFS_binary/BFS_v312_An/BFS_v312_An3s_equiDist/' ;
% filenames       = 'BFSv312_equiDist_An3s' ;
% dump_name       = 'BFSv312_equiDist_An3s' ;

% case_dir        = '/Volumes/My_Passport_for_Mac/BFS_binary/BFS_v100Tau/BFS_v100Tau_LES03s' ;
% filenames       = 'BFS_grid02' ;
% dump_name       = 'BFS_LES03s' ;

% case_dir        = '/Volumes/My_Passport_for_Mac/Channel/OpenFOAM/Re590_v010/LES_01c';
% filenames       = 'Channel590_LES01c' ;
% dump_name       = 'Channel590_LES01c' ;

% case_dir = 'skeletal_refinedTest_cells' ;
% filenames = 'BFS_Lin20_Lout20_Lz4_inlet020_v010_skeletal_refinedtest_Cells_t0';

cd(case_dir)
% case_files = dir([filenames,'0.*.csv']);
case_files = dir([filenames,'_t*.csv']);
grid_file  = dir([filenames,'_grid.csv']);

%%
disp('the reference pressure point is set to (x,y,z)=(0,5,0) for all snapshots.')

%%
for iMainLoop=1:length(case_files)
    file_numbers(iMainLoop)=str2num(case_files(iMainLoop).name((length(filenames)+5):end-4));
%     file_numbers(iMainLoop)=str2num(case_files(iMainLoop).name((length(filenames)+3):end-4));
end
[~,isort] = sort(file_numbers);
case_files = case_files(isort);

clear file_numbers i

%%
L = length(case_files) ; 

if ( distance_snapshots*(howManySnapshot-1) + starting_snapshot ) > L
    error(['there are only ', num2str(L), ' snapshots in the folder. consider picking more reasonable values!'])
end

%%
tic
[ ~ , XYZ , iXYZ ] = importCSV_ParaView_UPNUsnapshots_wXYZ_cellCenter_v110b3( grid_file(1).name );
% [~ , XYZ] = importCSV_ParaView_UPNUsnapshots_wXYZ_v110(case_files(1).name) ;
% [~ , ~ , XYZ] = importfile_csv_ParaView_woPMeans_v110(case_files(1).name) ;
toc

if strcmpi(do_separateUpDown,'yes')
    %%
    I_up    = (XYZ(:,1) < Step_position(1)) ;
    I_up    = I_up | ( (XYZ(:,1) == Step_position(1)) & (XYZ(:,2) >= Step_position(2)) ) ;

    XYZ_up = XYZ(I_up,:);

    [~,iP0] = min( sum(  ( XYZ_up - ( ones(size(XYZ_up)) * diag([0,5,0]) ) ) .^2   , 2 ) ) ;


    %%
    I_down      = (XYZ(:,1) >= Step_position(1)) ;
    XYZ_down    = XYZ(I_down,:);
else
    if strcmpi(do_legalDomain,'yes')
        I_lg    = ( (XYZ(:,1) >= domainBounds(1)) & (XYZ(:,1) <= domainBounds(2)) ) ;
        XYZ     = XYZ( I_lg ,:);
    end
    [~,iP0] = min( sum(  ( XYZ - ( ones(size(XYZ)) * diag([0,5,0]) ) ) .^2   , 2 ) ) ;
end

%%
if strcmpi(do_separateUpDown,'yes')
    fileID = fopen([dump_name,'_upstream','.xyz.original'],'w','l');
    fwrite(fileID,XYZ_up','float');
    fclose(fileID);
    clear fileID

    fileID = fopen([dump_name,'_downstream','.xyz.original'],'w','l');
    fwrite(fileID,XYZ_down','float');
    fclose(fileID);
    clear fileID
else
    fileID = fopen([dump_name,'.xyz.original'],'w','l');
    fwrite(fileID,XYZ','float');
    fclose(fileID);
    clear fileID
end

%%
I_mainLoop = (starting_snapshot : distance_snapshots : (distance_snapshots*(howManySnapshot-1)+starting_snapshot)) ;

%%
parfor iMainLoop = I_mainLoop
    
    iMainLoop
    Zeros = num2str(10^(4-floor(log10(startNumber-1 + iMainLoop)))) ;
    
    %%
    [ Vars , ~ , ~ ] = importCSV_ParaView_UPNUsnapshots_wXYZ_cellCenter_v110b3( ... 
        case_files(iMainLoop).name , iXYZ) ;
    
    %%
    if isempty(Vars) || size(Vars,2)~=5
        continue
    end
    
    %%
    if strcmpi(do_separateUpDown,'yes')
        %%
        Vars_upstream       = Vars(I_up,:);
        Vars_downstream     = Vars(I_down,:);
        
        %%
        p0                      = Vars_upstream(iP0,4) ;
        Vars_upstream(:,4)      = Vars_upstream(:,4) - p0 ;
        Vars_downstream(:,4)    = Vars_downstream(:,4) - p0;

        %%
        Vars_upstream   = Vars_upstream' ;
        Vars_downstream = Vars_downstream' ;

        Vars_upstream   = reshape(Vars_upstream,[],1);
        Vars_downstream = reshape(Vars_downstream,[],1);

        %%
        fileID = fopen([dump_name,'_upstream_',Zeros(2:end),num2str(startNumber-1 + iMainLoop),'original.dat'],'w','l');
        fwrite(fileID,Vars_upstream,'float');
        fclose(fileID);

        fileID = fopen([dump_name,'_downstream_',Zeros(2:end),num2str(startNumber-1 + iMainLoop),'original.dat'],'w','l');
        fwrite(fileID,Vars_downstream,'float');
        fclose(fileID);
        
    else
        
        %%
        p0          = Vars(iP0,4) ;
        Vars(:,4)   = Vars(:,4) - p0 ;
        
        %%
        if strcmpi( do_legalDomain , 'yes')
            Vars = Vars(I_lg,:) ;
        end
        
        %%
        Vars        = Vars' ;
        Vars        = reshape(Vars,[],1);
        
        %%
        fileID = fopen([dump_name,'_',Zeros(2:end),num2str(startNumber-1 + iMainLoop),'original.dat'],'w','l');
        fwrite(fileID,Vars,'float');
        fclose(fileID);
        
        %%
%         if strcmpi( delete_simoul , 'yes' )
%             delete(case_files(iMainLoop).name)
%         end
        
    end
end

% delete *.csv