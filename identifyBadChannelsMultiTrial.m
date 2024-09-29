function [badChannelsGrid1, badChannelsGrid2] = identifyBadChannelsMultiTrial(data, thresholdNaN, thresholdRange)
    % Function to identify bad channels based on NaN values and range for a single trial
    % data: 128x3 vector of channel data for a session (same conditions)
    % thresholdNaN: Number of NaNs to consider a channel bad
    % thresholdRange: Range [min, max] for valid data values
    % displayFlag: if true, displays bad channels for each grid, 

    % Initialize vectors to hold bad channels for each grid
    badChannelsGrid1 = [];
    badChannelsGrid2 = [];
    
    % Process each trial
    for trialIdx = 1:size(data, 2)
        % Extract data for each grid
        dataGrid1 = data(1:64, trialIdx);
        dataGrid2 = data(65:128, trialIdx);
    
        % Identify bad channels
        badChannelsGrid1Trial = identifyBadChannels(dataGrid1, thresholdNaN, thresholdRange);
        badChannelsGrid2Trial = identifyBadChannels(dataGrid2, thresholdNaN, thresholdRange);
    
        % Aggregate bad channels
        badChannelsGrid1 = [badChannelsGrid1; badChannelsGrid1Trial];
        badChannelsGrid2 = [badChannelsGrid2; badChannelsGrid2Trial];
    end
    
    % Remove duplicates
    badChannelsGrid1 = unique(badChannelsGrid1);
    badChannelsGrid2 = unique(badChannelsGrid2);
    
end

