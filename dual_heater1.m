close all; clear all; clc

model = 'dual_heater.slx';
open_system(model);

C2K = 273.15;

t0 = 23; 
t0 = t0 + C2K;

T = 23; 
T = T + C2K;


alfa = 0.01; 
alfa2 = 0.0075; 

cp = 500; 
A = 7e-4; 
As = 5e-4; 

m = 4e-3; 
U = 10;
eps = 0.5; 
sigma = 5.67e-8;

simOut = sim(model);
T1= simOut.get('simout');
figure;
plot(T1.time,T1.signals.values);
title('Teplota topného tělesa');
xlabel('Čas (s)');
ylabel('Teplota (C)');
%%
figure(1)
t1s = [];
t2s = [];
h1s = [];
h2s = [];
ht1 = 0;
ht2 = 0;
h1(ht1);
h2(ht2);
for i = 1:600
    tic;
    if i==1
        ht1 = 90;
        h1(ht1);
    end
    if i==300
        ht2 = 80;
        h1(ht1);
        h2(ht2);
    end
    t1 = T1C();
    t2 = T2C();
    h1s = [h1s,ht1];
    h2s = [h2s,ht2];
    t1s = [t1s,t1];
    t2s = [t2s,t2];
    n = length(t1s);
    time = linspace(0,n+1,n);
    clf
    plot(time,t1s,'r.','MarkerSize',10);
    hold on;
    plot(time,t2s,'b.','MarkerSize',10);
    legend('Temperature 1','Temperature 2','Location','NorthWest');
    plot(time,h1s,'r-','LineWidth',2);
    plot(time,h2s,'b--','LineWidth',2);
    plot(T1.time,T1.signals.values);
    yyaxis right;
    ylabel('Temperature (degC)');
    yyaxis left;
    ylabel('Heater (0-5.5 V)');
    xlabel('Time (sec)');
    legend('Heater 1','Heater 2','Location','NorthWest');
    drawnow;
    t = toc;
    pause(max(0.01,1.0-t));
end

disp('Turn off heaters')
h1(0);
h2(0);


