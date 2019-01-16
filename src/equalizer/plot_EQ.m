function axis = plot_EQ(axis, centers, bws, y, fs)
%function axis = plot_EQ(y, fs)

    Y = fft(y, 4*fs);
    k = (0 : (4 * fs - 1)) / 4;

    cla(axis);
    hold(axis, 'on');
    
    xlim(axis, [20 k(length(k))/2]);
    ylim(axis, [-12 12]);
    set(axis, 'YGrid', 'on');
    yticks(axis, -10:2:10);
    %xticks(axis, logspace( log10(31.25), log10(16000), 10));
    set(axis, 'XScale', 'log');      %semilogx
    set(axis, 'XGrid', 'on');
    
    xlabel(axis, 'Frequency [Hz]');
    ylabel(axis, 'G [dB]');
    
    for f = centers
        plot(axis, [1 1] * f, ylim(axis), '--', 'Color', [.7 .7 .7]);
    end
    
    plot(axis, k, 20 * log10(abs(Y)));
    
    hold(axis, 'off');
end
