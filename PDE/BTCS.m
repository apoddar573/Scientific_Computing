function [A, B] = BTCS(f, tLower, xLower, xHigher, a, b, constant) 
    N = 10;
    h = (b-a)/N;
    XT = linspace(a, b, N+1);
    A = zeros(N+1);
    B = zeros(N-1);
    for i = 1:N+1
        A(1, i) = xLower(XT(i));
        A(N+1, i) = xHigher(XT(i));
        A(i, 1) = tLower(XT(i));
    end
    
    B(1, 1) = 1-2/h;
    B(1, 2) = -1/h;
    for i = 2:N-2
        B(i, i-1) = -1/h;
        B(i, i+1) = -1/h;
        B(i, i) = 1-2/h;
    end
    B(N-1, N-2) = -1/h;
    B(N-1, N-1) = 1-2/h;
    
    for i = 2:N+1
        L = A(2:N, i-1);
        L
        L(1) = L(1) + (1/h)*A(1, i-1);
        L(N-1) = L(N-1) + (1/h)*A(N+1, i-1);
        for i = 1:N-1
            L(i) = L(i) - constant*h;
        end
        L
        A(2:N, i) = inv(B)*L;
    end
    
    for i = 1:N+1
        for j = 1:N+1
            B(i, j) = f(XT(i), XT(j));
        end
    end
    
    figure
    surf(A)
    figure
    surf(B)
    figure
    plot( A(:, N+1), XT, B(:, N+1), XT )
end