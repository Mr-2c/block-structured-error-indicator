function [ Vars , meanVars , RS , XYZ , iXYZ ] = importCSV_ParaView_UPNUsnapshots_wXYZ_cellCenter_v200b1(filename,iXYZ)

%%
csvHeader               = importCSVheader_ParaView_MeanFields_v100b1(filename) ;
[ indVars , indPoints , indVarsMean , indRS ] = indCSVvars_paraView_v200b1(csvHeader) ;

if length(indVars) <5
    warning('Flawed snapshop: not enough instananeous fileds! Skipped...')
    Vars    = [];
    return
end

%% 
if nargin<2
    warning('Point indeces are not assigned in function input! Returning empty...')
    iXYZ = [] ;
end

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Create output variable)
testCaseLES04fcellCenter20 = [dataArray{1:end-1}];

%% droping column containing NaNs (resulting from less number of columns than 10 which is default)
NpointsExported = length(testCaseLES04fcellCenter20) ;
numNans = sum( isnan( testCaseLES04fcellCenter20) ,1 ) ;

testCaseLES04fcellCenter20( : , numNans > .1*NpointsExported ) = [];

%%
if ~isempty(iXYZ) && ( max(iXYZ) > NpointsExported )
    Vars    = [];
    warning('the entered index does not match the snapshot! could be a result of inclomplete export by paraView. returning empty for all variable!')
    return
end

%%
if isempty(iXYZ)
    [ XYZ , iXYZ , ~ ] = unique(testCaseLES04fcellCenter20(:,indPoints) , 'rows' , 'stable') ;
else
    XYZ = testCaseLES04fcellCenter20(:,indPoints) ;
    if ~isempty(indPoints)
        disp('did not recompute xyz data, although there is data available.')
    end
end

Vars        = testCaseLES04fcellCenter20(iXYZ,indVars) ;
meanVars    = testCaseLES04fcellCenter20(iXYZ,indVarsMean) ;
RS          = testCaseLES04fcellCenter20(iXYZ,indRS) ;
