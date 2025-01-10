N=10^4;
R=5;
r=4;
h=3;
    % Initialize counters
    m=0;
    % Generate N random points within the bounding cube
    for i = 1:N
        % Generate random coordinates within the bounding cube
        x = -R + 2 * R * rand();
        y = -R + 2 * R * rand();
        z = -R + 2 * R * rand();

        % Check if the point is within the spherical ring
        distance_to_center = sqrt(x^2 + y^2 + z^2);
        if distance_to_center >= r && distance_to_center <= (r + 2 * h)
            m = m + 1;
        end
    end

    % Estimate the volume and uncertainty
    V = (2 * R)^3;
    p = m/N;
    I = V * p;
    % Calculate the uncertainty (standard deviation)
    dI= V * sqrt(p * (1 - p) / N);
    fprintf('The volume of the ring is I= %f\n',I)
    fprintf('The uncertainty is δΙ= %f\n',dI)