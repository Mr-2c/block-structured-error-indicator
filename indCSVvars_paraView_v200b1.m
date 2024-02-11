function [ indVars , indPoints , indVarsMean , indRS ] = indCSVvars_paraView_v200b1(csvHeader)

[ ~ , iu , ~ ]  = intersect( csvHeader , 'U:0' ) ;
[ ~ , iv , ~ ]  = intersect( csvHeader , 'U:1' ) ;
[ ~ , iw , ~ ]  = intersect( csvHeader , 'U:2' ) ;
[ ~ , ip , ~ ]  = intersect( csvHeader , 'p' ) ;
[ ~ , inu , ~ ] = intersect( csvHeader , 'nuSgs' ) ;

%%
[ ~ , ium , ~ ]     = intersect( csvHeader , 'UMean:0' ) ;
[ ~ , ivm , ~ ]     = intersect( csvHeader , 'UMean:1' ) ;
[ ~ , iwm , ~ ]     = intersect( csvHeader , 'UMean:2' ) ;
[ ~ , ipm , ~ ]     = intersect( csvHeader , 'pMean'   ) ;
[ ~ , inum , ~ ]    = intersect( csvHeader , 'nuSgs'   ) ;


[ ~ , irs11 , ~ ]   = intersect( csvHeader , 'UPrime2Mean:0' ) ;
[ ~ , irs22 , ~ ]   = intersect( csvHeader , 'UPrime2Mean:1' ) ;
[ ~ , irs33 , ~ ]   = intersect( csvHeader , 'UPrime2Mean:2' ) ;
[ ~ , irs12 , ~ ]   = intersect( csvHeader , 'UPrime2Mean:3' ) ;
[ ~ , irs23 , ~ ]   = intersect( csvHeader , 'UPrime2Mean:4' ) ;
[ ~ , irs13 , ~ ]   = intersect( csvHeader , 'UPrime2Mean:5' ) ;

%%
[ ~ , ix , ~ ]  = intersect( csvHeader , 'ccx' ) ;
[ ~ , iy , ~ ]  = intersect( csvHeader , 'ccy' ) ;
[ ~ , iz , ~ ]  = intersect( csvHeader , 'ccz' ) ;

%%
indVars         = [iu,iv,iw,ip,inu] ;
indPoints       = [ix,iy,iz] ;
indVarsMean     = [ium,ivm,iwm,ipm] ;
indRS           = [irs11,irs22,irs33,irs12,irs13,irs23] ;
