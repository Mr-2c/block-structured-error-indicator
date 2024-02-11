function TikTjk = nonlin2ttC_tmp_v100(T)

TikTjk = sum( T(:,[1,1,1 , 2,2 , 3],:) .* T(:,[1,2,3 , 2,3 , 3],:) , 3 ) ;