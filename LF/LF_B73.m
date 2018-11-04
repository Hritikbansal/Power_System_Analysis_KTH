#LF Assignment

function retval =  LF_B73()
format short g

Sbase=100; #MVA
Ubase=220; #kV
deg=180/pi;
Zbase=(Ubase^2)/Sbase;
Ibase=Sbase/(sqrt(3)*Ubase);

%known values
U1=220/Ubase; theta1=0;
U3=220/Ubase;
U7=220/Ubase;

nbus=8; #number of buses is 8

%for line-12
Z12pu=((0.05+j*0.5)*(142.5))/Zbase;
ysh12=(j*3.6*1E-6)*(142.5)/2;
ysh12pu=ysh12*Zbase;

%for line-23
Z23pu=((0.05+j*0.5)*(100))/Zbase;
ysh23=(j*3.6*1E-6)*(100)/2;
ysh23pu=ysh23*Zbase;

%for line-34
Z34pu=((0.05+j*0.5)*(100))/Zbase;
ysh34=(j*3.6*1E-6)*(100)/2;
ysh34pu=ysh34*Zbase;

%for line-45
Z45pu=((0.05+j*0.5)*(150))/Zbase;
ysh45=(j*3.6*1E-6)*(150)/2;
ysh45pu=ysh45*Zbase;

%for line-56
Z56pu=((0.05+j*0.5)*(150))/Zbase;
ysh56=(j*3.6*1E-6)*(150)/2;
ysh56pu=ysh56*Zbase;

%for line-67
Z67pu=((0.05+j*0.5)*(90))/Zbase;
ysh67=(j*3.6*1E-6)*(90)/2;
ysh67pu=ysh67*Zbase;

%for line-78
Z78pu=((0.05+j*0.5)*(90))/Zbase;
ysh78=(j*3.6*1E-6)*(90)/2;
ysh78pu=ysh78*Zbase;

%for line-28
Z28pu=((0.05+j*0.5)*(192.5))/Zbase;
ysh28=(j*3.6*1E-6)*(192.5)/2;
ysh28pu=ysh28*Zbase;

%for line-36
Z36pu=((0.05+j*0.5)*(200))/Zbase;
ysh36=(j*3.6*1E-6)*(200)/2;
ysh36pu=ysh36*Zbase;

%capacitor at Node 5  #this is a constant impedance load
Zc5=conj((220^2)/(-0.2*j));
Zc5pu=Zc5/Zbase;

%Formation of Y-Matrix 

Y11=(1/Z12pu)+ysh12pu; 
Y12= -1/Z12pu;
Y13=Y14=Y15=Y16=Y17=Y18=0;

Y21=Y12;
Y22=(1/Z12pu)+ysh12pu+(1/Z28pu)+ysh28pu+(1/Z23pu)+ysh23pu;
Y23= -(1/Z23pu);
Y24=Y25=Y26=Y27=0;
Y28= -(1/Z28pu);

Y31=Y13; Y32=Y23;
Y33=(1/Z23pu)+ysh23pu+(1/Z34pu)+ysh34pu+(1/Z36pu)+ysh36pu;
Y34=Y35=0;
Y36= -(1/Z36pu);
Y37=Y38=0;

Y41=Y14; Y42=Y24; Y43=Y34; 
Y44=(1/Z34pu)+ysh34pu+(1/Z45pu)+ysh45pu;
Y45= -(1/Z45pu);
Y46=Y47=Y48=0;

Y51=Y15; Y52=Y25; Y53=Y35; Y54=Y45;
Y55=(1/Z45pu)+ysh45pu+(1/Z56pu)+ysh56pu+(1/Zc5pu);
Y56= -(1/Z56pu);
Y57=Y58=0;

Y61=Y16; Y62=Y26; Y63=Y36; Y64=Y46; Y65=Y56; 
Y66=(1/Z56pu)+ysh56pu+(1/Z67pu)+ysh67pu+(1/Z36pu)+ysh36pu;
Y67= -(1/Z67pu);
Y68=0;

Y71=Y17; Y72=Y27; Y73=Y37; Y74=Y47; Y75=Y57; Y76=Y67;
Y77=(1/Z67pu)+ysh67pu+(1/Z78pu)+ysh78pu;
Y78= -(1/Z78pu);

Y81=Y18; Y82=Y28; Y83=Y38; Y84=Y48; Y85=Y58; Y86=Y68; Y87=Y78;
Y88=(1/Z78pu)+ysh78pu+(1/Z28pu)+ysh28pu;

Ybus=[Y11 Y12 Y13 Y14 Y15 Y16 Y17 Y18;
      Y21 Y22 Y23 Y24 Y25 Y26 Y27 Y28;
      Y31 Y32 Y33 Y34 Y35 Y36 Y37 Y38;
      Y41 Y42 Y43 Y44 Y45 Y46 Y47 Y48;
      Y51 Y52 Y53 Y54 Y55 Y56 Y57 Y58;
      Y61 Y62 Y63 Y64 Y65 Y66 Y67 Y68;
      Y71 Y72 Y73 Y74 Y75 Y76 Y77 Y78;
      Y81 Y82 Y83 Y84 Y85 Y86 Y87 Y88];
      
G=real(Ybus); B=imag(Ybus);
      
#Slack bus- Bus 1
#PU bus- Bus 3,7  
#PQ bus- Bus 2,4,5,6,8

PGD2=0;
QGD2=0;

PGD3=0;
PGD4=-242.5/Sbase;
QGD4=-30/Sbase;

PGD5=0;
QGD5=0;

PGD6=-230/Sbase;
QGD6=-10/Sbase;

PGD7=292.5/Sbase;

PGD8=-210/Sbase;
QGD8=-30/Sbase;

PGD=[PGD2;PGD3;PGD4;PGD5;PGD6;PGD7;PGD8]; #PGD Matrix for PU and PQ buses

QGD=[QGD2;QGD4;QGD5;QGD6;QGD8]; #QGD Matrix for PQ buses


%Initial Estimates to theta and U values

% We need to find theta2,theta3,theta4,theta5,theta6,theta7,theta8,U2,U4,U5,U6,U8

#Initial Estimates
X0=[0 0 0 0 0 0 0 0 1 1 1 1 1];
s_z=size(X0);
nx=s_z(1,1); #gives us the number of unknown variables

options_solve=optimset('Display','off','TolX',1E-6,'TolFun',1E-6); #1E-6 is the tolerance

PAR=[nx;nbus;U1;theta1;U3;U7]; %U1 and theta are known(slack bus)

[X_X,FVAL,EXITFLAG,OUTPUT,FJAC]=fsolve('solve_lf',(X0,G,B,PGD,QGD,PAR),options_solve);

if EXITFLAG~=1,
  disp('No solution'),
  EXITFLAG=EXITFLAG,
  return
end,

%Solved Variables X_X
ANG=[theta1 X_X(1) X_X(2) X_X(3) X_X(4) X_X(5) X_X(6) X_X(7)]' %voltage phase angles
VOLT=[U1 X_X(8) U3 X_X(9) X_X(10) X_X(11) U7 X_X(12)]' %voltage magnitudes

endfunction;







