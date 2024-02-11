function f = BL_finder_v100(Y,U,Uinf,ratio)

ia = sum( U <= ratio*Uinf ) ;

a = Y(ia) ;
b = Y(ia+1) ;

fa = U(ia)-ratio*Uinf ;
fb = U(ia+1)-ratio*Uinf ;

f = (a*fb-b*fa)/(fb-fa) ;