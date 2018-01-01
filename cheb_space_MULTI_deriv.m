function Dmf_out=cheb_space_MULTI_deriv(a,M)


%% Calculates the M-th derivative of the vector a, which exists in chebyshev space
% Uses the 3/2 padding rule prior to truncation to minimize spurious
% oscillatory modes

% Inputs: a - vector in Chebyshev space, of size 1 x n
% m - order of derivatives to be calculated

% Outputs: Dmf_out - a m x n vector of all calculated derivatives


N = max(size(a));
% Padding length
M_L = 3*N/2;
a_pad = zeros(1,M_L - N);
Dmf_pad = zeros(1,M_L + 1);
Dmf_out = zeros(M,N);

% Derivatives in Chebyshev space take space on 3/2*n points. It will later
% be assumed that the derivative can be truncated to the first n points
a = [a a_pad];


Dmf = Dmf_pad;

% Pre-allocates modes
N_vector = 2:2:2*M_L;

% Spectral derivative in Chebyshev space, recursive formulation. 
for ii=M_L:-1:2 
    Dmf(ii-1) = N_vector(ii-1)*a(ii) + Dmf(ii+1);
end


% Rescaling
Dmf(1) = a(2) + 0.5*Dmf(3);

Dmf = Dmf(1:N);
Dmf_out(1,:) = Dmf;

if M > 1
   
    for i=2:M
        % Uses previous derivative as a base point
        a(1:N) = Dmf;

        Dmf = Dmf_pad;

        % Spectral derivative, recursive formulation
        for ii=M_L:-1:2
            Dmf(ii-1) = N_vector(ii-1)*a(ii) + Dmf(ii+1);
        end
        % Rescaling
        Dmf(1) = a(2) + 0.5*Dmf(3);
        
        Dmf = Dmf(1:N);
        Dmf_out(i,:) = Dmf;
       
        
    end
end
