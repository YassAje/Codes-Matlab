%**************************************************************************
% Sujet TP électronique analogique
% Date :
% Séance :
%**************************************************************************
clear all;
close all;
clc;
%**************************************************************************
% Constantes du circuit
Vcc = 10;
Ic_0 = 10e-3;
Vbe_0 = 0.7;
Vce_0 = Vcc/2;
Ve = 1;
beta = 192;
Rl = 1e3;
zg = 50;
%**************************************************************************
% Dimensionnement du circuit
Ib_0 = Ic_0/beta;
Re = Ve/Ic_0;
R2 = (Vbe_0+Ve)/(9*Ib_0);
R1 = (Vcc-Ve-Vbe_0)/(10*Ib_0);
Rc = (Vcc-Vce_0-Ve)/Ic_0;
Rc = 390;
Icmax = Vcc/(Re+Rc);

%**************************************************************************
% Affichage
display( ['Ic  = ',num2str(Ic_0*1e3), ' mA (DC)']);
display( ['Re = ',num2str(Re), ' Ohms']);
display( ['R1 = ',num2str(R1*1e-3), ' kOhms']);
display( ['R2 = ',num2str(R2*1e-3), ' kOhms']);
display( ['Rc = ',num2str(Rc), ' Ohms']);

%**************************************************************************
subplot(2,2,2);
Ic =  [9.58     9.60    9.64    9.66    9.71    9.73    9.77    9.82    9.97    9.99];
Vce = [1.42     2.36    3.31    4.25    5.20    6.16    7.12    8.09    8.296   8.497];
plot(Vce,Ic,'b',[0 Vcc],[Icmax*1e3 0],'r');
grid on;
xlabel('Vce (V)'),ylabel('Ic (mA)');
title('premier diemension');
axis([0 Vcc 0 20]);

subplot(2,2,1);
axis([0 Ib_0 0 Ic_0]); 
plot(linspace(-Ib_0,0),beta*linspace(Ib_0,0));

ax = gca;
ax.XAxisLocation = 'bottom';
ax.YAxisLocation = 'right';

subplot(2,2,4);
% Avec C=10µF 
Ve0m =   [0.208 0.256 0.292  0.308  0.364 0.408 0.424 0.448  0.448 0.448  0.448   0.452   0.472   0.480    0.488  ];
Vs0m =   [0.256 0.424 0.62  0.8     1.1   1.32   1.5   1.7    1.72  1.74   1.76    1.8    1.82    1.84       1.84  ];
fre =    [4     5     6      7      10    15    20    50     100   500    100e1   100e2  200e2  500e2   100e3];

Av = 20*log10(Vs0m./Ve0m); 
semilogx(fre,Av);
hold on;
xlabel('fréquence (Hz)'),ylabel('Av (dB)');

%**************************************************************************
% Avec C=10nF sans charge
fre =  [50     100   500   1e3   2e3    5e3   10e3  50e3   100e3];
Ve =   [0.456  0.456 0.456 0.464 0.464  0.48  0.48  0.488  0.488 ];
Vs =   [0.0124 0.026 0.138 0.260 0.488  1.08  1.44  1.7    1.72];

Av = 20*log10(Vs./Ve);hold on;
semilogx(fre,Av);

%**************************************************************************
% Avec C=10µF avec rl=1k
fre =   [4       5      6     7      10    15    20    50     100   500   1e3   10e3   20e3   50e3   100e3];
Vem =   [0.212   0.26   0.292 0.316  0.364 0.4   0.424 0.44  0.44   0.44  0.44  0.456  0.456  0.464  0.464];
Vsm =   [0.076   0.128  0.22  0.268  0.52  0.78  0.9   1.1   1.14   1.16  1.18   1.18   1.2    1.22   1.22  ];


Av = 20*log10(Vsm./Vem); 

semilogx(fre,Av);
hold on;
% Avec C=10nF avec rl=1k
fre =  [300    500    700     900     1e3      2e3    5e3    10e3  20e3  50e3   100e3];
Ve =   [0.456  0.456  0.456   0.456   0.456    0.456  0.456  0.456 0.464 0.464  0.464];
Vs =   [0.0024 0.0049 0.0087  0.0136  0.0164   0.061  0.292  0.648 0.96  1.14   1.18 ];


Av = 20*log10(Vs./Ve); 

semilogx(fre,Av);
hold on;

subplot(2,2,3);
% méthode par pertes de signal
zs = Rl*(Vs0m./Vsm -1 ); 
fre =    [4     5     6      7      10    15    20    50     100   500    100e1   100e2  200e2  500e2   100e3];

semilogx(fre,zs);

