function [I, R] = romberg(f, a, b, M)
    M = M+1;
    R(1, 1) = (b-a)*(1 + f(b))/2;
    h = (b-a);
    for n = 2:M
        h = h/2;
        R(n, 1) = R(n-1, 1)/2;
        for j = 1:2^(n-2)
            R(n, 1) = R(n, 1) + h*f(a + (2*j-1)*h);
        end
        for m = 2:n
            R(n, m) = R(n, m-1) + (R(n, m-1) - R(n-1, m-1))/(4^(m-1)-1);
        end
    end
    R
    I = vpa(R(M, M));
end