%wartoscie zmienne w czasie- ustalone w danym po³o¿eniu
theta1=input('podaj wartoœæ kata theta_1 [rad]: ')
theta2=input('podaj wartoœæ kata theta_2 [rad]: ')
lambda3=input('podaj wartoœæ kata lambda_3 [rad]: ')
%wratoœæi sta³e i zmienne manipulatora
disp('dane manipulatora')
l=[1 1 1]%l [m]
lambda =[0 1 lambda3] %lambda [m]
alpha= [3*pi/2 0 0] %alpha[rad]
theta=[theta1 theta2 0]  %theta [rad] 
dtheta=[1 1 0] %theta prim [rad/s]
ddtheta=[1 1 0]%theta bis [rad/a^2]
dlambda=[0 0 1/2] %lambda prim
ddlambda=[0 0 1/2] %lambda bis