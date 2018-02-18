function im = bicubic_interpolation(z, scale)
    nrow = size(z,1);
    ncol = size(z,2);
    z1 = zeros(nrow,(ncol-1)*scale+1);
    im = zeros((nrow-1)*scale+1, (ncol-1)*scale+1);
    for i = 1 : nrow -1
        z1(i,:) = cubic_interpolation(z(i,:),scale);
    end
    
    for j = 1:(ncol-1)*scale+1
        im(:,j) = cubic_interpolation(z1(:,j),scale);
    end

end