% Define the function to integrate
f = @(x) sqrt(x);

    % Όρια ολοκληρώματος
    a = 1;
    b = 101;
    N = 10^4;
    % Δημιουργία τυχαίων δειγμάτων
    x_samples = a + (b - a) * rand(N, 1);

    % Υπολογισμός της τιμής της συνάρτησης στα τυχαία δείγματα
    f_samples = arrayfun(f, x_samples);

    % Υπολογισμός του Monte Carlo εκτιμητή
    I = (b - a) * mean(f_samples);

    % Εκτύπωση αποτελεσμάτων
    disp(['Crude Monte Carlo Estimate: ', num2str(I)]);

    % Estimate the uncertainty (standard deviation)
    sigma = sqrt(sum((f_samples - mean(f_samples)).^2) / (N - 1));
    dI=(b-a)*sigma/sqrt(N);
    % Εκτύπωση αποτελεσμάτων
    disp(['Crude Monte Carlo Estimate: ', num2str(I)]); 
    e=dI/I;
fprintf('Monte Carlo estimate: %.4f\n', I);
fprintf('e= %.4f\n', e);
