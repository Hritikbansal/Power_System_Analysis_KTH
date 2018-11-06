
function [g_x] = solve_lf (X,G,B,PGD,QGD,PAR)
  
 format short g
  
  nx=PAR(1); nbus=PAR(2); U1=PAR(3); theta1=PAR(4); U3=PAR(5); U7=PAR(6);
  PGD2=PGD(1); PGD3=PGD(2); PGD4=PGD(3); PGD5=PGD(4); PGD6=PGD(5); PGD7=PGD(6);PGD8=PGD(7);
  QGD2=QGD(1); QGD4=QGD(2); QGD5=QGD(3); QGD6=QGD(4); QGD8=QGD(5);
  
  theta2=X(1); theta3=X(2); theta4=X(3); theta5=X(4); theta6=X(5); theta7=X(6); theta8=X(7);
  U2=X(8); U4=X(9); U5=X(10); U6=X(11); U8=X(12);
  
  ANG=[theta1 theta2 theta3 theta4 theta5 theta6 theta7 theta8];
  VOLT=[U1 U2 U3 U4 U5 U6 U7 U8];
  
  g_x=zeros(nx,1);
  
  for m=1:nbus
    for n=1:nbus
      PP(m,n)=VOLT(m)*VOLT(n)*(G(m,n)*cos(ANG(m)-ANG(n))+B(m,n)*sin(ANG(m)-ANG(n)));
      QQ(m,n)=VOLT(m)*VOLT(n)*(G(m,n)*sin(ANG(m)-ANG(n))-B(m,n)*cos(ANG(m)-ANG(n)));
    end
  end
  P=sum(PP')';
  Q=sum(QQ')';
  
  %Active Power Mismatch for PU and PQ buses
  
  g_x(1)=P(2)-PGD2;
  g_x(2)=P(3)-PGD3;
  g_x(3)=P(4)-PGD4;
  g_x(4)=P(5)-PGD5;
  g_x(5)=P(6)-PGD6;
  g_x(6)=P(7)-PGD7;
  g_x(7)=P(8)-PGD8;
  
  %Reactive Power Mismatch 
  g_x(8)=Q(2)-QGD2;
  g_x(9)=Q(4)-QGD4;
  g_x(10)=Q(5)-QGD5;
  g_x(11)=Q(6)-QGD6;
  g_x(12)=Q(8)-QGD8;
  
end