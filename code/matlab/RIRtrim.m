%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: The following script can be used to trim audio files.
% The files were initially trimmed to remove 8 second padding.
% They were later re-trimmed to account for system latency.
%
% Author: Lewis Thresh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Locate files
rir_0 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/96/1/0/*.wav');
rir_90 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/96/1/90/*.wav');
rir_180 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/96/1/180/*.wav');
rir_270 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/96/1/270/*.wav');

rir_0_96 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/Original/96/1/0/*.wav');

%calulate number of samples in 8 seconds for 96kHz (REAL RIRs)
start = round(0.05193*96000);

%% Trim 8 second padding
for k = 1:length(rir_0)
    xTemp_0 = audioread(rir_0(k).name);
    xTemp_90 = audioread(rir_90(k).name);
    xTemp_180 = audioread(rir_180(k).name);
    xTemp_270 = audioread(rir_270(k).name);

    %Read audio in starting from 8 seconds
    x0 = audioread(rir_0(k).name,[start length(xTemp_0)]);
    x90 = audioread(rir_90(k).name,[start length(xTemp_90)]);
    x180 = audioread(rir_180(k).name,[start length(xTemp_180)]);
    x270 = audioread(rir_270(k).name,[start length(xTemp_270)]);
    
    %Prepend name with 'Trimmed_'
    newName1 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/HH RIR/Version 2/ODEON RIRs/New RIRs/Trimmed/Trimmed_%s',rir_0(k).name);
    newName2 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/90/Trimmed_%s',rir_90(k).name);
    newName3 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/180/Trimmed_%s',rir_180(k).name);
    newName4 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/270/Trimmed_%s',rir_270(k).name);

    %Write audio out with 8 seconds off the beggining
    audiowrite(newName1,x0,96000);
    audiowrite(newName2,x90,96000);
    audiowrite(newName3,x180,96000);
    audiowrite(newName4,x270,96000);

end

%% Full length 44.1kHz  RIR file locations

rir_0 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/44/1/0/*.wav');
rir_90 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/44/1/90/*.wav');
rir_180 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/44/1/180/*.wav');
rir_270 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/44/1/270/*.wav');

%calulate number of samples in 22ms for 44.1kHz RIRs
start = round(0.05193*44100);

%% trim full length 44.1kHz RIRs instead of down sampling trimmed 96Hz RIRs
%Loop through directory and trim each file
for k = 1:length(rir_0)
    %Load audio files
    xTemp_0 = audioread(rir_0(k).name);
    xTemp_90 = audioread(rir_90(k).name);
    xTemp_180 = audioread(rir_180(k).name);
    xTemp_270 = audioread(rir_270(k).name);

    %Read audio in starting from 22ms
    x0 = audioread(rir_0(k).name,[start length(xTemp_0)]);
    x90 = audioread(rir_90(k).name,[start length(xTemp_90)]);
    x180 = audioread(rir_180(k).name,[start length(xTemp_180)]);
    x270 = audioread(rir_270(k).name,[start length(xTemp_270)]);

    %Prepend file names with 'Trimmed_'
    newName1 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/0/Trimmed_%s',rir_0(k).name);
    newName2 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/90/Trimmed_%s',rir_90(k).name);
    newName3 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/180/Trimmed_%s',rir_180(k).name);
    newName4 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/270/Trimmed_%s',rir_270(k).name);

    %Save trimmed audio
    audiowrite(newName1,x0,96000);
    audiowrite(newName2,x90,96000);
    audiowrite(newName3,x180,96000);
    audiowrite(newName4,x270,96000);
    
end
