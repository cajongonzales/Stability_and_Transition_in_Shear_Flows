function a = maxer(t)
global qb;
a = -norm(expm(t*qb));
end