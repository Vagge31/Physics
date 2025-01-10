initial_guess = 2;   
error_tol = 1e-6;     
max_iterations = 1000;   
a=1.34;
    f = @(x) x^4-x^3-a^2; 
    df = @(x) 4*x^3-3*x^2;    
    
    x_0 = initial_guess;
    iterations = 0;
    
    while abs(f(x_0)) > error_tol && iterations < max_iterations
        x_0 = x_0 - f(x_0) / df(x_0);
        iterations = iterations + 1;
    end
   
    fprintf('Root: %.3f\n', x_0)
    fprintf('Number of iterations: %d\n', iterations)

