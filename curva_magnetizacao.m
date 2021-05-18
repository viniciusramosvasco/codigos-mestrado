%https://www.mathworks.com/help/physmod/sps/examples/custom-inductor-b-h-curve.html

mu_0 = pi*4e-7; %Permeabilidade do vácuo
mu_r = 3000; % permeabilidade relativa do núcleo
Nw = 100; % nº voltas bobina
le = 0.02; % comprimento efetivo do núcleo
Ae = 1e-05; % área da seção transversal do núcleo
B_sat_begin = 0.75; % início saturação núcleo
B_sat = 1.5; % núcleo totalmente saturado

% Use linear representation to find value of H corresponding to B_sat_begin
H_sat_begin = B_sat_begin/(mu_0*mu_r);
% Rearrange nonlinear representation to calculate coefficient, a
a = atanh( B_sat_begin/B_sat )/H_sat_begin;

% Linear representation
H_linear = [-500 500];
B_linear = mu_0*mu_r*H_linear;

% Nonlinear representation
H_nonlinear = -5*H_sat_begin:H_sat_begin:5*H_sat_begin;
B_nonlinear = B_sat*tanh(a*H_nonlinear);

if ~exist('h1_ee_custom_inductor', 'var') || ...
        ~isgraphics(h1_ee_custom_inductor, 'figure')
    h1_ee_custom_inductor = figure('Name', 'ee_custom_inductor');
end
figure(h1_ee_custom_inductor)
clf(h1_ee_custom_inductor)

plot( H_linear, B_linear,'--', H_nonlinear, B_nonlinear,'LineWidth',2 );
grid( 'on' );
title( 'Curva B-H','FontName','Times' );
xticks([-1000 -750 -500 -250 0 250 500 750 1000])
xlabel( 'Intensidade de campo magnético, H (A/m)','FontName','Times','fontsize',12 );
ylabel( 'Densidade de fluxo magnético, B (T)','FontName','Times','fontsize',12 );
legend( 'B=\mu_0 \mu_r H', 'curva B-H', 'Location', 'NorthWest' )