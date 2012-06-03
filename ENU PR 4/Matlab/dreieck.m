function res = dreieck(A,alpha,f,f_T,T_ges)
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
    if(t_rel < alpha*T_periode)
        res(k) = -A+t_rel*(2*A/(alpha*T_periode));
    else
        res(k) = 1+(alpha*(2*A/((1-alpha)))-t_rel*(2*A/((1-alpha)*T_periode)));
    end;
end;