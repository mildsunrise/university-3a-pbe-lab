%% Measure and analyze

signal = si2;
%signal = test_latency_acquire;
[latency, tsum, threshold, hist, bins, env] = detect_latency(signal);

fprintf("Masured latency [samples]: %d (%.2f ms)\n", ...
    latency, latency / 48e3 * 1e3);


%% Plot

close all

subplot(3,1,1);
stairs([0 bins bins(end)], [0 hist hist(end) 0]);
hold on
plot([threshold, threshold], ylim, 'r');
hold off
title("Envelope histogram");

subplot(3,1,2);
yyaxis right
plot(tsum / length(env));
yyaxis left
plot(signal);
hold on
plot([latency, latency], ylim, 'r', 'LineWidth', 2);
plot(xlim, [threshold, threshold], 'r');
hold off
title("Result overview");

zoom = [ max(1, latency - 200) min(length(signal), latency + 201) ];

subplot(3,1,3);
plot((1:length(signal)) - latency, signal);
hold on
plot((1:length(signal)) - latency, env);
plot([0, 0], ylim, 'r');
hold off
xlim(zoom - latency);
title("Signal close-up");