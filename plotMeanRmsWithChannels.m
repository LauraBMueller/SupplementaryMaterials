function plotMeanRmsWithChannels(array, MVC, state, subject)
    % plotMeanRmsWithChannels Plots the rmss array with channels as y-values
    %
    %   plotMeanRmsWithChannels(array, MVC, state, subject)
    %
    %   array - The array to plot (128x4 double array, including channels)
    %   MVC - Maximum voluntary contraction percentage
    %   state - State of the subject (e.g., 'fasted', 'fed')
    %   subject - Subject identifier (e.g., 'Subject 1')
    %
    % Example:
    %   channels = (1:128)';
    %   rms_f10_fasted = rand(128, 3); % Example data
    %   rms_f10_fasted_channels = [channels, rmss_f10_fasted];
    %   plotRmsWithChannels(rms_f10_fasted_channels, 10, 'fasted', 'Subject 1');

    % Extract channel values and data
    channels = array(:, 1);
    data = array(:, 2:end);

    % Create a new figure
    figure;

    % Plot the arrays
    hold on;
    plot(channels, data(:, 1), 'DisplayName', 'Trial 1');
    plot(channels, data(:, 2), 'DisplayName', 'Trial 2');
    plot(channels, data(:, 3), 'DisplayName', 'Trial 3');
    hold off;

    % Add labels and dynamic title
    xlabel('Channel Number');
    ylabel('RMS Value');
    title(['Comparison of RMS at ', num2str(MVC), '% MVC, ', state, ' state - ', subject]);
    
    % Add a legend
    legend;
end