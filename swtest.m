function [h, p] = swtest(x, alpha)
    % Shapiro-Wilk test for normality
    if nargin < 2
        alpha = 0.05;
    end
    [h, p] = swtest(x, alpha);
end
