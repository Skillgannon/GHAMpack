function T = sparsetoeplitz(col,row)
   
% Based off toeplitz.m (inbuilt matlab) and http://www.mathworks.com.au/matlabcentral/fileexchange/13353-sparse-toeplitz-matrix-construction/content/sptoeplitz.m
if nargin < 2  % symmetric case
  col(1) = conj(col(1)); row = col; col = conj(col); 
else
  if col(1)~=row(1)
    warning('MATLAB:sptoeplitz:DiagonalConflict',['First element of ' ...
      'input column does not match first element of input row. ' ...
      '\n         Column wins diagonal conflict.'])
  end
end


m = length(col(:));  n = length(row(:));

% Locate the nonzero diagonals.
[ic,jc,sc] = find(col(:));
row(1) = 0;  % not used
[ir,jr,sr] = find(row(:));

% Use spdiags for construction.
d = [ ir-1; 1-ic ];
B = repmat( [ sr; sc ].', min(m,n),1 );
T = spdiags( B,d,m,n );