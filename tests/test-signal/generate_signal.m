Fs = 48e3;
signal = [];
% Silence between test signals
sep = zeros(1, Fs*200e-3);

% - silenci/soroll
signal = [ signal sep zeros(1, Fs*1) (rand(1, Fs*3)*2-1) ];

% - chirp lineal
F = linspace(17, 21e3, Fs*15);
signal = [ signal sep sin(2*pi*cumsum(F)/Fs) ];

% - chirp logarítmica
F = logspace(log10(17), log10(21e3), Fs*15);
signal = [ signal sep sin(2*pi*cumsum(F)/Fs) ];

% - cosinus a 80
% - cosinus a 440
% - cosinus a 4000
for f = [ 80 440 4000 ]
    signal = [ signal sep ];
    for amplitude = [ 0.1 0.5 1 ]
        signal = [ signal (amplitude * sin(2*pi*(f/Fs)*(1:Fs*1.5))) ];
    end
end

% - cosinus 440 amb amplitud lineal
amplitude = linspace(0, 1, Fs*2);
y = sin( 2*pi*(f/Fs)*(1:length(amplitude)) );
signal = [ signal (amplitude * y) ];

% - dos cosinus, a 340 i a 440
signal = [ signal sep ];
for amplitude = [ 0.1 0.5 1 ]
    t = (1:Fs*1.5);
    y = sin(2*pi*(340/Fs)*t) + sin(2*pi*(440/Fs)*t);
    signal = [ signal (amplitude * y/2) ];
end

% - dos cosinus, a 2000 i 2100
signal = [ signal sep ];
for amplitude = [ 0.1 0.5 1 ]
    t = (1:Fs*1.5);
    y = sin(2*pi*(2000/Fs)*t) + sin(2*pi*(2100/Fs)*t);
    signal = [ signal (amplitude * y/2) ];
end

% Global attenuation to 0.8 amplitude for safetiness
signal = 0.8 * signal;

% Output file!
plot(signal);
title("Generated signal");
audiowrite("test_input.wav", signal, Fs);