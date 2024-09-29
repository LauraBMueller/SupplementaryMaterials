%% Preprocessing and Exploration Subject 2, fasted conditions

%% Mean for each VC level
% VC Level at 10% MVC
    % Trial 1
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t1_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t1 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t1)
    
    % Trial 3
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t3_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t3 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t3)
    
    % Trial 5
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t5_s1.mat";
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

%% VC Level at 20% MVC
    % Trial 2
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t2_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t2 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t2)

 % Trial 4
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t4_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t4 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t4)

% Trial 6
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t6_s1.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t6 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t6)

%% Mean of all Trials at 20 % MVC in fasted state

rms_f20_fasted = [rms_t2, rms_t4, rms_t6];

% Means for each column (=grid pair)
mean_rms_f20_fasted = mean(rms_f20_fasted);
disp(mean_rms_f20_fasted);

% Means for each row (=channel)
rowMeans = mean(rms_f20_fasted, 2);
disp(rowMeans);

%% Preanalysis Plots 

% Plots for 10 % MVC
    % Raw EMG and Force Data at 10% MVC combined into a single plot
    fileNames = {'S2_f10_t1_s1.mat', 'S2_f10_t3_s1.mat', 'S2_f10_t5_s1.mat'};
    plotMultipleFiles(fileNames); 
    
    % Plot mean RMSS values at 10% MVC
    % Define channel numbers and arrays
    channels = 1:128;
    array1 = rms_t1; 
    array2 = rms_t3; 
    array3 = rms_t5; 
    % Define the parameters for the plot title
    MVC = 10;
    state = 'fasted';
    subject = 'Subject 2';
    
    % Call the custom function to plot the arrays against the channels
    plotMeanRms(channels, array1, array2, array3, MVC, state, subject);
    
    % Generate a new array to add channels to rms_f10_fasted
    % Generate the channel values from 1 to 128
    channels = (1:128)';
    % Combine the channel values with the 128x3 array
    rms_f20_fasted_channels = [channels, rms_f10_fasted];
    % Display the new array
    disp(rms_f20_fasted_channels);
    
    % Plot the new array
    % Define the parameters for the plot title
    MVC = 10;
    state = 'fasted';
    subject = 'Subject 2';
    % Call the custom function to plot the array with channels
    plotMeanRmsWithChannels(rms_f20_fasted_channels, MVC, state, subject);

% Plots for 20% MVC 
    % Raw EMG and Force Data at 20% MVC combined into a single plot
    fileNames = {'S2_f20_t2_s1.mat', 'S2_f20_t4_s1.mat', 'S2_f20_t6_s1.mat'};
    plotMultipleFiles(fileNames); 
    
    % Plot mean RMSS values at 20% MVC
    % Define channel numbers and arrays
    channels = 1:128;
    array1 = rms_t2; 
    array2 = rms_t4; 
    array3 = rms_t6; 
    % Define the parameters for the plot title
    MVC = 20;
    state = 'fasted';
    subject = 'Subject 2';
    
    % Call the custom function to plot the arrays against the channels
    plotMeanRms(channels, array1, array2, array3, MVC, state, subject);
    
    % Generate a new array to add channels to rms_f10_peak
    % Generate the channel values from 1 to 128
    channels = (1:128)';
    % Combine the channel values with the 128x3 array
    rms_f20_fasted_channels = [channels, rms_f20_fasted];
    % Display the new array
    disp(rms_f20_fasted_channels);
    
    % Plot the new array
    % Define the parameters for the plot title
    MVC = 20;
    state = 'fasted';
    subject = 'Subject 2';
    % Call the custom function to plot the array with channels
    plotMeanRmsWithChannels(rms_f20_fasted_channels, MVC, state, subject);
