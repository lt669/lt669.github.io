%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: The following script provides two functions:
% 1) Prepend files names with 0's to ensure all file names are 3 digits long.
% This allows them to be read by Matlab in acsending order using the 'dir' fuctionality.
% 2) Extract the necessary audio files to produce a folder of RIR files for each grid (1m, 2m, 3m, 4m, 5m)
%
% Author: Lewis Thresh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RENAME FILES
%File file directories for files that need to be renamed
prenamed_0 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/RIRs/0/*.Wav');
prenamed_90 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/RIRs/90/*.Wav');
prenamed_180 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/RIRs/180/*.Wav');
prenamed_270 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/RIRs/270/*.Wav');

%Add 0's before number
for k=1:length(prenamed_0)
    
    [~, f0] = fileparts(prenamed_0(k).name);
    [~, f90] = fileparts(prenamed_90(k).name);
    [~, f180] = fileparts(prenamed_180(k).name);
    [~, f270] = fileparts(prenamed_270(k).name);
       
    % Convert to number
    num0 = str2double(f0);
    num90 = str2double(f90);
    num180 = str2double(f180);
    num270 = str2double(f270);
    
    %Add prepending 0's to the file name and save to a new folder
    oldName1 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/RIRs/0/%s',prenamed_0(k).name);
    newName1 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/96/1/0/%03d_0.Wav', num0);
    copyfile(oldName1, newName1);

    oldName2 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/RIRs/90/%s',prenamed_90(k).name);
    newName2 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/96/1/90/%03d_90.Wav', num90);
    copyfile(oldName2, newName2);

    oldName3 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/RIRs/180/%s',prenamed_180(k).name);
    newName3 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/96/1/180/%03d_180.Wav', num180);
    copyfile(oldName3, newName3);

    oldName4 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/RIRs/270/%s',prenamed_270(k).name);
    newName4 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/96/1/270/%03d_270.Wav', num270);
    copyfile(oldName4, newName4);
end
%% SORT FILES
%Search for trimmed RIR files
rirs_0 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/0/*.Wav');
rirs_90 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/90/*.Wav');
rirs_180 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/180/*.Wav');
rirs_270 = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/270/*.Wav');
%% Loop (2m) (44.1k)
num = 0;
for k=2:(2*15):240 %Start at position number 2 and jump two rows each time (2m)
    for i=k:2:k+12 %Increment in 2's untill final RIR location in the row has been reached
        num = num+1; %Rename the files starting from 001
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/0/%s',rirs_0(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/2/0/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/90/%s',rirs_90(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/2/90/%03d_90.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/180/%s',rirs_180(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/2/180/%03d_180.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/270/%s',rirs_270(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/2/270/%03d_270.Wav', num);
        copyfile(oldName0, newName0);
    end
end
%% Loop (2m) (96k)
num = 0;
for k=2:(2*15):length(rirs_0)
    for i=k:2:k+12
        num = num+1;
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/0/%s',rirs_0(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/2/0/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/90/%s',rirs_90(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/2/90/%03d_90.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/180/%s',rirs_180(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/2/180/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/270/%s',rirs_270(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/2/270/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
    end
end

%% Loop (3m) (44.1k)
num = 0;
for k=32:(3*15):240 %Start at position number 32 and jump three rows each time (3m)
    for i=k:3:k+12 %Increment in 3's untill final RIR location in the row has been reached
        num = num+1;
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/0/%s',rirs_0(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/3/0/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/90/%s',rirs_90(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/3/90/%03d_90.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/180/%s',rirs_180(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/3/180/%03d_180.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/270/%s',rirs_270(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/3/270/%03d_270.Wav', num);
        copyfile(oldName0, newName0);
    end
end
%% Loop (3m) (96k)
num = 0;
for k=32:(3*15):length(rir_0)
    for i=k:3:k+12
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/0/%s',rirs_0(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/3/0/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/90/%s',rirs_90(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/3/90/%03d_90.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/180/%s',rirs_180(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/3/180/%03d_180.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/270/%s',rirs_270(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/3/270/%03d_270.Wav', num);
        copyfile(oldName0, newName0);
    end
end
%% Loop (4m) (44.1k)
num = 0;
for k=4:(4*15):240 %Start at position number 4 and jump four rows each time (4m)
    for i=k:4:k+8 %Increment in 4's untill final RIR location in the row has been reached
        num = num+1;
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/0/%s',rirs_0(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/4/0/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/90/%s',rirs_90(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/4/90/%03d_90.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/180/%s',rirs_180(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/4/180/%03d_180.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/270/%s',rirs_270(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/4/270/%03d_270.Wav', num);
        copyfile(oldName0, newName0);
    end
end
%% Loop (4m) (96k)
num = 0;
for k=4:(4*15):length(rir_0)
    for i=k:4:k+8
        % Convert to number
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/0/%s',rirs_0(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/4/0/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/90/%s',rirs_90(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/4/90/%03d_90.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/180/%s',rirs_180(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/4/180/%03d_180.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/270/%s',rirs_270(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/4/270/%03d_270.Wav', num);
        copyfile(oldName0, newName0);
    end
end
%% Loop (5m) (44.1k)
num = 0;
for k=48:(5*15):240 %Start at position number 48 and jump five rows each time (5m)
    for i=k:5:k+10 %Increment in 5's untill final RIR location in the row has been reached
        num = num+1;
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/0/%s',rirs_0(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/5/0/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/90/%s',rirs_90(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/5/90/%03d_90.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/180/%s',rirs_180(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/5/180/%03d_180.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/1/270/%s',rirs_270(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/44/5/270/%03d_270.Wav', num);
        copyfile(oldName0, newName0);
    end
end
%% Loop (5m) (96k)
num = 0;
for k=48:(5*15):length(rir_0)
    for i=k:5:k+10
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/0/%s',rirs_0(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/5/0/%03d_0.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/90/%s',rirs_90(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/5/90/%03d_90.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/180/%s',rirs_180(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/5/180/%03d_180.Wav', num);
        copyfile(oldName0, newName0);
        oldName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/1/270/%s',rirs_270(i).name);
        newName0 = sprintf('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/ODEON/BulkRIRs/New RIRs/TrimmedNew/96/5/270/%03d_270.Wav', num);
        copyfile(oldName0, newName0);
    end
end