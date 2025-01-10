% Define the potential function V(x)
function V = potential(x)
    % Define your potential function here, for example:
    V = x.^2; % harmonic oscillator potential
    
    % You can replace this with any potential function you want to study.


% Define the function representing Newton's second law
function dxdt = newtons_second_law(t, x)
    % Constants
    m = 1; % mass
    
    % Potential energy function
    V = potential(x);
    
    % Derivative of the potential energy with respect to x
    dV_dx = gradient(V);
    
    % Newton's second law: F = ma = -dV/dx
    dxdt = zeros(size(x));
    dxdt(1) = x(2); % dx/dt = v
    dxdt(2) = -dV_dx/m; % dv/dt = -dV/dx
end

% Define initial conditions and time span
x0 = [0; 0]; % initial position and velocity
tspan = [0 10]; % time span for the simulation

% Solve the differential equation using ode45
[t, x] = ode45(@newtons_second_law, tspan, x0);

% Plot the results
figure;
plot(t, x(:, 1)); % plot position vs. time
xlabel('Time');
ylabel('Position');
title('Position vs. Time');
end