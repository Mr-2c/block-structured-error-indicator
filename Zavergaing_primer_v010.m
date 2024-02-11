function [XY_averagable,IndZ_averagable] = Zavergaing_primer_v010(XYZ_available,XYZVector2Matrix, X,Y , Nz_averagable)

%%
XYZ_available_sum = sum(XYZ_available,3) ;

%%
Ind_XY_averagable = XYZ_available_sum > Nz_averagable ;

%%
k=0;
XY_averagable = zeros( sum(sum(Ind_XY_averagable)) , 2 );
for i=1:size(Ind_XY_averagable,1)
    for j=1:size(Ind_XY_averagable,2)
        if Ind_XY_averagable(i,j)
            k=k+1;
            XY_averagable(k,1) = X(i) ;
            XY_averagable(k,2) = Y(j) ;
            IndZ_averagable{k,1} = reshape( permute( XYZVector2Matrix( i , j , XYZ_available(i,j,:) ) ,[3 2 1]) ,[],1) ;
        end
    end
end
