%% RMS Heatmap for 10% MVC, dip BGL condition
%% Identify Bad Channels
% Load your data (assuming 128x3 for three trials)
% Input Parameters
data = rms_f10_dip;
filename = 'rms_f10_dip';
biceps = data(1:64, 1:3);
triceps = data(65:128, 1:3);
forceLevel = 10; % adjust to session
condition = 'dip BGL'; % adjust to session
RmsSubject = 'Subject 1'; % adjust to trial

% Plot Settings
displayFlag = 1;
thresholdNaN = 0; % Set as 0 to allow no NaNs
thresholdRange = [0.1, 1000]; % Range of valid data values
ElChannelMap = [1 25 26 51 52; 1 24 27 50 53; 2 23 28 49 54; 3 22 29 48 55; 4 21 30 47 56; 5 20 31 46 57; 6 19 32 45 58; 7 18 33 44 59; 8 17 34 43 60; 9 16 35 42 61; 10 15 36 41 62; 11 14 37 40 63; 12 13 38 39 64];

% Identify bad channels across trials
[badChannelsGrid1, badChannelsGrid2] = identifyBadChannelsMultiTrial(data, thresholdNaN, thresholdRange, displayFlag, filename);

%% Calculate Row-wise Means of Biceps and Triceps to generate 64x1 vectors
rowWiseMeanBiceps = mean(biceps, 2);
rowWiseMeanTriceps = mean(triceps, 2);

%% Create Heatmap for Biceps
[outputArrayBiceps, ~] = rmsHeatMapBiceps(ElChannelMap, rowWiseMeanBiceps, badChannelsGrid1, false);

%% Create Heatmap for Triceps
[outputArrayTriceps, ~] = rmsHeatMapBiceps(ElChannelMap, rowWiseMeanTriceps, badChannelsGrid2, false);

%% Combine the two heatmaps into one figure
combinedFigure = figure;
tiledlayout(1, 2); % Create a 1x2 tiled layout for side-by-side plots

% Determine common color axis limits
minValue = min([outputArrayBiceps(:); outputArrayTriceps(:)]);
maxValue = max([outputArrayBiceps(:); outputArrayTriceps(:)]);

% Plot Biceps Heatmap
nexttile;
imagesc(outputArrayBiceps);
colorbar;
clim([minValue maxValue]); % Apply common color axis limits
title('Biceps Heatmap');
xlabel('Channel Position (mm)');
ylabel('Channel Position (mm)');
xticks(1:5);
yticks(1:13);
xticklabels(arrayfun(@num2str, (1:5) * 1, 'UniformOutput', false));
yticklabels(arrayfun(@num2str, (1:13) * 1, 'UniformOutput', false));
axis equal tight;

% Plot Triceps Heatmap
nexttile;
imagesc(outputArrayTriceps);
colorbar;
clim([minValue maxValue]); % Apply common color axis limits
title('Triceps Heatmap');
xlabel('Channel Position (mm)');
ylabel('Channel Position (mm)');
xticks(1:5);
yticks(1:13);
xticklabels(arrayfun(@num2str, (1:5) * 1, 'UniformOutput', false));
yticklabels(arrayfun(@num2str, (1:13) * 1, 'UniformOutput', false));
axis equal tight;

% Set the combined title
sgtitle(sprintf('RMS Heatmap for %d%% MVC - %s - %s', forceLevel, condition, RmsSubject));
