% 对个体按适应度大小进行排序，并且保存最佳个体

[fitness_value,index]=sort(fitness_value);%升序排列
pop=pop(index,:);

% 计算种群累积适应度
fitness_table = cumsum(fitness_value);
% 第G世代种群平均适应度
fitness_avg(gen) = fitness_table(pop_size)/pop_size;
% 设置最佳世代
% best_fistness 最佳适应度
% best_individual 最佳个体
if fitness_value(pop_size) > best_fitness
    best_fitness = fitness_value(pop_size);
    best_generation = gen;
    for j=1:chromo_size
        best_individual(j) = pop(pop_size,j);
    end
end

clear i;
clear j;
