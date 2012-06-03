% Technische Universität Berlin, Fachgebiet Nachrichtenübertragung
% Praktikum Nachrichtenübertragung im SS 2012
% 4. Termin: Pulsamplitudenmodulation und nichtideale Abtastung

clc;clear;close all;

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
for f_c = [10000 20000] % in kHz
    for alpha_c = [0.2 0.5 0.7]
        
        % unipolares Rechtecksignal mit 0..3 V Spannung als Abtastsignal mit f_c als Frequenz
        c = ???
        
        % Signalausblendung (Shape-Top-Sampling);
        u_sin_pam = ???         % Zeitsignal nach Abtastung mit Signalausblendung
        U_sin_pam = ???         % Betragsfrequenzgang nach Abtastung mit Signalausblendung
        
        figure(1);
        subplot(Nc,Na,i);
        stem(t(1:n_u_vis),u_sin_pam(1:n_u_vis));
        axis tight;
        xlabel('t in s');
        ylabel('Amplitude in V');
        title(['Shape-Top \alpha = ' num2str(alpha_c) ' und f_T = ' num2str(f_c)]);
        figure(2);
        subplot(Nc,Na,i);
        plot(nf(1:n_U_vis)./1000,U_sin_pam(1:n_U_vis)./N);
        axis tight;
        xlabel('f in kHz');
        title(['Shape-Top \alpha = ' num2str(alpha_c) ' und f_T = ' num2str(f_c)]);
        
        % Signalverbreiterung (Flat-Top-Sampling);
        u_sin_sh = ???          % Zeitsignal nach Halteglied (Sample&Hold)
        u_sin_sh_pam = ???      % Zeitsignal nach Abtastung mit Signalverbreiterung
        U_sin_sh_pam = ???      % Betragsfrequenzgang nach Abtastung mit Signalverbreiterung
        
        figure(3);
        subplot(Nc,Na,i);
        stem(t(1:n_u_vis),u_sin_sh_pam(1:n_u_vis));
        axis tight;
        xlabel('t in s');
        ylabel('Amplitude in V');
        title(['Flat-Top \alpha = ' num2str(alpha_c) ' und f_T = ' num2str(f_c)]);
        figure(4);
        subplot(Nc,Na,i);
        plot(nf(1:n_U_vis)./1000,U_sin_sh_pam(1:n_U_vis)./N);
        axis tight;
        xlabel('f in kHz');
        title(['Flat-Top \alpha = ' num2str(alpha_c) ' und f_T = ' num2str(f_c)]);
        
        i = i + 1;
    end
end




