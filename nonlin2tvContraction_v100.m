function RklVl = nonlin2tvContraction_v100( smoothModRij_wholeDomain_ZTMean_Vec , gradRsij )

for i=1:3
    RklVl(:,i) =  sum( ...
        smoothModRij_wholeDomain_ZTMean_Vec(:,(1:3)+(i-1)*3) .*  gradRsij ...
        , 2 ) ;
end