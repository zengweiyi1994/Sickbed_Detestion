function [x1,y1,x2,y2] = plotline(I,m,n)
x1 = 0;
x2 = 0;
for i = 1:m
    for j = 1:n
        if I(i,j) == 1
            x1 = i;
            break
        end
    end
end


for i = m:-1:1
    for j = 1:n
        if I(i,j) == 1
            x2 = i;
            break
        end
    end
end

y1 = 0;
y2 = 0;

for i = 1:n
    for j = 1:m
        if I(j,i) == 1
            y1 = i;
            break
        end
    end
end


for i = n:-1:1
    for j = 1:m
        if I(j,i) == 1
            y2 = i;
            break
        end
    end
end
