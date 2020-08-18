tspan = [0 1000]; % the range of t over which we will solve the ODEs
h0 = 1; % setting the initial condition for the ODE (remember that we are not working with dry foam variables here)

% ODE for semi-dry foam, no surface viscosity
[t,h] = ode45(@(t,h) -(3*2^(1/2))/16*h^(3/2), tspan, h0);
graph1 = loglog(t,h,'--') % log-log plot, dashed line
set(graph1,'LineWidth',2)
hold on 

% ODE for semi-dry foam, medium surface viscosity
[t,h] = ode45(@(t,h) -(5*2^(1/2))/8*h^(5/2), tspan, h0);
graph2 = loglog(t,h) % log-log plot, solid line
set(graph2,'LineWidth',2)

title('\textbf{Breward \& Howell model (semi-dry foam): log-log plot of $h$}','Interpreter', 'latex','fontsize',16)
xlabel('Time ($t$)', 'Interpreter', 'latex', 'fontweight','bold','fontsize',16);
ylabel('Lamella thickness $(h)$', 'Interpreter', 'latex','fontweight','bold','fontsize',16);
legend({'No surface viscosity','Surface viscosity $V_s \sim O(1)$'}, 'FontSize', 16,'Interpreter', 'latex')
hold off
