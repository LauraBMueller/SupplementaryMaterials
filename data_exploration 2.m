%Preliminary Data Exploration for 1 Trial

function data_exploration('mat file');

% Load the .mat file
load('S1_f10_t1_s1.mat'); 

% Display the loaded variables
disp('emg');
disp('force');
disp('time');

% EMG sampling rate
fs = 2000; % Sampling frequency in Hz

% Force samling rate
fs_force = 100; % Sampling frequency in Hz


% Plot EMG data
figure;
subplot(2, 1, 1);
plot(time, emg);
xlabel('Time (s)');
ylabel('EMG Amplitude');
title('EMG Data');

% Plot force data
subplot(2, 1, 2);
plot(time, force);
xlabel('Time (s)');
ylabel('Force Level');
title('Force Data');

% Band pass filter 
emg_filtered = bandpassingals(emg,2000,1);

% Notch Filter
emg_notchfiltered = notch_emg(emg_filtered,2000);
filteredsignal = notchsignals(emg_notchfiltered,2000);

% Format Signal HDsEMG
    % To get the 2d coordinates of EMG channels over the grid
    % To check the EMG signals (automatic or visual)
    % To exclude noisy channels
% formatsignalHDEMG(emg_filtered, 'GR08MM1305', 2000, 1, 128);

% RMS
emg_rms = [rms(filteredsignal, 2)];

% Display the results for RMS per channel
for idy=1:size(filteredsignal, 1)
    disp(['Channel: ', num2str(idy)]);
    disp(['RMS: ', num2str(rms(filteredsignal(idy, :)))]);
end

% Frequency Domain Features and Plot of Power Spectral Density
% powerspectraldensity(filteredsignal)

% Plot Multichannel Frequency Spectrum
plotMultichannelFreqSpectrum(filteredsignal, 2000)
