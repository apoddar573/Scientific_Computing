function Y = dirichlet(c1, c2, c3, f, a, b, n, xo, xn)
	h = (b-a)/n;
	Y = linspace(a, b, n+1);
	R = f(Y);
	R = R(2:n)
	Y(2, 1) = xo;
	Y(2, n+1) = xn;
	R(1) = R(1) - c1(h, Y(1, 2))*Y(2, 1);
	R(n-1) = R(n-1) - c1(h, Y(1, n))*Y(2, n+1);
	A(1, 1) = c2(h, Y(1, 2));
	A(1, 2) = c3(h, Y(1, 2));
	for i = 1:n-3
		A(i+1, i) = c1(h, Y(1, i+2));
		A(i+1, i+1) = c2(h, Y(1, i+2));
		A(i+1, i+2) = c3(h, Y(1, i+2));
	end
	A(n-1, n-2) = c1(h, Y(1, n));
	A(n-1, n-1) = c2(h, Y(1, n));
	A
	L = vpa(R*inv(A))
	for i = 2:n
		Y(2, i) = L(i-1);
	end
end