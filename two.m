function c=two(N)
    num = round(abs(N));
    c=zeros(num,num);
    for i=0:num-1
        for j=0:num-1
            if rem(i+1,2)==0
                p=1/(1-(i+j)^2)+1/(1-(i-j)^2);
                c(i+1,j+1)=p;
            else
                c(i+1,j+1) = 0;
            end
        end
    end
end