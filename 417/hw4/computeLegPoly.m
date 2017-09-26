function [ z ] = computeLegPoly( x, Q )
%COMPUTELEGPOLY Return the Qth order Legendre polynomial of x
%   Inputs:
%       x: vector (or scalar) of reals in [-1, 1]
%       Q: order of the Legendre polynomial to compute
%   Output:
%       z: matrix where each column is the Legendre polynomials of order 0 
%          to Q, evaluated atthe corresponding x value in the input

[m,~] = size(x);
if(Q>=0)
    z(1:m,1) = 1;
end

if(Q>=1)
    z(:,2) = x;
end

if(Q>=2)
    for q=2:Q
        z(:,q+1) = (2*q-1)/q*x.*z(:,q) - (q-1)/q*z(:,q-1);
    end
end
%{
m=size(x,2);
L=zeros(Q+1,m);
L(1,:)=1;
L(2,:)=x;
for i=3:Q+1
    j=i-1;
    L(i,:)=(2.*j-1)./j.*x.*L(i-1,:)-(j-1)./j.*L(i-2,:);
end
z=L;
%}
end

