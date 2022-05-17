% this is with the FFT function from professor + the .mat files from the
% MAMEN dataset = https://figshare.com/articles/dataset/MAMEM_EEG_SSVEP_Dataset_I_256_channels_11_subjects_5_frequencies_/2068677


[PB, freqs, times] = timefreq2004(eeg(1, :)', samplingRate, 'wavelet', 0,...
'freqs', [1 100], 'winsize', 256);

%%
PB = 10 * log10(PB .* conj(PB)); % dB
FFTpower = mean(PB, 2);
plot(freqs, FFTpower)
%%
%plot(PB(:,1)) % plot the power spectrum for the first window
