f = 28;           % Carrier Frequency
ht = 400;         % Transmitter Antenna Height
hr = 0.5;         % Receiver Antenna Height
Gt = 17;          % Transmitter Antenna  Gain Factor (dB)
Gr = 15;          % Receiver Antenna  Gain Factor (dB)
L = 0.3;          %Connector loss [dB]
G = 32;           %Gt+Gr
pt= 40;           %transmitter power[dBm]
pr=27;            %Receiver power[dBm]
angle=10;         %elevation angle
R=6378;           %R denotes the Earth s radius at 6,378 km
N=6;              %Noise figure [dBm] 
IP=3;             %Interference margin loss [dB]
B=10;             %Bandwidth [MHz] 
distance = linspace(1, 1000, 1000);

% Calculate total path loss
d = 2 * R * (acosd(R/(R +ht )* cosd(10)) - 10);
PL=10*log10(147.56+20*log10(d)+20*log10(f)-Gt-Gr);
PLT= PL*log(distance);   %To draw lines 
plot(distance,PLT)
xlabel('Distance (km)')
ylabel('Path Loss (dB)')
title('Path Loss (PL)')
grid on
 
%Calculate Rss [dBm]  
RSS =10*log10(pt)+10*log10(G*(ht))+10*log10(G*(hr))-(PLT-L);
figure;
plot(distance, RSS)
xlabel('Distance (km)');
ylabel('Received Signal Strength (RSS) in dBm');
title('Received Signal Strength (RSS)');
grid on;

%Calculate SINR [dBm] 
SINR=(-RSS/(N+IP));
figure;
plot(distance, SINR)
title('Signal-to-Interference-plus-Noise Ratio (SINR)');
xlabel('Distance (Km)');
ylabel('SINR (dB)');
grid on;

%Calculate Throughput [dBm]
Throughput=10*log(B*10*log2(1+(10.^(-SINR/10))));
figure;
plot(distance, Throughput)
title('Throughput');
xlabel('Distance (Km)');
ylabel('Throughput (Mbps)');
grid on;