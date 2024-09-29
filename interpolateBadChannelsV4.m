function interpolatedData = interpolateBadChannelsV4(gridData, ElChannelMap, badChannels, threshold)
    % Replace bad channels or channels with small values with bicubic interpolation
    % gridData = mapDataToGridV2(data, ElChannelMap, 13, 5); is the result of a previous step
    
    if nargin < 4
        threshold = 1e-6; % Define a default threshold if not provided
    end
    
    % Set bad channels to NaN
    for i = 1:length(badChannels)
        [row, col] = find(ElChannelMap == badChannels(i));
        gridData(row, col) = nan;
    end
    
    % Set channels with very small values (below threshold) to NaN
    smallValuesMask = abs(gridData) < threshold;
    gridData(smallValuesMask) = nan;
    
    % Perform interpolation using griddata
    [rows, cols] = ndgrid(1:13, 1:5);
    validMask = ~isnan(gridData);
    gridDataInterpolated = griddata(rows(validMask), cols(validMask), gridData(validMask), rows, cols, 'cubic');
    
    % Replace NaNs with interpolated values
    gridData(isnan(gridData)) = gridDataInterpolated(isnan(gridData));
    
    % Map grid data back to a vector
    interpolatedData = nan(64, 1);
    for row = 1:13
        for col = 1:5
            channel = ElChannelMap(row, col);
            if channel ~= 0
                interpolatedData(channel) = gridData(row, col);
            end
        end
    end
end