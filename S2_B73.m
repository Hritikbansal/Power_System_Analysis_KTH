%Assignment 2

format short g
%defining the conversion of angles
deg=180/pi;
rad=1/deg;

%Base value of Power(MVA)
Sbase=10;

%base voltage(kV)
Ub70=70;
Ub40=40;
%Base current
Ib70=Sbase/(sqrt(3)*Ub70);
Ib40=Sbase/(sqrt(3)*Ub40);
%Base Impedances
Zb70=(Ub70^2)/(Sbase);
Zb40=(Ub40^2)/(Sbase);

Sn1= 53.5; %using the rating of the transformer as it is

%Voltage at Node 9
U9pu=70/70;

%for power system thevenin
cosphi=0.15;
sinphi=sqrt(1-(cosphi)^2);
Zth=(70/(sqrt(3)*25))*(cosphi+j*sinphi);
Zthpu=Zth/Zb70;

%for transformer-1
Zt1pu=(0.08)*j*(Sbase/Sn1);

%for line-23
Z23pu=((0.8+j*0.3)*(15))/Zb40;
ysh23=(j*3*1E-6)*(15)/2;
ysh23pu=ysh23*Zb40;

%for line-34
Z34pu=((0.8+j*0.3)*(15))/Zb40;
ysh34=(j*3*1E-6)*(15)/2;
ysh34pu=ysh34*Zb40;

%for line-45
Z45pu=((0.8+j*0.3)*(20))/Zb40;
ysh45=(j*3*1E-6)*(20)/2;
ysh45pu=ysh45*Zb40;

%for line-56
Z56pu=((0.8+j*0.3)*(15))/Zb40;
ysh56=(j*3*1E-6)*(15)/2;
ysh56pu=ysh56*Zb40;

%for line-67
Z67pu=((0.8+j*0.3)*(17))/Zb40;
ysh67=(j*3*1E-6)*(17)/2;
ysh67pu=ysh67*Zb40;

%for line-78
Z78pu=((0.8+j*0.3)*(12))/Zb40;
ysh78=(j*3*1E-6)*(12)/2;
ysh78pu=ysh78*Zb40;

%for line-36
Z36pu=((0.8+j*0.3)*(25))/Zb40;
ysh36=(j*3*1E-6)*(25)/2;
ysh36pu=ysh36*Zb40;

%for line-28
Z28pu=((0.8+j*0.3)*(56.5))/Zb40;
ysh28=(j*3*1E-6)*(56.5)/2;
ysh28pu=ysh28*Zb40;

%for the load at Node 4
cosphi_4=0.95; sinphi_4=sqrt(1-(cosphi_4^2));
PLD_4=2.073;
magSLD_4=PLD_4/cosphi_4; %magnitude of Complex Power
SLD_4=magSLD_4*(cosphi_4+j*sinphi_4);
U4n=Ub40;
Zld_4=(U4n^2)/conj(SLD_4);
ZLD4pu=Zld_4/Zb40;

%for the load at Node 6
cosphi_6=0.98; sinphi_6=sqrt(1-(cosphi_6^2));
PLD_6=2.573;
magSLD_6=PLD_6/cosphi_6; %magnitude of Complex Power
SLD_6=magSLD_6*(cosphi_6+j*sinphi_6);
U6n=Ub40;
Zld_6=(U6n^2)/conj(SLD_6);
ZLD6pu=Zld_6/Zb40;

%for the load at Node 8
cosphi_8=0.95; sinphi_8=sqrt(1-(cosphi_8^2));
PLD_8=3.073;
magSLD_8=PLD_8/cosphi_8; %magnitude of Complex Power
SLD_8=magSLD_8*(cosphi_8+j*sinphi_8);
U8n=Ub40;
Zld_8=(U8n^2)/conj(SLD_8);
ZLD8pu=Zld_8/Zb40;

%capacitor at Node 3
Zc3=conj((40^2)/(-2*j));
Zc3pu=Zc3/Zb40;
%capacitor at Node 5
Zc5=conj((40^2)/(-2*j));
Zc5pu=Zc5/Zb40;

%making the Y-Bus Matrix for the system

% Elements of Ybus Matrix
Y11=(1/Zthpu)+(1/Zt1pu);
Y12=-(1/Zt1pu);
Y13=Y14=Y15=Y16=Y17=Y18=0; Y19=-(1/Zthpu);

Y21=Y12;
Y22=(1/Z23pu)+ysh23pu+ysh28pu+(1/Z28pu)+(1/Zt1pu);
Y23=-(1/Z23pu);
Y24=Y25=Y26=Y27=0;
Y28=-(1/Z28pu);Y29=0;

Y31=Y13;
Y32=Y23;
Y33=(1/Z34pu)+ysh34pu+ysh36pu+(1/Z36pu)+ysh23pu+(1/Z23pu)+(1/Zc3pu);
Y34=-(1/Z34pu);
Y35=0;
Y36=-(1/Z36pu);
Y37=Y38=Y39=0;

Y41=Y14; Y42=Y24; Y43=Y34;
Y44=(1/Z34pu)+ysh34pu+ysh45pu+(1/Z45pu)+(1/ZLD4pu);
Y45=-(1/Z45pu);
Y46=Y47=Y48=Y49=0;

Y51=Y15; Y52=Y25; Y53=Y35; Y54=Y45; 
Y55=(1/Z45pu)+ysh45pu+ysh56pu+(1/Z56pu)+(1/Zc5pu);
Y56=-(1/Z56pu);
Y57=Y58=Y59=0;

Y61=Y16; Y62=Y26; Y63=Y36; Y64=Y46; Y65=Y56; 
Y66=ysh67pu+(1/Z67pu)+ysh56pu+(1/Z56pu)+ysh36pu+(1/Z36pu)+(1/ZLD6pu);
Y67=-(1/Z67pu);
Y68=Y69=0;

Y71=Y17; Y72=Y27; Y73=Y37; Y74=Y47; Y75=Y57; Y76=Y67;
Y77=ysh78pu+(1/Z78pu)+ysh67pu+(1/Z67pu);
Y78=-(1/Z78pu);
Y79=0;

Y81=Y18; Y82=Y28; Y83=Y38; Y84=Y48; Y85=Y58; Y86=Y68; Y87=Y78;
Y88=ysh78pu+(1/Z78pu)+ysh28pu+(1/Z28pu)+(1/ZLD8pu);
Y89=0;

Y91=Y19; Y92=Y29; Y93=Y39; Y94=Y49; Y95=Y59;
Y96=Y69; Y97=Y79; Y98=Y89; 
Y99=(1/Zthpu);

%Ybus matrix 

Ybus=[Y11 Y12 Y13 Y14 Y15 Y16 Y17 Y18 Y19;
      Y21 Y22 Y23 Y24 Y25 Y26 Y27 Y28 Y29;
      Y31 Y32 Y33 Y34 Y35 Y36 Y37 Y38 Y39;
      Y41 Y42 Y43 Y44 Y45 Y46 Y47 Y48 Y49;
      Y51 Y52 Y53 Y54 Y55 Y56 Y57 Y58 Y59;
      Y61 Y62 Y63 Y64 Y65 Y66 Y67 Y68 Y69;
      Y71 Y72 Y73 Y74 Y75 Y76 Y77 Y78 Y79;
      Y81 Y82 Y83 Y84 Y85 Y86 Y87 Y88 Y89;
      Y91 Y92 Y93 Y94 Y95 Y96 Y97 Y98 Y99];
     
disp(Ybus);     %PART B 

%Injected power at the secondary end of the transformer

Zbus=inv(Ybus); %impedance matrix for the given system

I9pu=1/Zbus(9,9);
U2pu=Zbus(2,9)*I9pu;  %u2

S2=U2pu*conj(I9pu)*Sbase;
disp(222);
disp(abs(S2));
disp(abs(S2)/abs(Sn1));   %PART C

%Total Power given to the system
P_tot=real(S2);

%power consumption at Node 4
U4pu=Zbus(4,9)*I9pu;    %u4
ILD4pu=U4pu/ZLD4pu;
SLD4=U4pu*conj(ILD4pu)*Sbase;
P_cons_4=real(SLD4);

%power consumption at Node 6
U6pu=Zbus(6,9)*I9pu; %u6
ILD6pu=U6pu/ZLD6pu;
SLD6=U6pu*conj(ILD6pu)*Sbase;
P_cons_6=real(SLD6);

%power consumption at Node 8
U8pu=Zbus(8,9)*I9pu;  %u8
ILD8pu=U8pu/ZLD8pu;
SLD8=U8pu*conj(ILD8pu)*Sbase;
P_cons_8=real(SLD8);

P_losses=(P_tot-(P_cons_4+P_cons_6+P_cons_8));

disp(P_losses);   %PART D

%Thevenin equivalent from Node 7
U7pu=Zbus(7,9)*I9pu; %u7

U7Th=U7pu; %thevenin voltage in pu %PART E

absU7Th=abs(U7Th)
angleU7th=angle(U7Th)*deg

%for thevenin impedance..remove the last row and column of the Ybus
Y_del=Ybus(1:8,1:8);
Z_del=inv(Y_del);

Z7Th=Z_del(7,7)%thevenin impedance in pu  %PART E

%Short Circuit Current and Three Phase Short circuit power
I7scpu=(U7Th/Z7Th);
I7sc=I7scpu*Ib40;
disp(abs(I7sc)); %PART F
disp(angle(I7sc)*deg);  %PART F

S7scpu=U7Th*conj(I7scpu);
S7sc=S7scpu*Sbase;
disp(abs(S7sc)); %PART F

U1pu=Zbus(1,9)*I9pu;
U3pu=Zbus(3,9)*I9pu;
U5pu=Zbus(5,9)*I9pu;

%the voltage at Node 9 won't change so we shouldn't think about it

%Using superposition theorem...U'=Upre+del(U)
%del_I will be zero except del_I7

U1pu_new=U1pu-((Z_del(1,7)*U7pu)/Z_del(7,7));
U2pu_new=U2pu-((Z_del(2,7)*U7pu)/Z_del(7,7));
I9pu_new=(U9pu-U1pu_new)/Zthpu;

S2_new=U2pu_new*conj(I9pu_new)*Sbase;
abs(S2_new)
disp(abs(S2_new)/abs(Sn1));  %PART G
P_tot_new=real(S2_new);

U4pu_new=U4pu-((Z_del(4,7)*U7pu)/Z_del(7,7));
ILD4pu_new=U4pu_new/ZLD4pu;
SLD4_new=U4pu_new*conj(ILD4pu_new)*Sbase;
P_cons_4_new=real(SLD4_new);

U6pu_new=U6pu-((Z_del(6,7)*U7pu)/Z_del(7,7));
ILD6pu_new=U6pu_new/ZLD6pu;
SLD6_new=U6pu_new*conj(ILD6pu_new)*Sbase;
P_cons_6_new=real(SLD6_new);

U8pu_new=U8pu-((Z_del(8,7)*U7pu)/Z_del(7,7));
ILD8pu_new=U8pu_new/ZLD8pu;
SLD8_new=U8pu_new*conj(ILD8pu_new)*Sbase;
P_cons_8_new=real(SLD8_new);

P_losses_new=P_tot_new-(P_cons_4_new+P_cons_6_new+P_cons_8_new);
disp(P_losses_new);   %PART H

S1_B73(U7Th,Z7Th); %PART I














