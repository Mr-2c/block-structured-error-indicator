function SikTkj = SikTkj_contraction_v100b1(Sij,Tij)

Sij = Sij(:,[1 2 3 2 4 5 3 5 6]);
Tij = Tij(:,[1 2 3 2 4 5 3 5 6]);

SikTkj = zeros( length(Sij) , 9 ) ;
for i=1:3
    I = (i-1)*3 + [1 2 3] ;
    for j=1:3
        J = j:3:9;
        
        SikTkj(:,(i-1)*3+j) = sum(Sij(:,I) .* Tij(:,J) , 2 ) ;
    end
end

SikTkj = SikTkj(:,[1 2 3 5 6 9]);