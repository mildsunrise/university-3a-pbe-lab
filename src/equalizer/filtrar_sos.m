function y = filtrar_sos(sos, x)
%function y = filtrar_sos(sos, x)
    
    y = x;
    for i = 1 : size(sos, 1)
        y = filter(sos(i, (1:3)), sos(i, (4:6)), y);
    end

end