%轮盘赌选择法
for i=1:pop_size
    r = rand * fitness_table(pop_size); %随机生成一个随机数，在0和总适应度之间
    first = 1;
    last = pop_size;
    mid = round((last + first) / 2);
    idx = -1;
    while (first <= last && idx == -1)%二分查找
        if r>fitness_table(mid)
            first = mid;
        elseif r < fitness_table(mid)
            last = mid;
        else
            idx = mid;
            break;
        end
        mid = round((last + first) / 2);
        if (last - first) == 1
            idx = last;
            break;
        end
    end
    for j=1:chromo_size
        pop_new(i,j) = pop(idx,j);
    end
end
% elitism ：是否精英选择(保留最优值）
if elitism
    p = pop_size-1;
else
    p = pop_size;
end
for i=1:p
   for j=1:chromo_size
        pop(i,j) = pop_new(i,j);
   end
end

clear i;
clear j;
clear pop_new;
clear first;
clear last;
clear idx;
clear mid;