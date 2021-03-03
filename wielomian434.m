DanePlanowania           %ruch przyœpieszony-ustalony-opóŸniony
t=[t0:0.01:tk]; 
tau=t./tk;
t1=1
t2=2




tr=t1-t0
tb=t2-t1
tw=tk-t2

tau1=(t-t0)./tr;
tau2=(t-t1)./tb;
tau3=(t-t2)./tw;

q_A=[-10 20 -30]
q_B=[2 3 4]

A=[1 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0 1/tr 0 0 0 0 0 0 0 0 0 0 0 0;
   0 0 2/tr^2 0 0 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 1 1 1 1 1;
   0 0 0 0 0 0 0 0 0 0 1/tw 2/tw 3/tw 4/tw;
   0 0 0 0 0 0 0 0 0 0 0 2/tw^2 6/tw^2 12/tw^2;
   1 1 1 1 1 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 1 0 0 0 0 0 0 0 0;
   0 1/tr 2/tr 3/tr 4/tr 0 -1/tb 0 0 0 0 0 0 0;
   0 0 0 0 0 0 1/tb 2/tb 3/tb 0 -1/tw 0 0 0;
   0 0 0 0 0 1 1 1 1 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 1 0 0 0 0;
   0 0 2/tr^2 6/tr^2 12/tr^2 0 0 -2/tb^2 0 0 0 0 0 0;
   0 0 0 0 0 0 0 2/tb^2 6/tb^2 0 0 -2/tw^2 0 0;]
 %  0 0 2/tr^2 6/tr^2 12/tr^2 0 0 -2/tb^2 0 0 0 0 0 0];


for i=1:3
    
 qI(i)=3*q_A(i)/4+q_B(i)/4;
qII(i)=q_A(i)/4+3*q_B(i)/4;
B=[q_A(i)  q_B(i) 0  0  0  0  qI(i) qI(i)  qII(i)  qII(i)  0  0  0  0]';
  

% B=[ q_B(i)/4 3*q_A(i)/4 0 0 0 0 3*q_A(i)/4 3*q_A(i)/4 q_B(i)/4 q_B(i)/4 0 0 0 0];

a=inv(A)*B;  
a10=a(1);
a11=a(2);
a12=a(3);
a13=a(4);
a14=a(5);
a20=a(6);
a21=a(7);
a22=a(8);
a23=a(9);
a30=a(10);
a31=a(11);
a32=a(12);
a33=a(13);
a34=a(14);

    
    q_tau1=a10+a11*tau1+a12*tau1.^2+a13*tau1.^3+a14*tau1.^4;
    q_tau2=a20+a21*tau2+a22*tau2.^2+a23*tau2.^3;
    q_tau3=a30+a31*tau3+a32*tau3.^2+a33*tau3.^3+a34*tau3.^4;
    
    dq_tau1=(a11+2*a12*tau1+3*a13*tau1.^2+4*a14*tau1.^3)/tr;
    dq_tau2=(a21+2*a22*tau2+3*a23*tau2.^2)/tb;
    dq_tau3=(a31+2*a32*tau3+3*a33*tau3.^2+4*a34*tau3.^3)/tw;
    
    ddq_tau1=(2*a12+6*a13*tau1+12*a14*tau1.^2)/tr^2;
    ddq_tau2=(2*a22+6*a23*tau2)/tb^2;
    ddq_tau3=(2*a32+6*a33*tau3+12*a34*tau3.^2)/tw^2;

    
    subplot(3,3,i)

plot([tau tau+1 tau+2],[q_tau1 q_tau2 q_tau3])

xlabel('t')
ylabel('q tau')

subplot(3,3,i+3)


 plot([tau tau+1 tau+2],[dq_tau1 dq_tau2 dq_tau3])

xlabel('t')
ylabel('dq tau')

subplot(3,3,i+6)

 plot([tau tau+1 tau+2],[ddq_tau1 ddq_tau2 ddq_tau3])

xlabel('t')
ylabel('ddq tau')

    
end
