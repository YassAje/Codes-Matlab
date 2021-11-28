clear all;
close all;
clc;

A = [ 0 1 2 3 4 5 6 7 8 9 10];
f = [195.6  195.8 201.9 219.2 237.3 255.9 274.5 293.4 312 315.5 316]*1000;

plot(A,f);
xlabel('amplitude(v)');
ylabel('frequence(Hz)')