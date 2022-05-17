
location = "D:/Second Semester - Big Files/BCI/Week 13/2068677/EEG-SSVEP-Part1/EEG-SSVEP-Part1/S001a.mat";
raw_data = load(location); %load file
%%
data = raw_data; %only need data, not labels
perm_data = permute(data,[2 3 1]); %correct format for EEGLAB
save(location);

