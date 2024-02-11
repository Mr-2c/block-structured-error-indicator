function XYZ = grid_filterer_first_v100( XYZ , Nmin )

Nx_min = Nmin(2) * Nmin(3) ;
Ny_min = Nmin(1) * Nmin(3) ;
Nz_min = Nmin(1) * Nmin(2) ;

%%
X = unique(XYZ(:,1));
Y = unique(XYZ(:,2));
Z = unique(XYZ(:,3));

%%
[~,X_up_b] = dX_v100(X);
[~,Y_up_b] = dX_v100(Y);
[~,Z_up_b] = dX_v100(Z);
Nx_planes = histcounts(XYZ(:,1),X_up_b);
Ny_planes = histcounts(XYZ(:,2),Y_up_b);
Nz_planes = histcounts(XYZ(:,3),Z_up_b);
Z_drop = Z(Nz_planes<Nz_min);
X_drop = X(Nx_planes<Nx_min);
Y_drop = Y(Ny_planes<Ny_min);

%%
Idrop = false(length(XYZ(:,1)),1);
for i=1:length(X_drop)
    Idrop = Idrop | XYZ(:,1) == X_drop(i) ;
end
for i=1:length(Y_drop)
    Idrop = Idrop | XYZ(:,2) == Y_drop(i) ;
end
for i=1:length(Z_drop)
    Idrop = Idrop | XYZ(:,3) == Z_drop(i) ;
end
sum(Idrop)

%%
XYZ(Idrop,:) = [];

%%
XYZ = sortrows(XYZ,[1 2 3]);