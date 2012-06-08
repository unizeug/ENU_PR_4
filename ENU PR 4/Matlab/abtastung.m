% Technische Universit�t Berlin, Fachgebiet Nachrichten�bertragung
% Praktikum Nachrichten�bertragung im SS 2012
% 4. Termin: Pulsamplitudenmodulation und nichtideale Abtastung

clc;clear;clear all;figure(1);clf(1);figure(2);clf(2);figure(3);clf(3);figure(4);clf(4);%close all;

T_ges = 1;                  % Simulationsdauer in Sekunden

f_T_sim = 400000;           % Abtastfrequenz der Simulation

N = round(f_T_sim*T_ges);   % Anzahl der Werte der Simulation

n = 0:N-1;                  % n-ter Abtastwert
t = n ./ f_T_sim;           % Zeitpunkte der Abtastung
nf = n .* N ./ f_T_sim;     % physikalische Frequenzen für N-Punkte FFT an der Stelle n

% Sinus-Signal mit 2 kHz und 2 V Amplitude

f_sin = 2000;
Omega_sin = 2*pi*f_sin./f_T_sim;
A_sin = 2;

u_sin = A_sin*sin(Omega_sin.*n);

% Variation für alpha_c und f_c

f_vis = 250000;             % Darstellung der Frequenzen von 0 bis f_vis Hz
n_U_vis = f_vis / f_T_sim * N;
n_u_vis = 2*N*1 / f_sin;
Nc = 2;
Na = 3;
i = 1;

%global SI_ZP;
SI_ZP = zeros(1,N);
        
for f_c = [10000 20000] % in kHz
    SI_ZP = zeros(1,N);
    for alpha_c = [0.2 0.5 0.7]
        
        % unipolares Rechtecksignal mit 0..3 V Spannung als Abtastsignal mit f_c als Frequenz
        c = 1.5+rechteck(1.5,alpha_c,f_c,f_T_sim,T_ges);

        % Signalausblendung (Shape-Top-Sampling);
        u_sin_pam = u_sin.*c;         % Zeitsignal nach Abtastung mit Signalausblendung
        U_sin_pam = abs(fft(u_sin_pam)/N);  % Betragsfrequenzgang nach Abtastung mit Signalausblendung
        
        %SI_ZP = zeros(1,N);
        SI_ZP(1:N/f_c) = c(1:N/f_c);
        SI_ZP = SI_ZP ;%.* max(u_sin) .*(f_c*T_ges);
        SI_ZP_fft = abs(fft(SI_ZP)./(N/f_c));  % Betragsfrequenzgang nach Abtastung mit Signalausblendung ...((N/f_c)*alpha_c))
        %SI_ZP_fft = SI_ZP_fft * (1/max(SI_ZP_fft)) * max(U_sin_pam);
        
        figure(1);
<<<<<<< HEAD
        subplot(Nc,Na,i);
        plot(t(1:n_u_vis),u_sin_pam(1:n_u_vis));
%         axis tight;
        ylim([-7 7]);
=======
        subplot(Nc,Na,i);        
        plot(t(1:n_u_vis),u_sin_pam(1:n_u_vis));
        axis tight;
>>>>>>> refs/heads/master
        xlabel('t [s]');
        ylabel('Amplitude [V]');
        title(['\alpha = ' num2str(alpha_c) ' und f_T = ' num2str(f_c)]);
        
        figure(2);
        subplot(Nc,Na,i);
        plot(nf(1:n_U_vis)./1000,U_sin_pam(1:n_U_vis));
        hold on
        plot(nf(1:n_U_vis)./1000,SI_ZP_fft(1:n_U_vis),'r');
        hold off
        axis tight;
        xlabel('f [kHz]');
        if alpha_c == 0.2
            ylabel('Amplitude');
        end
        title(['\alpha = ' num2str(alpha_c) ' und f_T = ' num2str(f_c)]);
        
       
        % Signalverbreiterung (Flat-Top-Sampling);
        u_sin_sh = halteglied(u_sin,f_c,f_T_sim,T_ges);  % Zeitsignal nach Halteglied (Sample&Hold)
        u_sin_sh_pam = u_sin_sh.*c;                      % Zeitsignal nach Abtastung mit Signalverbreiterung
        U_sin_sh_pam = abs(fft(u_sin_sh_pam)/N);         % Betragsfrequenzgang nach Abtastung mit Signalverbreiterung
        
        
        SI_ZP(1:N/f_c) = c(1:N/f_c);
        SI_ZP = SI_ZP .* max(u_sin) .*(f_c*T_ges);
        SI_ZP_fft = abs(fft(SI_ZP)./N);  % Betragsfrequenzgang nach Abtastung mit Signalausblendung ...((N/f_c)*alpha_c))
        %SI_ZP_fft = SI_ZP_fft * (1/max(SI_ZP_fft)) * max(U_sin_pam);        
       
        
        figure(3);
        subplot(Nc,Na,i);
        plot(t(1:n_u_vis),u_sin_sh_pam(1:n_u_vis));
<<<<<<< HEAD
%         axis tight;
        ylim([-7 7]);
=======
        axis tight;
>>>>>>> refs/heads/master
        xlabel('t [s]');
        ylabel('Amplitude [V]');
        title(['\alpha = ' num2str(alpha_c) ' und f_T = ' num2str(f_c)]);


        SI_ZP = zeros(1,N);
        SI_ZP(1:N/f_c) = c(1:N/f_c);
        SI_ZP = SI_ZP ;%.* max(u_sin) .*(f_c*T_ges);
        SI_ZP_fft = abs(fft(SI_ZP)./(N/f_c));  % Betragsfrequenzgang nach Abtastung mit Signalausblendung ...((N/f_c)*alpha_c))
        %SI_ZP_fft = SI_ZP_fft * (1/max(SI_ZP_fft)) * max(U_sin_pam);
        
        
        figure(4);
        subplot(Nc,Na,i);
        plot(nf(1:n_U_vis)./1000,U_sin_sh_pam(1:n_U_vis));
        hold on
        plot(nf(1:n_U_vis)./1000,SI_ZP_fft(1:n_U_vis),'r');
        hold off
        axis tight;
        xlabel('f [kHz]');
        if alpha_c == 0.2
            ylabel('Amplitude');
        end
        title([' \alpha = ' num2str(alpha_c) ' und f_T = ' num2str(f_c)]);
        
%text(0.5, 1,'\bf Do you like this title?','HorizontalAlignment','center','VerticalAlignment', 'top')        



        i = i + 1;
    end
end

figure(1)
SUPTITLE(['\bf Shape-Top Abtastung',10])
figure(2)
SUPTITLE(['\bf Shape-Top Abtastung',10])
figure(3)
SUPTITLE(['\bf Flat-Top Abtastung',10])
figure(4)
SUPTITLE(['\bf Flat-Top Abtastung',10])

%         if i == 6
%             SUPTITLE(['\bf Flat-Top Abtastung',10])
%         end  

%         figure(1);
%         print -painters -dpdf -r600 ../Bilder/ShapeTop_Sign.pdf
%         figure(2);
%         print -painters -dpdf -r600 ../Bilder/ShapeTop_freq.pdf
%         figure(3);
%         print -painters -dpdf -r600 ../Bilder/FlatTop_Sign.pdf
%         figure(4);
%         print -painters -dpdf -r600 ../Bilder/FlatTop_freq.pdf

