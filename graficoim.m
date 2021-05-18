% Arquivo para plotar gráfico entre corrente e massa
%
%
%
%
close all;
clc,clf; %limpar figuras

A = 4*10^(-4); % área da seção
n = 300; % número de voltas
h = 0.5*10^(-3); % entreferro
g =9.8 % aceleração da gravidade
mu0 = 4*pi*10^(-7); % permeabilidade do vácuo
m=[0:0.001:1]; % massa do rotor
i=[0:0.5*10^(-3):0.5]; % corrente de base

i=h*sqrt(2*m*g/(mu0*A*n.^2));

plot(m,i,'LineWidth',2)
grid on
hold on
metade=plot(m(500),i(500),'*','LineWidth',3,'MarkerSize',14)
legend(metade,'i_{B1} = 0.2325, m = 0.5 kg','Location','northwest','FontName','Times')
title('Corrente de Base x Massa','FontName','Times')
ylabel('{i_{B1}} (A)','FontName','Times','fontsize',12)
xlabel('m (kg)','FontName','Times','fontsize',12)
print -depsc2 C:\Users\vinic\OneDrive\Documentos\Mestrado\Pesquisa\Relatorios\correntemassa.eps