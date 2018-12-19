function [out] = Ampl(s,Vdd)
%[out] = Switch(s,A)
%   Enter a signal (s) and the gain (G) and it switch the stage of the
%   signal as the filter LC needs. 
out=Vdd*s;
end

