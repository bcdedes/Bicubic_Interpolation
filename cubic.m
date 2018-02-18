function f = cubic(x)
    absx = abs(x);
    absx2 = absx.^2;
    absx3 = absx.^3;
    f = (1.5*absx3 - 2.5*absx2 + 1) .* (absx <= 1) + ...
        (-0.5*absx3 + 2.5*absx2 - 4*absx + 2) .* ((1 < absx) & (absx <= 2));
end