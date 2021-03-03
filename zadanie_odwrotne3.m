clc;
clear all;
close all;

disp('Zadanie odwrotne ')
disp('Wilczynski Patryk, Tokarek Pawe³')

%pause

% syms theta1 theta2 lambda3 %definiowanie zmiennej MATLAB
sym theta1 theta2 lambda3

l=[sym(1) sym(1) sym(1)] %definowanie sta³ej
alfa=[sym(3*pi/2) sym(0) sym(0)]
theta=[theta1 theta2 sym(0)]
lambda=[sym(0) sym(1) lambda3]

k=size(theta)
n=k(2)
for i=1:n 
    A=MacierzA(theta(i),l(i),lambda(i),alfa(i));
    eval(['A' num2str(i) '=A'])
end



 T30=A1*A2*A3;
 T30pods=subs(T30); %subs oblicza wynik liczbowy zapisany w postaci symbolicznej-w innym przypadku przepisa³ by wy¿szy wiersz

 r30=T30(1:3,4);
 r30pods=subs(r30); 
 

 r30x=r30pods(1)
 r30y=r30pods(2)
 r30z=r30pods(3)
 
 %disp('Wciœnij enter')
 %pause
 
 %wartoœci  theta1= pi/4; theta2 =pi/3; =lambda3=2;
 
 r30xnum=sym(-0.7071);
 r30ynum=sym(3.5355);
 r30znum=sym(-1.7321);
 
 %wyliczamy theta2 z 3 równania
 row1L=r30znum;
 row1P=r30z;
 row1=row1L-row1P;
 

th2=solve(row1,theta2);
theta2 = double(th2); %zamiana na wartoœc liczbow¹
theta2_1=theta2(1);
theta2_2=theta2(2);

%usuwanie czesci urojonej
 if (imag(theta2_1) > -0.00001 && imag(theta2_1) < 0.00001)
     theta2_1 = real(theta2_1);
     end
 
 if (imag(theta2_2) > -0.00001 && imag(theta2_2) < 0.00001)
     theta2_2 = real(theta2_2);
 
end
disp('Wcisnij enter')
pause


%_______________________________________________________________________________
% obliczanie thety po przez pomno¿enie r30x przez cost(heta1)
% oraz r30y przez sin(theta1)

row2L=r30xnum*cos(theta1)+r30ynum*sin(theta1);
row2P=r30x*cos(theta1)+r30y*sin(theta1);

row2=row2L-row2P;

% row2_1=simplify(row2);

theta2=sym(theta2_1); %podstaw za theta 2 pierwsze rozwi¹zanie równania
row2_1=subs(row2); %podaj wartoœc równania row2

theta2=sym(theta2_2);
row2_2=subs(row2); 

th1_1=solve(row2_1,theta1);  %rozwi¹¿ równanie dla pierwszego wyniku theta 2
th1_2=solve(row2_2,theta1);

theta111=double(th1_1); %zamiana na wartoœc liczbow¹
theta11=double(th1_2);

theta1_1=theta111(1);
theta1_2=theta111(2);
theta1_3=theta11(1);
theta1_4=theta11(2);


% %usuwanie czesci urojonej
     if (imag(theta1_1) > -0.00001 && imag(theta1_1) < 0.00001)
         theta1_1 = real(theta1_1);
     end
 
     if (imag(theta1_2) > -0.00001 && imag(theta1_2) < 0.00001)
         theta1_2 = real(theta1_2);
     end 
 
     if (imag(theta1_3) > -0.00001 && imag(theta1_3) < 0.00001)
         theta1_3 = real(theta1_3);
     end
 
 if (imag(theta1_4) > -0.00001 && imag(theta1_4) < 0.00001)
     theta1_4 = real(theta1_4);
 end

disp('Wcisnij enter')

pause
disp('')
disp('WYNIKI DLA THETA1')
pause

theta22=[theta2_1 theta2_2]
theta11=[theta1_1 theta1_2 theta1_3 theta1_4]




%oblicznie lambdy3 z 1 równania

disp('Wcisnij enter')

pause
disp('')
disp('WYNIKI DLA LAMBDA3')
pause


row3L=r30xnum;
row3P=r30x;
row3=row3L-row3P;

theta2=sym(theta2_1);
row3_1=subs(row3); %podaj wartoœæ równania row3 dla theta2_1


theta2=sym(theta2_2);
row3_2=subs(row3);

theta1=sym(theta1_1);
row3_11=subs(row3_1); 

theta1=sym(theta1_2);
row3_12=subs(row3_1); 

theta1=sym(theta1_3);
row3_13=subs(row3_2); 

theta1=sym(theta1_4);
row3_14=subs(row3_2); 


lambda3_11=solve(row3_11,lambda3);
lambda3_22=solve(row3_12,lambda3);
lambda3_33=solve(row3_13,lambda3);
lambda3_44=solve(row3_14,lambda3);




lambda3_1=double(lambda3_11)
lambda3_2=double(lambda3_22)
lambda3_3=double(lambda3_33)
lambda3_4=double(lambda3_44)

disp('Konfiguracja1')
theta2_1
theta1_1
lambda3_1

disp('Konfiguracja2')
theta2_1
theta1_2
lambda3_2

disp('Konfiguracja3')
theta2_2
theta1_3
lambda3_3

disp('Konfiguracja4')
theta2_2
theta1_4
lambda3_4

