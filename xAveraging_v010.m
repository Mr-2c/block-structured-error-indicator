%% consistent with R2016b+

function Vars_XZTMean_minorBatches_Vec = xAveraging_v010(Vars_ZTMean_minorBatches_Vec,IndX_averagable_up,numMinorBatch)

%%
Vars_XZTMean_minorBatches_Vec = ...
    zeros( size( Vars_ZTMean_minorBatches_Vec) );

%%
for j=1:numMinorBatch
    for i=1:length(IndX_averagable_up)
        Vars_XZTMean_minorBatches_Vec(IndX_averagable_up{i},:,j) = ...
            mean( Vars_ZTMean_minorBatches_Vec(IndX_averagable_up{i},:,j) , 1) .* ...
            ones( length(IndX_averagable_up{i}) , size(Vars_XZTMean_minorBatches_Vec,2) , 1 ) ;        
    end
end