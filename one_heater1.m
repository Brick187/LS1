close all; clear all; clc

model = 'one_heater.slx';
open_system(model);

m = 0.004;
cp = 500;
C2K = 273.15;
t0 = 23; 
t0 = t0 + C2K;
T = 23; 
T = T + C2K;
alfa = 0.5;
U = 10;
eps = 0.9;
A = 0.0012;
sig = 0.0000000567;
simOut = sim(model);
T1= simOut.get('simout');
figure;
plot(T1.time,T1.signals.values);
title('Teplota topného tělesa');
xlabel('Čas (s)');
ylabel('Teplota (C)');