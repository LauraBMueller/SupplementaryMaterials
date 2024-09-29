%% Version 2: Preprocessing and Exploration Subject 1, peak BGL conditions
% Add paths to all folders to script
addpath("Data/");
addpath("Figures/");
addpath("Live Scripts/");
addpath("MetaMuscle Functions/");

% Get all .mat files in the specified folder
%dataFolder = "/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/";
%matFiles = dir(fullfile(dataFolder, '*.mat'));

% Create a cell array to hold the full paths of the files
%fileNames = fullfile({matFiles.folder}, {matFiles.name});

% Process and save data
%processAndSaveData(fileNames);

%% Mean for each VC level
% VC Level at 10% MVC

% Trial 7
% Preprocessing and Inital Exploration
filename = "S1_f10_t7_s2.mat";
load(filename);
displayFlag = false;
rms_t7 = processAndSaveDataV3(filename,displayFlag);
disp(rms_t7)

% Trial 9
% Preprocessing and Inital Exploration
filename = "S1_f10_t9_s2.mat";
load(filename);
displayFlag = false;
rms_t9 = processAndSaveDataV3(filename,displayFlag);
disp(rms_t9)

% Trial 11
% Preprocessing and Inital Exploration
filename = "S1_f10_t11_s2.mat";
load(filename);
displayFlag = false;
rms_t11 = processAndSaveDataV3(filename,displayFlag);
disp(rms_t11)

%% Mean of all Trials at 10 % MVC in peak state
rms_f10_peak = [rms_t7, rms_t9, rms_t11];

% Means for each column (per grid pair)
mean_rms_f10_peak = mean(rms_f10_peak);
disp(mean_rms_f10_peak);

% Thresholds for excluding bad channels
% thresholdNaN = 0; % Set to 0 to allow no NaNs
% thresholdRange = [0.01, 1000]; % Range of valid data values
% thresholdVariance = 1000; % Threshold for variance

% Means for each row (means per channel per condition), includes interpolation and cleaning of
% each grid to get rid of bad channels accoring to threshholds set above
% Channel maps for each grid
    % EMG Grid for Biceps brachii, short head
    ElChannelMapGrid1 = [1 25 26 51 52; 
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
    % EMG Grid for Triceps brachii, lateral head 
    ElChannelMapGrid2 = [65 77 90 103 116; 
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

% Specify Variables
data = rms_f10_peak;
dataGrid1 = data(1:64);
dataGrid2 = data(65:128);

% Calculate row-wise mean RMS, excluding all bad channels
rowWiseMean = calculateRowWiseMean(data, ElChannelMapGrid1, ElChannelMapGrid2);

%%
%rowMeans = mean(rms_f10_peak, 2);
%disp(rowMeans);

% Plots of all Trials at 10 % MVC in peak state

% Multichannel Frequency Vector for mean RMS for Subject 1 at 10% MVC and
% in fasted state

% Raw EMG and Force Data combined into a single plot
fileNames = {"/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f10_t7_s2.mat","/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f10_t9_s2.mat","/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f10_t11_s2.mat"};
plotMultipleFiles(fileNames); 

%% Plot mean RMS values

% Define channel numbers and arrays
channels = 1:128;
array1 = rms_t7; 
array2 = rms_t9; 
array3 = rms_t11; 

% Define the parameters for the plot title
MVC = 10;
state = 'Peak';
subject = 'Subject 1';

% Call the custom function to plot the arrays against the channels
plotMeanRms(channels, array1, array2, array3, MVC, state, subject);

%% Generate a new array to add channels to rms_f10_peak

% Generate the channel values from 1 to 128
channels = (1:128)';

% Combine the channel values with the 128x3 array
rms_f10_peak_channels = [channels, rms_f10_peak];

% Display the new array
disp(rms_f10_peak_channels);

% Plot the new array
% Define the parameters for the plot title
MVC = 10;
state = 'Peak';
subject = 'Subject 1';
% Call the custom function to plot the array with channels
plotMeanRmsWithChannels(rms_f10_peak_channels, MVC, state, subject);

%% Multichannel Frequency Vector using Means
% plotMultichannelFreqSpectrumMultipleFiles(fileNames, filteredsignal_filename, fs);

%% VC Level at 30% MVC

% Trial 8
load("/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t8_s2.mat");
% Preprocessing and Inital Exploration
filename = "/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t8_s2.mat";
rms_t8 = processAndSaveData2(filename);
disp(rms_t8)

% Trial 10
load("/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t10_s2.mat");
% Preprocessing and Inital Exploration
filename = "/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t10_s2.mat";
rms_t10 = processAndSaveData2(filename);
disp(rms_t10)

% Trial 12
load("/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t12_s2.mat");
% Preprocessing and Inital Exploration
filename = "/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t12_s2.mat";
rms_t12 = processAndSaveData2(filename);
disp(rms_t12)

%% Mean of all Trials at 30 % MVC in peak state
rms_f30_peak = [rms_t8, rms_t10, rms_t12];

% Means for each column (=grid pair)
mean_rms_f30_peak = mean(rms_f30_peak);
disp(mean_rms_f30_peak);

% Means for each row (=channel)
rowMeans = mean(rms_f30_peak, 2);
disp(rowMeans);

% Plots of all Trials at 30% MVC in peak state

% Raw EMG and Force Data combined into a single plot
fileNames = {"/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t8_s2.mat", "/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t10_s2.mat", "/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f30_t12_s2.mat"};
plotMultipleFiles(fileNames); 
%% 
%