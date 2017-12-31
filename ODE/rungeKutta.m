function Y = rungeKutta(f, a, b, n, xo)
	h = (b-a)/n;
	Y = linspace(a, b, n+1);
	Y(2, 1) = xo;
	for i = 2:n+1
		F1 = h*f(Y(1, i-1), Y(2, i-1));
		F2 = h*f(Y(1, i-1) + h/2, Y(2, i-1) + F1/2);
		F3 = h*f(Y(1, i-1) + h/2, Y(2, i-1) + F2/2);
		F4 = h*f(Y(1, i-1) + h, Y(2, i-1) + F3);
		Y(2, i) = Y(2, i-1) + (F1 + 2*F2 + 2*F3 + F4)/6 ;
	end
end