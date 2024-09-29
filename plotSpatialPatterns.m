function [outputarray, h] = plotSpatialPatterns(data, ElChannelMapGrid1, ElChannelMapGrid2, badChannelsGrid1, badChannelsGrid2, plotFlag)
    % Function to create spatial patterns for two muscle grids and handle bad channels
    % data: 128x3 column vector, each column is a trial
    % ElChannelMapGrid1: Channel map for Grid 1 (Biceps brachii)
    % ElChannelMapGrid2: Channel map for Grid 2 (Triceps brachii)
    % badChannelsGrid1: Vector of bad channels for Grid 1
    % badChannelsGrid2: Vector of bad channels for Grid 2
    % plotFlag: Boolean flag to plot the results

    % Constants
    numTrials = size(data, 2);
    gridRows = 13;
    gridCols = 5;
    electrodeSpacing = 8; % mm
    gridWidth = 5 * electrodeSpacing; % cm
    gridHeight = 13 * electrodeSpacing; % cm

    % Initialize output array
    outputarray = zeros(numTrials, gridRows, gridCols, 2); % Last dimension for the two grids

    % Process each grid
    for trialIdx = 1:numTrials
        % Extract data for each grid
        dataGrid1 = data(1:64, trialIdx);
        dataGrid2 = data(65:128, trialIdx);
        
        % Handle bad channels using bicubic interpolation
        dataGrid1 = interpolateBadChannelsV3(dataGrid1, ElChannelMapGrid1, badChannelsGrid1);
        dataGrid2 = interpolateBadChannelsV3(dataGrid2, ElChannelMapGrid2, badChannelsGrid2);

        % Map data to grid structure
        outputarray(trialIdx, :, :, 1) = mapDataToGridV2(dataGrid1, ElChannelMapGrid1, gridRows, gridCols);
        outputarray(trialIdx, :, :, 2) = mapDataToGridV2(dataGrid2, ElChannelMapGrid2, gridRows, gridCols);
    end

    % Plot if requested
    if plotFlag
        h = figure;
        for trialIdx = 1:numTrials
            subplot(2, numTrials, trialIdx);
            imagesc(outputarray(trialIdx, :, :, 1));
            title(['Biceps Trial ', num2str(trialIdx)]);
            xlabel('Channel Position (mm)');
            ylabel('Channel Position (mm)');
            xticks(1:gridCols);
            yticks(1:gridRows);
            xticklabels(arrayfun(@num2str, (0:gridCols-1) * electrodeSpacing, 'UniformOutput', false));
            yticklabels(arrayfun(@num2str, (0:gridRows-1) * electrodeSpacing, 'UniformOutput', false));
            colorbar;
            
            subplot(2, numTrials, trialIdx + numTrials);
            imagesc(outputarray(trialIdx, :, :, 2));
            title(['Triceps Trial ', num2str(trialIdx)]);
            xlabel('Channel Position (mm)');
            ylabel('Channel Position (mm)');
            xticks(1:gridCols);
            yticks(1:gridRows);
            xticklabels(arrayfun(@num2str, (0:gridCols-1) * electrodeSpacing, 'UniformOutput', false));
            yticklabels(arrayfun(@num2str, (0:gridRows-1) * electrodeSpacing, 'UniformOutput', false));
            colorbar;
        end
    else
        h = [];
    end
end

