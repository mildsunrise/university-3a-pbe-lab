function [out] = Comparator(input,t_wave)
%[out] = comp(input,t_wave)
%   Compares the input with the Triangle wave 
%   Out=1 if input>wave, else 0           
    
    out = sign(input-t_wave);
end

