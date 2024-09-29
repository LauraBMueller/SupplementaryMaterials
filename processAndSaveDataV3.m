function rmsVector_filename=processAndSaveDataV3(filename, displayFlag)
% function processAndSaveData2(filename) %too many output variables when
% saving variables independently
    % processAndSaveData2 Load, preprocess, and save data from MetaMuscle .mat file
    %
    %   processAndSaveData2(filename, displayFlag)
    %
    %   filename - file to be processed
    %   displayFlag - boolean flag to control display of plots and print statements
    %
    % Example:
    %   filename = 'S1_f10_t1_s1.mat';
    %   processAndSaveData(filename);

    % Load the .mat file
    data = load(filename);
    
    % Display the loaded variables
    disp('Loaded variables:');
    disp(fieldnames(filename));
    
    % Sampling Rates
    fs = 2000;  % EMG sampling rate
    fs_force = 100;  % Force sampling rate
    
    % Extract data variables
    emg_filename = data.emg;
    force_filename = data.force;
    time_filename = data.time;
    
    % Raw Data Plots
    if displayFlag
        figure;
        subplot(2, 1, 1);
        plot(time_filename, emg_filename);
        xlabel('Time (s)');
        ylabel('EMG Amplitude');
        title(['EMG Data - File: ', filename]);
        
        subplot(2, 1, 2);
        plot(time_filename, force_filename);
        xlabel('Time (s)');
        ylabel('Force Level');
        title(['Force Data - File: ', filename]);
    end
    
    % Filtering
    emg_filtered = bandpassingals(emg_filename, fs, 1);
    emg_notchfiltered = notch_emg(emg_filtered, fs);
    filteredsignal = notchsignals(emg_notchfiltered, fs);
    
     % Initial Exploration of Preprocessed Data
    rmsVector_filename = zeros(size(filteredsignal, 1), 1);
    
    % Compute RMS and display the results per channel if the flag is true
    for idy = 1:size(filteredsignal, 1)
        r = rms(filteredsignal(idy, :));
        rmsVector_filename(idy) = r;
        if displayFlag
            disp(['File: ', filename, ' - Channel: ', num2str(idy), ' - RMS: ', num2str(r)]);
        end
    end
    
    % Frequency Domain Features and Plot of Power Spectral Density
    if displayFlag
        plotMultichannelFreqSpectrum(filteredsignal, fs);
        title(['Multi Channel Frequency Spectrum - File: ', filename]);
    end
    
    % Save the required variables
    %save(filename, "rms_filename", "force_data", "time_data", "emg_data", "fs_force", "force_data");
end
