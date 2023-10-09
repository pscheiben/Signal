Amplitude1 = 13;
Amplitude2 = 42;
NoiseAmp = 20;
Frequency1 = 3000;
Frequency2 = 3000;
Start_time = -0.1;
Duration = 1;
phi1 = 26;
phi2 = -30;
Samplepertime = 20;

x1 = Signal(Amplitude1,"sinSignal",Frequency1,phi1,Start_time,Duration,Samplepertime);
x1.Time_Vector = generate_time_vector(x1);
x1.Data_Vector = generate_data_vector(x1);
subplot(3,1,1);
plotaround(x1,0,3);
hold on
x2 = Signal(Amplitude2,"sinSignal",Frequency2,phi2,Start_time,Duration,Samplepertime);
x2.Time_Vector = generate_time_vector(x2);
x2.Data_Vector = generate_data_vector(x2);
subplot(3,1,2);
plotaround(x2,0,3);
x3 = Signal();
x3 = signalAdd(x3,x1,x2);
subplot(3,1,3);
plotaround(x3,0,3);