DanePlanowania
t=[t0:0.01:tk];
tau=t./tk;
%alpha1 beta2 alpha2
q_A=[-10 20 -30]
q_B=[2 3 4]
k=size(q_A)
n=k(2)


A= [1 0 0 0; %polozenie poczatkowe
    1 1 1 1; %polozenie koncowe
    0 1/tk 0 0; % V koncowe
    0 1/tk 2/tk 3/tk;] %V koncowe
for i=1:n
B=[q_A(i) 0 q_B(i) 0]';
X=inv(A)*B;
a0=X(1)
a1=X(2)
a2=X(3) %wspolczynniki
a3=X(4)

q_tau=a0+a1*tau+a2*tau.^2+a3*tau.^3  % wielomian stopnia 3

dq_tau= a1+a2*2*tau+a3*3*tau.^2 %predkosc

ddq_tau= a2*2+a3*3*2*tau%przysp

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





