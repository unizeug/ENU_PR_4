
f=linspace(1,195318,195318);
plot(f,A)
%xlim([18000 195300])
%xlim([96000 100000])

%fftshift



%Dauer des Signals: 1.0s
T_ges =0.05;
%Abtastfrequenz: 1MHz
f_T = 2*1E2;

%datei einlesen
y = A;
%Berechnung des Spektrums
y_DFT = fft(y);
y_DFT = fftshift(y_DFT);
N = length(y);
%Betragsspektrum
y_DFT_abs = abs(y_DFT)/N;
%Phasenspektrum
y_DFT_phase = unwrap(angle(y_DFT)/N);
%Zeitachse
t = T_ges*(0:(N-1))/(N-1);
%Frequenzachse
f_DFT = f_T*(0:(N-1))/(N-1);
%neues Fenster zur Darstellung
figure(1);
%Darstellung des Zeitsignals
subplot(3,1,1);
plot(t,y);
ylim([-3 3]);
xlim([0 0.05]);
title('Zeitsignal');
xlabel('t/s');
ylabel('u/V');
%Darstellung des Amplitudenspektrums
subplot(3,1,2);
semilogy(f_DFT, y_DFT_abs,'.-'); 
title('Amplitudenspektrum');
xlim([99.5 100.5]);
ylim([10^(-3) max(A)]);
xlabel('f/Hz');
ylabel('A(f)');    
%Darstellung des Phasenspektrums
subplot(3,1,3);
plot(f_DFT, y_DFT_phase);
xlim([99.5 100.5]);
title('Phasenspektrum');
xlabel('f/Hz');
ylabel('phi(f)');