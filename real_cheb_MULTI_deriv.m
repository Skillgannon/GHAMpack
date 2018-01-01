function Dmf_out=real_cheb_MULTI_deriv(a,M,flag)

%% Calculates the M-th derivative of the vector a, which exists in chebyshev space
% Uses the 3/2 padding rule prior to truncation to minimize spurious
% oscillatory modes

% Inputs: a - vector in real or chebyshev space, of size 1 x n
% m - order of derivatives to be calculated
% flag - if flag == 1, then a is a vector in real space, and if flag == 0,
% then a is a vector in chebyshev space

% Outputs: Dmf_out - a m x n vector of all calculated derivatives in real
% space

% If no flag is provided, then it will be assumed that a is in Chebyshev
% space
if (nargin==2)
    flag = 0;
end

N = max(size(a));

if flag == 1
    Dmf_out = cheb_space_MULTI_deriv(realtocheb(a),M);
else
    Dmf_out = cheb_space_MULTI_deriv(a,M);
end

% Converts to real space
for i=1:M
    Dmf_out(i,:) = chebtoreal(Dmf_out(i,:));
end

end