function badChannels = identifyBadChannels(data, thresholdNaN, thresholdRange)
    % Function to identify bad channels based on NaN values and range for a single trial
    % data: 128x1 vector of channel data for a trial
    % thresholdNaN: Number of NaNs to consider a channel bad
    % thresholdRange: Range [min, max] for valid data values

    % Initialize badChannels as empty
    badChannels = [];

    % Check for NaN values
    nanMask = isnan(data);
    if sum(nanMask) > thresholdNaN
        badChannels = [badChannels; find(nanMask)];
    end

    % Check for values outside the valid range
    outOfRangeMask = (data < thresholdRange(1)) | (data > thresholdRange(2));
    if sum(outOfRangeMask) > 0
        badChannels = [badChannels; find(outOfRangeMask)];
    end

    % Remove duplicate entries
    badChannels = unique(badChannels);
end
