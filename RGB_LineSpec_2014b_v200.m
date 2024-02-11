%% Line-type, color, and color-type combinations
% LineSpec: line (e.g. '-') or symbol (e.g. 's') styles
% Color: RGB color output
% Line_Color_Comb: line-style color combinations, e.g. '--k'

function [ LineSpec , Marker , Color , Line_Color_Comb , Color_names , Line_names ] = RGB_LineSpec_2014b_v200()

%%
if nargout >= 1
LineSpec = {'-';'--';'-.';':'};
end

%%
if nargout >= 2
Marker = {'none';'o';'+';'*';'^';'s';'d';'x';'v';'<';'>'};
end

%%
if nargout >= 3
Color = [ [0,0,0];
          [0,0,.8];
          [0,0,1];
          [.5 0 1];
          [1,.4118,.7059] ;
          [1 0 0];
          [0,.7,0];
          
          
          [.75,.75,0];
          
          [.85,.7,.1];
          [.498,1,.8314] ;
          
          
          [1,0,0];
          [0,1,0];
          
          
          
          
          
          
          
          
          
          
          
          
          [.75,0,.75];
          [0,.75,.75];
          [.95,.87,.73] ];
      
end

%%
Color_comb = [ 'k' , 'b' , 'g' , 'r' , 'm' , 'y' , 'c' ] ;

if nargout >= 4
    
    for i = 1 : length(Color_comb)
        for j = 1 : length(LineSpec)
            Line_Color_Comb{i,j} = [ LineSpec{j} , Color_comb(i) ] ;
        end
    end
end

%%
Color_names = { 'Black' ; 'Blue' ; 'Green' ; 'Dark Blue' ; 'Dark Green' ; 'Pink' ; 'Red' ; 'Aqua marine' ; 'Olive' ; 'Blah2' ; 'Blah3' } ;
Line_names = { 'Solid line' ; 'Dashed line' ; 'Dashed-dotted line' ; 'Dotted line' ;...
    'Solid line with circles' ; 'Dashed line with circles' ; 'Dashed-dotted line with circles' ; 'Dotted line with circles' ; ...
    'Solid line with plus signs' ; 'Dashed line with plus signs' ; 'Dashed-dotted line with plus signs' ; 'Dotted line with plus signs' ; ...
    'Solid line with stars' ; 'Dashed line with stars' ; 'Dashed-dotted line with stars' ; 'Dotted line with stars' } ;