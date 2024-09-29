function rowWiseMean = calculateRowWiseMean(data, ElChannelMapGrid1, ElChannelMapGrid2, badChannelsGrid1, badChannelsGrid2)
    % Function to calculate row-wise mean rms for 3 trials, excluding bad channels
    % data: 128x3 column vector, each column is a trial
    % ElChannelMapGrid1: Channel map for Grid 1 (Biceps brachii)
    % ElChannelMapGrid2: Channel map for Grid 2 (Triceps brachii)
    % badChannelsGrid1: Vector of bad channels for Grid 1
    % badChannelsGrid2: Vector of bad channels for Grid 2

    % Constants
    numTrials = size(data, 2);
    gridRows = 13;
    gridCols = 5;

    % Initialize matrices to hold cleaned data
    cleanedDataGrid1 = zeros(64, numTrials);
    cleanedDataGrid2 = zeros(64, numTrials);

    % Process each trial and handle bad channels
    for trialIdx = 1:numTrials
        % Extract data for each grid
        dataGrid1 = data(1:64, trialIdx);
        dataGrid2 = data(65:128, trialIdx);
        
        % Handle bad channels using bicubic interpolation
        dataGrid1 = interpolateBadChannels(dataGrid1, ElChannelMapGrid1, badChannelsGrid1);
        dataGrid2 = interpolateBadChannels(dataGrid2, ElChannelMapGrid2, badChannelsGrid2);

        % Store cleaned data
        cleanedDataGrid1(:, trialIdx) = dataGrid1;
        cleanedDataGrid2(:, trialIdx) = dataGrid2;
    end

    % Calculate row-wise mean, excluding bad channels
    rowWiseMeanGrid1 = mean(cleanedDataGrid1, 2, 'omitnan');
    rowWiseMeanGrid2 = mean(cleanedDataGrid2, 2, 'omitnan');

    % Combine results into a single array
    rowWiseMean = [rowWiseMeanGrid1; rowWiseMeanGrid2];
end


