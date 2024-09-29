function plotMultichannelFreqSpectrumMultipleFiles(fileNames, signal, fs);
    % plotMultichannelFreqSpectrumMultipleFiles Plot multichannel frequency spectrum for multiple files
    %
    %   plotMultichannelFreqSpectrumMultipleFiles(fileNames)
    %
    %   fileNames - Cell array of file names to be processed and plotted
    %
    % Example:
    %   fileNames = {'S1_f10_t1_s1.mat', 'S1_f10_t3_s1.mat', 'S1_f10_t5_s1.mat'};
    %   plotMultichannelFreqSpectrumMultipleFiles(fileNames);

    % Create a new figure
    figure;

    % Loop through each file and plot the data
    for i = 1:length(fileNames)
        % Load the .mat file
        data = load(fileNames{i});
        
        % Extract the necessary variables
        signal = data.emg; % assuming 'emg' contains the signal data
        fs = 2000; % sampling frequency
        
        % Plot frequency spectrum
        subplot(2, 1, 1);
        hold on; % Hold on to add multiple lines to the same plot
        for c = 1:size(signal, 1)
            % Preprocess EMG
            x = signal(c, :);
            y = fft(x);
            % Plot the power spectrum as a function of frequency
            n = length(x); % number of samples
            f = (0:n-1) * (fs / n); % frequency range
            power = abs(y).^2 / n; % power of the DFT
            y0 = fftshift(y); % shift y values
            f0 = (-n/2:n/2-1) * (fs / n); % 0-centered frequency range
            power0 = abs(y0).^2 / n; % 0-centered power
            plot(f0, power0, 'DisplayName', ['File: ', fileNames{i}, ' - Channel: ', num2str(c)]);
        end
        xlabel('Frequency');
        ylabel('Power');
        title('Multichannel Frequency Spectrum');
        xlim([0 450]);
        
        % Plot time series
        subplot(2, 1, 2);
        hold on; % Hold on to add multiple lines to the same plot
        t = (1:length(signal)) / fs; % Convert samples to seconds
        for c = 1:size(signal, 1)
            plot(t, signal(c, :), 'DisplayName', ['File: ', fileNames{i}, ' - Channel: ', num2str(c)]);
        end
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('Time Series');
    end

    % Add legends to the plots
    subplot(2, 1, 1);
    legend;

    subplot(2, 1, 2);
    legend;

    hold off; % Release the hold
end
