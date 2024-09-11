% TOPSIS法构建综合评价指标，input为输入数据，w为各指标权重数据
[m,n]=size(input);
input(:,2)=-input(:,2);
for i=1:n
    b(:,i)=input(:,i)/norm(input(:,i));
end
c=b.*repmat(w,m,1);
Cpos=max(c);
Cneg=min(c);
for i=1:m
    Dis_pos(i)=norm(c(i,:)-Cpos);
    Dis_neg(i)=norm(c(i,:)-Cneg);
end
f=Dis_neg./(Dis_neg+Dis_pos);
[result,index]=sort(f,'descend');
   