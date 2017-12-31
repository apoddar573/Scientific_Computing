function Y = explicitEuler(f, a, b, n, yo, tol)
    h = (b-a)/n;
    Y = linspace(a, b, n+1);
    Y(2, 1) = yo;
    for i = 2:n+1
        Y(2, i) = Y(2, i-1) + h*f(Y(1, i-1), Y(2, i-1));
        est = Y(2, i);
    end
end