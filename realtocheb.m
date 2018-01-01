%function d = realtocheb(in,z)

% Using DCT FORM

function out = realtocheb(in)
%% This ONLY works when IN is a function evaluated on the chebyshev points x = cos((1:2:(2*n-1))*pi/(2*n))

% Calculating Chebyshev transform using the real dct  
out = sqrt(2/length(in))*dct_fast(in);
out(1) = out(1)/sqrt(2);
out(abs(out) < 10^-15) = 0;

%% DCT Form

%a = sqrt(2/length(in))*dct(in);
%a = a/sqrt(2); %% THIS SECOND LINE WAS THE PROBLEM IT DOESN"T WORK!!1

%% Original forms

%n = max(size(in));
%d = zeros(1,z);
%for m=1:(z-1);
%for k = 0:(n-1)
%d(m+1) = d(m+1) + in(k+1)*cos(m*pi*(k)/(n));
%end
%end
%d = (2/(n))*d;
%d(1) = (1/(n))*sum(in);

%x = cos(pi*(0:n)/n)';
%x_k = cos(pi*(2*n+1-2*(0:n))/(2*(n+1)));
%x2 = x.^2;
%x2_k = x_k.^2;

%d = zeros(1,20);
%for m=1:19;
%for k = 0:n
%d(m+1) = d(m+1) + x2_k(k+1)*cos(m*pi*(2*n+1 - 2*k)/(2*n+2));
%end
%end
%d = (2/(n+1))*d;
%d(1) = (1/(n+1))*sum(x2);
%dstore_k = d;

%% Note the _k version actually works better, but for now I'm ignoring it. Need to revisit it, because x = -x_k