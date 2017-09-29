function [xs,es] = iord2(d)
[v,e]=eig(d);
e=diag(e);
[eimag,is]=sort(-imag(e));
xs = v(:,is);
es = e(is);

end