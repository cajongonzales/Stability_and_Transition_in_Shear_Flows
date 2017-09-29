function [qb,invF] = qbmat(M,xu,e)
work = M*xu;
A=work'*work;
[U,S,V]=svd(A);
s=sqrt(diag(S));
F=diag(s)*U';
invF = U*diag(ones(size(s))./s);

qb = -sqrt(-1)*F*diag(e)*invF;

end