params.m1 = 1;
params.l1 = 1;
params.m2 = 1;
params.l2 = 1;
init_deviations.theta1_0 = pi/4;
init_deviations.theta2_0 = pi/2;
init_deviations.omega1_0 = 4;
init_deviations.omega2_0 = 1;
t_range = linspace(0, 10, 60);
[t, x1, y1, x2, y2] = pendul2(params, init_deviations, t_range);
figure;
for i = 1:length(t)
    plot([0, x1(i), x2(i)], [0, y1(i), y2(i)], 'k.-', 'LineWidth', 1);
    axis([-2 2 -2 2]);
    axis square;
    xlabel('x');
    ylabel('y');
    title('Double Pendulum Animation');
    drawnow;
end

function [t, x1, y1, x2, y2] = pendul2(params, init_deviations, t_range)
    g = 9.81;
    m1 = params.m1;
    l1 = params.l1;
    m2 = params.m2;
    l2 = params.l2;
    theta1_0 = init_deviations.theta1_0;
    theta2_0 = init_deviations.theta2_0;
    omega1_0 = init_deviations.omega1_0;
    omega2_0 = init_deviations.omega2_0;

    function dxdt = double_pendulum_eqs(t, x)
        theta1 = x(1);
        theta2 = x(2);
        omega1 = x(3);
        omega2 = x(4);

        dtheta1_dt = omega1;
        dtheta2_dt = omega2;

        domega1_dt = (-g * (2 * m1 + m2) * sin(theta1) - m2 * g * sin(theta1 - 2 * theta2) - 2 * sin(theta1 - theta2) * m2 * (omega2^2 * l2 + omega1^2 * l1 * cos(theta1 - theta2))) / (l1 * (2 * m1 + m2 - m2 * cos(2 * theta1 - 2 * theta2)));
        domega2_dt = (2 * sin(theta1 - theta2) * (omega1^2 * l1 * (m1 + m2) + g * (m1 + m2) * cos(theta1) + omega2^2 * l2 * m2 * cos(theta1 - theta2))) / (l2 * (2 * m1 + m2 - m2 * cos(2 * theta1 - 2 * theta2)));

        dxdt = [dtheta1_dt; dtheta2_dt; domega1_dt; domega2_dt];
    end

    init_conditions = [theta1_0; theta2_0; omega1_0; omega2_0];
    [t, x] = ode23(@double_pendulum_eqs, t_range, init_conditions);

    x1 = l1 * sin(x(:, 1));
    y1 = -l1 * cos(x(:, 1));
    x2 = x1 + l2 * sin(x(:, 2));
    y2 = y1 - l2 * cos(x(:, 2));
end
