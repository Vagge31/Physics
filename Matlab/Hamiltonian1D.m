% Ολοκλήρωση ενός μονοδιάστατου Χαμιλτονιανού συστήματος
clc
% Παράμετροι του συστήματος
m = 1;          % Μάζα
tspan = [0 20]; % Χρονικό διάστημα ολοκλήρωσης
x0 = 1;         % Αρχική θέση
p0 = 0;         % Αρχική ορμή

% Αρχικές συνθήκες (x, p)
X0 = [x0; p0];

V = @(x) x^4/4;             % Παράδειγμα: Δυναμική ενέργεια 
dVdx = @(x) x^3;                   % Παράγωγος της V(x)

% Αριθμητική ολοκλήρωση με ode45
[t, y] = ode45(@(t, y) general_hamiltonian(t, y, m, dVdx), tspan, X0);


% Ανάλυση και Γραφική Παράσταση Αποτελεσμάτων
figure;
plot(t, X(:,1),'r', 'LineWidth', 2);
hold on;
plot(t, X(:,2),'b', 'LineWidth', 2);
xlabel('$t$','Interpreter','latex');
ylabel('$x(t),p(t)$','Interpreter','latex');
legend('$x(t)$', '$p(t)$','Interpreter','latex');
title('Graphs of position $x(t)$ and momentum $p(t)$','Interpreter','latex');
grid on;

% Φάση του συστήματος (x-p διάγραμμα)
figure;
plot(X(:,1), X(:,2),'b', 'LineWidth', 2);
xlabel('$x$','Interpreter','latex');
ylabel('$p$','Interpreter','latex');
title('Phase diagram $p=p(x)$','Interpreter','latex');
grid on;

% Εξισώσεις Χαμιλτονιανού συστήματος
function dXdt = general_hamiltonian(~, X, m, dVdx)
    x = X(1); % Θέση
    p = X(2); % Ορμή
    
    dxdt = p / m;         % Εξίσωση για τη θέση
    dpdt = -dVdx(x);      % Εξίσωση για την ορμή (δυναμική ενέργεια)
    
    dXdt = [dxdt; dpdt];
end
