%计算种群个体适应度
fitness_value = zeros(pop_size,1);

results = data*pop';
for i=1:pop_size
    result = results(:,i)';
    [after_sort,index]=sort(result,'descend');
    fit_value = cacl_fitness(index,creditrank);
    fitness_value(i)= fit_value;
end

clear i;
clear j;

function value = cacl_fitness(index,rank)
    count=0;
    for i=1:113
         if i>=1&&i<=26
             if rank(index(i))~='A'
                 count=count+1;
             end
         end
         if i>=27&&i<=62
             if rank(index(i))~='B'
                count=count+1;
             end
         end
         if i>=63&&i<=92
             if rank(index(i))~='C'
                 count=count+1;
             end
         end
         if i>=93&&i<=113
             if rank(index(i))~='D'
                count=count+1;
             end
         end
    end
    value=113-count;
    %value = value + 2*matrix(num,5);
end