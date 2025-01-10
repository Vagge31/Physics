% Define the Lagrangian function L(q, q_dot, t)
function L = lagrangian(q, q_dot, t)
    % Define your Lagrangian function here, for example:
    m = 1; % mass
    g = 9.81; % gravitational acceleration
    L = 0.5 * m * q_dot^2 - m * g * q; % Example Lagrangian for a simple pendulum
end

% Define parameters
q0 = pi/4; % Initial position
v0 = 0; % Initial velocity
tspan = [0 10]; % Time span
dt = 0.01; % Time step

% Initialize arrays
t = tspan(1):dt:tspan(2); % Time array
q = zeros(size(t)); % Position array
v = zeros(size(t)); % Velocity array

% Initial conditions
q(1) = q0;
v(1) = v0;

% Numerical integration using Euler's method
for i = 1:length(t)-1
    % Compute acceleration using finite difference approximation
    q_dot_dot = (lagrangian(q(i) + dt, v(i), t(i)) - lagrangian(q(i), v(i), t(i))) / dt;
    
    % Update velocity using acceleration
    v(i+1) = v(i) + q_dot_dot * dt;
    
    % Update position using the updated velocity
    q(i+1) = q(i) + v(i+1) * dt;
end

% Plot position vs. time
plot(t, q);
xlabel('Time');
ylabel('Position');
title('Position vs. Time');
grid on;