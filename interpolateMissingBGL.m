function data = interpolateMissingBGL(data)
    % Interpolate missing BGL values using linear interpolation
    data.("BGL [mg/dl]") = fillmissing(data.("BGL [mg/dl]"), 'linear');
end

%% Interpolate missing BGL values using linear interpolation
% Replacing NaN in BGL data with linear interpolation in order to plot and continue with further analyses
    % Input: data, replace with BGL data in .csv file format
    % Output: interpolated data based on BGL data

% Example: 
    % data = S1_BGL
    % S1_BGL = interploateMissingBGL(S1_BGL)