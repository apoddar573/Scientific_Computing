function y = lagrange(A, B)
	syms x
	y = 0;
	n = length(A);
	for i = 1:n
		temp = 1;
		for j = 1:n
			if (i ~= j)
				temp = temp*(x - A(j))/(A(i) - A(j)); 
			end
		end
		y = y + B(i)*temp;
	end
	y = simplify(y);
end