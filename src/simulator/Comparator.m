function [out] = Comparator(input,t_wave)
%[out] = comp(input,t_wave)
%   Compares the input with the Triangle wave 
%   Out=1 if input>wave, else 0           
    
    out = (input > t_wave)*2 - 1;
end

