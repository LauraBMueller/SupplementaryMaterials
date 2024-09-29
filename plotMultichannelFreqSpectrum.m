% Plot Multichannel Frequency Spectrum

function plotMultichannelFreqSpectrum(signal, fs)

% Plots the frequency spectrum of the signal (row vector) and sampling frequency fs

figure
subplot(2,1,1)
hold on
for c = 1:size(signal,1) 
    % Preprocesed EMG
    x = signal(c,:);
    y = fft(x);
    % Plot the power spectrum as a function of frequency
    n = length(x);          % number of samples
    f = (0:n-1)*(fs/n);     % frequency range
    power = abs(y).^2/n;    % power of the DFT
    y0 = fftshift(y);         % shift y values
    f0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range
    power0 = abs(y0).^2/n;    % 0-centered power
    plot(f0,power0)
    title('Multichannel Frequency Vector')
    xlabel('Frequency')
    ylabel('Power')
    xlim([0 450])
end
hold off

subplot(2,1,2)
% Add time series below
t = (1:length(signal))./fs; % Convert samples to seconds
hold on
for c = 1:size(signal,1) 
    plot(t,signal(c,:))
end
hold off

% add title to both figures that gets adjusted for each file
% title(['Multi Channel Frequency Vector - File: ', fileNames{n}]);
end

