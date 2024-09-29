function gridData = mapDataToGridV2(data, ElChannelMap, numRows, numCols)
    % Map data vector to grid based on ElChannelMap
    gridData = nan(numRows, numCols);
    for row = 1:numRows
        for col = 1:numCols
            channel = ElChannelMap(row, col);
            if channel ~= 0
                gridData(row, col) = data(channel);
            end
        end
    end
end