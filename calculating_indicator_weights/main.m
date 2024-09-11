pop_size = 500;
chromo_size = 6;
generation_size = 100;
elitism = 1;
cross_rate = 0.6;
mutate_rate = 0.05;

for m=1:10
    low  = -1;
    high = 1;
    pop = low .*ones(pop_size,chromo_size) + (high-low) .* rand(pop_size,chromo_size); %种群初始化 
    best_fitness = 0;
    best_generation = 0;
    for gen=1:generation_size   
    fitness;  %计算适应度 
    rank;  %对个体按适应度大小进行排序
    selection;%选择操作
    crossover;%交叉操作
    mutate;%变异操作
%    disp(gen);
    end
    best_ge(m,:)=best_generation;
    individual(m,:)=best_individual;
    value(m,:)=best_fitness;
end
% m = best_individual;%获得最佳个体
% n = best_fitness;%获得最佳适应度
% p = best_generation;%获得最佳个体出现代
final_individual=sum(individual,1)/10;
disp(final_individual);
clear i;
clear j;
 