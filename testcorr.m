clear
clc
clf
NoiseAmp = 20;
Frequency = 3;
Start_time = 0;
Duration = 1;
Phase = 0;
Samplepertime = 200;
Shift_Unit = -15;

x1 = Signal(NoiseAmp,"Noise",Frequency,Phase,Start_time,Duration,Samplepertime);
x1.Time_Vector = generate_time_vector(x1);
x1.Data_Vector = generate_data_vector(x1);
subplot(3,1,1);
ylim([0,max(x1.Data_Vector)*1.4]);
stem(x1.Data_Vector);
title("Signal One");
hold on
x2 = x1;
x2.Data_Vector = circshift(x1.Data_Vector,Shift_Unit);
subplot(3,1,2);
ylim([0,max(x2.Data_Vector)*1.4]);
stem(x2.Data_Vector);
signal2title = "Signal One shifted by " + Shift_Unit + " unit ";
title(signal2title);
x3 = x1;
[x3.Data_Vector,lags] = xcorr(x1.Data_Vector,x2.Data_Vector);
subplot(3,1,3);
[maxlags,lagidx]=max(lags);
ylim([0,max(x3.Data_Vector)*1.4]);
stem(lags,x3.Data_Vector);
hold off