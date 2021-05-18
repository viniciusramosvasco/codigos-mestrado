clear variables; clc;clf;

% load curvaBH.txt
% 
% H = curvaBH(:,1);
% B = curvaBH(:,2);
% 
% 
% semilogx (H,B,'LineWidth',3)
% legend('Curva B-H Aço Elétrico','Location','northwest','FontName','Times')
% title('Curva B-H Aço Elétrico','FontName','Times')
% ylabel('B (T)','FontName','Times','fontsize',12)
% xlabel('H (A/m)','FontName','Times','fontsize',12)
% print -depsc2 C:\Users\vinic\OneDrive\Documentos\Mestrado\Pesquisa\Relatorios\correntemassa.eps

a=[48 52 58 73 85 103 135 193 80 42 2 -18 -29 -40 -45 -48];
b=[0 0.2 0.4 0.6 0.7 0.8 0.9 1 0.95 0.9 0.8 0.7 0.6 0.4 0.2 0];
a = [a, -a];
b = [b, -b];
plot(a, b,'LineWidth',2)
hold on
grid on
a2=[0 8 25 40 60 100 193];
b2=[0 0.2 0.5 0.7 0.8 0.9 1];
plot(a2, b2,'--','LineWidth',2)

title('Curva de Histerese','FontName','Times')
xticks([0])
set(gca,'xticklabel',[0])
xlabel('Intensidade de campo magnético, H (A/m)','FontName','Times','FontSize',12)
%set(gca,'ytick',[])
yticks([0])
set(gca,'yticklabel',[0])
ylabel('Densidade de Fluxo magnético, B (T)','FontName','Times','FontSize',12)

print -depsc2 C:\Users\vinic\OneDrive\Documentos\Mestrado\Pesquisa\dissertacao\curva_BH.eps
