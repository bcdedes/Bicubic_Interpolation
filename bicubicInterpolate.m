function y = bicubicInterpolate(im, scale)
%bicubicInterpolate Cubic convolution interpolation in 2D.
    % Y = bicubicInterpolate(IM, SCALE) returns an image that has (SCALE-1)
    % interpolated points in between original samples of grayscale image
    % IM. It applies a cubic interpolation first horizontally, then 
    % vertically.

    nRow = size(im,1);
    nCol = size(im,2);
    g = zeros(nRow,(nCol-1)*scale+1);
    y = zeros((nRow-1)*scale+1, (nCol-1)*scale+1);
    for i = 1 : nRow
        g(i,:) = cubicInterpolate(im(i,:), scale);
    end
    
    nCol = size(g,2);
    for j = 1:nCol
        y(:,j) = cubicInterpolate(g(:,j)',scale);
    end

end