% Este c�digo ser� utilizado para obten�ao da express�o anal�tica das for�as de relut�ncia horizontal e vertical
syms A n mu i1 i2 i3 I01 I02 I03 id1 id2 id3 x y h alpha1 alpha2 alpha3... 
     beta1 beta2 beta3 i0 ix iy xnew ynew ixnew iynew theta;

clc;
%% Relut�ncias
%R1 = (1/(mu *A))*sqrt((h*(sqrt(3)/2)-x)^2+((h/2)-y)^2);
%R2 = (1/(mu *A))*sqrt((h*(sqrt(3)/2)+x)^2+((h/2)-y)^2);
%R3 = (1/(mu *A))*sqrt(x^2+(h+y)^2);

% As relut�ncias tamb�m podem ser aproximadas pelas express�es abaixo. O
% resultado � o mesmo
R1 = (1/(mu *A))*(h-x*sqrt(3)/2-y/2);
R2 = (1/(mu *A))*(h+x*sqrt(3)/2-y/2);
R3 = (1/(mu *A))*(h+y);

N = R1*R2 + R1*R3 + R2*R3;

%% Correntes nas bobinas
%i1= i0 + alpha1 * ix + beta1 * iy;
%i1 = I01 + id1;
%i2 = I02 + id2;
%i2= i0 + alpha2 * ix + beta2 * iy;
%i3= i0 + alpha3 * ix + beta3 * iy;
%i3 = I03 + id3;

%% Fluxos totais
phi1 = (n/N)*((R2 + R3)*i1 + R3*i2 - R2*i3);
phi2 = (n/N)*(-R3*i1 -(R1+ R3)*i2 - R1*i3);
phi3 = (n/N)*(-R2*i1 +R1*i2 +(R1 + R2)*i3);

%% For�a horizontal e vertical
%fx = (sqrt(3)/(4*mu*A))*((phi1)^2-(phi2)^2);
%fy = (1/(4*mu*A))*((phi1)^2 + (phi2)^2 - 2*(phi3)^2)

fx = (1/(2*mu*A))*((phi1)^2 * cos(theta) + (phi2)^2 * cos(theta + (2*pi/3)) + (phi3)^2 * cos(theta - (2*pi/3))).
fy = (1/(2*mu*A))*((phi1)^2 * sin(theta) + (phi2)^2 * sin(theta + (2*pi/3)) + (phi3)^2 * sin(theta - (2*pi/3)));

%% Encontrando i0 que atenda �s condi��es de fx e fy
% Para rotor na vertical, fx = fy = 0

