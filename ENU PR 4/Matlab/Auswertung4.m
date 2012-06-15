clear all

flatrec10_05= load('../Messwerte/flat_RecEingang10kHzalpha05.mat');
flatrec20_02= load('../Messwerte/flat_RecEingang20kHzalpha02.mat');
flatrec20_05= load('../Messwerte/flat_RecEingang20kHzalpha05.mat');
flatrec20_07= load('../Messwerte/flat_RecEingang20kHzalpha07.mat');
flatrecFil10_05= load('../Messwerte/flat_RecEingangFilter10kHzalpha05.mat');
flatrecFil20_02= load('../Messwerte/flat_RecEingangFilter20kHzalpha02.mat');
flatrecFil20_05= load('../Messwerte/flat_RecEingangFilter20kHzalpha05.mat');
flatrecFil20_07= load('../Messwerte/flat_RecEingangFilter20kHzalpha07.mat');
flatsin10_05= load('../Messwerte/flat_SinEingang10kHzalpha05.mat');
flatsin20_02= load('../Messwerte/flat_SinEingang20kHzalpha02.mat');
flatsin20_05= load('../Messwerte/flat_SinEingang20kHzalpha05.mat');
flatsin20_07= load('../Messwerte/flat_SinEingang20kHzalpha07.mat');
flataudio= load('../Messwerte/audiosignalzeitkurz.mat');


shaperec10_05= load('../Messwerte/receingang10kHzalpha05.mat');
shaperec20_02= load('../Messwerte/receingang20kHzalpha02.mat');
shaperec20_05= load('../Messwerte/receingang20kHzalpha05.mat');
shaperec20_07= load('../Messwerte/receingang20kHzalpha07.mat');
shaperecFil10_05= load('../Messwerte/receingangFilter10kHzalpha05.mat');
shaperecFil20_02= load('../Messwerte/receingangFilter20kHzalpha02.mat');
shaperecFil20_05= load('../Messwerte/receingangFilter20kHzalpha05.mat');
shaperecFil20_07= load('../Messwerte/receingangFilter20kHzalpha07.mat');
shapesin10_05= load('../Messwerte/sineingang10kHzalpha05.mat');
shapesin20_02= load('../Messwerte/sineingang20kHzalpha02.mat');
shapesin20_05= load('../Messwerte/sineingang20kHzalpha05.mat');
shapesin20_07= load('../Messwerte/sineingang20kHzalpha07.mat');
shapeaudio= load('../Messwerte/audiosignalzeitkurzashapetop.mat');



% ich denke mal, man muss T_ges und f_T nicht jedes mal neu berechnen. wir
% haben ja nichts an den aufnahmeeinstellungen geändert oder? 

S = flatrec10_05;
T_ges = S.Tinterval*S.Length;
f_T = 1/S.Tinterval;

FFTshiftplotZP2(S.B,T_ges,f_T,4,'b',1)

S = flatrec10_05;
T_ges = S.Tinterval*S.Length;
f_T = 1/S.Tinterval;

FFTshiftplotZP2(S.A,T_ges,f_T,4,'b',2)

S = flatrec20_05;
T_ges = S.Tinterval*S.Length;
f_T = 1/S.Tinterval;

FFTshiftplotZP2(S.B,T_ges,f_T,4,'b',3)

S = flatrec20_05;
T_ges = S.Tinterval*S.Length;
f_T = 1/S.Tinterval;

FFTshiftplotZP2(S.A,T_ges,f_T,4,'b',4)







%Alte versuche
% M = 1000000;
% T = 6.399999961104186e-07*100000;
% N = 78130;
% Ab = N/T;
% 
% FFTshiftplot(sin_modem.A,T_ges,f_T,4,'r',3)
% 
% FFTshiftplot(f100_05.A,T,Ab,4,'r',1)
% FFTshiftplot(f100_05.A,N/M,M,4,'r',2)
%
%Ganz alt
% FFTshiftplot(rec_modem.A,length(rec_modem.B)/1000000,1000000,4,'r',3)