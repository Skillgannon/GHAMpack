function u = chebtoreal(in)

%% Converts a vector in Chebyshev space to one in real space
% Inputs: - in: a vector of 1 x n Chebyshev points, where the points in real space correspond to x = cos((1:2:(2*n-1))*pi/(2*n))
% 
% Outputs: - u: 1 x n real space vector, expressed on the Chebyshev points x = cos((1:2:(2*n-1))*pi/(2*n))

% Tests for shape of the input vector, and if it's n x 1 then flips it so
% that it's 1 x n
[a,b]=size(in);
if a > b
    N = a;
    in = in';
else
    N = b;
end

% Machine precision tollerancing to remove spurious modes
in(abs(in) < 10^-15) = 0;

% Discrete fourier transform on the rescaled input vector, to convert to
% real space
u=idct_fast(sqrt(N/2)*[in(1)*sqrt(2), in(2:end)]);