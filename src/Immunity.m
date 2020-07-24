function [outputMain, outputImmunity] = Immunity(immunity, fractalMatrix, mainMatrix)
changes = zeros(100,2);

[m,n] = size(immunity);
[s,r] = size(fractalMatrix);

for row = 1:m
    for column = 1:n
        if (immunity(row, column) ~= 0) && (mainMatrix(row, column) ~= 0)
            immunity(row, column) = 1;
        end 
    end
end
count = 1;
for row = 1:s
    if fractalMatrix(row,1) ~= 0
        if immunity(fractalMatrix(row,1), fractalMatrix(row,2)) == 0
            changes(count,1) = fractalMatrix(row,1);
            changes(count,2) = fractalMatrix(row,2);
            count = count +1;
        end
    end
end


outputMain = changes;
outputImmunity = immunity;
end

