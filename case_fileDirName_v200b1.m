function [ case_dirName , case_filenames , numVars , dt ] = ...
    case_fileDirName_v200b1(which_case , which_grid , same_folder)


if strcmpi(which_case,'BFS')
   
if ~ischar(which_grid)
    
    %%
    if which_grid == 0
    %     case_dirName            = 'BFS_grid00' ;
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_grid00' ;
        case_filenames          = 'BFS_grid0' ;
        numVars                 = 4 ;
        dt                      = 1 ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 1
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v010/BFS_grid01' ;
        case_filenames          = 'BFS_grid01' ;
    elseif which_grid == 2
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v010/BFS_grid02' ;
        case_filenames          = 'BFS_grid02' ;
    elseif which_grid == 31
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v010/BFS_grid03' ;
        case_filenames          = 'BFS_grid03' ;
    elseif which_grid == 32
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v010/BFS_grid03_r4' ;
        case_filenames          = 'BFS_grid03_' ;
    elseif which_grid == 41
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v010/BFS_grid04_r2' ;
        case_filenames          = 'BFS_grid04' ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 1000
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_LES01' ;
        case_filenames          = 'BFS_LES01s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 1001
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100/BFS_v100_grid01' ;
        case_filenames          = 'BFS_grid01' ;
    elseif which_grid == 1002
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100/BFS_v100_grid02' ;
        case_filenames          = 'BFS_grid02' ;
    elseif which_grid == 1003
    %     case_dirName            = 'BFS_v100_grid03' ;
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100/BFS_v100_grid03' ;
        case_filenames          = 'BFS_grid03' ;
    elseif which_grid == 1004
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100/BFS_v100_grid04' ;
        case_filenames          = 'BFS_grid04' ;
    elseif which_grid == 10041
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100/BFS_v100_grid04_DNS' ;
        case_filenames          = 'BFS_grid04' ;
    elseif which_grid == 1005
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100/BFS_v100_grid05_DNS' ;
        case_filenames          = 'BFS_grid05' ;
    elseif which_grid == 10055
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100/BFS_v100_grid055r2_DNS' ;
        case_filenames          = 'BFS_grid06' ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 1101
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v110/BFS_v110_grid01' ;
        case_filenames          = 'BFS_grid01' ;
    elseif which_grid == 1102
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v110/BFS_v110_grid02' ;
        case_filenames          = 'BFS_grid02' ;
    elseif which_grid == 1103
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v110/BFS_v110_grid03' ;
        case_filenames          = 'BFS_grid03' ;
    elseif which_grid == 1104
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v110/BFS_v110_grid04' ;
        case_filenames          = 'BFS_grid04' ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    elseif which_grid == 1201
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100SF/BFS_v100SF_LES02s' ;
        case_filenames          = 'BFS_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    elseif which_grid == 1301
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100SF/BFS_v100SF_LES02sREV' ;
        case_filenames          = 'BFS_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 1302
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100SF/BFS_v100SF_LES03s' ;
        case_filenames          = 'BFS_LES03s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 13021
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100SF/BFS_v100SF_LES03a' ;
        case_filenames          = 'BFS_LES03a' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 1303
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100SF/BFS_v100SF_LES04s' ;
        case_filenames          = 'BFS_LES04s' ;
        numVars                 = 4 ;
        dt                      = 2.5 ;

    elseif which_grid == 13031
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100SF/BFS_v100SF_LES04sREV' ;
        case_filenames          = 'BFS_LES04s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 1304
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100SF/BFS_v100SF_LES05s' ;
        case_filenames          = 'BFS_LES05s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    elseif which_grid == 1501
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100RE/BFS_v100RE_LES02s' ;
        case_filenames          = 'BFS_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 1502
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100RE/BFS_v100RE_LES03s' ;
        case_filenames          = 'BFS_LES03s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    elseif which_grid == 1701
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100Tau/BFS_v100Tau_LES02s' ;
        case_filenames          = 'BFS_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 1702
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100Tau/BFS_v100Tau_LES03s' ;
        case_filenames          = 'BFS_LES03s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    elseif which_grid == 1801
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100TauR3/BFS_v100TauR3_LES02' ;
        case_filenames          = 'BFS_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 1802
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100TauR3/BFS_v100TauR3_LES03s' ;
        case_filenames          = 'BFS_LES03s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 1803
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v100TauR3/BFS_v100TauR3_LES04rev2' ;
        case_filenames          = 'BFS_LES04s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 2000
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v200/BFS_v200_grid00' ;
        case_filenames          = 'BFS_grid00' ;
    elseif which_grid == 2001
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v200/BFS_v200_grid01' ;
        case_filenames          = 'BFS_grid01' ;


    elseif which_grid == 300200
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v300/BFS_v300_g20_grid00' ;
        case_filenames          = 'BFS_grid00' ;
    elseif which_grid == 300203
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v300/BFS_v300_g20_grid03' ;
        case_filenames          = 'BFS_grid03' ;

    elseif which_grid == 300250
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v300/BFS_v300_g25_grid00' ;
        case_filenames          = 'BFS_grid00' ;
    elseif which_grid == 300253
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v300/BFS_v300_g25_grid03' ;
        case_filenames          = 'BFS_grid03' ;

    elseif which_grid == 310200
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v310/BFS_v310_g20_grid00' ;
        case_filenames          = 'BFS_grid00' ;
    elseif which_grid == 311200
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v311/BFS_v311_g20_grid00' ;
        case_filenames          = 'BFS_grid00' ;
    elseif which_grid == 310250
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v310/BFS_v310_g25_grid00' ;
        case_filenames          = 'BFS_grid00' ;
    elseif which_grid == 311250
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v311/BFS_v311_g25_grid00' ;
        case_filenames          = 'BFS_grid00' ;
    elseif which_grid == 310203
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v310/BFS_v310_g20_grid03' ;
        case_filenames          = 'BFS_grid03' ;
    elseif which_grid == 311203
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v311/BFS_v311_g20_grid03' ;
        case_filenames          = 'BFS_grid03' ;
    elseif which_grid == 310253
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v310/BFS_v310_g25_grid03' ;
        case_filenames          = 'BFS_grid03' ;
    elseif which_grid == 311253
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v311/BFS_v311_g25_grid03' ;
        case_filenames          = 'BFS_grid03' ;

    elseif which_grid == 2010
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v201/BFS_v201_grid00' ;
        case_filenames          = 'BFS_grid00' ;
    elseif which_grid == 2011
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v201/BFS_v201_grid01' ;
        case_filenames          = 'BFS_grid01' ;
    elseif which_grid == 2012
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v201/BFS_v201_grid02' ;
        case_filenames          = 'BFS_grid02' ;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 312000
        case_dirName            = '/Users/siavashtoosi/Documents/MATLAB/OpenFOAM/nuSgs_testDir' ;
        case_filenames          = 'BFS_LES01o' ;
        numVars                 = 5 ;



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 312251
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g25wNu_grid00v2' ;
        case_filenames          = 'BFS_LES01c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312252
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g25wNu_grid01v2' ;
        case_filenames          = 'BFS_LES02c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312253
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g25wNu_grid02v2' ;
        case_filenames          = 'BFS_LES03c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312254
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g25wNu_grid03' ;
        case_filenames          = 'BFS_LES04c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 3122541
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g25wNu_grid03q' ;
        case_filenames          = 'BFS_LES04q' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 312101
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g10wNu_grid00' ;
        case_filenames          = 'BFS_LES01f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312102
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g10wNu_grid01' ;
        case_filenames          = 'BFS_LES02f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312103
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g10wNu_grid02' ;
        case_filenames          = 'BFS_LES03f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312104
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g10wNu_grid03' ;
        case_filenames          = 'BFS_LES04f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 312201
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g20wNu_grid00' ;
        case_filenames          = 'BFS_LES01b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312202
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g20wNu_grid01' ;
        case_filenames          = 'BFS_LES02b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312203
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g20wNu_grid02' ;
        case_filenames          = 'BFS_LES03b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312204
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g20wNu_grid03' ;
        case_filenames          = 'BFS_LES04b' ;
        numVars                 = 5 ;
        dt                      = .01 ;
    elseif which_grid == 3122041
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/BFS_v312_g20wNu_grid03p' ;
        case_filenames          = 'BFS_LES04p' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 3122030
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/specialTests/BFS_v312_g20wNu_grid03_wTime' ;
        case_filenames          = 'BFS_LES04b' ;
        numVars                 = 5 ;
        dt                      = 0.01 ;

    elseif which_grid == 31201002
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312seq_v010/LES02s' ;
        case_filenames          = 'BFS_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 3122540
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_wNU/specialTests/BFS_v312_g25wNu_grid03_wK' ;
        case_filenames          = 'BFS_LES04c' ;
        numVars                 = 6 ;
        dt                      = 2.5 ;









    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    %% cell center
    elseif which_grid == 31200251
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES01c' ;
        case_filenames          = 'BFS_LES01c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200252
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES02c' ;
        case_filenames          = 'BFS_LES02c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 312002521
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES02mc' ;
        case_filenames          = 'BFS_LES02mc' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200253
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES03c' ;
        case_filenames          = 'BFS_LES03c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200254
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04c' ;
        case_filenames          = 'BFS_LES04c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 312002541
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04q' ;
        case_filenames          = 'BFS_LES04q' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;


    elseif which_grid == 31200201
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES01b' ;
        case_filenames          = 'BFS_LES01b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200202
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES02b' ;
        case_filenames          = 'BFS_LES02b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 312002021
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES02mb' ;
        case_filenames          = 'BFS_LES02mb' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200203
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES03b' ;
        case_filenames          = 'BFS_LES03b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200204
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04b' ;
        case_filenames          = 'BFS_LES04b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 312002041
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04p' ;
        case_filenames          = 'BFS_LES04p' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200101
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES01f' ;
        case_filenames          = 'BFS_LES01f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200102
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES02f' ;
        case_filenames          = 'BFS_LES02f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200103
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES03f' ;
        case_filenames          = 'BFS_LES03f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 31200104
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04f' ;
        case_filenames          = 'BFS_LES04f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif which_grid == 313251
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES01c' ;
        case_filenames          = 'BFS_LES01c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 313201
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES01b' ;
        case_filenames          = 'BFS_LES01b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 313252
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES02sc' ;
        case_filenames          = 'BFS_LES02sc' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 313202
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES02sb' ;
        case_filenames          = 'BFS_LES02sb' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 3132021
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES02sa' ;
        case_filenames          = 'BFS_LES02sa' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 3132022
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES02sa_mod2' ;
        case_filenames          = 'BFS_LES02a' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid == 313253
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES03sc' ;
        case_filenames          = 'BFS_LES03sc' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 313203
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES03sb' ;
        case_filenames          = 'BFS_LES03sb' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 3132031
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES03sa' ;
        case_filenames          = 'BFS_LES03sa' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;



    elseif which_grid == 313254
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES04sc' ;
        case_filenames          = 'BFS_LES04sc' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 313204
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v313/BFS_v313_LES04sb' ;
        case_filenames          = 'BFS_LES04sb' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;




    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% seqV001
    elseif which_grid == 312001202
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312seq_v001/BFS_v312_LES02s_1b1c_2' ;
        case_filenames          = 'BFS_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 312001252
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312seq_v001/BFS_v312_LES02c_1b1c_2' ;
        case_filenames          = 'BFS_LES02c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    %%
    elseif which_grid == 31220001
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312seq_v010/LES02s' ;
        case_filenames          = 'BFS_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid == 31210001
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312seq_v010/LES02f' ;
        case_filenames          = 'BFS_LES02f' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;

    elseif which_grid==312*10^12
        case_dirName            = '/Volumes/4TB/cellCenterTest/BFS_v312_LES01c' ;
        case_filenames          = 'BFS_LES01C' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid==312*10^12+1
        case_dirName            = '/Volumes/4TB/cellCenterTest/BFS_v312_seqV001_LES02a/' ;
        case_filenames          = 'BFS_LES02a' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;


    end
    
else
    
    if strcmpi( which_grid , 'BFSv312_DNS37m' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04ff' ;
        case_filenames          = 'BFSv312_LES04ff' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    end
    
    if strcmpi( which_grid , 'BFSv312_LES04fb' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_cellCenter/BFS_v312_LES04fb' ;
        case_filenames          = 'BFSv312_LES04fb' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    end
    
    if strcmpi( which_grid , 'BFS_v312_Gn2s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_Gn/BFS_v312_Gn2s' ;
        case_filenames          = 'BFS_v312_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    end
    
    
    
    
    
    if strcmpi( which_grid , 'BFSv320_LES01c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES01c' ;
        case_filenames          = 'BFSv320_LES01c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES01ec' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES01ec' ;
        case_filenames          = 'BFSv320_LES01ec' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES01b' ) || strcmpi( which_grid , 'BFSv320l_LES01b' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES01b' ;
        case_filenames          = 'BFSv320_LES01b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320m_LES01b' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES01b/meanFields' ;
        case_filenames          = 'BFSv320m_LES01b' ;
        numVars                 = 4 ;
        dt                      = 200 ;
        
    elseif strcmpi( which_grid , 'BFSv320_LES02c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES02c' ;
        case_filenames          = 'BFSv320_LES02c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES02s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES02s' ;
        case_filenames          = 'BFSv320_LES02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES02cr' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES02c_rev' ;
        case_filenames          = 'BFSv320_LES02cr' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES02sr' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES02s_rev' ;
        case_filenames          = 'BFSv320_LES02sr' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES02ar' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES02a_rev' ;
        case_filenames          = 'BFSv320_LES02ar' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn02sec' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_Gn02ecs' ;
        case_filenames          = 'BFSv320_Gn02sec' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn02lnhsec' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_Gn02sec_lnh' ;
        case_filenames          = 'BFSv320_Gn02lnhsec' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
        
        
    elseif strcmpi( which_grid , 'BFSv320_LES03c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES03c' ;
        case_filenames          = 'BFSv320_LES03c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES03s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES03s' ;
        case_filenames          = 'BFSv320_LES03s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES03cr' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES03c_rev' ;
        case_filenames          = 'BFSv320_LES03cr' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES03sr' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES03s_rev' ;
        case_filenames          = 'BFSv320_LES03sr' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn03sec' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_Gn03sec' ;
        case_filenames          = 'BFSv320_Gn03sec' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
        
        
    elseif strcmpi( which_grid , 'BFSv320_LES04c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES04c' ;
        case_filenames          = 'BFSv320_LES04c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES04s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES04s' ;
        case_filenames          = 'BFSv320_LES04s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
        
    elseif strcmpi( which_grid , 'BFSv320_LES04rc' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES04c_rev' ;
        case_filenames          = 'BFSv320_LES04rc' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES04rs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES04s_rev' ;
        case_filenames          = 'BFSv320_LES04rs' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn04sec' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_Gn04sec' ;
        case_filenames          = 'BFSv320_Gn04sec' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
        
    elseif strcmpi( which_grid , 'BFSv320_LES05s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES05s' ;
        case_filenames          = 'BFSv320_LES05s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newQijnT05s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_newQijnT05s' ;
        case_filenames          = 'BFSv320_newQijnT05s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
        
    end
    
    
    
    
    if strcmpi( which_grid , 'BFSv312_true_An02s')
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_An/BFS_v312_An2s_true' ;
        case_filenames          = 'BFSv312_An2s_true' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
        
    elseif strcmpi( which_grid , 'BFSv312_equiDist_An02s')
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_An/BFS_v312_An2s_equiDist' ;
        case_filenames          = 'BFSv312_An2s_equiDist' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv312_true_An03s')
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_An/BFS_v312_An3s_true' ;
        case_filenames          = 'BFSv312_true_An3s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
        
    elseif strcmpi( which_grid , 'BFSv312_equiDist_An03s')
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v312_An/BFS_v312_An3s_equiDist' ;
        case_filenames          = 'BFSv312_equiDist_An3s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    end
    
    
    
    
    
    
    
    
    
    %%
    if strcmpi( which_grid , 'BFSv320_LES01c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES01c' ;
        case_filenames          = 'BFSv320_LES01c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_LES01b' ) || strcmpi( which_grid , 'BFSv320l_LES01b' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320/BFS_v320_LES01b' ;
        case_filenames          = 'BFSv320_LES01b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
        
        
        
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT02c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT02c/' ;
        case_filenames          = 'BFSv320_newModQijnmT02c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT02s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT02s/' ;
        case_filenames          = 'BFSv320_newModQijnmT02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT02rc' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT02rc' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT02c_rev/' ;
        case_filenames          = 'BFSv320_newModQijnmT02rc' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT02rs' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT02rs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT02s_rev/' ;
        case_filenames          = 'BFSv320_newModQijnmT02rs' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An02s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An02s/' ;
        case_filenames          = 'BFSv320_An02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_cafAn02s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_cafAn/BFS_v320_cafAn02s/' ;
        case_filenames          = 'BFSv320_cafAn02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn02s' ) || strcmpi( which_grid , 'BFSv320l_Gn02s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn02s/' ;
        case_filenames          = 'BFSv320_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320m_Gn02s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn02s/meanFields/' ;
        case_filenames          = 'BFSv320m_Gn02s' ;
        numVars                 = 4 ;
        dt                      = 100 ;
    
        
        
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT03rc' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT03c_rev/' ;
        case_filenames          = 'BFSv320_newModQijnmT03rc' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT03r2c' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT03r2c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT03c_rev2/' ;
        case_filenames          = 'BFSv320_newModQijnmT03r2c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT03r2s' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT03r2s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT03s_rev2/' ;
        case_filenames          = 'BFSv320_newModQijnmT03r2s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT03An' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT03An/' ;
        case_filenames          = 'BFSv320_newModQijnmT03An' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT03rAn' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT03An_rev/' ;
        case_filenames          = 'BFSv320_newModQijnmT03rAn' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An03s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An03s/' ;
        case_filenames          = 'BFSv320_An03s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An03rs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An03s_rev/' ;
        case_filenames          = 'BFSv320_An03rs' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_cafAn03s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_cafAn/BFS_v320_cafAn03s/' ;
        case_filenames          = 'BFSv320_cafAn03s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn03s' ) || strcmpi( which_grid , 'BFSv320l_Gn03s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn03s/' ;
        case_filenames          = 'BFSv320_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320m_Gn03s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn03s/meanFields/' ;
        case_filenames          = 'BFSv320m_Gn03s' ;
        numVars                 = 4 ;
        dt                      = 100 ;
        
        
        
        
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT04c' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT04c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT04c/' ;
        case_filenames          = 'BFSv320_newModQijnmT04c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT04s' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT04s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT04s/' ;
        case_filenames          = 'BFSv320_newModQijnmT04s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT04An' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT04An/' ;
        case_filenames          = 'BFSv320_newModQijnmT04An' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT04rAn' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT04An_rev/' ;
        case_filenames          = 'BFSv320_newModQijnmT04rAn' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An04s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An04s/' ;
        case_filenames          = 'BFSv320_An04s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An04rs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An04s_rev/' ;
        case_filenames          = 'BFSv320_An04rs' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_cafAn04s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_cafAn/BFS_v320_cafAn04s/' ;
        case_filenames          = 'BFSv320_cafAn04s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn04s' ) || strcmpi( which_grid , 'BFSv320l_Gn04s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn04s/' ;
        case_filenames          = 'BFSv320_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320m_Gn04s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn04s/meanFields/' ;
        case_filenames          = 'BFSv320m_Gn04s' ;
        numVars                 = 4 ;
        dt                      = 100 ;
        
         
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT05s' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT05s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT05s/' ;
        case_filenames          = 'BFSv320_newModQijnmT05s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT05c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT05c/' ;
        case_filenames          = 'BFSv320_newModQijnmT05c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT05An' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT05An/' ;
        case_filenames          = 'BFSv320_newModQijnmT05An' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT05xs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT05s_refX/' ;
        case_filenames          = 'BFSv320_newModQijnmT05xs' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An05s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An05s/' ;
        case_filenames          = 'BFSv320_An05s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An05rs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An05s_rev/' ;
        case_filenames          = 'BFSv320_An05rs' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_cafAn05s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_cafAn/BFS_v320_cafAn05s/' ;
        case_filenames          = 'BFSv320_cafAn05s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_cafAn05rs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_cafAn/BFS_v320_cafAn05s_rev/' ;
        case_filenames          = 'BFSv320_cafAn05rs' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn05s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn05s/' ;
        case_filenames          = 'BFSv320_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn05rs' ) || strcmpi( which_grid , 'BFSv320l_Gn05rs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn05rs/' ;
        case_filenames          = 'BFSv320_Gn05rs' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320m_Gn05rs' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn05rs/meanFields/' ;
        case_filenames          = 'BFSv320m_Gn05rs' ;
        numVars                 = 4 ;
        dt                      = 100 ;
        
        
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT06s' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT06s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT06s/' ;
        case_filenames          = 'BFSv320_newModQijnmT06s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT06c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT06c/' ;
        case_filenames          = 'BFSv320_newModQijnmT06c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT06An' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT06An_rev/' ;
        case_filenames          = 'BFSv320_newModQijnmT06An' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An06s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An06s/' ;
        case_filenames          = 'BFSv320_An06s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_cafAn06s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_cafAn/BFS_v320_cafAn06s/' ;
        case_filenames          = 'BFSv320_cafAn06s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn06s' )  || strcmpi( which_grid , 'BFSv320l_Gn06s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn06s/' ;
        case_filenames          = 'BFSv320_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320m_Gn06s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn06s/meanFields/' ;
        case_filenames          = 'BFSv320m_Gn06s' ;
        numVars                 = 4 ;
        dt                      = 100 ;
        
        
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT07s' ) || strcmpi( which_grid , 'BFSv320l_newModQijnmT07s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT07s/' ;
        case_filenames          = 'BFSv320_newModQijnmT07s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT07c' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT07c/' ;
        case_filenames          = 'BFSv320_newModQijnmT07c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_newModQijnmT07An' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_newModQijnmT/BFS_v320_newModQijnmT07An/' ;
        case_filenames          = 'BFSv320_newModQijnmT07An' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_An07s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_An/BFS_v320_An07s/' ;
        case_filenames          = 'BFSv320_An07s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_cafAn07s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_cafAn/BFS_v320_cafAn07s/' ;
        case_filenames          = 'BFSv320_cafAn07s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320_Gn07s' )  || strcmpi( which_grid , 'BFSv320l_Gn07s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn07s/' ;
        case_filenames          = 'BFSv320_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif strcmpi( which_grid , 'BFSv320m_Gn07s' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_Gn/BFS_v320_Gn07s/meanFields/' ;
        case_filenames          = 'BFSv320m_Gn07s' ;
        numVars                 = 4 ;
        dt                      = 100 ;
        
    end
    
    
    if strcmpi( which_grid , 'BFSv320m_Gn07fDNS' )
        case_dirName            = '/Volumes/4TB/BFS_binary/BFS_v320_DNS_Gn07f/' ;
        case_filenames          = 'BFSv320_Gn07fDNS' ;
        numVars                 = 5 ;
        dt                      = 100 ;
    end
end




































%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
elseif strcmpi(which_case,'OFchannel')
    if which_grid == 500000+40*8*12
        case_dirName            = '/Volumes/4TB/Channel/OpenFOAM/Channel_binary/LES_Re5k_v010_LES01b/' ;
        case_filenames          = 'Channel_LES01b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    end
    
    
    
    
    
    
    
    
    
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
elseif strcmpi( which_case , 'jan-erik' )
%     case_dirName            = '/Volumes/2TB/jola_fullFiles' ;
    case_dirName            = '~/Desktop/johan_full';
    numVars                 = 6 ;
    dt                      = 100.0 ;
    if strcmpi(which_grid , 'WALEVol_base' )
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_base' ;
    elseif strcmpi(which_grid , 'WALEVol_refX' )
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_refX_' ;
    elseif strcmpi(which_grid , 'WALEVol_refY' )
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_refY_' ;
    elseif strcmpi(which_grid , 'WALEVol_refZ' )
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_refZ_' ;
    elseif strcmpi(which_grid , 'WALEVol_refXY' )
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_refXY_' ;
    elseif strcmpi(which_grid , 'WALEVol_refXZ' )
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_refXZ_' ;
    elseif strcmpi(which_grid , 'WALEVol_refYZ' )
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_refYZ_' ;
    elseif strcmpi(which_grid , 'WALEVol_refXYZ' )
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_refXYZ_' ;
          
    elseif strcmpi(which_grid , 'WALElsq_base' )
        case_filenames          = 'WMLES_Re125k_M02_WALElsq_cw04_base' ;
    elseif strcmpi(which_grid , 'WALElsq_refY' )
        case_filenames          = 'WMLES_Re125k_M02_WALElsq_cw04_refY_' ;
        
        
    elseif strcmpi(which_grid , 'WALEVol_base_second' )
        case_dirName            = '/Volumes/2TB/hybrid_WALEvol_base_second';
        numVars                 = 6 ;
        dt                      = 100.0 ;
        case_filenames          = 'WMLES_Re125k_M02_WALEvol_cw04_base' ;
    
    end
    
  
    
%%
elseif strcmpi( which_case , 'LES_ReTau5200' )
    if strcmpi(which_grid , 'LES_ReTau5200_LES01b' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_LES01b' ;
        case_filenames          = 'LES_ReTau5200_M02_LES01b' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn02s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn03s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn04s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn05s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn06s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn07s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn08s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn08s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn08s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn09s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn09s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn09s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn10s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn010s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn10s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi(which_grid , 'LES_ReTau5200_Gn11s' )
        case_dirName            = '/Volumes/4TB/Channel/Channel_ReTau5200/LES_Re125k_M02_Gn11s' ;
        case_filenames          = 'LES_ReTau5200_M02_Gn10s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
        
        
    end



%%
elseif strcmpi(which_case,'hybridWMLES250k')
    if strcmpi(which_grid , 'WMLES01b' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_WMLES01b' ;
        case_filenames          = 'WMLES_Re250k_M02_WMLES01b' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
        
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_uncorWMLES02s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_uncorWMLES02s' ;
        case_filenames          = 'WMLES_Re250k_M02_uncorWMLES02s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
        
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_corWMLES03s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_corWMLES03s' ;
        case_filenames          = 'WMLES_Re250k_M02_corWMLES03s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_uncorWMLES03s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_uncorWMLES03s' ;
        case_filenames          = 'WMLES_Re250k_M02_uncorWMLES03s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
        
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_corWMLES04s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_corWMLES04s' ;
        case_filenames          = 'WMLES_Re250k_M02_corWMLES04s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_uncorWMLES04s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_uncorWMLES04s' ;
        case_filenames          = 'WMLES_Re250k_M02_uncorWMLES04s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
        
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_corWMLES05s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_corWMLES05s' ;
        case_filenames          = 'WMLES_Re250k_M02_corWMLES05s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_uncorWMLES05s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_uncorWMLES05s' ;
        case_filenames          = 'WMLES_Re250k_M02_uncorWMLES05s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif strcmpi(which_grid , 'LES_Re250k_M02_uncorWMLES05s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/LES_Re250k_M02_uncorWMLES05s' ;
        case_filenames          = 'LES_Re250k_M02_uncorWMLES05s' ;
        numVars                 = 5 ;
        dt                      = 2.0 ;
        
        
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_corWMLES06s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_corWMLES06s' ;
        case_filenames          = 'WMLES_Re250k_M02_corWMLES06s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_corWMLES06s_dd' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_corWMLES06s_dd' ;
        case_filenames          = 'WMLES_Re250k_M02_corWMLES06s_dd' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_uncorWMLES06s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_uncorWMLES06s' ;
        case_filenames          = 'WMLES_Re250k_M02_uncorWMLES06s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
        
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_corWMLES07s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_corWMLES07s' ;
        case_filenames          = 'WMLES_Re250k_M02_corWMLES07s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif strcmpi(which_grid , 'WMLES_Re250k_M02_uncorWMLES07s' )
        case_dirName            = '/Volumes/4TB/Channel/WMLES/WMLES_Re250k_M02_uncorWMLES07s' ;
        case_filenames          = 'WMLES_Re250k_M02_uncorWMLES07s' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
        
    end
    

%%
elseif strcmpi(which_case,'hybridWMLES200k')
    if which_grid == 52*32*20
        case_dirName            = '/Volumes/4TB/hybridWMLES/WMLES_Re200k_Lx13Lz5/Nx52_Ny32_Nz20' ;
        case_filenames          = 'WMLES_Re200k_Lx13Lz5_Nx52_Ny32_Nz20' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif which_grid == 104*16*40
        case_dirName            = '/Volumes/4TB/hybridWMLES/WMLES_Re200k_Lx13Lz5/Nx104_Ny16_Nz40' ;
        case_filenames          = 'WMLES_Re200k_Lx13Lz5_Nx104_Ny16_Nz40' ;
        numVars                 = 6 ;
        dt                      = 5.0 ;
    end
    
    
    
    
    if which_grid==10^12
        case_dirName            = '/Users/siavashtoosi/Documents/MATLAB/WMLES_Re200k_Lx13Lz5/Nx52_Ny32_Nz20' ;
        case_filenames          = 'WMLES_Re200k_Lx13Lz5_Nx52_Ny32_Nz20' ;
        numVars                 = 6 ;
        dt                      = 2.0 ;
    elseif which_grid==10^12+1
        case_dirName            = '/Users/siavashtoosi/Documents/MATLAB/WMLES_Re200k_Lx13Lz5/Nx104_Ny16_Nz40' ;
        case_filenames          = 'WMLES_Re200k_Lx13Lz5_Nx104_Ny16_Nz40' ;
        numVars                 = 6 ;
        dt                      = 5.0 ;
    end
    
    
    
    
elseif strcmpi(which_case,'hybridDNS')
    if which_grid==395
        case_dirName            = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/NewEra/DNS_reTau395' ;
        case_filenames          = 'dns_retau395' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    end
    

    
    
    
elseif strcmpi(which_case,'hybridLES')
    
    if which_grid==30000+220*270*80
        case_dirName            = '/Volumes/4TB/Channel/CAF_paper/LES_Re30000/tRe30000_M8_Nx220_Nz265_Ny80_gamma2_Lx10_Lz3_ADrho1e-5/600-800_LES_Re30000' ;
        case_filenames          = 'Re30000_M8_LES_Nx220_Nz270_Ny80' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==30000+96*60*96
        case_dirName           = '/Volumes/4TB/Channel/hybrid/CAF_paper/LES_Re30000/Re30000_M8_Nx96_Nz96_Ny60_gamma22_Lx10_Lz3_ADrho1e-5/600-800_LES_Re30000' ;
        case_filenames          = 'Re30000_M8_LES_Nx96_Nz96_Ny60' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==30000+60*50*40
        case_dirName           = '/Volumes/4TB/Channel/CAF_paper/LES_Re30000/Re30000_M8_Nx60_Nz40_Ny50_gamma22_Lx10_Lz3_ADrho1e-5/600-800_LES_Re30000' ;
        case_filenames          = 'Re30000_M8_LES_Nx60_Nz40_Ny50' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    end
    
    
    
    
    
elseif strcmpi(which_case,'hybridLES20000')
    if which_grid==20000+40*8*12
        case_dirName           = '/Users/siavashtoosi/Desktop/channel/Re20000M04/Re20000_M8_LES1b' ;
        case_filenames          = 'Re20000_M04_LES1b_40x8x12' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif which_grid==20000+50*10*15
        case_dirName           = '/Users/siavashtoosi/Desktop/channel/Re20000M04/Re20000_M8_LES1f' ;
        case_filenames          = 'Re20000_M04_LES1b_50x10x15' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    
        
%     elseif which_grid==20000+160*52*160
%         case_dirName           = '/Volumes/4TB/Channel/hybrid/twoGrid_setupTrial/LES_Re20000/Re20000M02' ;
%         case_filenames          = 'Re20000_M02_LES1b_160x52x160' ;
%         numVars                 = 5 ;
%         dt                      = 1.5 ;
%     elseif which_grid==20000+160*52*160+2
%         case_dirName           = '/Volumes/4TB/Channel/hybrid/twoGrid_setupTrial/LES_Re20000/2ndOrder/Re20000M02' ;
%         case_filenames          = 'Re20000_M02_2ndOrder_160x52x160' ;
%         numVars                 = 5 ;
%         dt                      = 1.5 ;
    elseif which_grid==20000+0.4+ 160*52*160 +2
        case_dirName           = '/Volumes/4TB/Channel/hybrid/twoGrid_setupTrial/LES_Re20000/2ndOrder/Re20000M04' ;
        case_filenames          = 'Re20000_M02_2ndOrder_160x52x160' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    
        
    elseif which_grid==20000+0.13+160*52*160+2
        case_dirName           = '/Volumes/4TB/Channel/hybrid/twoGrid_setupTrial/LES_Re20000/2ndOrder/Re20000M013' ;
        case_filenames          = 'Re20000_M02_2ndOrder_160x52x160' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif which_grid==20000+0.13+160*52*160
        case_dirName           = '/Volumes/4TB/Channel/hybrid/twoGrid_setupTrial/LES_Re20000/Re20000M015' ;
        case_filenames          = 'Re20000_M015_LES1b_160x52x160' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    
    elseif which_grid==20000+120*58*84
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/LES_Re20000_120x58x84/' ;
        case_filenames          = 'LES_Re20000_120x58x84' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==20000+38*26*18+2
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/An_LES_Re20000_38x26x18_flucSmag_2nd/' ;
        case_filenames          = 'LES_Re20000_38x26x18' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==20000+38*26*18+6
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/An_LES_Re20000_38x26x18_flucSmag_6th/' ;
        case_filenames          = 'LES_Re20000_38x26x18' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==20000+75*38*42
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/An_LES_Re20000_75x38x42/' ;
        case_filenames          = 'LES_Re20000_75x38x42' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==20000+75*38*42+2
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/An_LES_Re20000_75x38x42_flucSmag_2nd/' ;
        case_filenames          = 'LES_Re20000_75x38x42' ;
        numVars                 = 5 ;
        dt                      = 0.01 ;
    elseif which_grid==20000+75*38*42+6
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/An_LES_Re20000_75x38x42_flucSmag_6th/' ;
        case_filenames          = 'LES_Re20000_75x38x42' ;
        numVars                 = 5 ;
        dt                      = 0.01 ;
    elseif which_grid==20000+112*48*100
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/An_LES_Re20000_112x48x100/' ;
        case_filenames          = 'LES_Re20000_112x48x100' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==20000+112*48*100+2
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/An_LES_Re20000_112x48x100_flucSmag_2nd/' ;
        case_filenames          = 'LES_Re20000_112x48x100' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==20000+112*48*100+6
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/An_LES_Re20000_112x48x100_flucSmag_6th/' ;
        case_filenames          = 'LES_Re20000_112x48x100' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
        
    elseif which_grid==30000+96*60*96+2
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/CAF_LES_Re30000_96x60x96_flucSmag_2nd/' ;
        case_filenames          = 'LES_Re30000_96x60x96' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif which_grid==30000+96*60*96+6
        case_dirName           = '/Users/siavashtoosi/Documents/MATLAB/DNS-LES Channel/anEvenNewerEra/CAF_LES_Re30000_96x60x96_flucSmag_6th/' ;
        case_filenames          = 'LES_Re30000_96x60x96' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    end
    
    
    
elseif strcmpi(which_case,'LES20000M02_v010')
    if which_grid==20000+160*52*160
        case_dirName           = '/Volumes/4TB/Channel/hybrid/twoGrid_setupTrial/LES_Re20000/Re20000M02' ;
        case_filenames          = 'Re20000_M02_LES1b_160x52x160' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif which_grid==20000+160*52*160+2
        case_dirName           = '/Volumes/4TB/Channel/hybrid/twoGrid_setupTrial/LES_Re20000/2ndOrder/Re20000M02' ;
        case_filenames          = 'Re20000_M02_2ndOrder_160x52x160' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    
    elseif strcmpi( which_grid , 'LES01b' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES01f' ;
        case_filenames          = 'Re20000_M02_LES1f_50x10x15' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'LES01c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES01b' ;
        case_filenames          = 'Re20000_M02_LES1b_40x8x12' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
%     elseif which_grid==30*6*9+6
%         case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES01c' ;
%         case_filenames          = 'Re20000_M02_LES1c_30x6x9' ;
%         numVars                 = 5 ;
%         dt                      = 1.0 ;
        
    elseif strcmpi( which_grid , 'LES02sQij' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES02sQij' ;
        case_filenames          = 'Re20000_M02_LES2sQij' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'LES02cQij' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES02cQij' ;
        case_filenames          = 'Re20000_M02_LES2sQij' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'LES02sQijnT' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES02sQijnT' ;
        case_filenames          = 'Re20000_M02_LES2sQij' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'LES02cQijnT' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES02cQijnT' ;
        case_filenames          = 'Re20000_M02_LES2sQij' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'LES02sAn' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES02sAn' ;
        case_filenames          = 'Re20000_M02_LES2sAn' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
     
        
    elseif strcmpi( which_grid , 'Qij03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_Qij03s' ;
        case_filenames          = 'Re20000_M02_Qij3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Qij03c')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_Qij03c' ;
        case_filenames          = 'Re20000_M02_Qij3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'QijnT03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_QijnT03s' ;
        case_filenames          = 'Re20000_M02_QijnT3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'QijnT03c')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_QijnT03c' ;
        case_filenames          = 'Re20000_M02_QijnT3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'An03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_An03s_rev' ;
        case_filenames          = 'Re20000_M02_An3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Qij03aAn')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_Qij03aAn' ;
        case_filenames          = 'Re20000_M02_Qij3aAn' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'QijnT03aAn')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_QijnT03aAn' ;
        case_filenames          = 'Re20000_M02_QijnT3aAn' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'QijnT03aQij')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_QijnT03aQij' ;
        case_filenames          = 'Re20000_M02_QijnT3aQij' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Qij03aQijnT')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_Qij03aQijnT' ;
        case_filenames          = 'Re20000_M02_Qij3aQijnT' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
 
    
    
    
%%
elseif strcmpi(which_case,'LES20000M02_v030')
    if strcmpi( which_grid , 'LES01b' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES01f' ;
        case_filenames          = 'Re20000_M02_LES1f_50x10x15' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'LES01c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v010/Re20000M020_LES01b' ;
        case_filenames          = 'Re20000_M02_LES1b_40x8x12' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
        
        
    elseif strcmpi( which_grid , 'Qij02s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_Qij02s' ;
        case_filenames          = 'Re20000_M02_Qij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Qij02c')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_Qij02c' ;
        case_filenames          = 'Re20000_M02_Qij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Eij02s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_Eij02s' ;
        case_filenames          = 'Re20000_M02_Eij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Eij02c')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_Eij02c' ;
        case_filenames          = 'Re20000_M02_Eij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'absEij02s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_absEij02s' ;
        case_filenames          = 'Re20000_M02_absEij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'absEij02c')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_absEij02c' ;
        case_filenames          = 'Re20000_M02_absEij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'An02s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_An02s' ;
        case_filenames          = 'Re20000_M02_An2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Gn02s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_Gn02s' ;
        case_filenames          = 'Re20000_M02_Gn2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Gn3rd02s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_Gn3rd02s' ;
        case_filenames          = 'Re20000_M02_Gn3rd2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Gn02s_rev')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_Gn02s_rev' ;
        case_filenames          = 'Re20000_M02_Gn2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'GnC02s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_GnC02s' ;
        case_filenames          = 'Re20000_M02_GnC2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'GnC3rd02s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_GnC3rd02s' ;
        case_filenames          = 'Re20000_M02_GnC2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'newQij02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_smoothModQij02s' ;
        case_filenames          = 'Re20000_M02_newQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'newQij02c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_smoothModQij02c' ;
        case_filenames          = 'Re20000_M02_newQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_modQij02s' ;
        case_filenames          = 'Re20000_M02_modQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij02c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter2/Re20000M020_modQij02c' ;
        case_filenames          = 'Re20000_M02_modQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
       
    elseif strcmpi( which_grid , 'Qij03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_Qij03s' ;
        case_filenames          = 'Re20000_M02_Qij3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Qij03c')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_Qij03c' ;
        case_filenames          = 'Re20000_M02_Qij3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'absEij03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_absEij03s' ;
        case_filenames          = 'Re20000_M02_absEij3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'absEij03c')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_absEij03c' ;
        case_filenames          = 'Re20000_M02_absEij3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Gn03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_Gn03s' ;
        case_filenames          = 'Re20000_M02_Gn3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'An03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_An03s' ;
        case_filenames          = 'Re20000_M02_An3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Gn3rd03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_Gn3rd03s' ;
        case_filenames          = 'Re20000_M02_Gn3rd3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'GnC03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_GnC03s' ;
        case_filenames          = 'Re20000_M02_GnC3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'GnC3rd03s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter3/Re20000M020_GnC3rd03s' ;
        case_filenames          = 'Re20000_M02_Gn3rd3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'Gn04s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter4/Re20000M020_Gn04s' ;
        case_filenames          = 'Re20000_M02_Gn4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'An04s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter4/Re20000M020_An04s' ;
        case_filenames          = 'Re20000_M02_An4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Gn3rd04s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter4/Re20000M020_Gn3rd04s' ;
        case_filenames          = 'Re20000_M02_Gn3rd4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'An04c')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter4/Re20000M020_An04c' ;
        case_filenames          = 'Re20000_M02_An4c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'GnC04s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter4/Re20000M020_GnC04s' ;
        case_filenames          = 'Re20000_M02_GnC4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'GnC3rd04s')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter4/Re20000M020_GnC3rd04s' ;
        case_filenames          = 'Re20000_M02_GnC3rd4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'An04s_2nd')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter4/Re20000M020_An04s_2ndOrder' ;
        case_filenames          = 'Re20000_M02_2ndOrder_An4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'An04c_2nd')
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030/iter4/Re20000M020_An04c_2ndOrder' ;
        case_filenames          = 'Re20000_M02_An4c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
    
    
    
    
elseif strcmpi(which_case,'LES20000M02_v030_2nd')
    if strcmpi( which_grid , 'LES01b_2nd' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrder/iter1/Re20000M020_2nd_LES01f' ;
        case_filenames          = 'Re20000_M02_LES1f' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'LES01c_2nd' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrder/iter1/Re20000M020_2nd_LES01b' ;
        case_filenames          = 'Re20000_M02_LES1b' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'modQij02s_2nd' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrder/iter2/Re20000M020_2nd_modQij2s' ;
        case_filenames          = 'Re20000_M02_2ndOrder_modQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'modQij02c_2nd' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrder/iter2/Re20000M020_2nd_modQij2c' ;
        case_filenames          = 'Re20000_M02_modQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'newQij02s_2nd' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrder/iter2/Re20000M020_2nd_smoothModQij2s' ;
        case_filenames          = 'Re20000_M02_2ndOrder_newQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'newQij02c_2nd' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrder/iter2/Re20000M020_2nd_smoothModQij2c' ;
        case_filenames          = 'Re20000_M02_2ndOrder_newQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
        
    end
    
    
elseif strcmpi(which_case,'LES20000M02_v030_H2a3')
    if strcmpi( which_grid , 'LES01b_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrder/iter1/Re20000M020_2nd_LES01f' ;
        case_filenames          = 'Re20000_M02_LES1f' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'LES01c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrder/iter1/Re20000M020_2nd_LES01b' ;
        case_filenames          = 'Re20000_M02_LES1b' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
        
    elseif strcmpi( which_grid , 'modQij02s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQij2s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij02c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQij2c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmT02s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQijnmT2s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmT2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmT02c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQijnmT2c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmT2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmTPRSLRR02s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQijnmTPRSLRR2s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmTPRSLRR2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmTPRSLRR02c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQijnmTPRSLRR2c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmTPRSLRR2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'smQij02s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_smQij2s/' ;
        case_filenames          = 'Re20000_M02_H2a3_smQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'smQij02c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_smQij2c/' ;
        case_filenames          = 'Re20000_M02_H2a3_smQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmT02s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQijnmT2s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmT2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmT02c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQijnmT2c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmT2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmTPRSLRR02s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQijnmTPRSLRR2s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmTPRSLRR2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmTPRSLRR02c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter2/LES_Re20000_H2a3_modQijnmTPRSLRR2c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmTPRSLRR2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'modQij03s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQij3s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQij3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij03c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQij3c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQij3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmT03s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQijnmT3s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmT3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmT03c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQijnmT3c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmT2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmTPRSLRR03s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQijnmTPRSLRR3s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmTPRSLRR3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQijnmTPRSLRR03c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQijnmTPRSLRR3c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQijnmTPRSLRR3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'smQij03s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_smQij3s/' ;
        case_filenames          = 'Re20000_M02_H2a3_smQij3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'smQij03c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_smQij3c/' ;
        case_filenames          = 'Re20000_M02_H2a3_smQij3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'modQij04s_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter4/LES_Re20000_H2a3_modQij4s/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQij4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij04c_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter4/LES_Re20000_H2a3_modQij4c/' ;
        case_filenames          = 'Re20000_M02_H2a3_modQij4c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
%     elseif strcmpi( which_grid , 'modQijnmT03s_H2a3' )
%         case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQijnmT3s/' ;
%         case_filenames          = 'Re20000_M02_H2a3_modQijnmT3s' ;
%         numVars                 = 5 ;
%         dt                      = 1.5 ;
%     elseif strcmpi( which_grid , 'modQijnmT03c_H2a3' )
%         case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQijnmT3c/' ;
%         case_filenames          = 'Re20000_M02_H2a3_modQijnmT3c' ;
%         numVars                 = 5 ;
%         dt                      = 1.5 ;
%     elseif strcmpi( which_grid , 'modQijnmTPRSLRR03s_H2a3' )
%         case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQijnmTPRSLRR3s/' ;
%         case_filenames          = 'Re20000_M02_H2a3_modQijnmTPRSLRR3s' ;
%         numVars                 = 5 ;
%         dt                      = 1.5 ;
%     elseif strcmpi( which_grid , 'modQijnmTPRSLRR03c_H2a3' )
%         case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_2ndOrderHybrid_3rdOrderScaling/iter3/LES_Re20000_H2a3_modQijnmTPRSLRR3c/' ;
%         case_filenames          = 'Re20000_M02_H2a3_modQijnmTPRSLRR3c' ;
%         numVars                 = 5 ;
%         dt                      = 1.5 ;
        
        
        
    end
    
    
    
    
%%
elseif strcmpi(which_case,'LES20000M02_v030_H2a2b2_equivAnDX')
    if strcmpi( which_grid , 'smQij02s_H2a2b2' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_H2a2b2_equivAnDX/iter2/LES_Re20000_H2a2b2_equivAnDX_smQij2s/' ;
        case_filenames          = 'Re20000_M02_H2a2b2_equivAnDX_smQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'smQij02c_H2a2b2' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v030_H2a2b2_equivAnDX/iter2/LES_Re20000_H2a2b2_equivAnDX_smQij2c/' ;
        case_filenames          = 'Re20000_M02_H2a2b2_equivAnDX_smQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;    
    end
        
    
%%
elseif strcmpi(which_case,'LES20000M02_v030_H2a2b3')
    if strcmpi( which_grid , 'smQij02s_H2a2b3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b3/iter2/LES_Re20000_H2a2b3_smQij2s' ;
        case_filenames          = 'Re20000_M02_H2a2b3_smQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;
    elseif strcmpi( which_grid , 'smQij02c_H2a2b3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b3/iter2/LES_Re20000_H2a2b3_smQij2c' ;
        case_filenames          = 'Re20000_M02_H2a2b5_smQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.0 ;    
    end
    
    
%%
elseif strcmpi(which_case,'LES20000M02_v030_H2a2b5')
    if strcmpi( which_grid , 'modQij02s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b5/iter2/LES_Re20000_H2a2b5_modQij2s/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_modQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij02c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b5/iter2/LES_Re20000_H2a2b5_modQij2c/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_modQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;    
    elseif strcmpi( which_grid , 'smQij02s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b5/iter2/LES_Re20000_H2a2b5_smQij2s/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_smQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'smQij02c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b5/iter2/LES_Re20000_H2a2b5_smQij2c/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_smQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ; 
        
    elseif strcmpi( which_grid , 'modQij03c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b5/iter3/LES_Re20000_H2a2b5_modQij3c/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_modQij3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij03s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b5/iter3/LES_Re20000_H2a2b5_modQij3s/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_modQij3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij03ca_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b5/iter3/LES_Re20000_H2a2b5_modQij3ca/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_modQij3ca' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij03sa_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v050_H2a2b5/iter3/LES_Re20000_H2a2b5_modQij3sa/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_modQij3sa' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
    
    
%%
elseif strcmpi(which_case,'LES20000M02_v060_H2a2b5')
    if strcmpi( which_grid , 'LES01b_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter1/LES_Re20000_H2a2b5_LES01b/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_LES01b' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'LES01c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter1/LES_Re20000_H2a2b5_LES01c/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_LES01c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ; 
        
    elseif strcmpi( which_grid , 'An02s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter2/LES_Re20000_H2a2b5_An2s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_An2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'pAn02s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter2/LES_Re20000_H2a2b5_pAn2s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_pAn2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'pGn02s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter2/LES_Re20000_H2a2b5_pGn2s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_pGn2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij02s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter2/LES_Re20000_H2a2b5_modQij2s/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_modQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij02c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter2/LES_Re20000_H2a2b5_modQij2c/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_modQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'smQij02s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter2/LES_Re20000_H2a2b5_smQij2s/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_smQij2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'smQij02c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter2/LES_Re20000_H2a2b5_smQij2c/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_smQij2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    
        
    elseif strcmpi( which_grid , 'An03s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter3/LES_Re20000_H2a2b5_An3s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'pAn03s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter3/LES_Re20000_H2a2b5_pAn3s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_pAn3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'pGn03s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter3/LES_Re20000_H2a2b5_pGn3s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_pGn3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij03s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter3/LES_Re20000_H2a2b5_modQij3s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij03c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter3/LES_Re20000_H2a2b5_modQij3c/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij03a_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter3/LES_Re20000_H2a2b5_modQij3a/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij3a' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij03pa_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter3/LES_Re20000_H2a2b5_modQij3pa/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij3pa' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'An04s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter4/LES_Re20000_H2a2b5_An4s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_An4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'pAn04s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter4/LES_Re20000_H2a2b5_pAn4s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_pAn4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'pGn04s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter4/LES_Re20000_H2a2b5_pGn4s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_pGn4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij04s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter4/LES_Re20000_H2a2b5_modQij4s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij04c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter4/LES_Re20000_H2a2b5_modQij4c/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij4c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij04a_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter4/LES_Re20000_H2a2b5_modQij4a/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'An05s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter5/LES_Re20000_H2a2b5_An5s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_An5s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'pAn05s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter5/LES_Re20000_H2a2b5_pAn5s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_pAn5s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij05c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter5/LES_Re20000_H2a2b5_modQij5c/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij5c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij05s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter5/LES_Re20000_H2a2b5_modQij5s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij5s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij05a_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter5/LES_Re20000_H2a2b5_modQij5a/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij5a' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'modQij06a_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter6/LES_Re20000_H2a2b5_modQij6a/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij6a' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij06c_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter6/LES_Re20000_H2a2b5_modQij6c/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij6c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij06pa_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter6/LES_Re20000_H2a2b5_modQij6pa/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij6pa' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'modQij06s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter6/LES_Re20000_H2a2b5_modQij6s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_modQij6s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
        
    elseif strcmpi( which_grid , 'newQijnT04s_H2a2b5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/test_newQijnT4s/' ;
        case_filenames          = 'Re20000_M02_v060_H2a2b5_newQijnT4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
    
    
    
    %%
elseif strcmpi(which_case,'LES20000M02_v061_H2a2b5')
    if strcmpi( which_grid , 'LES01b' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter1/LES_Re20000_H2a2b5_LES01b/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_LES01b' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'LES01c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v060_finerY/iter1/LES_Re20000_H2a2b5_LES01c/' ;
        case_filenames          = 'Re20000_M02_H2a2b5_LES01c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ; 
        
        
    elseif strcmpi( which_grid , 'CHv061_An02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter2/LES_Re20000_v061_An2s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_An2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter2/LES_Re20000_v061_newModQijnmT2s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT02c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter2/LES_Re20000_v061_newModQijnmT2c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT2c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter2/LES_Re20000_v061_Gn2s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_Gn2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_cafAn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter2/LES_Re20000_v061_cafAn2s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_cafAn2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmTwRANS02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter2/LES_Re20000_v061_newModQijnmTwRANS2s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmTwRANS2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmTwRANS02c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter2/LES_Re20000_v061_newModQijnmTwRANS2c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmTwRANS2s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter3/LES_Re20000_v061_newModQijnmT3s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT03c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter3/LES_Re20000_v061_newModQijnmT3c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT03An' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter3/LES_Re20000_v061_newModQijnmT3An/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmTwRANS03c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter3/LES_Re20000_v061_newModQijnmTwRANS3c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmTwRANS3c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmTwRANS03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter3/LES_Re20000_v061_newModQijnmTwRANS3s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmTwRANS3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_An03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter3/LES_Re20000_v061_An3s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_An3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_cafAn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter3/LES_Re20000_v061_cafAn3s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_cafAn3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter3/LES_Re20000_v061_Gn3s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_Gn3s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter4/LES_Re20000_v061_newModQijnmT4s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT04c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter4/LES_Re20000_v061_newModQijnmT4c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT04An' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter4/LES_Re20000_v061_newModQijnmT4An/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT4An' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmTwRANS04c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter4/LES_Re20000_v061_newModQijnmTwRANS4c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmTwRANS4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmTwRANS04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter4/LES_Re20000_v061_newModQijnmTwRANS4s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmTwRANS4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_An04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter4/LES_Re20000_v061_An4s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_An4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_cafAn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter4/LES_Re20000_v061_cafAn4s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_cafAn4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter4/LES_Re20000_v061_Gn4s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_Gn4s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
        
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter5/LES_Re20000_v061_newModQijnmT5s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT5s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT05c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter5/LES_Re20000_v061_newModQijnmT5c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT5c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT05An' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter5/LES_Re20000_v061_newModQijnmT5An/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT5An' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmTwRANS05c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter5/LES_Re20000_v061_newModQijnmTwRANS5c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmTwRANS5c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmTwRANS05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter5/LES_Re20000_v061_newModQijnmTwRANS5s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmTwRANS5s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_An05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter5/LES_Re20000_v061_An5s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_An5s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_cafAn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter5/LES_Re20000_v061_cafAn5s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_cafAn5s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter5/LES_Re20000_v061_Gn5s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_Gn5s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter6/LES_Re20000_v061_newModQijnmT6s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT6s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT06c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter6/LES_Re20000_v061_newModQijnmT6c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT6c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061HH_newModQijnmT06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter6/LES_Re20000_v061_newModQijnmT6s_HH/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5HH_newModQijnmT6s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061LH_newModQijnmT06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter6/LES_Re20000_v061_newModQijnmT6s_LH/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5LH_newModQijnmT6s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061refX_newModQijnmT06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter6/LES_Re20000_v061_newModQijnmT6s_refX/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT6s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_An06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter6/LES_Re20000_v061_An6s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_An6s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_cafAn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter6/LES_Re20000_v061_cafAn6s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_cafAn6s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter6/LES_Re20000_v061_Gn6s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_Gn6s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter7/LES_Re20000_v061_newModQijnmT7s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT7s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_newModQijnmT07c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter7/LES_Re20000_v061_newModQijnmT7c/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_newModQijnmT7c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_An07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter7/LES_Re20000_v061_An7s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_An7s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_cafAn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter7/LES_Re20000_v061_cafAn7s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_cafAn7s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv061_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/iter7/LES_Re20000_v061_Gn7s/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_Gn7s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv061_semiDNS' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v061/semiDNS/' ;
        case_filenames          = 'Re20000_M02_v061_H2a2b5_semiDNS' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
    
    
    
    
    
    
    
    
%%

elseif strcmpi(which_case,'LES20000M02_v062_H6a2b5')
    if strcmpi( which_grid , 'LES01b' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter1/LES_Re20000_H6a2b5_LES01b/' ;
        case_filenames          = 'Re20000_M02_H6a2b5_LES01b' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'LES01c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter1/LES_Re20000_H6a2b5_LES01c/' ;
        case_filenames          = 'Re20000_M02_H6a2b5_LES01c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ; 
        
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter2/LES_Re20000_v062_H6a2b5_newModQijnmT02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT02c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter2/LES_Re20000_v062_H6a2b5_newModQijnmT02c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT02c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_An02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter2/LES_Re20000_v062_H6a2b5_An02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter2/LES_Re20000_v062_H6a2b5_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter2/LES_Re20000_v062_H6a2b5_cafAn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_cafAn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn02rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter2/LES_Re20000_v062_H6a2b5_cafAn02s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_cafAn02rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter2/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS02c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter2/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS02c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS02c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
        
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT03c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_newModQijnmT03c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT03c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_newModQijnmT03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS03c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS03c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS03c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT03An' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_newModQijnmT03An/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT03An' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_An03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_An03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_An03rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_An03s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An03rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_cafAn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_cafAn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn03rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter3/LES_Re20000_v062_H6a2b5_cafAn03s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_cafAn03rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT04c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_newModQijnmT04c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_newModQijnmT04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS04c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS04c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS04c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT04An' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_newModQijnmT04An/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT04An' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_An04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_An04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_Gn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_cafAn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn04rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter4/LES_Re20000_v062_H6a2b5_cafAn04s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An04rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT05c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_newModQijnmT05c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT05c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_newModQijnmT05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS05c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS05c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS05c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT05An' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_newModQijnmT05An/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT05An' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_An05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_An05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_cafAn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn05rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter5/LES_Re20000_v062_H6a2b5_cafAn05s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_cafAn05rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT06c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter6/LES_Re20000_v062_H6a2b5_newModQijnmT06c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter6/LES_Re20000_v062_H6a2b5_newModQijnmT06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS06c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter6/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS06c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter6/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT06An' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter6/LES_Re20000_v062_H6a2b5_newModQijnmT06An/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT06An' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_An06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter6/LES_Re20000_v062_H6a2b5_An06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter6/LES_Re20000_v062_H6a2b5_Gn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter6/LES_Re20000_v062_H6a2b5_cafAn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT07c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter7/LES_Re20000_v062_H6a2b5_newModQijnmT07c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT07c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter7/LES_Re20000_v062_H6a2b5_newModQijnmT07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS07c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter7/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS07c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS07c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmTwRANS07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter7/LES_Re20000_v062_H6a2b5_newModQijnmTwRANS07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmTwRANS07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_newModQijnmT07An' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter7/LES_Re20000_v062_H6a2b5_newModQijnmT07An/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_newModQijnmT07An' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_An07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter7/LES_Re20000_v062_H6a2b5_An07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter7/LES_Re20000_v062_H6a2b5_Gn07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_cafAn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter7/LES_Re20000_v062_H6a2b5_cafAn07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_Gn08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter8/LES_Re20000_v062_H6a2b5_Gn08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Gn08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_An08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/iter8/LES_Re20000_v062_H6a2b5_An08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_An08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_semiDNS' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/semiDNS/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_semiDNS' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
    
    
    if strcmpi( which_grid , 'CHv062sd_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/domainSizeStudy/LES_Re20000_v062_H6a2b5_Lx75Lz15_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Lx75Lz15_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062ssd_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062/domainSizeStudy/LES_Re20000_v062_H6a2b5_Lx6Lz1_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    end
    
    
    
    
    
    if strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_noSGSDSM_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_noSGSDSM_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSDSM_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_VremanDSM_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_noSGSDSM_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_noSGSDSM_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSDSM_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_VremanDSM_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_VremanDSM_Gn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_VremanDSM_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_VremanDSM_Gn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_VremanDSM_Gn07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_inconsistent/LES_Re20000_v062_H6a2b5_VremanDSM_Gn08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_VremanDSM_Gn08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    end
    
    
    if strcmpi( which_grid , 'TGT_baseV01' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/intentional/baseV01/' ;
        case_filenames          = 'LES_Re20000_M02_baseV01' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'TGT_baseV02' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/intentional/baseV02/' ;
        case_filenames          = 'LES_Re20000_M02_baseV02' ;
        numVars                 = 6 ;
        dt                      = 1.5 ;
    end
    
%%
elseif strcmpi( which_case ,'LES20000M02_v062_H6a2b5_verification' )
    if strcmpi( which_grid , 'CHv062_mWALE_gVr01s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr01s/' ;
        case_filenames          = 'Re20000_M02_H6a2b5_WALE_Vr01s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_mWALE_gVr02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_WALE_Vr02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_mWALE_gVr03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_WALE_Vr03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_mWALE_gVr04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_WALE_Vr04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_mWALE_gVr05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_WALE_Vr05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_mWALE_gVr05s_refX' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr05s_refX/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_WALE_Vr05s_refX' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_mWALE_gVr06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_WALE_Vr06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_mWALE_gVr07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_WALE_Vr07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_mWALE_gVr08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_WALE/LES_Re20000_v062_H6a2b5_WALE_Vr08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_WALE_Vr08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_mAnEddy_gDSM05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/verification/hybrid_AnEddy/Re20000_M02_v062_H6a2b5_AnEddy_DSM05s' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_AnEddy_C0015_DSM05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    end
    
    
    
%%
elseif strcmpi(which_case,'LES20000M02_v062_H6a2b5_WALE')
    if strcmpi( which_grid , 'CHv062_WALEvol_base1' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEAn_base1' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base_WALEc0.4_An/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEAn04' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEmax_base1' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base_WALEc0.4_max/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEmax04' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEomegaTilde_base1' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base_WALEc0.4_omegaTilde/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEomegaTilde04' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
        
    elseif strcmpi( which_grid , 'CHv062_WALEAn_base1_refX' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refX4_c0.4_An/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEAn04_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEmax_base1_refX' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refX4_c0.4_max/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEmax04_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEomegaTilde_base1_refX' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refX4_c0.4_omegaTilde/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEomegaTilde04_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_WALEAn_base1_refZ' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refZ4_c0.4_An/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEAn04_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEmax_base1_refZ' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refZ4_c0.4_max/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEmax04_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEomegaTilde_base1_refZ' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refZ4_c0.4_omegaTilde/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEomegaTilde04_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
        
        
    elseif strcmpi( which_grid , 'CHv062_WALEvol_base1_refX4' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refX4/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEvol_base1_refZ4' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x112_refZ4/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x112_refZ4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_WALEvol01_base1' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base_WALEc0.1/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.1_72x50x28_base' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEvol02_base1' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base_WALEc0.2/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.2_72x50x28_base' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEvol03_base1' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base_WALEc0.3/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.3_72x50x28_base' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEvol05_base1' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x28_base_WALEc0.5/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.5_72x50x28_base' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_WALEvol03_base1_refX4' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refX4_c0.3/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.3_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEvol03_base1_refZ4' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x112_refZ4_c0.3/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.3_72x50x112_refZ4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_WALEvol05_base1_refX4' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_288x50x28_refX4_c0.5/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.5_288x50x28_refX4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_WALEvol05_base1_refZ4' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/Re20000_M02_v062_Lx6Lz1_WALEvol_72x50x112_refZ4_c0.5/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.5_72x50x112_refZ4' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_WALEvol_base5' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/john/LES_Re20000_M02_baseV04_72x86x36_base/' ;
        case_filenames          = 'Re20000_M02_v062_Lx6Lz1_WALEvol0.3_72x86x28_baseV05' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    end
    
    
    
%%
elseif strcmpi(which_case,'LES20000M02_v062_H6a2b5_vreman')
    if strcmpi( which_grid , 'LES01b_vreman' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_H6a2b5_vreman_LES01b/' ;
        case_filenames          = 'Re20000_M02_H6a2b5_vreman_LES01b' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_LES01b' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_LES01b/' ;
        case_filenames          = 'Re20000_M02_H6a2b5_hyperVreman_LES01b' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_vreman_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_vreman_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_vreman_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_trueVreman_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_trueVreman_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_trueVreman_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGSVreman_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_noSGSVreman_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSVreman_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_vreman_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_vreman_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_vreman_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_trueVreman_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_trueVreman_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_trueVreman_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGSVreman_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_noSGSVreman_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSVreman_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_vreman_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_vreman_Gn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_vreman_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_trueVreman_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_trueVreman_Gn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_trueVreman_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGSVreman_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_noSGSVreman_Gn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSVreman_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_Gn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_vreman_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_vreman_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_vreman_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_trueVreman_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_trueVreman_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_trueVreman_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGSVreman_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_noSGSVreman_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSVreman_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_vreman_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_vreman_Gn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_vreman_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_trueVreman_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_trueVreman_Gn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_trueVreman_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGSVreman_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_noSGSVreman_Gn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSVreman_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_Gn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_vreman_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_vreman_Gn07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_vreman_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_trueVreman_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_trueVreman_Gn07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_trueVreman_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGSVreman_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_noSGSVreman_Gn07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSVreman_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_vreman_Gn08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_vreman_Gn08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_vreman_Gn08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_trueVreman_Gn08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_trueVreman_Gn08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_trueVreman_Gn08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGSVreman_Gn08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_vreman/LES_Re20000_v062_H6a2b5_noSGSVreman_Gn08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGSVreman_Gn08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
    
    if strcmpi( which_grid , 'test_vreman_H2' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/test_H2_vreman/' ;
        case_filenames          = 'Re20000_M02_v062_H2a2b5_vreman_test' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
    if strcmpi( which_grid , 'CHv062_hyperVreman_C002_DSM04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c002_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c002_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C003_DSM04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c003_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c003_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C004_DSM04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c004_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c004_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C005_DSM04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c005_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c005_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C005_DSM04c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c005_DSM04c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c005_DSM04c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C0078125_DSM04s' )
        case_dirName            = '/Volumes/2TB/LES_Re20000_H6a2b5_hyperVreman_c0078125_DSM04s/' ;
%         case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c0078125_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c0078125_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C010_DSM04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c010_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c010_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_DSM04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C015_DSM04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c015_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c015_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    end
    
    
    
    if strcmpi( which_grid , 'hyperVreman_c003_DSM04s' )
        case_dirName            = '/Volumes/2TB/SRS/verification/hyperVreman_c003_DSM04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c003_DSM04s' ;
        numVars                 = 5 ;
        dt                      = 1 ;
    end
    
    
    if strcmpi( which_grid , 'CHv062_hyperVreman_C012_LES01b' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_LES01b/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_LES01b' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn02rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn02s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn03rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn03s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn04rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn04s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn04rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn05rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn05s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn05rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn06rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn06s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn06rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn07rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn07s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn07rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_Gn08rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_H6a2b5_hyperVreman_c012_Gn08s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_Gn08rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C002_Gn07c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/test_LES_Re20000_v062_H6a2b5_hyperVreman_c002_Gn07c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c002_Gn07c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_DSM_Gn07c' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/test_LES_Re20000_v062_H6a2b5_hyperVreman_DSM_Gn07c/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_DSM_Gn07c' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
        
        
        
        
        
    elseif strcmpi( which_grid , 'CHv062_hyperVreman_C012_DSM03f' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_hyperVreman/LES_Re20000_v062_H6a2b5_hyperVreman_c012_DSM03f/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_hyperVreman_c012_DSM03f' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    end
    
    
    
    
    
%%
elseif strcmpi(which_case,'LES20000M02_v062_H6a2b5_noSGS')
    if strcmpi( which_grid , 'LES01b_noSGS' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_LES01b/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_LES01b' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGS_Gn02s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_Gn02s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_Gn02s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGS_Gn03s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_Gn03s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_Gn03s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGS_Gn04s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_Gn04s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_Gn04s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGS_Gn05s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_Gn05s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_Gn05s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGS_Gn06s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_Gn06s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_Gn06s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGS_Gn07s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_Gn07s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_Gn07s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGS_Gn08s' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_Gn08s/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_Gn08s' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'CHv062_noSGS_Gn08rs' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v062_noSGS/LES_Re20000_v062_H6a2b5_noSGS_Gn08s_rev/' ;
        case_filenames          = 'Re20000_M02_v062_H6a2b5_noSGS_Gn08rs' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    end
    
    
    
    
    
    
    
%%
elseif strcmpi(which_case,'LES20000M02_v040_H2')
    if strcmpi( which_grid , 'LES01bf' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v040/iter1/LES_Re20000_LES01bf' ;
        case_filenames          = 'Re20000_M02_LES1bf' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'LES01cf' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v040/iter1/LES_Re20000_LES01cf' ;
        case_filenames          = 'Re20000_M02_LES1bf' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
        
    elseif strcmpi( which_grid , 'smQij02sf_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v040/iter2/LES_Re20000_H2a3_smQij2sf' ;
        case_filenames          = 'Re20000_M02_H2a3_smQij2sf' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
    elseif strcmpi( which_grid , 'smQij02cf_H2a3' )
        case_dirName            = '/Volumes/4TB/Channel/hybrid/algorithm_v040/iter2/LES_Re20000_H2a3_smQij2cf' ;
        case_filenames          = 'Re20000_M02_H2a3_smQij2cf' ;
        numVars                 = 5 ;
        dt                      = 1.5 ;
        
    end
    
%%    
elseif strcmpi(which_case,'LES20000_v020')
    if which_grid==40*16*12
        case_dirName            = '/Volumes/4TB/Channel/OpenFOAM/Re590_v010/LES_01c' ;
        case_filenames          = 'Channel590_LES01c' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    elseif which_grid==50*20*15
        case_dirName            = '/Volumes/4TB/Channel/OpenFOAM/Re590_v010/LES_01b' ;
        case_filenames          = 'Channel590_LES01b' ;
        numVars                 = 5 ;
        dt                      = 2.5 ;
    end
        
end

%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
if strcmpi(same_folder,'yes')
    case_dirName = './' ;
end
