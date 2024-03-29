function [ EintRef_tot , epsTotal_ref ] = ...
couldYouPleaseComputeErrorForAnyMsnapshots_v02p( ...
    theFile , mSnaps , totalSnaps , p_Lp , ...
    Qref_upstream_interp , Qref_downstream_interp , cfRef_up_interp , cfRef_down_interp , cpRef_up_interp , cpRef_down_interp , ...
    X_up_int,Y_up_int , X_down_int,Y_down_int , ...
    Qbar_ref , xyArea_up , xyArea_down , Lx_up,Lx_down )

%%
load( theFile , ...
    'Vars_wholeDomain_ZTMean_minorBatches_Vec' , 'modRS_wholeDomain_ZTMean_minorBatches_Vec' , ...
    'XY_averagable_all'  , ...
    'fluid_*' , 'which_*' )

%%
[   ~ , ~ , ~ , ~ , ...
    ~ , ~ , x_Pref , ~ ] = ...
    caseSpecificDomainFluidValues_v100( which_case );

%%
Q_up_full = cat( 2 , Vars_wholeDomain_ZTMean_minorBatches_Vec(:,[1:2,4],:) , modRS_wholeDomain_ZTMean_minorBatches_Vec(:,1:4,:) ) ;
clear Vars_wholeDomain_ZTMean_minorBatches_Vec modRS_wholeDomain_ZTMean_minorBatches_Vec

if totalSnaps > size(Q_up_full,3)
% totalSnaps = min( size(Q_up_full,3) , 800 ) ;
    error('you picked more snapshots than what you had')
end

for mm=1:length(mSnaps)
    
    mHere       = mSnaps(mm) ;
    numBatches  = floor(totalSnaps/mHere) ;
     
    disp(['averaging over ' , num2str(mHere) , ' snapshots. there are a total of ' , num2str(numBatches) , ' samples.' ])
    
    %%
    Q_up  = permute( mean( reshape( Q_up_full(:,:,1:(numBatches*mHere)) , size(Q_up_full,1),size(Q_up_full,2),mHere,[]) , 3 ) , [1 2 4 3] ) ;

    %%
    for j=1:size(Q_up,3)
        
        disp(['doing sample ' , num2str(j) , ' of a total of ' , num2str(numBatches) , ' samples...'])

        [ Q_upstream_interp , Q_downstream_interp , BL_cf_interp,DN_cf_interp , BL_cp_interp,DN_cp_interp ] = ...
    returnInterpErrorComputationStuff_v01( ...
        Q_up(:,:,j) , ...
        XY_averagable_all , X_up_int,Y_up_int , X_down_int,Y_down_int , ...
        which_code , which_case , fluid_nu , x_Pref ) ;

        [ EintRef_tot{mm}(j,:) , epsTotal_ref{mm}(j,1) ]= ...
    computeBFSErrors_v02p( ...
        p_Lp , ...
        Qref_upstream_interp , Qref_downstream_interp , cfRef_up_interp , cfRef_down_interp , cpRef_up_interp , cpRef_down_interp , ...
        Q_upstream_interp , Q_downstream_interp , BL_cf_interp , DN_cf_interp , BL_cp_interp , DN_cp_interp , ...
        Qbar_ref , xyArea_up , xyArea_down , Lx_up,Lx_down , ...
        X_up_int , Y_up_int , X_down_int , Y_down_int ) ;
    
    end
    
end


