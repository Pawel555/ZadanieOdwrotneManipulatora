DanePlanowania
t=[t0:0.01:tk];
tau=t./tk;
%alpha1 beta2 alpha2
q_A=[-10 20 -30]
q_B=[2 3 4]
qw=[2 2 2]
qr=[2 2 2]
k=size(q_A)
n=k(2)


A= [1 0 0 0 0 0; 
    1 1 1 1 1 1 ;
    0 1/tk 0 0 0 0; 
    0 1/tk 2/tk 3/tk 4/tk 5/tk;
    0 0 2/tk^2 0 0 0;
    0 0 2/tk^2 6/tk^2 12/tk^2 20/tk^2   ] 
for i=1:n
B=[q_A(i) 0 q_B(i) 0 qw(i) qr(i)]';
X=inv(A)*B;
a0=X(1)
a1=X(2)
a2=X(3) %wspolczynniki
a3=X(4)
a4=X(5)
a5=X(6)


q_tau=a0+a1*tau+a2*tau.^2+a3*tau.^3+a4*tau.^4+a5*tau.^5  % wielomian stopnia 5

dq_tau= a1+2*a2*tau+3*a3*tau.^2+4*a4*tau.^3+5*a5*tau.^4 %predkosc

ddq_tau= 2*a2*+6*a3*tau+12*a4*tau.^2+20*a5*tau.^3%przysp

subplot(3,3,i)

m1=max(q_tau)
idx=find(q_tau==m1)
plot(tau,q_tau,'r',tau(idx),m1,'b*')
nazwa=['max=' num2str(m1)]
text(tau(idx),q_tau(idx),nazwa)
xlabel('t')
ylabel('q tau')

subplot(3,3,i+3)

m1=max(dq_tau)
idx=find(dq_tau==m1)
plot(tau,dq_tau,'g',tau(idx),m1,'b*')
nazwa=['max=' num2str(m1)]
text(tau(idx),dq_tau(idx),nazwa)
xlabel('t')
ylabel('dq tau')

subplot(3,3,i+6)
m1=max(ddq_tau)
idx=find(ddq_tau==m1)
plot(tau,ddq_tau,'b',tau(idx),m1,'b*')
nazwa=['max=' num2str(m1)]
text(tau(idx),ddq_tau(idx),nazwa)
xlabel('t')
ylabel('ddq tau')

%eval(['C' num2str(i) '=C'])
end
