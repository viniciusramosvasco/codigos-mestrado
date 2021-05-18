% Este código será utilizado para obtençao da expressão analítica das forças de relutância horizontal e vertical
syms A n mu i1 i2 i3  x y h alpha1 alpha2 alpha3 beta1 beta2 beta3 i0 ix iy xnew ynew ixnew iynew theta;

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
%i1= i0 + alpha1 * ix + beta1 * iy;
%i2 = i1;
%i2= i0 + alpha2 * ix + beta2 * iy;
%i3= i0 + alpha3 * ix + beta3 * iy;

%% Fluxos totais
phi1 = (n/N)*((R2 + R3)*i1 + R3*i2 - R2*i3);
phi2 = (n/N)*(-R3*i1 -(R1+ R3)*i2 - R1*i3);
phi3 = (n/N)*(-R2*i1 +R1*i2 +(R1 + R2)*i3);

%% Força horizontal e vertical

% Força horizontal e vertical (3 Polos)
%fx = (sqrt(3)/(4*mu*A))*((phi1)^2-(phi2)^2)
%fy = (1/(4*mu*A))*((phi1)^2 + (phi2)^2 - 2*(phi3)^2);

% Força horizontal e vertical (8 Polos)
fx = (mu * A * n^2/4)*(((i0+ix)/(h-x*cos(theta)))^2-((i0 - ix)/(h+x*cos(theta)))^2);
fy = (mu * A * n^2/4)*(((i0+iy)/(h-y*cos(theta)))^2-((i0 - iy)/(h+y*cos(theta)))^2);;
%% Derivadas Parciais de fx e fy
dfxdx = diff(fx,x);
dfxdy = diff(fx,y);
dfxdix = diff(fx,ix);
dfxdiy = diff(fx,iy);

dfydx = diff(fy,x);
dfydy = diff(fy,y);
dfydix = diff(fy,ix);
dfydiy = diff(fy,iy);

%% Ponto de equilibrio desejado
x = 0;
y = 0;
ix = 0;
iy= 0;

%% Avaliação das derivadas parciais no ponto de eq. acima
f1 = subs(dfxdx);
f2 = subs(dfxdy);
f3 = subs(dfxdix);
f4 = subs(dfxdiy);

f5 = subs(dfydx);
f6 = subs(dfydy);
f7 = subs(dfydix);
f8 = subs(dfydiy);

%% Expressão das forças Linearizadas avaliadas no pto de equilibrio 
fxlin =f1 * xnew + f2* ynew + f3 * ixnew + f4* iynew;
fxlin = simplify(fxlin)
fylin =f5 * xnew + f6* ynew + f7 * ixnew + f8* iynew;
fylin = simplify(fylin);
