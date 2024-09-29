function interpolatedData = interpolateBadChannelsV3(gridData, ElChannelMap, badChannels)
    % Replace bad channels with bicubic interpolation from neighboring channels
    %gridData = mapDataToGridV2(data, ElChannelMap, 13, 5);
    
    % Set bad channels to NaN
    for i = 1:length(badChannels)
        [row, col] = find(ElChannelMap == badChannels(i));
        gridData(row, col) = nan;
    end
    
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


