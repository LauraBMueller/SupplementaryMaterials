%% Preprocessing and Exploration Subject 1, dip BGL conditions
% Add paths to all folders to script

addpath(genpath("Data/"));
addpath(genpath("Figures/"));
addpath(genpath("Live Scripts/"));
addpath(genpath("MetaMuscle Functions/"));
addpath(genpath("RMS/"));
addpath(genpath("DataCleaningExploration"));
%%
% Get all .mat files in the specified folder
dataFolder = "/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/";
matFiles = dir(fullfile(dataFolder, '*.mat'));

% Create a cell array to hold the full paths of the files
fileNames = fullfile({matFiles.folder}, {matFiles.name});
%fileNames = {'/Users/laurabmueller/MATLAB-Drive/Data/S1_20240724/S1_f10_t1_s1.mat','S1_f10_t3_s1.mat','S1_f10_t5_s1.mat','S1_f30_t2_s1.mat','S1_f30_t4_s1.mat','S1_f30_t6_s1.mat'};
displayFlag = false;
processAndSaveDataV3(fileNames,displayFlag)
%% Mean for each VC level
% VC Level at 10% MVC
    % Trial 13
    % Preprocessing and Inital Exploration
    filename = "S1_f10_t13_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t13 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t13)
    
    % Trial 14
    % Preprocessing and Inital Exploration
    filename = "S1_f10_t14_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t14 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t14)
    
    % Trial 15
    % Preprocessing and Inital Exploration
    filename = "S1_f10_t15_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t15 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t15)

%% Mean of all Trials at 10 % MVC in fasted state

rms_f10_dip = [rms_t13, rms_t14, rms_t15];

% Means for each column (=grid pair)
mean_rms_f10_dip = mean(rms_f10_dip);
disp(mean_rms_f10_dip);

% Means for each row (=channel)
rowMeans = mean(rms_f10_dip, 2);
disp(rowMeans);
% Plots

% Multichannel Frequency Vector for mean RMS for Subject 1 at 10% MVC and
% in fasted state
%% 
% Raw EMG and Force Data combined into a single plot

fileNames = {'S1_f10_t13_s3.mat', 'S1_f10_14_s3.mat', 'S1_f10_t15_s3.mat'};
plotMultipleFiles(fileNames); 
%% Plot mean RMSS values

% Define channel numbers and arrays
channels = 1:128;
array1 = rms_t13; 
array2 = rms_t14; 
array3 = rms_t15; 

% Define the parameters for the plot title
MVC = 10;
state = 'dip';
subject = 'Subject 1';

% Call the custom function to plot the arrays against the channels
plotMeanRms(channels, array1, array2, array3, MVC, state, subject);
%% 
% Generate a new array to add channels to rms_f10_dip

% Generate the channel values from 1 to 128
channels = (1:128)';

% Combine the channel values with the 128x3 array
rms_f10_dip_channels = [channels, rms_f10_dip];

% Display the new array
disp(rms_f10_dip_channels);
%% 
% Plot the new array

% Define the parameters for the plot title
MVC = 10;
state = 'dip';
subject = 'Subject 1';

% Call the custom function to plot the array with channels
plotMeanRmsWithChannels(rms_f10_dip_channels, MVC, state, subject);
