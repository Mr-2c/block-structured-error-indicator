function RStemp = RStempOriginal_v100(UVW)

%%
RStemp(:,1:3) = UVW.^2;
RStemp(:,4:6) = UVW(:,[1,1,2]) .* UVW(:,[2,3,3]) ;