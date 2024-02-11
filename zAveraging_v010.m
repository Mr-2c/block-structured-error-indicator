function Vars_ZTMean_minorBatches_Vec = zAveraging_v010(Vars_TMean_minorBatches_Vec,IndZ_averagable_up,numMinorBatch)

Vars_ZTMean_minorBatches_Vec = ...
    zeros(length(IndZ_averagable_up) , size(Vars_TMean_minorBatches_Vec,2) , numMinorBatch);
for j=1:numMinorBatch
    for i=1:length(IndZ_averagable_up)
        Vars_ZTMean_minorBatches_Vec(i,:,j) = ...
            mean( Vars_TMean_minorBatches_Vec(IndZ_averagable_up{i},:,j) , 1);        
    end
end