  function Bxyx=KatyObrotuST (alpha1,beta,alpha2)
Bx1=[ 1 0 0 ; 0 cos(alpha1) -sin(alpha1) ;0 sin(alpha1) cos(alpha1)]
By= [cos(beta) 0 sin(beta); 0 1 0 ; sin(beta) 0 cos(beta) ]
Bx2=[ 1 0 0 ;0 cos(alpha2) -sin(alpha2) ;0 sin(alpha2) cos(alpha2)]
Bxyx=Bx2*By*Bx1