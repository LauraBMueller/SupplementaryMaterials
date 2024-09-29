%% Preprocessing and Exploration Subject 1, fasted conditions
% Add paths to all folders to script

addpath(genpath("Data/"));
addpath(genpath("Figures/"));
addpath(genpath("Live Scripts/"));
addpath(genpath("MetaMuscle Functions/"));
addpath(genpath("RMS/"));
addpath(genpath("DataCleaningExploration"));

%% Mean for each VC level
% VC Level at 10% MVC
    % Trial 1
    % Preprocessing and Inital Exploration
    filename = "S1_f10_t1_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t1 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t1)
    
    % Trial 3
    % Preprocessing and Inital Exploration
    filename = "S1_f10_t3_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t3 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t3)
    
    % Trial 5
    % Preprocessing and Inital Exploration
    filename = "S1_f10_t5_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t5 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t5)

%% Mean of all Trials at 10 % MVC in fasted state

rms_f10_fasted = [rms_t1, rms_t3, rms_t5];

% Means for each column (=grid pair)
mean_rms_f10_fasted = mean(rms_f10_fasted);
disp(mean_rms_f10_fasted);

% Means for each row (=channel)
rowMeans = mean(rms_f10_fasted, 2);
disp(rowMeans);

%% 
% Raw EMG and Force Data combined into a single plot

fileNames = {'S1_f10_t1_s1.mat', 'S1_f10_t3_s1.mat', 'S1_f10_t5_s1.mat'};
plotMultipleFiles(fileNames); 
%% Plot mean RMSS values

% Define channel numbers and arrays
channels = 1:128;
array1 = rms_t1; 
array2 = rms_t3; 
array3 = rms_t5; 

% Define the parameters for the plot title
MVC = 10;
state = 'fasted';
subject = 'Subject 1';

% Call the custom function to plot the arrays against the channels
plotMeanRms(channels, array1, array2, array3, MVC, state, subject);
%% 
% Generate a new array to add channels to rms_f10_fasted

% Generate the channel values from 1 to 128
channels = (1:128)';

% Combine the channel values with the 128x3 array
rms_f10_fasted_channels = [channels, rms_f10_fasted];

% Display the new array
disp(rms_f10_fasted_channels);
%% 
% Plot the new array

% Define the parameters for the plot title
MVC = 10;
state = 'fasted';
subject = 'Subject 1';

% Call the custom function to plot the array with channels
plotMeanRmsWithChannels(rms_f10_fasted_channels, MVC, state, subject);
%% 
% Multichannel Frequency Vector using Means

% plotMultichannelFreqSpectrumMultipleFiles(fileNames, filteredsignal_filename, fs);
%% VC Level at 30% MVC
 % Trial 2
    % Preprocessing and Inital Exploration
    filename = "S1_f30_t2_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t2 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t2)

 % Trial 4
    % Preprocessing and Inital Exploration
    filename = "S1_f30_t4_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t4 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t4)

% Trial 6
    % Preprocessing and Inital Exploration
    filename = "S1_f30_t6_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t6 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t6)

%% Mean of all Trials at 30 % MVC in fasted state

rms_f30_fasted = [rms_t2, rms_t4, rms_t6];

% Means for each column (=grid pair)
mean_rms_f30_fasted = mean(rms_f30_fasted);
disp(mean_rms_f30_fasted);

% Means for each row (=channel)
rowMeans = mean(rms_f30_fasted, 2);
disp(rowMeans);
% Plots
% Raw EMG and Force Data combined into a single plot

fileNames = {'S1_f30_t8_s2.mat', 'S1_f30_t10_s2.mat', 'S1_f30_t12_s2.mat'};
plotMultipleFiles(fileNames); 
%% 
