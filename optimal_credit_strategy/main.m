pop_size = 600;
chromo_size = 6;
generation_size = 200;
elitism = 1;
cross_rate = 0.8;
mutate_rate = 0.3;

for m=1:50
    low1  = 1e5;
    high1 = 1e6;
   pop1 = low1 .*ones(pop_size,3) + (high1-low1) .* rand(pop_size,3); %�����������ʼ��
   low2  = 0.04;
   high2 = 0.15;
   pop2 = low2 .*ones(pop_size,3) + (high2-low2) .* rand(pop_size,3); %�������ʳ�ʼ��
   pop=[pop1 pop2];
    best_fitness = 0;
    best_generation = 0;
    for gen=1:generation_size   
    fitness;  %������Ӧ�� 
    rank;  %�Ը��尴��Ӧ�ȴ�С��������
    selection;%ѡ�����
    crossover;%�������
    mutate;%�������
%    disp(gen);
    end
    individual(m,:)= best_individual;
    value(m,:)=best_fitness;
    best_ge(m,:)=best_generation;
end
% m = best_individual;%�����Ѹ���
% n = best_fitness;%��������Ӧ��
% p = best_generation;%�����Ѹ�����ִ�
final_individual=sum(individual,1)/50;
disp(final_individual);
clear i;
clear j;
 