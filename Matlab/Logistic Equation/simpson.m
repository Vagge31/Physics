
f = @(x) x^2 * exp(3*x);

    % Integration limits
    a = -1;
    b = 1;

    % Number of intervals (even for Simpson's rule)
    n = 20;

    % Step size
    h = (b - a) / n;

    % Initialize sum
    result = f(a) + f(b);

    % Compute sum of odd terms
    for i = 1:2:(n-1)
        result = result + 4 * f(a + i * h);
    end

    % Compute sum of even terms
    for i = 2:2:(n-2)
        result = result + 2 * f(a + i * h);
    end

    % Multiply by step size and divide by 3
    result = (h / 3) * result;
    fprintf('The value of the integral is: %.4f\n',result);