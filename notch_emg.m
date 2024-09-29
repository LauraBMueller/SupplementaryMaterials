function emg_notchfiltered = notch_emg(emg,fs)

emg_notchfiltered = zeros(size(emg));

% Notch filtering at 50 Hz, 100 Hz, 150 Hz and 200 Hz. 
notch_freqs = [50 100 150 200 250 300];

for i=1:size(emg,1) % repeat for every channel
    % Bandpass filtering
    NyqFreq = fs/2;
    EMG_notch = zeros(4,length(emg)); % initialization

        for j= 1:4
            wo = notch_freqs(j)/NyqFreq;
            bw = wo/35;
            % [b,a] = designNotchPeakIIR(wo,bw); %replacing iirnotch
            [b,a] = iirnotch(wo,bw);
            if j==1
                EMG_notch(j,:) = filtfilt(b,a,emg(i,:));
            else
                EMG_notch(j,:) = filtfilt(b,a,EMG_notch(j-1,:));
            end
        end

    emg_notchfiltered(i,:) = EMG_notch(4,:);
end