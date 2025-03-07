
initialGuess = 1;  % Provide an initial guess
tolerance = 1e-6;  % Set the tolerance for convergence
maxIterations = 100;  % Set the maximum number of iterations

root = newtonRaphsonMethod(initialGuess, tolerance, maxIterations);
function root = newtonRaphsonMethod(initialGuess, tolerance, maxIterations)
    % Define the function and its derivative
    f = @(x) exp(x) - x^2 - 3;
    df = @(x) exp(x) - 2*x;

    % Initialize variables
    x = initialGuess;
    iteration = 0;

    % Newton-Raphson iteration
    while abs(f(x)) > tolerance && iteration < maxIterations
        x = x - f(x) / df(x);
        iteration = iteration + 1;
    end

    % Output the result
    if abs(f(x)) <= tolerance
        root = x;
        fprintf('Root found: %f\n', root);
    else
        fprintf('Newton-Raphson method did not converge within the given number of iterations.\n');
        root = [];
    end
end