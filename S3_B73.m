%Assignment 3

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
Uthpu=1;
%for power system thevenin
cosphi=0.15;
sinphi=sqrt(1-(cosphi)^2);
Zth=(70/(sqrt(3)*25))*(cosphi+j*sinphi);
Zthpu_1=Zth/Zb70;

%for transformer-1
Zt1pu_1=(0.08)*j*(Sbase/Sn1);

%for line-23
Z23pu_1=((0.8+j*0.3)*(15))/Zb40;
ysh23=(j*3*1E-6)*(15)/2;
ysh23pu_1=ysh23*Zb40;

%for line-34
Z34pu_1=((0.8+j*0.3)*(15))/Zb40;
ysh34=(j*3*1E-6)*(15)/2;
ysh34pu_1=ysh34*Zb40;

%for line-45
Z45pu_1=((0.8+j*0.3)*(20))/Zb40;
ysh45=(j*3*1E-6)*(20)/2;
ysh45pu_1=ysh45*Zb40;

%for line-56
Z56pu_1=((0.8+j*0.3)*(15))/Zb40;
ysh56=(j*3*1E-6)*(15)/2;
ysh56pu_1=ysh56*Zb40;

%for line-67
Z67pu_1=((0.8+j*0.3)*(17))/Zb40;
ysh67=(j*3*1E-6)*(17)/2;
ysh67pu_1=ysh67*Zb40;

%for line-78
Z78pu_1=((0.8+j*0.3)*(12))/Zb40;
ysh78=(j*3*1E-6)*(12)/2;
ysh78pu_1=ysh78*Zb40;

%for line-36
Z36pu_1=((0.8+j*0.3)*(25))/Zb40;
ysh36=(j*3*1E-6)*(25)/2;
ysh36pu_1=ysh36*Zb40;

%for line-28
Z28pu_1=((0.8+j*0.3)*(56.5))/Zb40;
ysh28=(j*3*1E-6)*(56.5)/2;
ysh28pu_1=ysh28*Zb40;

%for the load at Node 4
cosphi_4=0.95; sinphi_4=sqrt(1-(cosphi_4^2));
PLD_4=2.073;
magSLD_4=PLD_4/cosphi_4; %magnitude of Complex Power
SLD_4=magSLD_4*(cosphi_4+j*sinphi_4);
U4n=Ub40;
Zld_4=(U4n^2)/conj(SLD_4);
ZLD4pu_1=Zld_4/Zb40;

%for the load at Node 6
cosphi_6=0.98; sinphi_6=sqrt(1-(cosphi_6^2));
PLD_6=2.573;
magSLD_6=PLD_6/cosphi_6; %magnitude of Complex Power
SLD_6=magSLD_6*(cosphi_6+j*sinphi_6);
U6n=Ub40;
Zld_6=(U6n^2)/conj(SLD_6);
ZLD6pu_1=Zld_6/Zb40;

%for the load at Node 8
cosphi_8=0.95; sinphi_8=sqrt(1-(cosphi_8^2));
PLD_8=3.073;
magSLD_8=PLD_8/cosphi_8; %magnitude of Complex Power
SLD_8=magSLD_8*(cosphi_8+j*sinphi_8);
U8n=Ub40;
Zld_8=(U8n^2)/conj(SLD_8);
ZLD8pu_1=Zld_8/Zb40;

%capacitor at Node 3
Zc3=conj((40^2)/(-2*j));
Zc3pu_1=Zc3/Zb40;
%capacitor at Node 5
Zc5=conj((40^2)/(-2*j));
Zc5pu_1=Zc5/Zb40;


Zthpu_2=Zthpu_1;
cosphi=0.15;
sinphi=sqrt(1-(cosphi)^2);
Isc1phase=13*(cosphi-j*sinphi)/Ib70;
Zthpu_0=(3*Uthpu/Isc1phase)-(2*Zthpu_1);


Zt1pu_2=Zt1pu_1;
Zt1pu_0=Zt1pu_1;

Z23pu_2=Z23pu_1;
Z23pu_0=(2+j*0.6)*(15)/Zb40;

ysh23pu_2=ysh23pu_1;
ysh23pu_0=0.5*ysh23pu_1;

Zc3pu_2=Zc3pu_1;

Z34pu_2=Z34pu_1;
Z34pu_0=(2+j*0.6)*(15)/Zb40;

ysh34pu_2=ysh34pu_1;
ysh34pu_0=0.5*ysh34pu_1;

ZLD4pu_2=ZLD4pu_1;
ZLD4pu_0=ZLD4pu_1;

Z45pu_2=Z45pu_1;
Z45pu_0=(2+j*0.6)*(20)/Zb40;

ysh45pu_2=ysh45pu_1;
ysh45pu_0=0.5*ysh45pu_1;

Zc5pu_2=Zc5pu_1;
Zc5pu_0=Zc5pu_1;

Z56pu_2=Z56pu_1;
Z56pu_0=(2+j*0.6)*(15)/Zb40;

ysh56pu_2=ysh56pu_1;
ysh56pu_0=0.5*ysh56pu_1;

ZLD6pu_2=ZLD6pu_1;

Z36pu_2=Z36pu_1;
Z36pu_0=(2+j*0.6)*(25)/Zb40;

ysh36pu_2=ysh36pu_1;
ysh36pu_0=0.5*ysh36pu_1;

Z67pu_2=Z67pu_1;
Z67pu_0=(2+j*0.6)*(17)/Zb40;

ysh67pu_2=ysh67pu_1;
ysh67pu_0=0.5*ysh67pu_1;

Z78pu_2=Z78pu_1;
Z78pu_0=(2+j*0.6)*(12)/Zb40;

ysh78pu_2=ysh78pu_1;
ysh78pu_0=0.5*ysh78pu_1;

ZLD8pu_2=ZLD8pu_1;
ZLD8pu_0=ZLD8pu_1;

Z28pu_2=Z28pu_1;
Z28pu_0=(2+j*0.6)*(56.5)/Zb40;

ysh28pu_2=ysh28pu_1;
ysh28pu_0=0.5*ysh28pu_1;

%making the Y-Bus Matrix for the system

% Elements of Ybus Matrix
Y11=(1/Zthpu_1)+(1/Zt1pu_1);
Y12=-(1/Zt1pu_1);
Y13=Y14=Y15=Y16=Y17=Y18=0; Y19=-(1/Zthpu_1);

Y21=Y12;
Y22=(1/Z23pu_1)+ysh23pu_1+ysh28pu_1+(1/Z28pu_1)+(1/Zt1pu_1);
Y23=-(1/Z23pu_1);
Y24=Y25=Y26=Y27=0;
Y28=-(1/Z28pu_1);Y29=0;

Y31=Y13;
Y32=Y23;
Y33=(1/Z34pu_1)+ysh34pu_1+ysh36pu_1+(1/Z36pu_1)+ysh23pu_1+(1/Z23pu_1)+(1/Zc3pu_1);
Y34=-(1/Z34pu_1);
Y35=0;
Y36=-(1/Z36pu_1);
Y37=Y38=Y39=0;

Y41=Y14; Y42=Y24; Y43=Y34;
Y44=(1/Z34pu_1)+ysh34pu_1+ysh45pu_1+(1/Z45pu_1)+(1/ZLD4pu_1);
Y45=-(1/Z45pu_1);
Y46=Y47=Y48=Y49=0;

Y51=Y15; Y52=Y25; Y53=Y35; Y54=Y45; 
Y55=(1/Z45pu_1)+ysh45pu_1+ysh56pu_1+(1/Z56pu_1)+(1/Zc5pu_1);
Y56=-(1/Z56pu_1);
Y57=Y58=Y59=0;

Y61=Y16; Y62=Y26; Y63=Y36; Y64=Y46; Y65=Y56; 
Y66=ysh67pu_1+(1/Z67pu_1)+ysh56pu_1+(1/Z56pu_1)+ysh36pu_1+(1/Z36pu_1)+(1/ZLD6pu_1);
Y67=-(1/Z67pu_1);
Y68=Y69=0;

Y71=Y17; Y72=Y27; Y73=Y37; Y74=Y47; Y75=Y57; Y76=Y67;
Y77=ysh78pu_1+(1/Z78pu_1)+ysh67pu_1+(1/Z67pu_1);
Y78=-(1/Z78pu_1);
Y79=0;

Y81=Y18; Y82=Y28; Y83=Y38; Y84=Y48; Y85=Y58; Y86=Y68; Y87=Y78;
Y88=ysh78pu_1+(1/Z78pu_1)+ysh28pu_1+(1/Z28pu_1)+(1/ZLD8pu_1);
Y89=0;

Y91=Y19; Y92=Y29; Y93=Y39; Y94=Y49; Y95=Y59;
Y96=Y69; Y97=Y79; Y98=Y89; 
Y99=(1/Zthpu_1);

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
     

%making the Y_del_0 Matrix for the system

% Elements of Y_del_0

Y11=(1/Zthpu_0)+(1/Zt1pu_0);
Y12=-(1/Zt1pu_0);
Y13=Y14=Y15=Y16=Y17=Y18=0; 

Y21=Y12;
Y22=(1/Z23pu_0)+ysh23pu_0+ysh28pu_0+(1/Z28pu_0)+(1/Zt1pu_0);
Y23=-(1/Z23pu_0);
Y24=Y25=Y26=Y27=0;
Y28=-(1/Z28pu_0);

Y31=Y13;
Y32=Y23;
Y33=(1/Z34pu_0)+ysh34pu_0+ysh36pu_0+(1/Z36pu_0)+ysh23pu_0+(1/Z23pu_0);
Y34=-(1/Z34pu_0);
Y35=0;
Y36=-(1/Z36pu_0);
Y37=Y38=0;

Y41=Y14; Y42=Y24; Y43=Y34;
Y44=(1/Z34pu_0)+ysh34pu_0+ysh45pu_0+(1/Z45pu_0)+(1/ZLD4pu_0);
Y45=-(1/Z45pu_0);
Y46=Y47=Y48=0;

Y51=Y15; Y52=Y25; Y53=Y35; Y54=Y45; 
Y55=(1/Z45pu_0)+ysh45pu_0+ysh56pu_0+(1/Z56pu_0)+(1/Zc5pu_0);
Y56=-(1/Z56pu_0);
Y57=Y58=0;

Y61=Y16; Y62=Y26; Y63=Y36; Y64=Y46; Y65=Y56; 
Y66=ysh67pu_0+(1/Z67pu_0)+ysh56pu_0+(1/Z56pu_0)+ysh36pu_0+(1/Z36pu_0);
Y67=-(1/Z67pu_0);
Y68=0;

Y71=Y17; Y72=Y27; Y73=Y37; Y74=Y47; Y75=Y57; Y76=Y67;
Y77=ysh78pu_0+(1/Z78pu_0)+ysh67pu_0+(1/Z67pu_0);
Y78=-(1/Z78pu_0);

Y81=Y18; Y82=Y28; Y83=Y38; Y84=Y48; Y85=Y58; Y86=Y68; Y87=Y78;
Y88=ysh78pu_0+(1/Z78pu_0)+ysh28pu_0+(1/Z28pu_0)+(1/ZLD8pu_0);

Y_del_0=[
        Y11 Y12 Y13 Y14 Y15 Y16 Y17 Y18 ;
        Y21 Y22 Y23 Y24 Y25 Y26 Y27 Y28 ;
        Y31 Y32 Y33 Y34 Y35 Y36 Y37 Y38 ;
        Y41 Y42 Y43 Y44 Y45 Y46 Y47 Y48 ;
        Y51 Y52 Y53 Y54 Y55 Y56 Y57 Y58 ;
        Y61 Y62 Y63 Y64 Y65 Y66 Y67 Y68 ;
        Y71 Y72 Y73 Y74 Y75 Y76 Y77 Y78 ;
        Y81 Y82 Y83 Y84 Y85 Y86 Y87 Y88 ;
        ]
        

Y_del_2=Ybus(1:8,1:8);
Y_del_1=Ybus(1:8,1:8);

Zbus=inv(Ybus); %impedance matrix for the given system
Uth7pu=Zbus(7,9)/Zbus(9,9) %Answer to Part C

Z_del_1=inv(Y_del_1);

Z7Th_1=Z_del_1(7,7)   %PART C
Z7Th_2=Z7Th_1   %PART C

Z_del_0=inv(Y_del_0);
Z_del_2=inv(Y_del_2);

Z7Th_0=Z_del_0(7,7)   %PART C

I7fa =((3*Uth7pu)/(Z7Th_0+Z7Th_1+Z7Th_2))*Ib40;   %PART D in kA
abs_I7fa=abs(I7fa)
ang_I7fa=angle(I7fa)*deg

I7fa_pu=I7fa/Ib40;
I_s=1/3*[I7fa_pu;I7fa_pu;I7fa_pu];

U1_pre_pu_1=Zbus(1,9)/Zbus(9,9);
U2_pre_pu_1=Zbus(2,9)/Zbus(9,9);
U3_pre_pu_1=Zbus(3,9)/Zbus(9,9);
U4_pre_pu_1=Zbus(4,9)/Zbus(9,9);
U5_pre_pu_1=Zbus(5,9)/Zbus(9,9);
U6_pre_pu_1=Zbus(6,9)/Zbus(9,9);
U7_pre_pu_1=Uth7pu;
U8_pre_pu_1=Zbus(8,9)/Zbus(9,9);
U9_pre_pu_1=U9pu;

I_del_1=[0;0;0;0;0;0;-I_s(1,1);0];

U_pre_1=[ U1_pre_pu_1;U2_pre_pu_1;U3_pre_pu_1;U4_pre_pu_1;U5_pre_pu_1;
          U6_pre_pu_1;U7_pre_pu_1;U8_pre_pu_1];

U_new_1=U_pre_1+(Z_del_1*I_del_1);
U_new_2=(Z_del_2*I_del_1);
U_new_0=(Z_del_0*I_del_1);

I_12_1=(U_new_1(1,1)-U_new_1(2,1))/Zt1pu_1;
I_12_2=(U_new_2(1,1)-U_new_2(2,1))/Zt1pu_2;
I_12_0=(U_new_0(1,1)-U_new_0(2,1))/Zt1pu_0;

S_12_1=U_new_1(2,1)*conj(I_12_1);
S_12_2=U_new_2(2,1)*conj(I_12_2);
S_12_0=U_new_0(2,1)*conj(I_12_0);
S_in=S_12_0+S_12_1+S_12_2; %Total Power Given to the System from secondary side of Xformer
S2=S_in*Sbase %PART E

P_tot=real(S2);

%power consumption at Node 4
ILD4pu_1=U_new_1(4,1)/ZLD4pu_1;
SLD4_1=U_new_1(4,1)*conj(ILD4pu_1)*Sbase;
P_cons_4_1=real(SLD4_1);

ILD4pu_2=U_new_2(4,1)/ZLD4pu_2;
SLD4_2=U_new_2(4,1)*conj(ILD4pu_2)*Sbase;
P_cons_4_2=real(SLD4_2);

ILD4pu_0=U_new_0(4,1)/ZLD4pu_0;
SLD4_0=U_new_0(4,1)*conj(ILD4pu_0)*Sbase;
P_cons_4_0=real(SLD4_0);

P_cons_4=P_cons_4_0+P_cons_4_1+P_cons_4_2;

%power consumption at Node 6
ILD6pu_1=U_new_1(6,1)/ZLD6pu_1;
SLD6_1=U_new_1(6,1)*conj(ILD6pu_1)*Sbase;
P_cons_6_1=real(SLD6_1);

ILD6pu_2=U_new_2(6,1)/ZLD6pu_2;
SLD6_2=U_new_2(6,1)*conj(ILD6pu_2)*Sbase;
P_cons_6_2=real(SLD6_2);

P_cons_6=P_cons_6_1+P_cons_6_2;

%power consumption at Node 8
ILD8pu_1=U_new_1(8,1)/ZLD8pu_1;
SLD8_1=U_new_1(8,1)*conj(ILD8pu_1)*Sbase;
P_cons_8_1=real(SLD8_1);

ILD8pu_2=U_new_2(8,1)/ZLD8pu_2;
SLD8_2=U_new_2(8,1)*conj(ILD8pu_2)*Sbase;
P_cons_8_2=real(SLD8_2);

ILD8pu_0=U_new_0(8,1)/ZLD8pu_0;
SLD8_0=U_new_0(8,1)*conj(ILD8pu_0)*Sbase;
P_cons_8_0=real(SLD8_0);

P_cons_8=P_cons_8_0+P_cons_8_1+P_cons_8_2;

P_losses=(P_tot-(P_cons_4+P_cons_6+P_cons_8)) %PART F



%-----Now we will connect the system from S1 to our given meshed network---------%

%Defining Base voltages in kV
Ub12=12; Ub6=6;
%Defining Base Currents in kA and Impedances
Zb40=(Ub40^2)/(Sbase);
Ib12=Sbase/(sqrt(3)*Ub12); Zb12=(Ub12^2)/(Sbase);
Ib6=Sbase/(sqrt(3)*Ub6); Zb6=(Ub6^2)/(Sbase);

%for the transformers
Sn1=6;
Sn2=5;

%per-unit voltage of the generator at node a
%Uapu=1.0; %Ua=Ua40=40kV 
%per-unit impedance of Transformer-1
Zt1pu_1=j*(0.07)*(Sbase/Sn1);

%per-unit impedance of Cable-bc
Zbc=(0.16+j*0.08)*(0.273) ;%length of the cable is 0.273km
Zbcpu_1=Zbc/Zb12;
yshbc=(j*3*1E-6)*(0.273)/2;
yshbcpu_1=yshbc*Zb12;

%per-unit impedance for LD_b
cosphi_b=0.9; sinphi_b=sqrt(1-(cosphi_b^2));
PLD_b=0.173;
magSLD_b=PLD_b/cosphi_b; %magnitude of Complex Power
SLD_b=magSLD_b*(cosphi_b+j*sinphi_b);
Ubn=Ub12;
Zld_b=(Ubn^2)/conj(SLD_b);
ZLDbpu_1=Zld_b/Zb12;


%per-unit impedance of Cable-cd
Zcd=(0.16+j*0.08)*(0.273) ;%length of the cable is 0.385km
Zcdpu_1=Zcd/Zb12;
yshcd=(j*3*1E-6)*(0.273)/2;
yshcdpu_1=yshcd*Zb12;


%per-unit impedance of LD_c
cosphi_c=0.95; sinphi_c=sqrt(1-(cosphi_c^2));
PLD_c=0.103;
magSLD_c=PLD_c/cosphi_c; %magnitude of Complex Power
SLD_c=magSLD_c*(cosphi_c+j*sinphi_c);
Ucn=Ub12;
Zld_c=(Ucn^2)/conj(SLD_c);
ZLDcpu_1=Zld_c/Zb12;


%per-unit impedance of Transformer-2
Zt2pu_1=j*(0.08)*(Sbase/Sn2);


%per-unit impedance of LD_e
cosphi_e=0.9; sinphi_e=sqrt(1-(cosphi_e^2));
PLD_e=0.187;
magSLD_e=PLD_e/cosphi_e; %magnitude of Complex Power
SLD_e=magSLD_e*(cosphi_e+j*sinphi_e);
Uen=Ub6;
Zld_e=(Uen^2)/conj(SLD_e);
ZLDepu_1=Zld_e/Zb6;


Zt1pu_2=Zt1pu_1;
Zt1pu_0=Zt1pu_1;

ZLDbpu_2=ZLDbpu_1;


Zbcpu_2=Zbcpu_1;
Zbcpu_0=3*Zbcpu_1;

yshbcpu_2=yshbcpu_1;
yshbcpu_0=0.5*yshbcpu_1;

ZLDcpu_2=ZLDcpu_1;
ZLDcpu_0=ZLDcpu_1;

Zcdpu_2=Zcdpu_1;
Zcdpu_0=3*Zcdpu_1;

yshcdpu_2=yshcdpu_1;
yshcdpu_0=0.5*yshcdpu_1;

Zt2pu_2=Zt2pu_1;
Zt2pu_0=Zt2pu_1;


%Making of the Ybus matrix

Yaa=(1/Z7Th_1)+(1/Zt1pu_1);
Yab=-1/Zt1pu_1;
Yac=Yad=Yae=0;
Yaf=-(1/Z7Th_1);

Yba=Yab;
Ybb=(1/Zt1pu_1)+(1/ZLDbpu_1)+yshbcpu_1+(1/Zbcpu_1);
Ybc=-1/Zbcpu_1;
Ybd=Ybe=Ybf=0;

Yca=Yac; Ycb=Ybc;
Ycc=(1/Zbcpu_1)+yshbcpu_1+(1/ZLDcpu_1)+yshcdpu_1+(1/Zcdpu_1);
Ycd=-1/Zcdpu_1;
Yce=Ycf=0;

Yda=Yad; Ydb=Ybd; Ydc=Ycd; 
Ydd=1/Zcdpu_1+yshcdpu_1+1/Zt2pu_1;
Yde=-1/Zt2pu_1;
Ydf=0;

Yea=Yae; Yeb=Ybe; Yec=Yce; Yed=Yde; 
Yee=1/Zt2pu_1; Yef=0;

Yfa=Yaf; Yfb=Ybf; Yfc=Ycf; Yfd=Ydf; Yfe=Yef; 
Yff=1/Z7Th_1;

Y=    [
        Yaa Yab Yac Yad Yae Yaf  ;
        Yba Ybb Ybc Ybd Ybe Ybf  ;
        Yca Ycb Ycc Ycd Yce Ycf  ;
        Yda Ydb Ydc Ydd Yde Ydf  ;
        Yea Yeb Yec Yed Yee Yef  ;
        Yfa Yfb Yfc Yfd Yfe Yff  ;
        ]

Z=inv(Y);

Uthepu=Z(5,6)*Uth7pu/Z(6,6); %PART H

Y_del_1=Y(1:5,1:5);
Z_del_1=inv(Y_del_1);
Z_del_2=Z_del_1;
Zthepu_1=Z_del_1(5,5);
Zthepu_2=Zthepu_1; %PART H
 
Yaa_0=(1/Z7Th_0)+(1/Zt1pu_0);
Yab_0=-1/Zt1pu_0;
Yac_0=Yad_0=Yae_0=0;

Yba_0=Yab_0;
Ybb_0=(1/Zt1pu_0)+yshbcpu_0+(1/Zbcpu_0);
Ybc_0=-1/Zbcpu_0;
Ybd_0=Ybe_0=0;

Yca_0=Yac_0; Ycb_0=Ybc_0;
Ycc_0=(1/Zbcpu_0)+yshbcpu_0+(1/ZLDcpu_0)+yshcdpu_0+(1/Zcdpu_0);
Ycd_0=-1/Zcdpu_0;
Yce_0=0;

Yda_0=Yad_0; Ydb_0=Ybd_0; Ydc_0=Ycd_0; 
Ydd_0=(1/Zcdpu_0)+yshcdpu_0+(1/Zt2pu_0);
Yde_0=-1/Zt2pu_0;

Yea_0=Yae_0; Yeb_0=Ybe_0; Yec_0=Yce_0; Yed_0=Yde_0; 
Yee_0=1/Zt2pu_0; 
 
Y_del_0= [
        Yaa_0 Yab_0 Yac_0 Yad_0 Yae_0   ;
        Yba_0 Ybb_0 Ybc_0 Ybd_0 Ybe_0   ;
        Yca_0 Ycb_0 Ycc_0 Ycd_0 Yce_0   ;
        Yda_0 Ydb_0 Ydc_0 Ydd_0 Yde_0   ;
        Yea_0 Yeb_0 Yec_0 Yed_0 Yee_0   ;
        ]
        
Z_del_0=inv(Y_del_0);

Zthepu_0=Z_del_0(5,5); %PART H

Upre_e_pu=[Uthepu;0;0];

Z_del_e=[Zthepu_1 0 0;0 Zthepu_2 0;0 0 Zthepu_0];  %Taken from Slide 142

alpha= e^(j*rad*120);
T=[1 1 1 ;alpha^2 alpha 1 ;alpha alpha^2 1];

ZLDbus_eph=[2*ZLDepu_1 0 0;0 ZLDepu_1 0;0 0 ZLDepu_1];
Z_LDbus_es=inv(T)*ZLDbus_eph*T

I_del_e=-(inv(Z_LDbus_es+Z_del_e))*Upre_e_pu;

U_pre_a_pu_1=Z(1,6)*Uth7pu/Z(6,6);

U_new_a_pu_1=U_pre_a_pu_1+(Z_del_1(1,5)*I_del_e(1,1));

U_new_a_pu_2=Z_del_2(1,5)*I_del_e(2,1);

U_new_a_pu_0=Z_del_0(1,5)*I_del_e(3,1);

U_new_ph=Ub40*(T*[U_new_a_pu_1;U_new_a_pu_2;U_new_a_pu_0]);
Unewph=abs(U_new_ph)/sqrt(3)  %PART I
Unewang=angle(U_new_ph)*deg  %PART I





        
