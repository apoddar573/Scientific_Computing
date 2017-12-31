function Y = adamBoulton(f, a, b, n, xo, tol)
	h = (b-a)/n;
	Y = linspace(a, b, n+1);
	Y(2, 1) = xo;
	for i = 2:3
		F1 = h*f(Y(1, i-1), Y(2, i-1));
		F2 = h*f(Y(1, i-1) + h/2, Y(2, i-1) + F1/2);
		F3 = h*f(Y(1, i-1) + h/2, Y(2, i-1) + F2/2);
		F4 = h*f(Y(1, i-1) + h, Y(2, i-1) + F3);
		Y(2, i) = Y(2, i-1) + (F1 + 2*F2 + 2*F3 + F4)/6;
	end
	for i = 4:n+1
		F1 = h*f(Y(1, i-1), Y(2, i-1));
		F2 = h*f(Y(1, i-1) + h/2, Y(2, i-1) + F1/2);
		F3 = h*f(Y(1, i-1) + h/2, Y(2, i-1) + F2/2);
		F4 = h*f(Y(1, i-1) + h, Y(2, i-1) + F3);
		Y(2, i) = Y(2, i-1) + (F1 + 2*F2 + 2*F3 + F4)/6;
		est = Y(2, i);
		Y(2, i) = Y(2, i-1) + (h/24)*(9*f(Y(1, i), Y(2, i)) + 19*f(Y(1, i-1), Y(2, i-1))... 
			- 5*f(Y(1, i-2), Y(2, i-2)) + f(Y(1, i-3), Y(2, i-3)));
		while(abs(est - Y(2, i)) > tol)
			est = Y(2, i);
			Y(2, i) = Y(2, i-1) + (h/24)*(9*f(Y(1, i), Y(2, i)) + 19*f(Y(1, i-1), Y(2, i-1))... 
			- 5*f(Y(1, i-2), Y(2, i-2)) + f(Y(1, i-3), Y(2, i-3)));
		end 
	end
end