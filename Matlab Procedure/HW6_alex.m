
location = "C:/Users/alexc/OneDrive/Documents/Taiwan Classes/Second Semester/Brain Computer Interfaces/Week 13/BCI-HW6/Matlab Procedure/Dataset/";
folder1 = "8Hz/"; 
folder2 = "14Hz/";
folder3 = "28Hz/";

matFiles = dir(location + folder3 +"*.mat") ; 
N = length(matFiles); %not used anymore
eeg_data = {};

for j = 1:4 % 4 subjects
    for i = 1:5 %only 5 files per subject, per Hz
       load(location + folder3 +'SSVEP_28Hz_Trial'+i+'_SUBJ'+j+'.MAT')
       eeg_data = [eeg_data, EEGdata];
    end
end

%%
samplingRate = 256;
FFTpower = [];
O1 = 15;
OZ = 23;
O2 = 28;

Occ = [O1, OZ, O2];
for j = 1:3
    for i = 1:N  %N being the number of files in the subfolder
        %Get the FFT of Channel
        [PB, freqs, times] = timefreq2004(eeg_data{1,i}(Occ(j),:)', samplingRate, 'wavelet', 0,...
        'freqs', [1 30], 'winsize', 256);
        PB = 10 * log10(PB .* conj(PB));
        idx = (times>5000 & times<20000);
        %FFTpower = mean(PB, 2);
        if(j>=2)
            FFTpower(i+(N*(j-1)),:) = mean(PB(:,idx), 2);
        else
            FFTpower(i,:) = mean(PB(:,idx), 2); 
        end
        plot(freqs, FFTpower)
        hold on;
    end
end


