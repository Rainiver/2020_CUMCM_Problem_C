x2=zeros(302,3);
num1=303280;
num2=377939;
for i=1:num1
    for j=1:302
        if S2{i,1}==j+123
            x2(j,2)=x2(j,2)+1;
                if S2{i,5}<0
                    x2(j,3)=x2(j,3)+1;
                    x2(j,4)=x2(j,4)+S2{i,5};
                        if S2{i,5}<=-10000
                            x2(j,5)=x2(j,5)+1;
                            x2(j,6)=x2(j,6)+S2{i,5};
                        end
                        
                end
               break;
        end
        
    end
end
disp(x2);