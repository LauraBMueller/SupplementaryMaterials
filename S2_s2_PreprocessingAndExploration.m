%% Preprocessing and Exploration Subject 2, peak BGL conditions

%% Mean for each VC level
% VC Level at 10% MVC
    % Trial 7
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t7_s2.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t7 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t7)
    
    % Trial 9
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t9_s2.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t9 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t9)
    
    % Trial 11
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t11_s2.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t11 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t11)

%% Mean of all Trials at 10 % MVC in fasted state

rms_f10_peak = [rms_t7, rms_t9, rms_t11];

% Means for each column (=grid pair)
mean_rms_f10_peak = mean(rms_f10_peak);
disp(mean_rms_f10_peak);

% Means for each row (=channel)
rowMeans = mean(rms_f10_peak, 2);
disp(rowMeans);

%% VC Level at 20% MVC
    % Trial 8
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t8_s2.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t8 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t8)

 % Trial 10
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t10_s2.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t10 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t10)

% Trial 12
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t12_s2.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t12 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t12)

%% Mean of all Trials at 30 % MVC in fasted state

rms_f20_peak = [rms_t8, rms_t10, rms_t12];

% Means for each column (=grid pair)
mean_rms_f20_peak = mean(rms_f20_peak);
disp(mean_rms_f20_peak);

% Means for each row (=channel)
rowMeans = mean(rms_f20_peak, 2);
disp(rowMeans);

%% Preanalysis Plots 

% Plots for 10 % MVC
    % Raw EMG and Force Data at 10% MVC combined into a single plot
    fileNames = {'S2_f10_t7_s2.mat', 'S2_f10_t9_s2.mat', 'S2_f10_t11_s2.mat'};
    plotMultipleFiles(fileNames); 
    
    % Plot mean RMSS values at 10% MVC
    % Define channel numbers and arrays
    channels = 1:128;
    array1 = rms_t7; 
    array2 = rms_t9; 
    array3 = rms_t11; 
    % Define the parameters for the plot title
    MVC = 10;
    state = 'peak';
    subject = 'Subject 2';
    
    % Call the custom function to plot the arrays against the channels
    plotMeanRms(channels, array1, array2, array3, MVC, state, subject);
    
    % Generate a new array to add channels to rms_f10_peak
    % Generate the channel values from 1 to 128
    channels = (1:128)';
    % Combine the channel values with the 128x3 array
    rms_f20_peak_channels = [channels, rms_f10_peak];
    % Display the new array
    disp(rms_f20_peak_channels);
    
    % Plot the new array
    % Define the parameters for the plot title
    MVC = 10;
    state = 'peak';
    subject = 'Subject 2';
    % Call the custom function to plot the array with channels
    plotMeanRmsWithChannels(rms_f20_peak_channels, MVC, state, subject);

% Plots for 20% MVC 
    % Raw EMG and Force Data at 20% MVC combined into a single plot
    fileNames = {'S2_f20_t8_s2.mat', 'S2_f20_t10_s2.mat', 'S2_f20_t12_s2.mat'};
    plotMultipleFiles(fileNames); 
    
    % Plot mean RMSS values at 20% MVC
    % Define channel numbers and arrays
    channels = 1:128;
    array1 = rms_t7; 
    array2 = rms_t9; 
    array3 = rms_t11; 
    % Define the parameters for the plot title
    MVC = 20;
    state = 'peak';
    subject = 'Subject 2';
    
    % Call the custom function to plot the arrays against the channels
    plotMeanRms(channels, array1, array2, array3, MVC, state, subject);
    
    % Generate a new array to add channels to rms_f10_peak
    % Generate the channel values from 1 to 128
    channels = (1:128)';
    % Combine the channel values with the 128x3 array
    rms_f20_peak_channels = [channels, rms_f20_peak];
    % Display the new array
    disp(rms_f20_peak_channels);
    
    % Plot the new array
    % Define the parameters for the plot title
    MVC = 20;
    state = 'peak';
    subject = 'Subject 2';
    % Call the custom function to plot the array with channels
    plotMeanRmsWithChannels(rms_f20_peak_channels, MVC, state, subject);
