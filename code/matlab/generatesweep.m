%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Generates a sine sweet of set range, duration, sample rate.
% Padding can be defined.
%
% Note: This code was not produced by the author of this dissertation, but taken
% from the departmental website from the University of York
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ sweep, inverse_filter ] = generatesweep( freq_lower, freq_upper, duration, Fs,  padlength, nowav)
%GENERATESWEEP Generates a logarithmic sine sweep and a corresponding
%inverse filter for deconvolution.

    % Create a timeramp for the sweep
    timeramp = [0:1/Fs:duration-(1/Fs)];
    
    % Calculate the sweep
    sweep = sin((2*pi*freq_lower*duration/log(freq_upper/freq_lower))*(exp((timeramp)*log(freq_upper/freq_lower)/duration)-1));

    % Create an envelope with a ramp at either end
    ramptime = 0.1;
    maxamplitude = 0.95;
    envelope = [ linspace(0,maxamplitude,ramptime*Fs), ones(1,round((duration-(2*ramptime))*Fs))*maxamplitude, linspace(maxamplitude,0,ramptime*Fs) ];

    % Apply the envelope
    sweep = sweep.*envelope;
    
    % Reverse the sweep
    sweep_rev = fliplr(sweep);

    % Apply amp envelope of 6dB/Octave
    % Generate linear range from 0 to -6*log2(number of octaves)
    env_linspace=linspace(0,(-6*(log(freq_upper/freq_lower)./log(2))),length(sweep_rev));
    env_log=10.^(env_linspace./20);
    
    % Multiply by amp envelope
    inverse_filter = sweep_rev.*env_log;
    
	% Apply the padding to the start of the sweep
    if padlength > 0
        
        % Create padding
        padding = zeros(1,padlength*Fs);
        
        % Add a HF burst 1 second before the start of the sweep (for sync)
        padding(((padlength-1)*Fs)+1:((padlength-1)*Fs)+11) = [0,0.1,-0.1,0.1,-0.1,0.1,-0.1,0.1,-0.1,0.1,-0.1];
        
        % Add the padding to the front of the sweep, and 3s after it
        sweep = [padding, sweep, zeros(1,3*Fs)];
        
    end
    
    % Unless we specified otherwise, export the sweep as a wav
    if ~exist('nowav', 'var')
        audiowrite(['Sweep_',num2str(freq_lower),'to',num2str(freq_upper),'_',num2str(Fs),'_pad',num2str(padlength),'s.wav'], sweep, Fs, 'BitsPerSample' , 24);
        audiowrite(['InvSweep_',num2str(freq_lower),'to',num2str(freq_upper),'_',num2str(Fs),'_pad',num2str(padlength),'s.wav'], inverse_filter, Fs, 'BitsPerSample' , 24);
    end
    
end