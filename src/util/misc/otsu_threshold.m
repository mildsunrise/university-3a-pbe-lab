function bin = otsu_threshold(hist)
%otsu_threshold Find threshold for uniform histogram using Otsu's method
%   Given a uniform histogram, perform Otsu's method and return index
%   of the selected bin for threshold.
    L = length(hist);
    p = hist / sum(hist);
    omega = cumsum(p);
    mu = cumsum(p .* (1:L));
    mu_t = mu(end);

    sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));
    [~, bin] = max(sigma_b_squared);
end
