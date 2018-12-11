function [latency, ok] = test_signal_verify(in, silence_samples, noise_samples, noise_amplitude)
%VERIFY_TEST_SIGNAL Verify test signal input
    latency = detect_latency(in);
    delay = latency - silence_samples;

    silence_power = sum(in(1:latency).^2) / length(in);
    noise_power = sum(in(latency+1:length(in)).^2) / length(in);
    power_minimum = (noise_amplitude * 0.5 * 0.25) ^ 2;
    ok = delay >= -20 && delay < noise_samples / 1.5 && ...
        noise_power / silence_power > 5 && ...
        noise_power > power_minimum && ...
        sum(abs(in) > .95) / noise_samples < 0.01;
end
