function in = test_latency_acquire()

    % 1s silence, then sinus
    fs = 48000;
    signal = [ zeros(fs*1, 1); (rand(fs*1.5, 1)*2-1) ];
    in = raw_acquire(signal, fs, 16, -1, -1)';

end

function m = rows(x)
    dims = size(x);
    m = dims(1);
end

function n = columns(x)
    dims = size(x);
    n = dims(2);
end

function x = crop_rows(x, r)
    x = x(1:min(rows(x), r), :); % crop
    dims = size(x);
    dims(1) = r - rows(x);
    x = [ x; zeros(dims) ]; % pad
end

function signal = raw_acquire(signal, Fs, nBits, outputID, inputID)
    play = audioplayer(signal, Fs, nBits, outputID);
    rec = audiorecorder(Fs, nBits, columns(signal), inputID);

    record(rec);
    playblocking(play);
    stop(rec);

    signal = crop_rows(getaudiodata(rec), rows(signal));
end
