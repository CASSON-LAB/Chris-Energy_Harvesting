%use sample rate of 1MHz to show data. 1us resolution
voltage = 3;


current = ones(1,2420);
current(1:2) = 0;
current(3:61) = 3.5;
current(62:501) = 1.5;
current(502:1506) = 0.4;
current(1507:1640) = 2.8;
current(1641:1784) = 6.6;
current(1785:1887) = 6.0;
current(1888:2211) = 6.6;
current(2212:2417) = 3.2;
current(2418:2420) = 0;

power = voltage.*current;


foot_peak = ones(1,40120);
foot_peak(1:2) = 0;
foot_peak(3:40103) = 13.35;
foot_peak(40104:40120) = 0;

area(power);
hold on
area(foot_peak);

% pad plots with zeros

