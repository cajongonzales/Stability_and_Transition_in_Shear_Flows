function t = fmy(t1,t2,options)
f1 = maxer(t1);
f2 = maxer(t2);

tt = fmin('maxer',t1,t2,options);

f3 = maxer(tt);
f = [f1 f2 f3];
tm = [t1 t2 tt];
[~,is] = sort(f);
t=tm(is(1));

end