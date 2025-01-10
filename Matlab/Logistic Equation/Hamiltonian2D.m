% Παράμετροι
m = 1;                  % Μάζα σώματος
M = 1;                  % Μάζα κεντρικού σώματος
G = 1;                  % Σταθερά βαρύτητας
h = 0.01;               % Βήμα χρόνου
t_max = 100;             % Μέγιστος χρόνος
N = t_max / h;          % Αριθμός βημάτων

% Αρχικές συνθήκες
r0 = 3;                 % Αρχική ακτίνα
theta0 = 0;             % Αρχική γωνία
pr0 = 0;                % Αρχική ακτινική ορμή
ptheta0 = 2;            % Αρχική γωνιακή ορμή

% Αρχικοποίηση μεταβλητών
r = zeros(1, N);
theta = zeros(1, N);
pr = zeros(1, N);
ptheta = zeros(1, N);
t = zeros(1, N);

% Ορισμός αρχικών συνθηκών
r(1) = r0;
theta(1) = theta0;
pr(1) = pr0;
ptheta(1) = ptheta0;

% Μέθοδος Euler
for n = 1:N-1
    % Εξισώσεις κίνησης
    drdt = pr(n) / m;
    dthetadt = ptheta(n) / (m * r(n)^2);
    dprdt = ptheta(n)^2 / (m * r(n)^3) - G * M * m / r(n)^2;
    dpthetadt = 0; % Σταθερή ορμή

    % Ενημέρωση μεταβλητών
    r(n+1) = r(n) + h * drdt;
    theta(n+1) = theta(n) + h * dthetadt;
    pr(n+1) = pr(n) + h * dprdt;
    ptheta(n+1) = ptheta(n) + h * dpthetadt;
    t(n+1) = t(n) + h;
end

% Υπολογισμός x, y για την τροχιά
x = r .* cos(theta);
y = r .* sin(theta);

% Γραφική Παράσταση
figure;
plot(x, y, 'LineWidth', 2);
xlabel('$x$','Interpreter','latex');
ylabel('$y$','Interpreter','latex');
title('Trajectory of a particle in potential $V(r)$','Interpreter','latex');
grid on;
axis equal;
