function plotFFT (y, T_ges, f_T, A, fig)

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
f_DFT = f_T*((-N/2 + 0.5): (N/2 - 0.5))/(N-1);
%neues Fenster zur Darstellung
figure(fig);
clf(fig);
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
%xlim([0 4000]);
ylim([-30 max(A)]);
xlabel('f/Hz');
ylabel('A(f)');    
%Darstellung des Phasenspektrums
subplot(3,1,3);
plot(f_DFT, y_DFT_phase);
%xlim([0 4000]);
title('Phasenspektrum');
xlabel('f/Hz');
ylabel('phi(f)');