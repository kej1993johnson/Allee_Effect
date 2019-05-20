function [m,V]=hw1FindEigendigits(A)
A = im2double(A);
% find mu (mean vector)
m = mean(A,2);

% Typically we have:
%Ax=lambda*x
% and we find the eigenvectors of A

% Here we can work with the smaller system and let x = A*v
% A*A'*A*v = mu*A*v
% A*A' is what we need to find the eigenvectors of 
% Find the eigenvectors of this
[Vsmall,D] = eig(A'*A);

V = A*Vsmall;

end