# GHAMpack

Software package for solving 1D nonlinear, variable coefficient boundary value problems (BVPs) using Matlab. This code uses a new variant of the Homotopy Analysis Method (HAM) in order to numerically solve these BVPs to machine precision, and is able to resolve highly oscillatory solutions subject to arbitrary, linear boundary conditions, and can solve problems containing singularities. This code uses sparse basis functions, and has been shown to converge spectrally, and scale with O(n), where n is the grid resolution. 

The full version of this code uses a mix between Chebyshev and Ultraspherical spectral methods with gradient based searches, Genetic Algorithms and Latin Hypercube sampling. While solutions calculated within this code exist on (-1,1), it has been tested on semi-infinite and infinite domains using linear, exponential and logarithmic mappings. 
