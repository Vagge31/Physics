    w = [1, 1];
    x = [-1/sqrt(3), 1/sqrt(3)];
    a = 0;
    b = 4;
    N = 100;
    f = @(x) sqrt(x);
    % Initialize result
    result = 0;
    error = 0;
    % Calculate the integral for each subinterval
    for i = 1:N
        % Map the nodes and weights to the current subinterval [xi, xi+1]
        xi = a + (i - 1) * (b - a) / N;
        xi1 = a + i * (b - a) / N;
        
        % Transform the integral to the [-1, 1] interval
        integral_subinterval = (b-a)/(2*N) * sum(w .* f(0.5 * (xi1 - xi) * x + 0.5 * (xi1 + xi) ));
         
        % Accumulate the result
        result = result + integral_subinterval;
    end
    fprintf('The integral is: %f\n',result)
    