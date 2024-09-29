function [outputArray, h] = rmsHeatMapV3(ElChannelMap, rms, badChan, plotFlag)
    % Constants
    %numTrials = size(data, 2);
    gridRows = 13;
    gridCols = 5;
    electrodeSpacing = 1; % mm
    gridWidth = 5 * electrodeSpacing; % cm
    gridHeight = 13 * electrodeSpacing; % cm
    
    % Check inputs
    if numel(rms) ~= 64
        error('channelData must be a 64-element column vector');
    end
    
    if ~ismatrix(ElChannelMap) || any(size(ElChannelMap) ~= [13, 5])
        error('ElChannelMap must be a 13x5 matrix');
    end
    
    if nargin < 3
        badChan = [];
    end
    
    if nargin < 4
        plotFlag = false;
    end

    % Initialize the output array
    outputArray = NaN(size(ElChannelMap));

    % Map the channelData to the outputArray using ElChannelMap
    for row = 1:size(ElChannelMap, 1)
        for col = 1:size(ElChannelMap, 2)
            channelIndex = ElChannelMap(row, col);
            outputArray(row, col) = rms(channelIndex);
        end
    end

    % Replace bad channels with NaNs
    for i = 1:numel(badChan)
        [row, col] = find(ElChannelMap == badChan(i));
        if ~isempty(row) && ~isempty(col)
            outputArray(row, col) = NaN;
        end
    end

    % Perform bicubic interpolation for bad channels
    if ~isempty(badChan)
        [X, Y] = meshgrid(1:size(outputArray, 2), 1:size(outputArray, 1));
        nanIndices = isnan(outputArray);
        outputArray(nanIndices) = griddata(X(~nanIndices), Y(~nanIndices), outputArray(~nanIndices), X(nanIndices), Y(nanIndices), 'cubic');
    end

    if plotFlag
        h = figure;
        imagesc(outputArray);
        colorbar;
        
        % Set the title using the muscle name variable
        title('64-Channel Heat Map: Biceps brachii, Short Head');
        xlabel('Channel Position (mm)');
        ylabel('Channel Position (mm)');
        xticks(1:gridCols);
        yticks(1:gridRows);
        xticklabels(arrayfun(@num2str, (1:gridCols) * electrodeSpacing, 'UniformOutput', false));
        yticklabels(arrayfun(@num2str, (1:gridRows) * electrodeSpacing, 'UniformOutput', false));
        % axis equal; % Adjust the aspect ratio
        
        % Adjust aspect ratio and axis limits
        axis equal tight;
        
        % Adjust position of the axes to remove empty spaces
        ax = gca;
        outerpos = ax.OuterPosition;
        ti = ax.TightInset; 
        left = outerpos(1) + ti(1);
        bottom = outerpos(2) + ti(2);
        ax_width = outerpos(3) - ti(1) - ti(3);
        ax_height = outerpos(4) - ti(2) - ti(4);
        ax.Position = [left, bottom, ax_width, ax_height];
        
        % Adjust colorbar position
        cb = colorbar;
        cb.Position(1) = 0.7; % Position the colorbar to the right of the plot
        cb.Position(3) = 0.02; % Adjust the width of the colorbar
    else
        h = [];
    end
end
