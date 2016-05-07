%% Load real RIRs
real = dir('/Users/Lewis/Uni Work/4th Year/Project/Room Measurements/HH RIR/Version 2/Real RIRs/V4/Trimmed/44/*.Wav');

%% Manually set multiplier
mult = 0.03;
mult_w = mult;
mult_x = mult;
mult_y = mult;
mult_z = mult;

%% Normalisation Loop
for i=1:length(real)
    %read in audio file
    real1 = audioread(real(i).name);

    % Split channels
    real_w = real1(:,1);
    real_x = real1(:,2);
    real_y = real1(:,3);
    real_z = real1(:,4);

    % Calibrate
    realOut = zeros(length(real1),4);
    
    for k=1:length(real_w)
        realOut(k,1) = real_w(k)*mult_w;
    end
    for k=1:length(real_x)
        realOut(k,2) = real_x(k)*mult_x;
    end
    for k=1:length(real_y)
        realOut(k,3) = real_y(k)*mult_y;
    end
    for k=1:length(real_z)
        realOut(k,4) = real_z(k)*mult_z;
    end

    % Render new audio file
    newName = sprintf('%s',real(i).name);
    audiowrite(newName,realOut,44100);
end