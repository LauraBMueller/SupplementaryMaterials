function rowWiseMean = calculateRowWiseMeanV2(data, ElChannelMap)
    % Function to calculate row-wise mean for 3 trials, excluding bad channels
    % Inputs:
        % data: 128x3 column vector, each column is a trial
        % ElChannelMapGrid1: Channel map for Grid 1 (Biceps brachii)
        % ElChannelMapGrid2: Channel map for Grid 2 (Triceps brachii)
        % Thresholds for identifying bad channels
            % thresholdNaN = 0; % Set as 0 to allow no NaNs
            % thresholdRange = [0.01, 1000]; % Range of valid data values
    % Outputs:
        % Cleaned data, where missing chsnnels were identified and then
        % replaced with bicubic interpolation
            % cleanedDataGrid1(:, trialIdx) = dataGrid1;
            % cleanedDataGrid2(:, trialIdx) = dataGrid2;
        % row-wise mean RMS for both grids, for all trials of one condition, combined into one array
        % rowWiseMean = [rowWiseMeanGrid1; rowWiseMeanGrid2];


    % Constants
    numTrials = size(data, 2);
    gridRows = 13;
    gridCols = 5;

    % Initialize matrices to hold cleaned data
    cleanedDataBiceps = zeros(64, numTrials)

    %Thresholds for identifying bad channels
        thresholdNaN = 0; % Set as 0 to allow no NaNs
        thresholdRange = [0.1, 1000]; % Range of valid data values
    
    % Process each trial and handle bad channels
    for trialIdx = 1:numTrials
        % Extract data for each grid
        dataBiceps = data(1:64, trialIdx);

        % Identify bad channels
        badChannelsBiceps = identifyBadChannels(dataBiceps, thresholdNaN, thresholdRange);
       
        % Handle bad channels using bicubic interpolation
        dataBiceps = interpolateBadChannelsV3(dataBiceps, ElChannelMap, badChannelsBiceps);

        % Store cleaned data
        cleanedDataBiceps(:, trialIdx) = dataBiceps;

    end

    % Calculate row-wise mean, excluding bad channels
    rowWiseMeanBiceps = mean(cleanedDataBiceps, 2, 'omitnan');

end