function dbs = amplitude_to_db(x)
%amplitude_to_db Converts values from amplitudes to decibels
    dbs = 20*log10(abs(x));
end