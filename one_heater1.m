close all; clear all; clc
tclab;
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
% figure;
% plot(T1.time,T1.signals.values);
% title('Teplota topného tělesa');
% xlabel('Čas (s)');
% ylabel('Teplota (C)');
%%
figure(1)
t1s = [];
h1s = [];
ht1 = 0;
h1(ht1);
for i = 1:1200
    tic;
    if i==1
        ht1 = 50;
        h1(ht1);
    end
    if i==600
        ht1 = 0;
        h1(ht1);
    end
    t1 = T1C();
    h1s = [h1s,ht1];
    t1s = [t1s,t1];
    n = length(t1s);
    time = linspace(0,n+1,n);
    clf
    plot(time,t1s,'r.','MarkerSize',10);
    hold on;
    plot(T1.time,T1.signals.values);
    yyaxis left;
    ylabel('Temperature (degC)');
    yyaxis right;
    plot(time,h1s,'o-','LineWidth',1);
    ylabel('Heater (%)');
    xlabel('Time (sec)');
    legend('Temperature measured','Temperature predicted','Heater 1', 'Location','NorthEast');
    drawnow;
    t = toc;
    pause(max(0.01,1.0-t));
end

%%
h1(0);