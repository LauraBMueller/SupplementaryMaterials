function badChan = identifyBadChannelsMuscle(data, thresholdNaN, thresholdRange)
    % Function to identify bad channels based on NaN values and range for a single trial
    % data: allRMSvector for one muscle (biceps or triceps) for all trials under same conditions
    % thresholdNaN: Number of NaNs to consider a channel bad
    % thresholdRange: Range [min, max] for valid data values

    % Initialize vectors to hold bad channels for each grid
    badChan = [];

    % Process each trial
    for t = 1:3
        % Extract data for one muscle
        dataMuscle = data(t);
    
        % Identify bad channels
        badChanTrial = identifyBadChannelsMuscle(dataMuscle, thresholdNaN, thresholdRange);
        
        % Aggregate bad channels
        badChan = [badChan; badChanTrial];
       
    end
    
    % Remove duplicates
    badChan = unique(badChan);

end

