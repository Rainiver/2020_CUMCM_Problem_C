% �����㷨
for i=1:pop_size
    if rand < mutate_rate   %�������
        mutate_pos = round(rand(1,2) * chromo_size);  %����λ��
%         if mutate_pos == 0
%             continue;
%         end
        for i=1:length(mutate_pos)
            if mutate_pos(i)==0
                mutate_pos(i)=1;
            end
        end
        for i=1:length(mutate_pos)
            if mutate_pos(i)>=1&&mutate_pos(i)<=3
                pop(i,mutate_pos) = low1 + (high1 - low1) * rand;
            else
                pop(i,mutate_pos) = low2 + (high2 - low2) * rand;
            end
        end
    end
end
clear i;
clear mutate_pos;