function a = idcst_fast_P(b,ww,n)
%% Modified version of Matlab (R2015b's) idct to remove slow, superflous function calls, and modify how weights are calculated

%   Original author(s): C. Thompson, 2-12-93
%              S. Eddins, 10-26-94, revised
%   Copyright 1988-2013 The MathWorks, Inc.

%   References:
%   1) A. K. Jain, "Fundamentals of Digital Image
%      Processing", pp. 150-153.
%   2) Wallace, "The JPEG Still Picture Compression Standard",
%      Communications of the ACM, April 1991.

% Inputs: - b: Vector for which the idct will be applied
% - ww: Precomputed weights
% - n: length of the vector

% If input is a vector, make it a column:
do_trans = (size(b,1) == 1);
if do_trans, b = b(:); end

if nargin==2,
    n = size(b,1);
end
m = size(b,2);

yy = ww.*b;

% Compute x tilde using equation (5.93) in Jain
y = ifft(yy);

% Re-order elements of each column according to equations (5.93) and
% (5.94) in Jain
a = zeros(n,m);

a(1:2:n,:) = y(1:n/2,:);
a(2:2:n,:) = y(n:-1:n/2+1,:);

if isreal(b)
    a = real(a);
end
if do_trans
    a = a.';
end
