function Omega = Vorticity_v100( DVars_Dx , DVars_Dy , DVars_Dz )

Omega(:,1) = DVars_Dy(:,3) - DVars_Dz(:,2) ;
Omega(:,2) = DVars_Dz(:,1) - DVars_Dx(:,3) ;
Omega(:,3) = DVars_Dx(:,2) - DVars_Dy(:,1) ;
