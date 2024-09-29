function rmsVector=processAndSaveDataV4(emg, fs)
    % Preprocess and save data from MetaMuscle .mat file
    % Inputs:
    %   filename - file to be processed
    %   displayFlag - boolean flag to control display of plots and print statements
    %
    % Example:
    %   filename = 'S1_f10_t1_s1.mat';
    %   processAndSaveDataV4(filename, true);
    
    % Filtering
    emg_filtered = bandpassingals(emg, fs, 1);
    emg_notchfiltered = notch_emg(emg_filtered, fs);
    filteredsignal = notchsignals(emg_notchfiltered, fs);
    
     % Initial Exploration of Preprocessed Data
    rmsVector = zeros(size(filteredsignal, 1), 1);
    
    % Compute RMS and display the results per channel if the flag is true
    for idy = 1:size(filteredsignal, 1)
        r = rms(filteredsignal(idy, :));
        rmsVector(idy) = r;
    end
end
