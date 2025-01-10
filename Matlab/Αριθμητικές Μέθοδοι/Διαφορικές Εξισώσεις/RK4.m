% Ορισμός των παραμέτρων
g = 9.81; % Επιτάχυνση λόγω βαρύτητας (m/s^2)
l = 1; % Μήκος νήματος (m)
theta0 = pi/2; % Αρχική γωνία (rad)
omega0 = 0; % Αρχική γωνιακή ταχύτητα (rad/s)
tspan = [0 10]; % Χρονικό διάστημα
dt = 0.01; % Βήμα χρόνου

% Αρχικοποίηση των μεταβλητών
t = tspan(1):dt:tspan(2);
n = length(t);
theta = zeros(1, n);
omega = zeros(1, n);
theta(1) = theta0;
omega(1) = omega0;

% Συνάρτηση για το σύστημα εξισώσεων
f = @(theta, omega) [omega; -(g/l)*sin(theta)];

% Μέθοδος Runge-Kutta 4ης τάξης
for i = 1:n-1
    k1 = dt * f(theta(i), omega(i));
    k2 = dt * f(theta(i) + 0.5*k1(1), omega(i) + 0.5*k1(2));
    k3 = dt * f(theta(i) + 0.5*k2(1), omega(i) + 0.5*k2(2));
    k4 = dt * f(theta(i) + k3(1), omega(i) + k3(2));
    
    theta(i+1) = theta(i) + (1/6)*(k1(1) + 2*k2(1) + 2*k3(1) + k4(1));
    omega(i+1) = omega(i) + (1/6)*(k1(2) + 2*k2(2) + 2*k3(2) + k4(2));
end

theta_an=theta0*cos(sqrt(g/l)*t);

% Προβολή των αποτελεσμάτων
plot(t, theta);
hold on
plot(t,theta_an);
xlabel('$t$','FontSize',16,'Interpreter','latex');
ylabel('$\theta(t)$','FontSize',16,'Interpreter','latex');
title('Ταλάντωση Απλού Εκκρεμούς με Runge-Kutta 4ης Τάξης');
grid on;