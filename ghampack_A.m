function [A, P_mod, order] = ghampack_A(n,inputs,Boundary_b)

[i1, i2] = size(inputs);
order = i2 - 1;

L = multmat(inputs(:,1),order)*diffmat(n,order);
for i=2:(i2-1)
    L = L + convertmat(n,i2 - i,order-1)*multmat(inputs(:,i),i2-i)*diffmat(n,i2-i);
end

con_0 = convertmat(n,0,order-1);

L = L + con_0*multmat(inputs(:,i2),0);

P = speye(n-order,n);
T_P = speye(n,n);

A = [Boundary_b; P*L*T_P];


P_mod = P*con_0;