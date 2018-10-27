function [position, tsum, threshold, hist, bins] = detect_step(signal)
%detect_step Detect position (sample index) of edge in a step signal
%   Given a signal that starts with a low level and
%   then transitions to a high level at some point,
%   find the average position of the edge.

    % Calculate histogram
    [hist, bins] = histcounts(signal);

    % Find and apply threshold
    threshold = bins(otsu_threshold(hist));
    binarized_signal = sign(signal - threshold);

    % Find edge: find max of cumulative sum
    tsum = cumsum(-binarized_signal);
    [~, position] = max(tsum);
end
