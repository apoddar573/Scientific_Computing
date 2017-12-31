function mat = gauss_siedel(u,a,b,h,f,u0x,u0y,u1x,u1y,tol,mat_itr)
	n=floor((b-a)/h);
	mat=zeros(n+1,n+1);
	x=a:h:b;
	y=a:h:b;
	for i=1:n+1
		mat(1,i)=u0x(x(i));
		mat(n+1,i)=u1x(x(i));
	end
	for i=2:n
		mat(i,1)=u0y(y(i));
		mat(i,n+1)=u1y(y(i));
	end
	old=mat;
	for k=1:mat_itr
		for i=2:n
			for j=2:n
				mat(i,j)=(mat(i-1,j)+mat(i,j-1)+mat(i,j+1)+mat(i+1,j))/4;
			end
		end
		if norm(old-mat)<tol
			break;
		end
		old=mat;
	end
end
