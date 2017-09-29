function x=nlize(x,M)
nc = size(x);
nc = nc(2);
for i = 1:nc
    x(:,i) = x(:,i)/norm(M*x(:,i));
end
end