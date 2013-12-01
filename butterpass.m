clc; 
clear all;
close all;

fs2=10000; % sampling frequency given

%low pass filter
fcl=fs2/4;
wnl=fcl/(fs2/2); % normalized cutoff
[zl,pl]=butter(4,wnl,'low');
[Hl,wl]=freqz(zl,pl); % fourier of the filter


figure(1);
subplot(4,1,1);
plot((fs2*wl/(2*pi)),abs(Hl),'r');

title('Low Pass Filter with cutoff Fs/4');
ylabel('Magnitude');

grid

%Band Pass
f1b=fs2/4;
f2b=3*fs2/8;
w1b=f1b/(fs2/2); %
w2b=f2b/(fs2/2); % 
[zb,pb]=butter(4,[w1b w2b],'bandpass');
[Hb,wb]=freqz(zb,pb);
subplot(4,1,2);
plot((fs2*wb/(2*pi)),abs(Hb),'g');

title('Band Pass Filter with cutoffs Fs/4 and 3Fs/8');

grid

%High pass
fch=3*fs2/8;
wnh=fch/(fs2/2); % 
[zh,ph]=butter(4,wnh,'high');
[Hh,wh]=freqz(zh,ph);
subplot(4,1,3);
plot((fs2*wh/(2*pi)),abs(Hh),'b');

title('High Pass Filter with cutoff 3Fs/8');

grid


% Add
subplot(4,1,4);

plot((fs2*wl/(2*pi)),abs(Hl),'r');
hold on
plot((fs2*wh/(2*pi)),abs(Hh),'b');
hold on
plot((fs2*wb/(2*pi)),abs(Hb),'g');
hold on
plot((fs2*wh/(2*pi)),abs(Hh)+abs(Hl)+abs(Hb),'k');
xlabel('Frequency (Hz)');
title('Sum of Above Filters (showed in black color)');
grid





























































































































%----------------------------------------
%B.S.Vineeth <b.vineeth@iitg.ernet.in>
%BTech EP, Class of 2016,NOV 2013, Copyright (c)
%----------------------------------------
