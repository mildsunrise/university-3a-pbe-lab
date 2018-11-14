function envelope = envelope_hilbert(signal)
%envelope_hilbert Detect signal envelope by calculating magnitude of Hilbert transform (analytical signal)
    x = fft(signal);
    n = length(x);
    h = [ 1 2*ones(1, ceil(n/2-1)) ones(1, mod(n,2) == 0) zeros(1, ceil(n/2-1)) ];
    hilbert = ifft(x .* h);
    envelope = abs(hilbert);
end