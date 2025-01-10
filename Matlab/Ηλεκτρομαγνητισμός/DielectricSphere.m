clear;
% Παράμετροι
a = 4; % Διάσταση (μπορείς να το τροποποιήσεις)
R = 2; % Διάσταση (μπορείς να το τροποποιήσεις)
x = linspace(-10, 10, 1000); % Συντεταγμένες x
y = linspace(-10, 10, 1000); % Συντεταγμένες y
[X, Y] = meshgrid(x, y); % Δημιουργία πλέγματος
x_c = 4;
y_c = 0;
% Περιορισμός: x^2 + y^2 > R^2
mask = (X.^2 + Y.^2 > R^2); % Μάσκα για το περιορισμένο πεδίο

% Υπολογισμός του δυναμικού V με τον περιορισμό
V = @(x, y, a, R) (1./sqrt(x.^2 + y.^2 + a^2 - 2*a*x)) - ...
                   (1./sqrt(R^2 + (sqrt(x.^2 + y.^2)*a/R).^2 - 2*a*x));

% Υπολογισμός των συνιστωσών του ηλεκτρικού πεδίου (αρνητικό του βαθμωτή του δυναμικού)
[Vx, Vy] = gradient(V(X, Y, a, R), x, y);

% Εφαρμογή της μάσκας στο ηλεκτρικό πεδίο
Vx = Vx .* mask; % Εφαρμογή μάσκας στις συνιστώσες του ηλεκτρικού πεδίου
Vy = Vy .* mask;
theta = linspace(0, 2*pi, 100); % Ορίζεις τις γωνίες από 0 έως 2π
x = R * cos(theta); % Συντεταγμένες x του κύκλου
y = R * sin(theta); % Συντεταγμένες y του κύκλου
X_1 = (R/5)*cos(theta)+x_c;
Y_1 = (R/5)*sin(theta)+y_c;

% Σχεδίαση των γραμμών ροής του πεδίου με streamslice
figure;
l = streamslice(X, Y, -Vx, -Vy, 3); % Δημιουργία γραμμών ροής
set(l, 'Color', 'r'); % Χρώμα των γραμμών ροής (κόκκινο)
title('Electric potential outside the sphere $(r>R)$','Interpreter','latex');
xlabel('$x$','Interpreter','latex');
ylabel('$y$','Interpreter','latex');
axis equal;
hold on;
fill(X_1, Y_1, 'r', 'EdgeColor', 'r', 'LineWidth', 2);% Σχεδιάζουμε το φορτίο σαν κόκκινο σημείο
hold on;
text(x_c-0.1, y_c+0.04,'$q$', 'FontSize', 15,'Interpreter','latex'); % Προσθήκη κειμένου για το φορτίο
hold on;
plot(x, y,'--r'); % Σχεδίαση του κύκλου
grid on;
set(l,'LineWidth',1.5)
set(l,'Color','b');
hold off;
xticks([]); % Αφαίρεση των αριθμών στον άξονα x
yticks([]);
box off;
