pop_size = 500;
chromo_size = 6;
generation_size = 100;
elitism = 1;
cross_rate = 0.6;
mutate_rate = 0.05;

for m=1:10
    low  = -1;
    high = 1;
    pop = low .*ones(pop_size,chromo_size) + (high-low) .* rand(pop_size,chromo_size); %��Ⱥ��ʼ�� 
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
    best_ge(m,:)=best_generation;
    individual(m,:)=best_individual;
    value(m,:)=best_fitness;
end
% m = best_individual;%�����Ѹ���
% n = best_fitness;%��������Ӧ��
% p = best_generation;%�����Ѹ�����ִ�
final_individual=sum(individual,1)/10;
disp(final_individual);
clear i;
clear j;
 