% �Ը��尴��Ӧ�ȴ�С�������򣬲��ұ�����Ѹ���

[fitness_value,index]=sort(fitness_value);%��������
pop=pop(index,:);

% ������Ⱥ�ۻ���Ӧ��
fitness_table = cumsum(fitness_value);
% ��G������Ⱥƽ����Ӧ��
fitness_avg(gen) = fitness_table(pop_size)/pop_size;
% �����������
% best_fistness �����Ӧ��
% best_individual ��Ѹ���
if fitness_value(pop_size) > best_fitness
    best_fitness = fitness_value(pop_size);
    best_generation = gen;
    for j=1:chromo_size
        best_individual(j) = pop(pop_size,j);
    end
end

clear i;
clear j;
