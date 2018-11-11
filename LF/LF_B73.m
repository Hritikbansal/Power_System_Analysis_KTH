%LF Ass1ignment


format short g

Sbase=100; %MVA
Ubase=220; %kV
deg=180/pi;
Zbase=(Ubase^2)/Sbase;
Ibase=Sbase/(sqrt(3)*Ubase);

%known values
U1=220/Ubase; theta1=0;
U3=220/Ubase;
U7=220/Ubase;

nbus=8; %number of buses is 8

%for line-12
Z12pu=((0.05+1i*0.5)*(142.5))/Zbase;
ysh12=(1i*3.6*1E-6)*(142.5)/2;
ysh12pu=ysh12*Zbase;

%for line-23
Z23pu=((0.05+1i*0.5)*(100))/Zbase;
ysh23=(1i*3.6*1E-6)*(100)/2;
ysh23pu=ysh23*Zbase;

%for line-34
Z34pu=((0.05+1i*0.5)*(100))/Zbase;
ysh34=(1i*3.6*1E-6)*(100)/2;
ysh34pu=ysh34*Zbase;

%for line-45
Z45pu=((0.05+1i*0.5)*(150))/Zbase;
ysh45=(1i*3.6*1E-6)*(150)/2;
ysh45pu=ysh45*Zbase;

%for line-56
Z56pu=((0.05+1i*0.5)*(150))/Zbase;
ysh56=(1i*3.6*1E-6)*(150)/2;
ysh56pu=ysh56*Zbase;

%for line-67
Z67pu=((0.05+1i*0.5)*(90))/Zbase;
ysh67=(1i*3.6*1E-6)*(90)/2;
ysh67pu=ysh67*Zbase;

%for line-78
Z78pu=((0.05+1i*0.5)*(90))/Zbase;
ysh78=(1i*3.6*1E-6)*(90)/2;
ysh78pu=ysh78*Zbase;

%for line-28
Z28pu=((0.05+1i*0.5)*(192.5))/Zbase;
ysh28=(1i*3.6*1E-6)*(192.5)/2;
ysh28pu=ysh28*Zbase;

%for line-36
Z36pu=((0.05+1i*0.5)*(200))/Zbase;
ysh36=(1i*3.6*1E-6)*(200)/2;
ysh36pu=ysh36*Zbase;

%capacitor at Node 5  %th1is 1is a constant 1impedance load
Zc5=conj((220^2)/(-0.2*1i));
Zc5pu=Zc5/Zbase;

%Format1ion of Y-Matr1ix 

Y11=(1/Z12pu)+ysh12pu; 
Y12= -1/Z12pu;
Y13=0;Y14=0;Y15=0;
Y16=0; Y17=0; Y18=0;

Y21=Y12;
Y22=(1/Z12pu)+ysh12pu+(1/Z28pu)+ysh28pu+(1/Z23pu)+ysh23pu;
Y23= -(1/Z23pu);
Y24=0;Y25=0;Y26=0;Y27=0;
Y28= -(1/Z28pu);

Y31=Y13; Y32=Y23;
Y33=(1/Z23pu)+ysh23pu+(1/Z34pu)+ysh34pu+(1/Z36pu)+ysh36pu;
Y34=-(1/Z34pu);
Y35=0;
Y36= -(1/Z36pu);
Y37=0;Y38=0;

Y41=Y14; Y42=Y24; Y43=Y34; 
Y44=(1/Z34pu)+ysh34pu+(1/Z45pu)+ysh45pu;
Y45= -(1/Z45pu);
Y46=0;Y47=0;Y48=0;

Y51=Y15; Y52=Y25; Y53=Y35; Y54=Y45;
Y55=(1/Z45pu)+ysh45pu+(1/Z56pu)+ysh56pu+(1/Zc5pu);
Y56= -(1/Z56pu);
Y57=0;Y58=0;

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
      
%Slack bus- Bus 1
%PU bus- Bus 3,7  
%PQ bus- Bus 2,4,5,6,8

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

PGD=[PGD2;PGD3;PGD4;PGD5;PGD6;PGD7;PGD8]; %PGD Matr1ix for PU and PQ buses

QGD=[QGD2;QGD4;QGD5;QGD6;QGD8]; %QGD Matr1ix for PQ buses


%initial Estimates to theta and U values

% We need to find theta2,theta3,theta4,theta5,theta6,theta7,theta8,U2,U4,U5,U6,U8

%initial Estimates
X0=[0 0 0 0 0 0 0 1 1 1 1 1];
s_z=size(X0);
nx=s_z(1,1); %g1ives us the number of unknown var1iables

options_solve=optimset('Display','off','TolX',1E-06,'TolFun',1E-06); %1E-6 1is the tolerance

PAR=[nx;nbus;U1;theta1;U3;U7]; %U1 and theta are known(slack bus)

[X_X,FVAL,EXITFLAG,OUTPUT,FJAC]=fsolve('solve_lf',X0,options_solve,G,B,PGD,QGD,PAR);

%for the time being i have removed the exit flag condition
%Solved Var1iables X_X
%PART D
ANG=([theta1 X_X(1) X_X(2) X_X(3) X_X(4) X_X(5) X_X(6) X_X(7)]') %voltage phase angles
VOLT=([U1 X_X(8) U3 X_X(9) X_X(10) X_X(11) U7 X_X(12)]') %voltage magnitudes

ANG_deg=ANG*deg; %in degrees
VOLT_kV=VOLT*Ubase; %in kV

%We need to find the value H N J L matrices

  for m=1:nbus
    for n=1:nbus
      PP(m,n)=VOLT(m)*VOLT(n)*(G(m,n)*cos(ANG(m)-ANG(n))+B(m,n)*sin(ANG(m)-ANG(n)));
      QQ(m,n)=VOLT(m)*VOLT(n)*(G(m,n)*sin(ANG(m)-ANG(n))-B(m,n)*cos(ANG(m)-ANG(n)));
    end
  end
  P=sum(PP')'
  Q=sum(QQ')'

%H will be 7x7 matrix 
H=zeros(7,7);

for m=2:8
    for n=2:8
        if m~=n
            H(m-1,n-1)=VOLT(m)*VOLT(n)*((G(m,n)*sin(ANG(m)-ANG(n)))-(B(m,n)*cos(ANG(m)-ANG(n))));
        else
            H(m-1,m-1)=-Q(m)-(B(m,m)*VOLT(m)*VOLT(m));
        end
    end     
end
disp(H)

%N will be 5x7 matrix
N=zeros(7,5);

tmp=[2 4 5 6 8];

for m=2:8
    for n=1:5
        if m~=tmp(n)
            N(m-1,n)=VOLT(m)*VOLT(tmp(n))*(G(m,tmp(n))*cos(ANG(m)-ANG(tmp(n)))+B(m,tmp(n))*sin(ANG(m)-ANG(tmp(n))));
        else
            N(m-1,n)=P(m)+(G(m,m)*VOLT(m)*VOLT(m));
        end
   
    end
end
disp(N)

%J will be 7x5 matrix
J=zeros(5,7);

for m=1:5
    for n=2:8
        if tmp(m)~=n
            J(m,n-1)=-VOLT(tmp(m))*VOLT(n)*(G(tmp(m),n)*cos(ANG(tmp(m))-ANG(n)+B(tmp(m),n)*sin(ANG(tmp(m))-ANG(n))));  
        else
            J(m,n-1)=P(n)-(G(n,n)*VOLT(n)*VOLT(n));
        end
        
    end
end
disp(J)

            
%L will be 5x5 matrix

for m=1:5
    for n=1:5
        if m~=n
            L(m,n)=VOLT(tmp(m))*VOLT(tmp(n))*(G(tmp(m),tmp(n))*sin(ANG(tmp(m))-ANG(tmp(n)))-B(tmp(m),tmp(n))*cos(ANG(tmp(m))-ANG(tmp(n))));
        else
            L(m,n)=Q(tmp(m))-(B(tmp(m),tmp(m))*VOLT(tmp(m))*VOLT(tmp(m)));
        end
    end
end

disp(L)

%PART E Not correct values but the format is right :)

PG1=P(1)*Sbase;  %in MW  PART F
QG1=Q(1)*Sbase;  %in MVar

%bus 3 and 7 are PU buses
QG3=Q(3)*Sbase; %in MVar
QG7=Q(7)*Sbase;  %in MVar

g=-G; b=-B;

P12=((g(1,2)*(VOLT(1)^2))-(VOLT(1)*VOLT(2)*(g(1,2)*cos(ANG(1)-ANG(2))+b(1,2)*sin(ANG(1)-ANG(2)))))*Sbase; %in MW
P21=((g(2,1)*(VOLT(2)^2))-(VOLT(2)*VOLT(1)*(g(2,1)*cos(ANG(2)-ANG(1))+b(2,1)*sin(ANG(2)-ANG(1)))))*Sbase; %in MW
Q12=(((-ysh12pu-b(1,2))*(VOLT(1)^2))-(VOLT(1)*VOLT(2)*(g(1,2)*sin(ANG(1)-ANG(2))-b(1,2)*cos(ANG(1)-ANG(2)))))*Sbase; %in MVar
Q21=(((-imag(ysh12pu)-b(2,1))*(VOLT(2)^2))-(VOLT(2)*VOLT(1)*(g(2,1)*sin(ANG(2)-ANG(1))-b(2,1)*cos(ANG(2)-ANG(1)))))*Sbase; %in MVar
Ploss_12=P12+P21;

P23=((g(2,3)*(VOLT(2)^2))-(VOLT(2)*VOLT(3)*(g(2,3)*cos(ANG(2)-ANG(3))+b(2,3)*sin(ANG(2)-ANG(3)))))*Sbase; %in MW
P32=((g(3,2)*(VOLT(3)^2))-(VOLT(3)*VOLT(2)*(g(3,2)*cos(ANG(3)-ANG(2))+b(3,2)*sin(ANG(3)-ANG(2)))))*Sbase; %in MW
Q23=(((-imag(ysh23pu)-b(2,3))*(VOLT(2)^2))-(VOLT(2)*VOLT(3)*(g(2,3)*sin(ANG(2)-ANG(3))-b(2,3)*cos(ANG(2)-ANG(3)))))*Sbase; %in MVar
Q32=(((-imag(ysh23pu)-b(3,2))*(VOLT(3)^2))-(VOLT(3)*VOLT(2)*(g(3,2)*sin(ANG(3)-ANG(2))-b(3,2)*cos(ANG(3)-ANG(2)))))*Sbase; %in MVar
Ploss_23=P23+P32;

P34=((g(3,4)*(VOLT(3)^2))-(VOLT(3)*VOLT(4)*(g(3,4)*cos(ANG(3)-ANG(4))+b(3,4)*sin(ANG(3)-ANG(4)))))*Sbase; %in MW
P43=((g(4,3)*(VOLT(4)^2))-(VOLT(4)*VOLT(3)*(g(4,3)*cos(ANG(4)-ANG(3))+b(4,3)*sin(ANG(4)-ANG(3)))))*Sbase; %in MW
Q34=(((-imag(ysh34pu)-b(3,4))*(VOLT(3)^2))-(VOLT(3)*VOLT(4)*(g(3,4)*sin(ANG(3)-ANG(4))-b(3,4)*cos(ANG(3)-ANG(4)))))*Sbase; %in MVar
Q43=(((-imag(ysh34pu)-b(4,3))*(VOLT(4)^2))-(VOLT(4)*VOLT(3)*(g(4,3)*sin(ANG(4)-ANG(3))-b(4,3)*cos(ANG(4)-ANG(3)))))*Sbase; %in MVar
Ploss_34=P34+P43;

P45=((g(4,5)*(VOLT(4)^2))-(VOLT(4)*VOLT(5)*(g(4,5)*cos(ANG(4)-ANG(5))+b(4,5)*sin(ANG(4)-ANG(5)))))*Sbase; %in MW
P54=((g(5,4)*(VOLT(5)^2))-(VOLT(5)*VOLT(4)*(g(5,4)*cos(ANG(5)-ANG(4))+b(5,4)*sin(ANG(5)-ANG(4)))))*Sbase; %in MW
Q45=(((-imag(ysh45pu)-b(4,5))*(VOLT(4)^2))-(VOLT(4)*VOLT(5)*(g(4,5)*sin(ANG(4)-ANG(5))-b(4,5)*cos(ANG(4)-ANG(5)))))*Sbase; %in MVar
Q54=(((-imag(ysh45pu)-b(5,4))*(VOLT(5)^2))-(VOLT(5)*VOLT(4)*(g(5,4)*sin(ANG(5)-ANG(4))-b(5,4)*cos(ANG(5)-ANG(4)))))*Sbase; %in MVar
Ploss_45=P45+P54;

P56=((g(5,6)*(VOLT(5)^2))-(VOLT(5)*VOLT(6)*(g(5,6)*cos(ANG(5)-ANG(6))+b(5,6)*sin(ANG(5)-ANG(6)))))*Sbase; %in MW
P65=((g(6,5)*(VOLT(6)^2))-(VOLT(6)*VOLT(5)*(g(6,5)*cos(ANG(6)-ANG(5))+b(6,5)*sin(ANG(6)-ANG(5)))))*Sbase; %in MW
Q56=(((-imag(ysh56pu)-b(5,6))*(VOLT(5)^2))-(VOLT(5)*VOLT(6)*(g(5,6)*sin(ANG(5)-ANG(6))-b(5,6)*cos(ANG(5)-ANG(6)))))*Sbase; %in MVar
Q65=(((-imag(ysh56pu)-b(6,5))*(VOLT(6)^2))-(VOLT(6)*VOLT(5)*(g(6,5)*sin(ANG(6)-ANG(5))-b(6,5)*cos(ANG(6)-ANG(5)))))*Sbase; %in MVar
Ploss_56=P56+P65;

P67=((g(6,7)*(VOLT(6)^2))-(VOLT(6)*VOLT(7)*(g(6,7)*cos(ANG(6)-ANG(7))+b(6,7)*sin(ANG(6)-ANG(7)))))*Sbase; %in MW
P76=((g(7,6)*(VOLT(7)^2))-(VOLT(7)*VOLT(6)*(g(7,6)*cos(ANG(7)-ANG(6))+b(7,6)*sin(ANG(7)-ANG(6)))))*Sbase; %in MW
Q67=(((-imag(ysh67pu)-b(6,7))*(VOLT(6)^2))-(VOLT(6)*VOLT(7)*(g(6,7)*sin(ANG(6)-ANG(7))-b(6,7)*cos(ANG(6)-ANG(7)))))*Sbase; %in MVar
Q76=(((-imag(ysh67pu)-b(7,6))*(VOLT(7)^2))-(VOLT(7)*VOLT(6)*(g(7,6)*sin(ANG(7)-ANG(6))-b(7,6)*cos(ANG(7)-ANG(6)))))*Sbase; %in MVar
Ploss_67=P67+P76;

P78=((g(7,8)*(VOLT(7)^2))-(VOLT(7)*VOLT(8)*(g(7,8)*cos(ANG(7)-ANG(8))+b(7,8)*sin(ANG(7)-ANG(8)))))*Sbase; %in MW
P87=((g(8,7)*(VOLT(8)^2))-(VOLT(8)*VOLT(7)*(g(8,7)*cos(ANG(8)-ANG(7))+b(8,7)*sin(ANG(8)-ANG(7)))))*Sbase; %in MW
Q78=(((-imag(ysh78pu)-b(7,8))*(VOLT(7)^2))-(VOLT(7)*VOLT(8)*(g(7,8)*sin(ANG(7)-ANG(8))-b(7,8)*cos(ANG(7)-ANG(8)))))*Sbase; %in MVar
Q87=(((-imag(ysh78pu)-b(8,7))*(VOLT(8)^2))-(VOLT(8)*VOLT(7)*(g(8,7)*sin(ANG(8)-ANG(7))-b(8,7)*cos(ANG(8)-ANG(7)))))*Sbase; %in MVar
Ploss_78=P78+P87;

P36=((g(3,6)*(VOLT(3)^2))-(VOLT(3)*VOLT(6)*(g(3,6)*cos(ANG(3)-ANG(6))+b(3,6)*sin(ANG(3)-ANG(6)))))*Sbase; %in MW
P63=((g(6,3)*(VOLT(6)^2))-(VOLT(6)*VOLT(3)*(g(6,3)*cos(ANG(6)-ANG(3))+b(6,3)*sin(ANG(6)-ANG(3)))))*Sbase; %in MW
Q36=(((-imag(ysh36pu)-b(3,6))*(VOLT(3)^2))-(VOLT(3)*VOLT(6)*(g(3,6)*sin(ANG(3)-ANG(6))-b(3,6)*cos(ANG(3)-ANG(6)))))*Sbase; %in MVar
Q63=(((-imag(ysh36pu)-b(6,3))*(VOLT(6)^2))-(VOLT(6)*VOLT(3)*(g(6,3)*sin(ANG(6)-ANG(3))-b(6,3)*cos(ANG(6)-ANG(3)))))*Sbase; %in MVar
Ploss_36=P36+P63;

P28=((g(2,8)*(VOLT(2)^2))-(VOLT(2)*VOLT(8)*(g(2,8)*cos(ANG(2)-ANG(8))+b(2,8)*sin(ANG(2)-ANG(8)))))*Sbase; %in MW
P82=((g(8,2)*(VOLT(8)^2))-(VOLT(8)*VOLT(2)*(g(8,2)*cos(ANG(8)-ANG(2))+b(8,2)*sin(ANG(8)-ANG(2)))))*Sbase; %in MW
Q28=(((-imag(ysh28pu)-b(2,8))*(VOLT(2)^2))-(VOLT(2)*VOLT(8)*(g(2,8)*sin(ANG(2)-ANG(8))-b(2,8)*cos(ANG(2)-ANG(8)))))*Sbase; %in MVar
Q82=(((-imag(ysh28pu)-b(8,2))*(VOLT(8)^2))-(VOLT(8)*VOLT(2)*(g(8,2)*sin(ANG(8)-ANG(2))-b(8,2)*cos(ANG(8)-ANG(2)))))*Sbase; %in MVar
Ploss_28=P28+P82;
%PART G concluded

P_tot_losses=Ploss_12+Ploss_23+Ploss_34+Ploss_45+Ploss_56+Ploss_67+Ploss_78+Ploss_28+Ploss_36; %PART H




