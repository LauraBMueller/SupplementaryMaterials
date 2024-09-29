function interpolatedData = interpolateBadChannelsV2(data, ElChannelMap, badChannels)
    % Replace bad channels with bicubic interpolation from neighboring channels
    gridData = mapDataToGrid(data, ElChannelMap, 13, 5);
    for badChannel = badChannels
        [row, col] = find(ElChannelMap == badChannel);
        if ~isempty(row) && ~isempty(col)
            gridData(row, col) = nan;
        end
    end
    gridData = inpaint_nans(gridData, 4); % Bicubic interpolation
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