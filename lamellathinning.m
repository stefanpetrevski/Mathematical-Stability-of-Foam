w = tan(pi/6) - pi/6 % defining our omega
tspan = [0 100]; % the range of t over which we will solve the ODE

% First solve the ODE for dry foam
h0 = 1/(1+w); % setting the initial condition for the ODE
[t,h] = ode45(@(t,h) -h^(3/2)*(1-h)^(-1/4), tspan, h0);
graph1 = loglog(t,h,'--') % log-log plot, dashed line
set(graph1,'LineWidth',2)
hold on 

% Now solve the ODE for semi-dry foam
[t,h] = ode45(@(t,h) -h^(3/2)*((1+w)/w)^(1/4), tspan, h0);
graph2 = loglog(t,h) % log-log plot, solid line
set(graph2,'LineWidth',2)

title('\textbf{Log-log plot of dry versus semi-dry foam thinning laws}','Interpreter', 'latex', 'fontweight','bold','fontsize',16)
xlabel('Time ($\tilde{t}$)', 'Interpreter', 'latex', 'fontweight','bold','fontsize',16);
ylabel('Lamella thickness ($\tilde{h}$)', 'Interpreter', 'latex','fontweight','bold','fontsize',16);
legend({'Brush & Davis (Dry)','Breward & Howell (Semi-Dry)'}, 'FontSize',16)
hold off
