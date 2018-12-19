function axis = plot_EQ(axis, y, fs)
%function axis = plot_EQ(y, fs)

    Y = fft(y, 4*fs);
    k = (0 : (4 * fs - 1)) / 4;

    plot(axis, k, 20 * log10(abs(Y)));
    
    set(axis, 'XScale', 'log');      %semilogx
    
    xlabel(axis, 'Frequency [Hz]');
    ylabel(axis, 'G [dB]')
    
    xlim(axis, [20 k(length(k))/2]);
    
    ylim(axis, [-12 12]);
    set(axis, 'YGrid', 'on');
    yticks(axis, -10:10);
    xticks(axis, logspace(log10(31.25), log10(16000), 10));
    set(axis, 'XGrid', 'on');
end