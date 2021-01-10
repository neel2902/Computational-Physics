% Question 2A
% Defining the parameters L0 = Length of well and V0 = Potential
format short;
L0 = 2.5;
V0 = 1.5;

% LHS 
f1 = @(x) sqrt((1-x) ./ x);
% symmetric case
f2 = @(x) tan(2.7*L0*sqrt(V0*x));
% RHS - asymmetric case
f3 = @(x) -cot(2.7*L0*sqrt(V0*x));

x = linspace(0, 1, 100)';

% Calculate Y values
y1 = f1(x); 
y2 = f2(x);
y3 = f3(x);

% Plotting the functions with symmetric equation
subplot(1, 2, 1);
plot(x, y1, 'linewidth', 1.5);
title("Symmetric-case Plot");
hold on;
plot(x, y2, 'linewidth', 1.5);
hold off;

% Plotting the functions with asymmetric equation
subplot(1, 2, 2);
plot(x, y1, 'linewidth', 1.5);
title("Asymmetric Plot");
hold on;
plot(x, y3, 'linewidth', 1.5);
hold off;

% Finding the Energy Eigenvalues
% Defining the new functions for Newton Rhapson
fsym = @ (x) f1(x) - f2(x);
fasym = @ (x) f1(x) - f3(x);

% The derivative function
fsym_x = @ (x) ((-1./x) - ((1-x)./x)) ./ (2*sqrt((1-x) ./ x)) - (27*L0*V0*(sec(2.7*L0*sqrt(V0*x))).^2) ./ (20*sqrt(V0*x));
fasym_x = @ (x) ((-1./x) - ((1-x)./x)) ./ (2*sqrt((1-x) ./ x)) - (27*L0*V0*(csc(2.7*L0*sqrt(V0*x))).^2) ./ (20*sqrt(V0*x));

% For symmetric case
% Initial guesses for 3 roots
x = [0.04; 0.3; 0.41];
epsilon = 1.0e-8;
x_new = zeros(3, 1);

for i=1:3
    x_new(i) = x(i) - fsym(x(i)) / fsym_x(x(i));
    count = 0;
    while abs(x_new(i) - x(i)) >= epsilon
            x(i) = x_new(i);
            x_new(i) = x(i) - fsym(x(i)) / fsym_x(x(i));
    end
end
Esym = V0*x_new;

disp("First 3 energy eigenvalues for symmetric case are:");
disp(Esym);
fprintf("\n");

% For asymmetric case
% Initial guesses for 3 roots
x1 = [0.01; 0.36; 0.65];
epsilon = 1.0e-8;
x1_updated = zeros(3, 1);

for i=1:3
    x1_updated(i) = x1(i) - fasym(x1(i)) / fasym_x(x1(i));
    count = 0;
    while abs(x1_updated(i) - x1(i)) >= epsilon
            x1(i) = x1_updated(i);
            x1_updated(i) = x1(i) - fasym(x1(i)) / fasym_x(x1(i));
    end
end

x1_updated;
Easymm = V0*x1_updated;
disp("First 3 energy eigenvalues for asymmetric case are:");
disp(Easymm);
fprintf("\n");

% Creating array of all eigenvalues (symm and asymm);
E = [Esym; Easymm];
E = sort(E');

format short;
fprintf("The first 3 energy eigenvalues are: %d, %d, %d\n", E(1), E(2), E(4));