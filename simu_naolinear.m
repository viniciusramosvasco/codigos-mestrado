format shortG
close all;
clc,clf; %limpar figuras 

tfinal = 3.5; %tempo de simulação
dt = 0.0001;
t = 0:dt:tfinal;

Iz = 0.0017;
J = 0.0592;
kp = 19563.58; %I_base = 0.2325 A
ki = 42.07; %I_base = 0.2325 A
Ki =200; %ganho do integrador
b = 0.137;
d = 0.203;