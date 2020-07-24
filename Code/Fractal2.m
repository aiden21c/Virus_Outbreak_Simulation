function [out] = Fractal2(matrix)

changedIndex = zeros(100,2);
x = 1;

[m,n] = size(matrix);

for rows = 1:m
    for column = 1:n
        if (rows + 2 < m && rows -2 > 1)
            if (column + 2 < n) && (column -2 > 1)
                if matrix(rows,column) ~=0
                    if matrix (rows, column+1) == 0
                        if (matrix(rows, column+2) == 0 && matrix(rows +1, column+1) == 0 && matrix(rows -1, column+1) == 0)
                            changedIndex(x, 1) = rows;
                            changedIndex(x, 2) = column+1;
                            x = x+1;
                        end

                    end
                    if matrix (rows, column-1) == 0
                        if (matrix(rows, column-2) == 0 && matrix(rows +1, column-1) == 0 && matrix(rows -1, column-1) == 0)
                            changedIndex(x, 1) = rows;
                            changedIndex(x, 2) = column-1;
                            x = x+1;

                        end

                    end
                    if matrix (rows+1, column) == 0
                        if (matrix (rows+1, column + 1) == 0 && matrix (rows+1, column - 1) == 0 && matrix (rows+2, column) == 0)
                            changedIndex(x, 1) = rows+1;
                            changedIndex(x, 2) = column;
                            x = x+1;
                        end

                    end
                    if matrix (rows-1, column) == 0
                        if (matrix (rows-1, column + 1) == 0 && matrix (rows-1, column - 1) == 0 && matrix (rows-2, column) == 0)
                        changedIndex(x, 1) = rows-1;
                        changedIndex(x, 2) = column;
                        x = x+1;
                        end
                    end
                end  
            end
        end
    end
end

out = changedIndex;
end

