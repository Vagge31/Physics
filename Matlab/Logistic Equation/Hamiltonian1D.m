% Ολοκλήρωση ενός μονοδιάστατου Χαμιλτονιανού συστήματος
clc
% Παράμετροι του συστήματος
m = 1;          % Μάζα
tspan = [0 20]; % Χρονικό διάστημα ολοκλήρωσης
q0 = 1;         % Αρχική θέση
p0 = 0;         % Αρχική ορμή

% Αρχικές συνθήκες (q, p)
y0 = [q0; p0];

V = @(q) q^4/4;             % Παράδειγμα: Δυναμική ενέργεια 
dVdq = @(q) q^3;                   % Παράγωγος της V(q)

% Αριθμητική ολοκλήρωση με ode45
[t, y] = ode45(@(t, y) general_hamiltonian(t, y, m, dVdq), tspan, y0);


% Ανάλυση και Γραφική Παράσταση Αποτελεσμάτων
figure;
plot(t, y(:,1),'r', 'LineWidth', 2);
hold on;
plot(t, y(:,2),'b', 'LineWidth', 2);
xlabel('$t$','Interpreter','latex');
ylabel('$q(t),p(t)$','Interpreter','latex');
legend('$q(t)$', '$p(t)$','Interpreter','latex');
title('Graphs of position and momentum','Interpreter','latex');
grid on;

% Φάση του συστήματος (q-p διάγραμμα)
figure;
plot(y(:,1), y(:,2), 'LineWidth', 2);
xlabel('$q$','Interpreter','latex');
ylabel('$p$','Interpreter','latex');
title('Phase diagram','Interpreter','latex');
grid on;

% Εξισώσεις Χαμιλτονιανού συστήματος
function dydt = general_hamiltonian(~, y, m, dVdq)
    q = y(1); % Θέση
    p = y(2); % Ορμή
    
    dqdt = p / m;         % Εξίσωση για τη θέση
    dpdt = -dVdq(q);      % Εξίσωση για την ορμή (δυναμική ενέργεια)
    
    dydt = [dqdt; dpdt];
end
