iflow=input('Poiseuille (1) or Couette Flow (2)');
nosmod=input('Enter N the number of OS modes');
R=input('Reynolds Number= ');
alp = input('Enter alpha= ');
beta = input('Enter beta= ');
iflag = input('(1) Maximum Growth in [Tmin,Tmax] (2) Maximum Growth at T');

if iflag==1
    Tmin=input('Tmin= ');
    Tmax=input('Tmax= ');
    T=[Tmin,Tmax];
else
    T = input('Enter T:');
end

[D0,D1,D2,D4] = Dmat(nosmod);

if iflow==1
    [A,B]=pois(nosmod,alp,beta,R,D0,D1,D2,D4);
else
    [A,B]=couet(nosmod,alp,beta,R,D0,D1,D2,D4);
end

ak2 = alp^2+beta^2;
M = energy(nosmod+1,nosmod+1,ak2);

d = inv(B)*A;
[flowin,flowout,gg] = optimal(d,T,M,ak2,iflag);
figure(1)
semilogy(gg(:,1),gg(:,2))
grid on