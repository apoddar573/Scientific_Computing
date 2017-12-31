function I = compositeCTR(f, a, b, n)
    syms x
    df = diff(f(x), x);
    X = linspace(a, b, n+1);
    I = 0;
    h = (b-a)/n;
    for i = 1:n
        I = I + h*(f(X(i)) + f(X(i+1)))/2 + (h^2/12)*(vpa(subs(df, x, a)) - vpa(subs(df, x, b)));
    end
end