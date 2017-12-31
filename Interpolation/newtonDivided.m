function y = newtonDivided(A, B)
	syms x
	n = length(A);
	y = B(1);

	for i = 1:n
		L(i, 1) = B(i);
	end

	for i = 2:n
		for j = 1:n+1-i
			L(j, i) = (L(j+1, i-1) - L(j, i-1))/(A(i+j-1)-A(j));
		end
		temp = 1;
		for j = 1:i-1
			temp = temp*(x-A(j));
		end
		y = y + temp*L(1, i);
	end

	y = simplify(y);
end