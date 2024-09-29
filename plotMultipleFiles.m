function plotMultipleFiles(fileNames)
    % plotMultipleFiles Plot data from multiple .mat files in one figure
    %
    %   plotMultipleFiles(fileNames)
    %
    %   fileNames - Cell array of file names to be processed and plotted
    %
    % Example:
    %   fileNames = {'S1_f10_t1_s1.mat', 'S1_f10_t3_s1.mat', 'S1_f10_t5_s1.mat'};
    %   plotMultipleFiles(fileNames);

    % Create a new figure
    figure;

    % Loop through each file and plot the data
    for i = 1:length(fileNames)
        % Load the .mat file
        data = load(fileNames{i});
        
        % Extract the necessary variables
        time = data.time;
        emg = data.emg;
        force = data.force;
        
        % Plot EMG data
        subplot(2, 1, 1);
        hold on; % Hold on to add multiple lines to the same plot
        plot(time, emg, 'DisplayName', ['EMG - ', fileNames{i}]);
        xlabel('Time (s)');
        ylabel('EMG Amplitude');
        title('EMG Data');
        
        % Plot Force data
        subplot(2, 1, 2);
        hold on; % Hold on to add multiple lines to the same plot
        plot(time, force, 'DisplayName', ['Force - ', fileNames{i}]);
        xlabel('Time (s)');
        ylabel('Force Level');
        title('Force Data');
    end

    % Add legends to the plots
    % subplot(2, 1, 1);
    % legend;
    % 
    % subplot(2, 1, 2);
    % legend;

    hold off; % Release the hold
end

