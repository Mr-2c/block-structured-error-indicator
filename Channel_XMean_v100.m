%% compatible with MATLAB R2016b+

function F = Channel_XMean_v100(F , dim)

Fmean = mean( F , dim );

F = Fmean .* ones( size(F) ) ;