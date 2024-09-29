function plotMeanRms(channels, array1, array2, array3, MVC, state, subject)
    % plotMeanRms Plots three 128x1 arrays against a channels array with a customizable title
    %
    %   plotMeanRms(channels, array1, array2, array3, MVC, state, subject)
    %
    %   channels - Array with channel numbers (1 to 128)
    %   array1 - First 128x1 array to plot
    %   array2 - Second 128x1 array to plot
    %   array3 - Third 128x1 array to plot
    %   MVC - Maximum voluntary contraction percentage
    %   state - State of the subject (e.g., 'fasted', 'fed')
    %   subject - Subject identifier (e.g., 'Subject 1')
    %
    % Example:
    %   channels = 1:128;
    %   array1 = rand(128, 1);
    %   array2 = rand(128, 1);
    %   array3 = rand(128, 1);
    %   plotMeanRms(channels, array1, array2, array3, 10, 'fasted', 'Subject 1');

    % Ensure the inputs are column vectors
    if size(channels, 1) == 1
        channels = channels';
    end
    if size(array1, 1) == 1
        array1 = array1';
    end
    if size(array2, 1) == 1
        array2 = array2';
    end
    if size(array3, 1) == 1
        array3 = array3';
    end

    % Check the size of the arrays
    if length(channels) ~= 128 || length(array1) ~= 128 || length(array2) ~= 128 || length(array3) ~= 128
        error('All inputs must be 128x1 arrays');
    end

    % Create a new figure
    figure;

    % Plot the arrays
    hold on;
    plot(channels, array1, 'DisplayName', 'Trial 1');
    plot(channels, array2, 'DisplayName', 'Trial 2');
    plot(channels, array3, 'DisplayName', 'Trial 3');
    hold off;

    % Add labels and dynamic title
    xlabel('Channel Number');
    ylabel('Value');
    title(['Comparison of RMS at ', num2str(MVC), '% MVC, ', state, ' state - ', subject]);
    
    % Add a legend
    legend;
end