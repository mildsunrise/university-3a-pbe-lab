function h = impu_coef(sos)
%function h = impu_sos(sos)

    n = 1e5; % 43025 si no especificat en impz
    h = [1 zeros(1, n-1)];
    
    h = filtrar_sos(sos, h);

end