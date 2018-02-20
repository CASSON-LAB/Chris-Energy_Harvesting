%resample data
%need to import data as x, y and z

Fs = 100; %original sampling frequency
[P,Q] = rat(128/Fs); %find P and Q values to upsample to 128Hz
x_new = resample(x,P,Q);
y_new = resample(y,P,Q);
z_new = resample(z,P,Q);
time = 0:1/128:(1/128)*length(x_new)-(1/128);
time=time';

leg_data_resampled5(:,1) = time;
leg_data_resampled5(:,5) = x_new;
leg_data_resampled5(:,6) = y_new;
leg_data_resampled5(:,7) = z_new;