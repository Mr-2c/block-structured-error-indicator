function [dX,Xb] = dX_v100(X)

Xb = ( X(2:end) + X(1:end-1) ) / 2 ;
Xb = [ X(1)-(Xb(1)-X(1)) ; Xb ; X(end)+(X(end)-Xb(end)) ] ;
dX = Xb(2:end) - Xb(1:end-1) ;
