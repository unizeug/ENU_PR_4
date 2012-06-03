function res = halteglied(x,f,f_T,T_ges)
%Anzahl der Abtastwerte
N = round(f_T*T_ges);
%Periodendauer
T_periode = 1/f;
%Abstand zwischen zwei Abtastwerten
T = 1/f_T;
%Initialisierung des Ergebnisvektors:
res = zeros(1,N);
%Schleife über alle Abtastwerte
%ACHTUNG: MatLab-Indizes beginnen bei 1!
for k = 1:N,
    %Modulo-Test -> Zeit relativ zur Signalperiode
    t_rel = mod((k-1)*T,T_periode);
    if (t_rel == 0)
        val = x(k);
    end
    res(k) = val;
end;