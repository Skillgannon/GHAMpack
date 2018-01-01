%% GHAMPACK_A modified for continuation problems
% At the moment the way this is structured has that the boundary vector
% does not depend in any way upon the continuation parameter. Can be
% modified to fix that, but at this stage no. 

function [A, P_mod, order] = ghampack_C(n,inputs,Boundary_b,auxillary_vector)

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

P_mod = P*con_0;

%size(P)
%size(T_P)
%size(P_mod)

%A = [Boundary_b(:,1:end-1); P*L*T_P];
%A = [A, [Boundary_b(:,end); P_mod*auxillary_vector'];
%catch
A = [Boundary_b; P*L*T_P];
A = [A, [zeros(min(size(Boundary_b)),1); P_mod*auxillary_vector']];
%A = [A, [zeros(min(size(Boundary_b)),1); P*auxillary_vector']]; % Does not work, seriously, stop trying it

end


