clear

%periodisches bipolars Rechtecksignal
%Amplitude: 2V
A = 1.0;
%Dauer des Signals: 1.0s
T_ges = 1.0;
%Abtastfrequenz: 1MHz
f_T = 1E6;
%Frequenz des Signals: 100Hz
f = 100;
fc = 2000;
%DutyCycle: 0 < alpha < 1
alpha = 0.5;



%      // AM //      %


%Berechnung der Signale mit offset
r = rechteck(A, 0.5, f, f_T, T_ges) +1;

d = dreieck(A, 0.5, f, f_T, T_ges) +1;

s = cosinus(A, 0.5, f, f_T, T_ges) +1;


% carrier
c = cosinus(A, 0.5, fc, f_T, T_ges);



% Moduliert
%  FFTshiftplot(c.*r, T_ges, f_T, A,'r', 1)

% modem
 %plotFFT(c.*d.*c, T_ges, f_T, A, 2)

% carrier
 %plotFFT(c, T_ges, f_T, A, 3)

% zu übertragendes Signal

 %plotFFT(d, T_ges, f_T, A, 4)


%      // FM //      %

T_ges = 0.5;

f = 1000;
t = 0:(1/f_T):T_ges;
N = round(f_T*T_ges);
um = zeros(1,N);

u = cos(2*pi*f.*t); %cosinus(A, 0.5, f, f_T, T_ges);

K_FM = 1/200;


integ = cumsum(u);



for k = 1:N

    % phi = 2*pi*f_c*t + integ(t)
    um(k) = A * cos(2*pi*fc*t(k) + K_FM *integ(k));
    
end;


plotFFT(u, T_ges, f_T, A, 2)

FFTshiftplot(um, T_ges, f_T, A,'r', 3)
