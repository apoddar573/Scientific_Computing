
function y = hermite(A, B, C)
	syms x
	n = length(A);
	y = 0;
	for i = 1:n
		l = 1;
		for j = 1:n
			if i~=j
				l = l*(x-A(j))/(A(i)-A(j));
			end
		end
		dl = diff(l, x);
		P = (1 - 2*(x-A(i))*subs(dl, x, A(i)))*l*l;
		Q = (x-A(i))*l*l;
		y = y + P*B(i) + Q*C(i);
	end
	y = simplify(y);
end