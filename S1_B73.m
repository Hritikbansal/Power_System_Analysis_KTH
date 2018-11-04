%Assignment S1
function retval=S1_B73(Uapu,Z_th)  %Give Uapu=1.0 for Part a-f
  
format short g
%defining the conversion of angles
deg=180/pi;
rad=1/deg;


%Defining the base power(Sbase) in MVA
Sbase=10;  

%Defining Base voltages in kV
Ub40=40; Ub12=12; Ub6=6;
%Defining Base Currents in kA and Impedances
Ib40=Sbase/(sqrt(3)*Ub40); Zb40=(Ub40^2)/(Sbase);
Ib12=Sbase/(sqrt(3)*Ub12); Zb12=(Ub12^2)/(Sbase);
Ib6=Sbase/(sqrt(3)*Ub6); Zb6=(Ub6^2)/(Sbase);

%for the transformers
Sn1=6;
Sn2=5;

%per-unit voltage of the generator at node a
%Uapu=1.0; %Ua=Ua40=40kV 
%per-unit impedance of Transformer-1
Zt1pu=j*(0.07)*(Sbase/Sn1);
Zt1pu=Zt1pu %------------------------------------------------slight change to accomodate Assignment S2


%per-unit impedance of Cable-bc
Zbc=(0.16+j*0.08)*(0.273) ;%length of the cable is 0.273km
Zbcpu=Zbc/Zb12;
yshbc=(j*3*1E-6)*(0.273)/2;
yshbcpu=yshbc*Zb12;

%per-unit impedance for LD_b
cosphi_b=0.9; sinphi_b=sqrt(1-(cosphi_b^2));
PLD_b=0.173;
magSLD_b=PLD_b/cosphi_b; %magnitude of Complex Power
SLD_b=magSLD_b*(cosphi_b+j*sinphi_b);
Ubn=Ub12;
Zld_b=(Ubn^2)/conj(SLD_b);
ZLDbpu=Zld_b/Zb12;


%per-unit impedance of Cable-cd
Zcd=(0.16+j*0.08)*(0.273) ;%length of the cable is 0.385km
Zcdpu=Zcd/Zb12;
yshcd=(j*3*1E-6)*(0.273)/2;
yshcdpu=yshcd*Zb12;


%per-unit impedance of LD_c
cosphi_c=0.95; sinphi_c=sqrt(1-(cosphi_c^2));
PLD_c=0.103;
magSLD_c=PLD_c/cosphi_c; %magnitude of Complex Power
SLD_c=magSLD_c*(cosphi_c+j*sinphi_c);
Ucn=Ub12;
Zld_c=(Ucn^2)/conj(SLD_c);
ZLDcpu=Zld_c/Zb12;


%per-unit impedance of Transformer-2
Zt2pu=j*(0.08)*(Sbase/Sn2);


%per-unit impedance of LD_e
cosphi_e=0.9; sinphi_e=sqrt(1-(cosphi_e^2));
PLD_e=0.187;
magSLD_e=PLD_e/cosphi_e; %magnitude of Complex Power
SLD_e=magSLD_e*(cosphi_e+j*sinphi_e);
Uen=Ub6;
Zld_e=(Uen^2)/conj(SLD_e);
ZLDepu=Zld_e/Zb6;
ZLDepu=ZLDepu*2;  %-------------------------------------------------Assignment S2 requirement 50%load
disp(ZLDepu);
%two-port of the given system 
TP_0=[1 Z_th;0 1]; 
TP_1=[1 Zt1pu;0 1];

TP_2=[1 0;(1/ZLDbpu) 1];

A_bc=1+yshbcpu*Zbcpu;
B_bc=Zbcpu;
C_bc=yshbcpu*(2+yshbcpu*Zbcpu);
D_bc=1+yshbcpu*Zbcpu;
TP_3=[A_bc B_bc;C_bc D_bc];

TP_4=[1 0;(1/ZLDcpu) 1];

A_cd=1+yshcdpu*Zcdpu;
B_cd=Zcdpu;
C_cd=yshcdpu*(2+yshcdpu*Zcdpu);
D_cd=1+yshcdpu*Zcdpu;
TP_5=[A_cd B_cd;C_cd D_cd];

TP_6=[1 Zt2pu;0 1];


TP_tot_E=((((((TP_0*TP_1)*TP_2)*TP_3)*TP_4)*TP_5)*TP_6);   %PART B
disp(TP_tot_E);

%impedance of the entire system in per unit
Z_totpu=((TP_tot_E(1,1)*ZLDepu)+(TP_tot_E(1,2)))/((TP_tot_E(2,1)*ZLDepu)+(TP_tot_E(2,2)));  %PART C
disp(Z_totpu);

%Assuming that the system is fed with nominal voltage at node a
Iapu=Uapu/Z_totpu;

Uepu_Iepu=inv(TP_tot_E)*[Uapu;Iapu];
%nominal voltage at node e in kV
Ue=abs(Uepu_Iepu(1,1))*Ub6;    %PART D
disp(Ue);
disp(angle(Uepu_Iepu(1,1))*deg);


%Consumed active power at Node e


ILDepu=Uepu_Iepu(1,1)/ZLDepu;
S_cons_e=Uepu_Iepu(1,1)*conj(ILDepu)*Sbase;  %power consumption at Load E 
P_cons_e=real(S_cons_e);  %PART E

disp(P_cons_e);
disp(S_cons_e);
disp(abs(S_cons_e));
disp(angle(S_cons_e)*deg);
pf_e=P_cons_e/abs(S_cons_e);  %PART E
disp(pf_e);

%Consumed active power at Node b
TP_tot_B=TP_1;   
Ubpu_Ibpu=inv(TP_tot_B)*[Uapu;Iapu];
disp(Ubpu_Ibpu);

ILDbpu=Ubpu_Ibpu(1,1)/ZLDbpu;
S_cons_b=Ubpu_Ibpu(1,1)*conj(ILDbpu)*Sbase;
P_cons_b=real(S_cons_b);
disp(P_cons_b);

%Consumed active power at Node c
TP_tot_C=((TP_1*TP_2)*TP_3);
Ucpu_Icpu=inv(TP_tot_C)*[Uapu;Iapu];  %power consumption at Load C 
disp(Ucpu_Icpu);

ILDcpu=Ucpu_Icpu(1,1)/ZLDcpu;
S_cons_c=Ucpu_Icpu(1,1)*conj(ILDcpu)*Sbase;
P_cons_c=real(S_cons_c);
disp(P_cons_c);

%Total Power consumption
S_tot=Uapu*conj(Iapu)*Sbase;
P_tot=real(S_tot);
disp(P_tot);

%Total Losses
disp((P_tot-(P_cons_b+P_cons_c+P_cons_e))*1E3);

endfunction


vec=[];
for pu=0.8:0.01:1.2
vec=[vec,S1_B73(pu,0.18548)];  
end
x=0.8:0.01:1.2;
plot(x,vec);
xlabel("Variation in voltage at Node a")
ylabel("Normalized Power Consumption at Node e")
title("PLOT") 























