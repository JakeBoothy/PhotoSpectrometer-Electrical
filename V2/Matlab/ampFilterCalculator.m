%Script based on TI Opamp Calculator Apnote http://www.ti.com/lit/an/sloa097/sloa097.pdf

%Choose Rf
Rf = 10000;

%Choose V requirements
Vref = 2.5;
Voutf = 4.5;
Voutz = -4.5;
Vinf = 2.5;
Vinz = 0.6;

%Calculate m and b
m = (Voutf-Voutz)/(Vinf-Vinz);
b = Voutz - m*Vinz;

%Calculate Resistor Values for 1 opamp amplifier
Rg = Rf/(m-1);
Rg2 = Rg/10;
Rg1 = Rg - Rg2;
Vrefp = abs(b)*Rg1/(Rg1+Rf);
R1 = Rg2*(Vref-Vrefp)/Vrefp;

%Display
fprintf("Sinple Opamp Design: \n");
fprintf("R1 = %f\nRg1 = %f\nRg2 = %f\nRf = %f\n\n",R1,Rg1,Rg2,Rf);

%Calculate Resistor Values more accurate 2 opamp amplifier
Rg = Rg/(m-1);
Vrefp = abs(b)/m;

%Select R1
R1 = 500;
R2 = (Vrefp*R1)/(Vref-Vrefp);

%Display
fprintf("Dual Opamp Design: \n");
fprintf("R1 = %f\nR2 = %f\nRg = %f\nRf = %f\n",R1,R2,Rg,Rf);



