% Plot Power Spectral Density and Display Frequency Domain Features

% Input:
% emg_rectified

% Output:
% [pxx, f]: Power Spectral Density using Welch's method
% mnf: mean frequency
% mdf: median frequency
% peak_freq: Peak Frequency
% total_power: Total Power
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plotpowerspectraldensity()

figure;
hold on;
for idy = 1:size(emg_rectified, 1)
    % Compute Power Spectral Density using Welch's method
    [pxx, f] = pwelch(emg_rectified(idy, :), [], [], [], fs);
    
    % Mean Frequency
    mnf = sum(f .* pxx) / sum(pxx);
    
    % Median Frequency
    cumsum_pxx = cumsum(pxx);
    mdf = f(find(cumsum_pxx >= 0.5 * sum(pxx), 1));
    
    % Peak Frequency
    [~, idx] = max(pxx);
    peak_freq = f(idx);
    
    % Total Power
    total_power = sum(pxx);

    % Display the results
    disp(['Channel: ', num2str(idy)]);
    disp(['Mean Frequency: ', num2str(mnf), ' Hz']);
    disp(['Median Frequency: ', num2str(mdf), ' Hz']);
    disp(['Peak Frequency: ', num2str(peak_freq), ' Hz']);
    disp(['Total Power: ', num2str(total_power)]);

    plot(f, 10*log10(pxx));
end

% Plot Power Spectral Density
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
title('Power Spectral Density');