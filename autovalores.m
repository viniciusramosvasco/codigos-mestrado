syms k c x kb kc; 
A=[0 0 1 0;0 0 0 1;k 0 0 x;0 k -x 0];
% av=eig(A);
% av1=simplify(av(1));
% av2=simplify(av(2));
% av3=simplify(av(3));
% av4=simplify(av(4));
B=kb*[zeros(2);eye(2)];
C=[eye(2) zeros(2)];
cont=[B A*B A^2*B A^3*B]
ob=[C;C*A;C*A^2;C*A^3]