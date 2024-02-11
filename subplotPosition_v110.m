function subplotPosition = subplotPosition_v110( Nrows , Ncolumns , n , withTitle )
% subplotPosition_v120
if nargin<4 || ~strcmpi(withTitle,'yes')
    withTitle = 'no' ;
end

%%
xPositionIncrement = (.98-.01*Ncolumns)/Ncolumns;
yPositionIncrement = (.9-.01*Nrows)/Nrows ;

if strcmpi(withTitle,'yes')
    yLength = .75*yPositionIncrement;
else 
    yLength = yPositionIncrement;
end

%%
whichRow        = ceil( n / Ncolumns ) ; 
whichColumn     = n - Ncolumns * (whichRow-1) ;

%%
y = ( Nrows - whichRow ) * yPositionIncrement + ( Nrows - whichRow ) * .01 + .01 ;
x = ( whichColumn -1 ) * xPositionIncrement + ( whichColumn ) * .01 ;

%%
subplotPosition = [ x y xPositionIncrement yLength ] ;