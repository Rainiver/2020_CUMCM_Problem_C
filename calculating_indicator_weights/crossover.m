% �����㷨
for i=1:2:pop_size
    if (rand < cross_rate)  %cross_rate���������
        cross_pos = round(rand * chromo_size);   %����λ��
        if (cross_pos == 0 || cross_pos == 1)
            continue;
        end
        for j = cross_pos:chromo_size   %����
            tmp = pop(i,j);
            pop(i,j) = pop(i+1,j);
            pop(i+1,j) = tmp;
        end
    end
end
clear i;
clear j;
clear tmp;
