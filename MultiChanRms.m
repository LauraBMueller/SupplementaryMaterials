%% Mutli Trial rms Heatmap for one condition
% Add paths to all folders to script
% Add paths to all folders to script

addpath(genpath("Data/"));
addpath(genpath("Figures/"));
addpath(genpath("Live Scripts/"));
addpath(genpath("MetaMuscle Functions/"));

% Inputs
% rmss column vector (size must be 128x3) for one condition and one
% metabolic state, calculated in 
rms_condition = rms_f30_peak;
% Channel map for each grid
ElChannelMapGrid1 = [1 25 26 51 52; % EMG Grid for Biceps brachii, short head
                    1 24 27 50 53; 
                    2 23 28 49 54; 
                    3 22 29 48 55; 
                    4 21 30 47 56; 
                    5 20 31 46 57; 
                    6 19 32 45 58; 
                    7 18 33 44 59; 
                    8 17 34 43 60; 
                    9 16 35 42 61; 
                    10 15 36 41 62; 
                    11 14 37 40 63; 
                    12 13 38 39 64];

ElChannelMapGrid2 = [65 77 90 103 116; % EMG Grid for Triceps brachii, lateral head 
                    65 78 91 104 117; 
                    66 79 92 105 118; 
                    67 80 93 106 119; 
                    68 81 94 107 120; 
                    69 82 95 108 121; 
                    70 83 96 109 122; 
                    71 84 97 110 123; 
                    72 85 98 111 124; 
                    73 86 99 112 125; 
                    74 87 100 113 126; 
                    75 88 101 114 127; 
                    76 89 102 115 128];
% Bad channels (for both grids)
badChan = [5, 13, 14, 23, 47, 54, 65, 66, 72, 79, 82, 88, 98, 114, 125, 126, 127, 128]
% Plotflag (True = plot heatmap)
plotFlag = 1;

% Output
[outputArray, h] = multiTrialRmsHeatMap(rms_condition, badChan, plotFlag)