% Este código será utilizado para obtençao da expressão analítica das forças de relutância horizontal e vertical
% Considerações: 
% correntes de base ótimas, isto é, I01 = I02  e I03 = 0
% angulo de orientação theta = pi/6
% entreferros com valor aproximado, e não com valor real, com raiz quadrada.

syms A n mu i1 i2 i3  I01 id1 id3 x y h xnew ynew id1new id3new;

clc;
%% Relutâncias
%R1 = (1/(mu *A))*sqrt((h*(sqrt(3)/2)-x)^2+((h/2)-y)^2);
%R2 = (1/(mu *A))*sqrt((h*(sqrt(3)/2)+x)^2+((h/2)-y)^2);
%R3 = (1/(mu *A))*sqrt(x^2+(h+y)^2);

% As relutâncias também podem ser aproximadas pelas expressões abaixo. O
% resultado é o mesmo
R1 = (1/(mu *A))*(h-x*sqrt(3)/2-y/2);
R2 = (1/(mu *A))*(h+x*sqrt(3)/2-y/2);
R3 = (1/(mu *A))*(h+y);

N = R1*R2 + R1*R3 + R2*R3;

%% Correntes nas bobinas
i1= I01 + id1;
i2 = i1;
%i2= i0 + alpha2 * ix + beta2 * iy;
i3= id3;

%% Fluxos totais
phi1 = (n/N)*((R2 + R3)*i1 + R3*i2 - R2*i3);
phi2 = (n/N)*(-R3*i1 -(R1+ R3)*i2 - R1*i3);
phi3 = (n/N)*(-R2*i1 +R1*i2 +(R1 + R2)*i3);

%% Força horizontal e vertical
fx = (sqrt(3)/(4*mu*A))*((phi1)^2-(phi2)^2);
fy = (1/(4*mu*A))*((phi1)^2 + (phi2)^2 - 2*(phi3)^2);

%% Derivadas Parciais de fx e fy
dfxdx = diff(fx,x);
dfxdy = diff(fx,y);
dfxdid1 = diff(fx,id1);
dfxdid3 = diff(fx,id3);

dfydx = diff(fy,x);
dfydy = diff(fy,y);
dfydid1 = diff(fy,id1);
dfydid3 = diff(fy,id3);

%% Ponto de equilibrio desejado
x = 0;
y = 0;
id1 = 0;
id3= 0;

%% Avaliação das derivadas parciais no ponto de eq. acima
f1 = subs(dfxdx);
f2 = subs(dfxdy);
f3 = subs(dfxdid1);
f4 = subs(dfxdid3);

f5 = subs(dfydx);
f6 = subs(dfydy);
f7 = subs(dfydid1);
f8 = subs(dfydid3);

%% Expressão das forças Linearizadas avaliadas no pto de equilibrio 
fxlin =f1 * xnew + f2* ynew + f3 * id1new + f4* id3new;
fxlin = simplify(fxlin)
fylin =f5 * xnew + f6* ynew + f7 * id1new + f8* id3new;
fylin = simplify(fylin);
