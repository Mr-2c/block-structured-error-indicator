function SijLpfX_contracted_upstream = SijSecondInvarient_v100( SijLpfX_upstream )

%%
SijLpfX_contracted_upstream = ...
    SijLpfX_upstream(:,1) .* SijLpfX_upstream(:,4) + ...
    SijLpfX_upstream(:,1) .* SijLpfX_upstream(:,6) + ...
    SijLpfX_upstream(:,4) .* SijLpfX_upstream(:,6) - ...
    SijLpfX_upstream(:,2).^2 - SijLpfX_upstream(:,3).^2 - SijLpfX_upstream(:,5).^2 ;