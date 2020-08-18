tspan = [0 1000]; % the range of t over which we will solve the ODEs
w = tan(pi/6) - pi/6 % defining our omega
h0 = 1/(1+w); % setting the initial condition for the ODE

% ODE for dry foam, no surface viscosity
[t,h] = ode45(@(t,h) -h^(3/2)*(1-h)^(-1/4), tspan, h0);
graph1 = loglog(t,h,'--') % log-log plot, dashed line
set(graph1,'LineWidth',2)
hold on 

% ODE for dry foam, medium surface viscosity
[t,h] = ode45(@(t,h) -10/3*(1+w)*h^(5/2)*(1-h)^(-1/4), tspan, h0);
graph2 = loglog(t,h,'--') % log-log plot, dashed line
set(graph2,'LineWidth',2)

% ODE for semi-dry foam, no surface viscosity
[t,h] = ode45(@(t,h) -h^(3/2)*((1+w)/w)^(1/4), tspan, h0);
graph3 = loglog(t,h) % log-log plot, solid line
set(graph3,'LineWidth',2)

% ODE for semi-dry foam, medium surface viscosity
[t,h] = ode45(@(t,h) -10/3*(1+w)^(5/4)*w^(-1/4)*h^(5/2), tspan, h0);
graph4 = loglog(t,h) % log-log plot, solid line
set(graph4,'LineWidth',2)

title('\textbf{All models: log-log plot of $\tilde{h}$ and $\tilde{t}$}','Interpreter', 'latex','fontsize',16)
xlabel('Time ($\tilde{t}$)', 'Interpreter', 'latex', 'fontweight','bold','fontsize',16);
ylabel('Lamella thickness ($\tilde{h}$)', 'Interpreter', 'latex','fontweight','bold','fontsize',16);
legend({'Dry foam (Brush \& Davis) $V_s << 1$','Dry foam (Brush \& Davis) $V_s \sim O(\epsilon^{-1})$', 'Semi-dry foam (Breward \& Howell) $V_s << 1$', 'Semi-dry foam (Breward \& Howell) $V_s \sim O(\epsilon^{-1})$'}, 'FontSize',16,'Interpreter', 'latex')
hold off