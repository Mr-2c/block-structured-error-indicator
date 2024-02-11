function IndX_averagable = Xavergaing_primer_v010(XY_available,XYVector2Matrix , Nx_averagable)

%%
XY_available_sum = sum(XY_available,1) ;
XY_available_sum = permute(XY_available_sum , [2 1]) ;

%%
Ind_Y_averagable = XY_available_sum > Nx_averagable ;

%%
k=0;
% YZ_averagable = zeros( sum(sum(sum(Ind_XY_averagable))) , 2 );
for i=1:length(Ind_Y_averagable)
%     for j=1:size(Ind_Y_averagable,2)
        if Ind_Y_averagable(i)
            k=k+1;
%             YZ_averagable(k,1) = Y(i) ;
%             YZ_averagable(k,2) = Z(j) ;
            IndX_averagable{k,1} = reshape( XYVector2Matrix( XY_available(:,i) , i ) ,[],1) ;
        end
%     end
end