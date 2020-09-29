clc;
clear;
close;


x = -1:0.1:1;       %time axis
w = -40:40;     
w = (2*pi/100)*w;   %frequency-axis

%delta and impulse
impulse = dirac(x);
idx = impulse == Inf; % find Inf
impulse(idx) = 1;     % set Inf to finite value
unitstep = x>=0;

%DTFT
Xdelta = dtft(impulse,x,w);
U = dtft(unitstep,x,w);

%graph
subplot(121)
stem(x,impulse)
title('delta[n]')
subplot(122)
plot(w,abs(Xdelta));
title('X(delta[n])')
figure
subplot(121)
stem(x,unitstep)
title('u[n]')
subplot(122)
plot(w,abs(U));
title('X(u[n])')

function [X] = dtft(x,n,w)
X = exp(-1i*w'*n)*x.';
end

