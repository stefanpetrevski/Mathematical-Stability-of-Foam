tspan = [-7 3]; % the range of xi over which we will solve the ODE

h0 = 1.000001 % specify (M1) as the condition as xi becomes small
% we want h0 to be close to (but not equal to 1)

% here t takes the role of xi
% solving numerically the ODE for the transition region profile
[t,h] = ode45(@(t,h) sqrt(2)*(h^(1/2)-h^(-1)), tspan, h0);

graph1 = plot(t,h)
set(graph1,'LineWidth',2)

% set the axes to their usual origins
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

title('\textbf{Shape of (T) in terms of rescaled variables $\hat{h}, \hat{\xi}$}','Interpreter', 'latex','fontsize',16)
xlabel('Transition region length ($\hat{\xi}$)', 'Interpreter', 'latex', 'fontweight','bold','fontsize',16);
ylabel('Lamellar thickness ($\hat{h}$)', 'Interpreter', 'latex','fontweight','bold','fontsize',16);