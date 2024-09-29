function gridData = mapDataToGrid(data, ElChannelMap, gridRows, gridCols)
    % Map 1D data to 2D grid based on channel map
    gridData = nan(gridRows, gridCols);
    for row = 1:gridRows
        for col = 1:gridCols
            channel = ElChannelMap(row, col);
            if channel ~= 0
                gridData(row, col) = data(channel);
            end
        end
    end
end
