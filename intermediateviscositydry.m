tspan = [0 1000]; % the range of t over which we will solve the ODEs
w = tan(pi/6) - pi/6 % defining our omega
h0 = 1/(1+w); % setting the initial condition for the ODE

% ODE for semi-dry foam, no surface viscosity
[t,h] = ode45(@(t,h) -h^(3/2)*((1+w)/w)^(1/4), tspan, h0);
graph1 = loglog(t,h) % log-log plot, solid line
set(graph1,'LineWidth',2)
hold on

% ODE for semi-dry foam, medium surface viscosity
[t,h] = ode45(@(t,h) -10/3*(1+w)^(5/4)*w^(-1/4)*h^(5/2), tspan, h0); 
graph2 = loglog(t,h) % log-log plot, solid line
set(graph2,'LineWidth',2)

% ODE for semi-dry foam, V_s = 0.3
[t,h] = ode45(@(t,h) -w^(-1/4)/(1/(0.3*h^(3/2)*(1+w)^(1/4))+ 3/(10*h^(5/2)*(1+w)^(5/4))), tspan, h0);
graph3 = loglog(t,h,'--') % log-log plot, dashed line
set(graph3,'LineWidth',2)

% ODE for semi-dry foam, V_s = 1
[t,h] = ode45(@(t,h) -w^(-1/4)/(1/(h^(3/2)*(1+w)^(1/4))+ 3/(10*h^(5/2)*(1+w)^(5/4))), tspan, h0);
graph4 = loglog(t,h,'--') % log-log plot, dashed line
set(graph4,'LineWidth',2)

% ODE for semi-dry foam, V_s = 5
[t,h] = ode45(@(t,h) -w^(-1/4)/(1/(5*h^(3/2)*(1+w)^(1/4))+ 3/(10*h^(5/2)*(1+w)^(5/4))), tspan, h0);
graph5 = loglog(t,h,'--') % log-log plot, dashed line
set(graph5,'LineWidth',2)

title('\textbf{Semi-dry foam: Log-log plot of $\tilde{h}$ under all regimes}','Interpreter', 'latex','fontsize',16)
xlabel('Time ($\tilde{t}$)', 'Interpreter', 'latex', 'fontweight','bold','fontsize',16);
ylabel('Lamella thickness ($\tilde{h}$)', 'Interpreter', 'latex','fontweight','bold','fontsize',16);
legend({'$V_s \ll 1$', '$V_s \sim O(\epsilon^{-1})$', '$V_s = 0.3$', '$V_s = 1$', '$V_s = 5$'}, 'FontSize',16,'Interpreter', 'latex')

hold off
