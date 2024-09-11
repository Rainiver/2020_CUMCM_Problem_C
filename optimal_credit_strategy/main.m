pop_size = 600;
chromo_size = 6;
generation_size = 200;
elitism = 1;
cross_rate = 0.8;
mutate_rate = 0.3;

for m=1:50
    low1  = 1e5;
    high1 = 1e6;
   pop1 = low1 .*ones(pop_size,3) + (high1-low1) .* rand(pop_size,3); %贷款金额比例初始化
   low2  = 0.04;
   high2 = 0.15;
   pop2 = low2 .*ones(pop_size,3) + (high2-low2) .* rand(pop_size,3); %贷款利率初始化
   pop=[pop1 pop2];
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
    individual(m,:)= best_individual;
    value(m,:)=best_fitness;
    best_ge(m,:)=best_generation;
end
% m = best_individual;%获得最佳个体
% n = best_fitness;%获得最佳适应度
% p = best_generation;%获得最佳个体出现代
final_individual=sum(individual,1)/50;
disp(final_individual);
clear i;
clear j;
 