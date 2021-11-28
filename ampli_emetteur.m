%clear all;
close all;
clc;
%***************************
% Constantes du circuit
Vcc = 10;
%%VGSoff = -2.716;
%%Idss = 7.56e-3;
%%Id0 = 1e-3;
Vds = Vcc/2 ;
%%Vss = -10;
H = 100e-6;
f0 = 400e3;
C = 1/H * 1/(2*pi*f0)^2; 
BP = 40e3;
Q = f0/BP;
R = 10/(sqrt(C/H));
Vth = 1.92;
Vthpi4 = Vth + Vth/3;
Id_pi4 = 0.784 / 10;
Idss = 8.6e-3;
Vgsoff = -2.9;
Id0 = 2*Idss/3;
%**************************************************************************
% Dimensionnement du circuit
VGso = Vgsoff * (1 - sqrt(Id0/Idss));
Vs0  = -(VGso);
Rs = Vs0/Id0;
%Rp  = (Vs0 - Vss)/(2 * Id0) ;
Vrd = Vcc - Vds - Vs0;
Rd = Vrd / Id0;
VGs = -0.81;
g_m = (-2)*Idss/Vgsoff * (1 - VGs/Vgsoff);

%**************************************************************************

%%V  =   [-3     -1.4  -1.3   -1.2  -1.1  -1    -0.9  -0.8  -0.7  -0.6  -0.5  -0.4  -0.3  -0.2  -0.1  0     0.1    0.2  0.3  0.4   0.5   0.6    0.7   0.8   0.9   1     1.2  1.5   2    2.5   2.7    2.8   2.9   3];Vo =   [10     10    9.99   9.98  9.92  9.81  9.65  9.43  9.17  8.88  8.56  8.23  7.88  7.52  7.15  6.77  6.4    6.03 5.65 5.29  4.93  4.58   4.26  3.97  3.72  3.51  3.25 3.06  2.91 2.83  2.81   2.8   2.79  2.77];
%%Vs =   [1.31   1.31  1.311  1.314 1.321 1.335 1.356 1.385 1.417 1.451 1.489 1.529 1.57  1.613 1.659 1.704 1.752  1.8  1.85 1.902 1.954 2.007  2.061 2.113 2.162 2.206 2.27 2.327 2.38 2.416 2.428  2.434 2.44  2.446];
%%figure(1);
%%plot(V,Vo,'b',V,Vs,'r');
%%grid on;
%%xlabel('V');
%%ylabel('Vo(b) Vs(r)');
%%hold on ;
%%Av = 20*log10(Vo./Vs);
%%plot(V,Av);
%%hold off;

%**************************************************************************

%%Ve  = [0.0066 0.00664 0.0076  0.0082  0.0086  0.01   0.0112 0.0192 0.0448 0.088 0.168 0.328 0.432 0.472 0.488 0.488 0.488 0.44  0.316  ];
%%Vo2 = [0.0082 0.0136  0.026   0.0328  0.0392  0.0512 0.0656 0.126  0.312  0.616 1.2   2.32  2.88  2.88  2.08  1.52  1.24  0.252 0.116 ];
%%figure(2);
%%Av2 = 20*log10(Vo2./Ve);
%%semilogx(fre,Av2);
%%grid on;
%%xlabel('fréquence(Hz)');
%%ylabel('gain(dB)');
%**************************************************************************
%Avec deuxieme transfor , vpp=20 ,ve = Vgate , vo = Vdrain , sans charge

%fre = [10 20 30 40 50  100    200    300 400 500 1000]*e3;
%Ve3 = [0.464  0.576  0.576  0.584   0.592  0.64  1.04  1.2   0.488 0.344 0.264 0.216 0.176 0.124 0.088 0.18   0.124 0.0124 0.0376 0.01];
%Vo3 = [2.56   3.92   3.92   4       4.08   4.32  6     6.4   3.24  2.32  1.78  1.44  1.2   0.86  0.6  1.24   0.84   0.0672 0.072  0.02  ];

%%figure(3);
%Av3 = 20*log10(Vo3./Ve3);
%semilogx(fre,Av3);
%grid on;
%hold on; 
figure;
fre = 1e2*[ 100  200 300 400 500  100e1 200e1 300e1 400e1 500e1 100e2];
Bdin = -22.2;
Bdout = [ -27 -27 -27 -27 -27 -21.4 -18.6 -8.99 3.41 -21.4 -27 ] ;
Av4 = Bdout - Bdin ;
%Av4 = 20*log10(Vo4./Ve4);
semilogx(fre,Av4);......................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
grid on;
hold on;
xlabel('[Hz]'), ylabel('dB');
%**************************************************************************
fre1 = 1e2*[ 100  200 300 400 500  100e1 200e1 300e1 400e1 500e1 600e1 700e1 800e1 900e1 100e2 150e2 200e2];
Bdin1 = -6.17;
Bdout1 = [ 7.05 6.65 6.65 6.65 6.65 6.65 6.65 6.65 6.65 6.65 6.65 6.25 6.25 6.25 5.85 5.05 4.25] ;
%mode commun avec partie transistor à vss
%fre = [5    10   100   1e3  1e4   1e5     1e6   ];
%Ve5 = [6.16 6.08 6.08  6.08 9.4  9.8     9.8  ] ;
%Vo5 = [3.44 4.8  5.92  5.92 0.044    0.152   1.14  ];
Av1 = Bdout1 - Bdin1 ;

semilogx(fre1,Av1);......................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
grid on;
hold on;
xlabel('[Hz]'), ylabel('dB');
%Av5 = 20*log10(Vo5./Ve5);
%semilogx(fre,Av5);
%grid on;
