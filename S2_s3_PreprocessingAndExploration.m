%% Preprocessing and Exploration Subject 2, dip conditions

%% Mean for each VC level
% VC Level at 10% MVC
    % Trial 13
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t13_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t13 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t13)
    
    % Trial 15
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t15_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t15 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t15)
    
    % Trial 17
    % Preprocessing and Inital Exploration
    filename = "S2_f10_t17_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t17 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t17)

%% Mean of all Trials at 10 % MVC in fasted state

rms_f10_dip = [rms_t13, rms_t15, rms_t17];

% Means for each column (=grid pair)
mean_rms_f10_dip = mean(rms_f10_dip);
disp(mean_rms_f10_dip);

% Means for each row (=channel)
rowMeans = mean(rms_f10_dip, 2);
disp(rowMeans);

%% VC Level at 20% MVC
    % Trial 14
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t14_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t14 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t14)

 % Trial 16
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t16_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t16 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t16)

% Trial 18
    % Preprocessing and Inital Exploration
    filename = "S2_f20_t18_s3.mat";
    load(filename);
    displayFlag = false;
    % Calculate RMS
    rms_t18 = processAndSaveDataV3(filename,displayFlag);
    disp(rms_t18)

%% Mean of all Trials at 20 % MVC in fasted state

rms_f20_dip = [rms_t14, rms_t16, rms_t18];

% Means for each column (=grid pair)
mean_rms_f20_dip = mean(rms_f20_dip);
disp(mean_rms_f20_dip);

% Means for each row (=channel)
rowMeans = mean(rms_f20_dip, 2);
disp(rowMeans);

%% Preanalysis Plots 

% Plots for 10 % MVC
    % Raw EMG and Force Data at 10% MVC combined into a single plot
    fileNames = {'S2_f10_t13_s3.mat', 'S2_f10_t15_s3.mat', 'S2_f10_t17_s3.mat'};
    plotMultipleFiles(fileNames); 
    
    % Plot mean RMSS values at 10% MVC
    % Define channel numbers and arrays
    channels = 1:128;
    array1 = rms_t13; 
    array2 = rms_t15; 
    array3 = rms_t17; 
    % Define the parameters for the plot title
    MVC = 10;
    state = 'dip BGL';
    subject = 'Subject 2';
    
    % Call the custom function to plot the arrays against the channels
    plotMeanRms(channels, array1, array2, array3, MVC, state, subject);
    
    % Generate a new array to add channels to rms_f10_fasted
    % Generate the channel values from 1 to 128
    channels = (1:128)';
    % Combine the channel values with the 128x3 array
    rms_f20_dip_channels = [channels, rms_f10_dip];
    % Display the new array
    disp(rms_f20_dip_channels);
    
    % Plot the new array
    % Define the parameters for the plot title
    MVC = 10;
    state = 'dip BGL';
    subject = 'Subject 2';
    % Call the custom function to plot the array with channels
    plotMeanRmsWithChannels(rms_f20_dip_channels, MVC, state, subject);

% Plots for 20% MVC 
    % Raw EMG and Force Data at 20% MVC combined into a single plot
    fileNames = {'S2_f20_t14_s3.mat', 'S2_f20_t16_s3.mat', 'S2_f20_t18_s3.mat'};
    plotMultipleFiles(fileNames); 
    
    % Plot mean RMSS values at 20% MVC
    % Define channel numbers and arrays
    channels = 1:128;
    array1 = rms_t14; 
    array2 = rms_t16; 
    array3 = rms_t18; 
    % Define the parameters for the plot title
    MVC = 20;
    state = 'dip BGL';
    subject = 'Subject 2';
    
    % Call the custom function to plot the arrays against the channels
    plotMeanRms(channels, array1, array2, array3, MVC, state, subject);
    
    % Generate a new array to add channels to rms_f10_peak
    % Generate the channel values from 1 to 128
    channels = (1:128)';
    % Combine the channel values with the 128x3 array
    rms_f20_dip_channels = [channels, rms_f20_dip];
    % Display the new array
    disp(rms_f20_dip_channels);
    
    % Plot the new array
    % Define the parameters for the plot title
    MVC = 20;
    state = 'dip BGL';
    subject = 'Subject 2';
    % Call the custom function to plot the array with channels
    plotMeanRmsWithChannels(rms_f20_dip_channels, MVC, state, subject);
