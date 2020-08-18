tspan = [0 1000]; % the range of t over which we will solve the ODEs
w = tan(pi/6) - pi/6 % defining our omega
h0 = 1/(1+w); % setting the initial condition for the ODE

% ODE for dry foam (no surface viscosity)
[t,h] = ode45(@(t,h) -h^(3/2)*(1-h)^(-1/4), tspan, h0);
graph1 = loglog(t,h,'--') % log-log plot, dashed line
set(graph1,'LineWidth',2)
hold on 

a = ((1+w)/w)^(1/2)*(1-h).^(1/2) % curvature radius
graph2 = loglog(t,a)
set(graph2,'LineWidth',2)

title('\textbf{Log-log plot of $\tilde{h}$ and $\tilde{a}$ for dry foam}','Interpreter', 'latex','fontsize',16)
xlabel('Time ($\tilde{t}$)', 'Interpreter', 'latex', 'fontweight','bold','fontsize',16);
ylabel('Lamella thickness ($\tilde{h}$)', 'Interpreter', 'latex','fontweight','bold','fontsize',16);
legend({'Dry foam thickness $\tilde{h}$','Radius of curvature $\tilde{a}$'}, 'FontSize',16,'Interpreter', 'latex')
hold off

