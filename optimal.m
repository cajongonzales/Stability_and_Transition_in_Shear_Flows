function [flowin, flowout, gg] = optimal(d,T,M,ak2,iflag)
    global qb;
%% Phase 1
[xs,es] = iord2(d);
xs = nlize(xs,M);
%% Phase 2
ishift =1;
imin = -1.5;
while imag(es(ishift))>1
    ishift = ishift + 1 ;
end
[n1,n2] = n9(es,imin);
cols = (ishift:n2);
xu = xs(:,cols);
eu = es(cols);
ncols = length(cols);
fprintf('Number of modes used: %1.0f \n',ncols)

%% Phase 3
[qb,invF] = qbmat(M,xu,eu);

%% Phase 4
if iflag==1
    gcheck = maxer(1/100);
    gcheck = gcheck^2;  
    if gcheck <1
        tformax=0;  
        mgrowth = 1;
    else
        ts = T(1);
        tf = T(2);
        options = [0 1e-3 1e-3];
        tformax = fmy(ts,tf,options);
        mgrowth = maxer(tformax);
        mgrowth = mgrowth^2;
    end
    fprintf('Time for maximum growth: %e \n',tformax)
else
    tformax = T;
end 

%% Phase 5
evol = expm(tformax*qb);
[U,S,V] =svd(evol);
mgrowth = S(1,1)^2;
fprintf('Maximum growth in energy: %e \n',mgrowth)
flowin = sqrt(2*ak2)*xu*invF*V(:,1);
flowout = sqrt(2*ak2)*xu*invF*U(:,1);

for i =1:100
    if iflag==1
        tid = ts + (tf-ts)/99*(i-1);
    else
        tid = 0 + (tformax)/99*(i-1);
    end
    gg(i,2) = norm(expm(tid*qb))^2;
    gg(i,1) = tid;
end