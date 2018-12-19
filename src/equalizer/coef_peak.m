function sos = coef_peak(fc, B, GdB, fs)
%function sos= coef_peak(fc, B, GdB, fs)

    len = [length(fc), length(B), length(GdB)];
    len = min(len(len ~= 1));
    if isempty(len)
        len = 1;
    end

    fo = fc(1 : min(len, length(fc)));
    Q = 2 * pi * fo / B(1 : min(len, length(B)));
    K = tan(pi*fo/fs);

    GdB = GdB(1 : min(len, length(GdB)));
    G = 10.^(abs(GdB)/20);
    
    bK = G.*K .* (GdB >= 1) + K .* (GdB <= -1);
    aK = K .* (GdB >= 1) + G.*K .* (GdB <= -1);
    div = (Q.*K.^2 + aK + Q);
    
    a0 = ones(len, 1);
    a1 = (2*Q.*K.^2 - 2*Q) ./ div;
    a2 = (Q.*K.^2 - aK + Q) ./ div;
    
    b0 = (Q.*K.^2 + bK + Q) ./ div;
    b1 = (2*Q.*K.^2 - 2*Q) ./ div;
    b2 = (Q.*K.^2 - bK + Q) ./ div;
    
    num = [b0' b1' b2'];
    den = [a0 a1' a2'];
    
    sos = [num den];
end