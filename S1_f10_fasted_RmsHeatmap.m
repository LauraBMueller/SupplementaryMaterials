%% RMS and Heatmap for all trials under one condition (MVC and metabolic state identical)
% Input from PreprocessingAndExplorationSubject1fasted or peak

% Doesnt work, why????
%% Identify Bad Channels
% Load your data (assuming 128x3 for three trials)
% Input Paramters
data = rms_f10_fasted;
filename = 'rms_f10_fasted';
displayFlag = 1;
thresholdNaN = 0; % Set as 0 to allow no NaNs
thresholdRange = [0.01, 1000]; % Range of valid data values
ElChannelMapGrid1 = [1 25 26 51 52; 1 24 27 50 53; 2 23 28 49 54; 3 22 29 48 55; 4 21 30 47 56; 5 20 31 46 57; 6 19 32 45 58; 7 18 33 44 59; 8 17 34 43 60; 9 16 35 42 61; 10 15 36 41 62; 11 14 37 40 63; 12 13 38 39 64];
ElChannelMapGrid2 = [65 77 90 103 116; 65 78 91 104 117; 66 79 92 105 118; 67 80 93 106 119; 68 81 94 107 120; 69 82 95 108 121; 70 83 96 109 122; 71 84 97 110 123; 72 85 98 111 124; 73 86 99 112 125; 74 87 100 113 126; 75 88 101 114 127; 76 89 102 115 128];

% Identify bad channels across trials
[badChannelsGrid1, badChannelsGrid2] = identifyBadChannelsMultiTrial(data, thresholdNaN, thresholdRange, displayFlag, filename);
%% Map Data to Channel Grids
data = rms_f10_fasted(1:64);
ElChannelMap = ElChannelMapGrid1;
gridRows = 13;
gridCols = 5;
gridData = mapDataToGrid(data, ElChannelMap, gridRows, gridCols);
disp(gridData)
%% Interploate dead channels for Grid 1 
interpolatedDataGrid1 = interpolateBadChannelsV3(data(1:64), ElChannelMapGrid1, badChannelsGrid1);
disp(interpolatedDataGrid1)
%% Interploate dead Channels for Grid 2
% %%
% data = rms_f10_fasted;
% filename = 'rms_f10_fasted';
% displayFlag = 1;
% thresholdNaN = 0; % Set as 0 to allow no NaNs
% thresholdRange = [0.01, 1000]; % Range of valid data values
% ElChannelMapGrid1 = [1 25 26 51 52; 1 24 27 50 53; 2 23 28 49 54; 3 22 29 48 55; 4 21 30 47 56; 5 20 31 46 57; 6 19 32 45 58; 7 18 33 44 59; 8 17 34 43 60; 9 16 35 42 61; 10 15 36 41 62; 11 14 37 40 63; 12 13 38 39 64];
% ElChannelMapGrid2 = [65 77 90 103 116; 65 78 91 104 117; 66 79 92 105 118; 67 80 93 106 119; 68 81 94 107 120; 69 82 95 108 121; 70 83 96 109 122; 71 84 97 110 123; 72 85 98 111 124; 73 86 99 112 125; 74 87 100 113 126; 75 88 101 114 127; 76 89 102 115 128];
% gridData = mapDataToGrid(data, ElChannelMap, gridRows, gridCols);
%% Create Heatmap for Grid 1
ElChannelMap = ElChannelMapGrid1;
rms = gridData(1:64);
badChan = badChannelsGrid1;
plotFlag = 1;

[outputArray, h] = rmsHeatMapV3(ElChannelMap, rms, badChan, plotFlag);