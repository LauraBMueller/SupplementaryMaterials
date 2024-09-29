function prepareAnalysis
%% Preparing Analysis
% Go through necessary steps prior to analysis
% Add all folders to path to avoid manually adding
% Set constants for all trials 
% Inputs: 
    % Constants: fs (HDsEMG sampling rate), fs_force (force sensor sampling rate)
    % Folders needed
% Outputs: none
%%
% Add paths to all folders to script
    addpath(genpath("Data/"));
    addpath(genpath("Figures/"));
    addpath(genpath("Live Scripts/"));
    addpath(genpath("MetaMuscle Functions/"));
    addpath(genpath("RMS/"));
    addpath(genpath("DataCleaningExploration"));
    addpath(genpath("Comparisons"));
    addpath(genpath("Unused"));

% Constants
    % Sampling Rates
    fs = 2000;  % EMG sampling rate
    fs_force = 100;  % Force sampling rate
end
