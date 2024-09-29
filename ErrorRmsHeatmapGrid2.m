%% Error Exploration RMS Heatmap for Grid 2
%% Identify Bad Channels
% Load your data (assuming 128x3 for three trials)
% Input Paramters
    % Data
    data = rms_f10_peak;
    filename = 'rms_f10_peak';
    biceps = data(1:64);
    triceps = data(65:128);
    
    % Plot Settings
    displayFlag = 1;
    thresholdNaN = 0; % Set as 0 to allow no NaNs
    thresholdRange = [0.1, 1000]; % Range of valid data values
    ElChannelMap = [1 25 26 51 52; 1 24 27 50 53; 2 23 28 49 54; 3 22 29 48 55; 4 21 30 47 56; 5 20 31 46 57; 6 19 32 45 58; 7 18 33 44 59; 8 17 34 43 60; 9 16 35 42 61; 10 15 36 41 62; 11 14 37 40 63; 12 13 38 39 64];
    
% Identify bad channels across trials
[badChannelsGrid1, badChannelsGrid2] = identifyBadChannelsMultiTrial(data, thresholdNaN, thresholdRange, displayFlag, filename);

%% Grid 2 % doesn't work, displays 'index exceeds the number of array elements'

% Map Data to Channel Grid 2
%data = Grid2;
gridRows = 13;
gridCols = 5;
gridData = mapDataToGrid(triceps, ElChannelMap, gridRows, gridCols);
disp(gridData)
%%
% Interploate dead channels for Grid 2 
interpolatedDataGrid2 = interpolateBadChannelsV4(gridData, ElChannelMap, badChannelsGrid2);
disp(interpolatedDataGrid2)
%%
% Create Heatmap for Grid 2

%plotFlag = 1;

[outputArray, h] = rmsHeatMapTriceps(ElChannelMap, rms, badChannelsGrid2, true);

