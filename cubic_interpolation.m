function g = cubic_interpolation(x, scale)
%cubic_interpoaltion_20181303
    N = length(x);
    g = linspace(1, (N-1)*scale + 1, (N-1)*scale + 1);
    
    d0 = 1/scale;
    for j = 2:scale
        d = d0*(j-1);
        for i = 1 : N-1
            if (i == 1)
                g(i*j) = (x(3) - 3*x(2) + 3*x(1))*cubic(-d-1) + x(i)*cubic(-d)...
                    + x(i+1)*cubic(-d+1) + x(i+2)*cubic(-d+2);            
            elseif (i == N-1)
                g(i*j) = x(i-1)*cubic(-d-1) + x(i)*cubic(-d) + x(i+1)*cubic(-d+1) ...
                     + (3*x(N) - 3*x(N-1) + x(N-2))*cubic(-d+2);            
            else
                g(i*j) = x(i-1)*cubic(-d-1) + x(i)*cubic(-d) + x(i+1)*cubic(-d+1) ...
                    + x(i+2)*cubic(-d+2);
            end
        end
    end
    
    for i = 1:N
        g((i-1)*scale + 1) = x(i);
    end
end