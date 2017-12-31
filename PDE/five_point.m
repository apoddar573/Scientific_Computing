function [U,actual,err] = five_point(u,a,b,h,f,u0x,u0y,u1x,u1y)
    N=floor((b-a)/h);
    A=zeros((N+1)^2,(N+1)^2);
    f_val=zeros((N+1)^2,1);
    for i=1:(N+1)^2
	i
        if i>0 & i<=N+1
            A(i,i)=1;
        elseif i>N^2+N & i<=(N+1)^2
            A(i,i)=1;
        elseif mod(i,N+1) == 0 | mod(i,N+1) == 1
            A(i,i)=1;
        else
            A(i,i)=-4;
            A(i-1,i)=1;
            A(i+1,i)=1;
            A(i,i-1)=1;
            A(i,i+1)=1;
        end
    end
    x=a:h:b;
    y=a:h:b;
    for i=1:(N+1)^2
        if i>0 & i<=N+1
            f_val(i)=u0x(x(i));
        elseif i>N^2+N & i<=(N+1)^2
            f_val(i)=u1x(x(i-N^2-N));
        elseif mod(i,N+1)==0
            f_val(i)=u1y(y(i/(N+1)));
        elseif mod(i,N+1)==1
            f_val(i)=u0y(y(floor(i/(N+1))+1));
	   else
	    f_val(i)=h^2*f(x(mod(i,N+1)),y(floor(i/(N+1))+1));
        end
    end
    ans=A\f_val;
    actual=zeros(N+1,N+1);
    err=zeros(N+1,N+1);
    U=zeros(N+1,N+1);
    for i=1:N+1
	for j=1:N+1
           actual(i,j)=u(x(i),y(j));
	end
    end
    k=1;
    for j=1:N+1
	for i=1:N+1
	    U(i,j)=ans(k);
	    k=k+1;
	end
    end
    for i=1:N+1
	for j=1:N+1
	   err(i,j)=abs(U(i,j)-actual(i,j));
	end
    end

end

