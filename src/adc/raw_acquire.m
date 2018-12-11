function signal = raw_acquire(signal, Fs, nBits, outputID, inputID)
    channels = size(signal, 2);
    play = audioplayer(signal, Fs, nBits, outputID);
    rec = audiorecorder(Fs, nBits, channels, inputID);

    record(rec);
    playblocking(play);
    stop(rec);

    target_length = size(signal, 1);
    signal = getaudiodata(rec);
    length = size(signal, 1);
    signal = signal(1 + max(0, length - target_length):length, :);
    signal = [ zeros(max(0, target_length - length), channels); signal ];
end
