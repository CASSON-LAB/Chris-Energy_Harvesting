%capacitor loss calculator
close all
global P energy time cap_multiplier fs lossy_voltage voltage_developed lossy_energy energy_input_change
clear E_T energy_extended time_extended
fs=2048;


%%Generate extra blank energy data at end of array
empty_length = 60*10; %number of seconds of empty data to create
%empty_length = 0;
empty_samples = empty_length*fs;
old_length = length(energy);
last_energy_value = energy(length(energy));
energy_extended(old_length + empty_samples) = 0; %pre-allocate array size
energy_extended = energy;
time_extended = time;

for i=old_length:(old_length+empty_samples)
    energy_extended(i) = last_energy_value;
    time_extended(i) = time_extended(i-1) + 1/fs;
end


plot(time_extended, energy_extended);
title('\bf Unlossy Energy'); xlabel('Time (s)'); ylabel('Energy (J)');
hold on

capacitance = 10;
cap_voltage = 5;
leakage_resistance = 50000/capacitance;


max_energy_stored = 0.5 * capacitance * cap_voltage * cap_voltage;


for i=2:length(energy_extended)
    energy_input_change(i)=energy_extended(i)-energy_extended(i-1);
end



E_T(1) = 0;
voltage_developed(1) = 0;
voltage_inc_losses(1) = 0;

for j=1:5
if j ==1
    leakage_resistance = 5/capacitance;
elseif j == 2
    leakage_resistance = 50/capacitance;
elseif j == 3
    leakage_resistance = 500/capacitance;
elseif j == 4
    leakage_resistance = 5000/capacitance;
elseif j ==5
    leakage_resistance = 50000/capacitance;
end
    
for i=2:length(energy_extended)
    E_T(i) = E_T(i-1) + energy_input_change(i); %Add in value of energy coming in from harvester for this time sample
    voltage_developed(i) = sqrt((2*E_T(i))/capacitance);    %Work out the voltage on the cap before the losses for this time step
    voltage_inc_losses(i) = voltage_developed(i) * exp((-(1/fs))/(leakage_resistance*capacitance));
    E_T(i) = 0.5 * capacitance * voltage_inc_losses(i)^2;
end
plot(time_extended,E_T, 'LineWidth',2);
title('\bf Lossy Energy'); xlabel('Time (s)'); ylabel('Energy (J)');
end

legend('Ideal', '5/C', '50/C', '500/C', '5000/C', '50000/C');
% plot(time_extended,E_T);
% title('\bf Lossy Energy'); xlabel('Time (s)'); ylabel('Energy (J)');
