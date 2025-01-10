initialGuess = 1;  % Provide an initial guess
tolerance = 1e-6;  % Set the tolerance for convergence
maxIterations = 100;  % Set the maximum number of iterations
root = newtonRaphsonMethod(initialGuess, tolerance, maxIterations);
function root = newtonRaphsonMethod(initialGuess, tolerance, maxIterations)
t=-10:0.0001:10;
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
    y=exp(t) - t.^(2) - 3;
plot(t,y,'b');
xlim([-4, 4])
ylim([-6, 6])
xlabel('$x$','Interpreter','latex'), ylabel('$f(x)$','Interpreter','latex')
title('Graph of $f(x)=e^x-x^2-3$','Interpreter','latex')
end
